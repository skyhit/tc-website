package com.topcoder.utilities.pacts;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.web.ejb.pacts.ReliabilityBonusPayment;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Checks the component payments that don't have reliability bonus payment and create their payments.
 * 
 * 
 * @author Cucu
 * @version 1.0
 */
public class PayReliabilityBonus extends DBUtility {

    /**
     * Date when the reliability schema changes.  
     * Remember that month it's 0 based.
     */
    private static final Date SCHEMA_CHANGE_DATE = new GregorianCalendar(2007,4,24).getTime();
    
    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;


	protected void runUtility() throws Exception {
		PactsClientServices  ejb = (PactsClientServices) createEJB();
        
		StringBuffer query = new StringBuffer(200);

		// Find all the project result that have a payment but not a reliability bonus payment
		// If a reliability bonus is deleted (status 69) it will be found anyways, so that if 
		// someone deletes a reliability bonus, it is not created again.
		query.append("SELECT pr.user_id, pr.project_id, pr.old_reliability, pd.total_amount, pd.client, p.payment_id, ");
        query.append("       (select NVL(ppd.actual_start_time, psd.actual_start_time)   ");
        query.append("          from tcs_catalog:project proj  ");
        query.append("               , OUTER tcs_catalog:project_phase psd  ");
        query.append("               , OUTER tcs_catalog:project_phase ppd  ");
        query.append("          where  psd.project_id = proj.project_id   ");
        query.append("          and psd.phase_type_id = 2   ");
        query.append("          and ppd.project_id = proj.project_id   ");
        query.append("          and proj.project_id = pr.project_id   ");
        query.append("          and ppd.phase_type_id = 1) as posting_date ");
        query.append("FROM tcs_catalog:project pro, tcs_catalog:project_result pr, ");
        query.append("payment p, ");
        query.append("payment_detail pd ");
        query.append("WHERE p.user_id = pr.user_id ");
        query.append("AND component_project_id = pr.project_id ");
        query.append("AND p.most_recent_detail_id = pd.payment_detail_id ");      
        query.append("AND pr.reliability_ind = 1 ");
        query.append("AND pd.installment_number = 1 ");
        query.append("AND pr.project_id = pro.project_id ");
        query.append("AND pro.project_status_id = 7 ");
        query.append("AND old_reliability >= 0.8 ");
        query.append("AND pd.payment_type_id = 6 ");
        query.append("AND not exists ");
        query.append("   (SELECT 1 FROM payment_detail pd2 ");
        query.append("     WHERE pd2.parent_payment_id=p.payment_id ");
        query.append("     AND pd2.payment_type_id=" + PactsConstants.RELIABILITY_BONUS_PAYMENT + ")");
        
        PreparedStatement psSelProjects = prepareStatement("informixoltp", query.toString());
        
		log.info("user_id, project_id, posting date, bonus amount, old reliability, total amount, parent payment id");


        int count = 0;
        ResultSet rs = psSelProjects.executeQuery();
        while (rs.next()) {
        	long userId = rs.getLong("user_id");
        	long projectId = rs.getLong("project_id");
        	double reliability = rs.getDouble("old_reliability");
        	double amount = rs.getDouble("total_amount");
        	long paymentId = rs.getLong("payment_id");
        	Date postingDate = rs.getDate("posting_Date");

        	// use parent's client for the reliability payment
        	String client = rs.getString("client");

        	double bonusAmount;
            if (postingDate.before(SCHEMA_CHANGE_DATE)) {
                bonusAmount = getReliabilityPercent(reliability) * amount;
            } else {
                bonusAmount = getReliabilityPercent2(reliability) * amount;               
            }

            if (onlyAnalyze.equalsIgnoreCase("false")) {
            	ReliabilityBonusPayment bp = new ReliabilityBonusPayment(userId, bonusAmount, paymentId);
            	bp.setClient(client);
            	bp.setNetAmount(bonusAmount);

            	ejb.addPayment(bp);
            }

    		log.info("" + userId + ", " + projectId + ", " + postingDate + ", "+ bonusAmount + ", " + reliability + ", " + amount + ",  " + paymentId);
			count++;			
        }
        log.info("Done. Bonus rows inserted: " + count);
	}

    private double getReliabilityPercent(double reliability) {
        double bonus = 0;
        if (reliability >= .95) {
            bonus = .2;
        } else if (reliability >= .9) {
            bonus = .15;
        } else if (reliability >= .8) {
            bonus = .1;
        }
        return bonus;
    }
    
    private double getReliabilityPercent2(double reliability) {
        double bonus = 0;
        if (reliability >= .95) {
            bonus = .5;
        } else if (reliability >= .9) {
            bonus = .2;
        } else if (reliability >= .8) {
            bonus = .1;
        }
        return bonus;
    }


    public static Object createEJB() throws NamingException, Exception {
        InitialContext initial = TCContext.getInitial();

        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome) 
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return(home.create());
    }
    
    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null) {
        	onlyAnalyze = "false";
        }
        params.remove("onlyAnalyze");

        log.debug("onlyAnalyze : " + onlyAnalyze);
    }

    /**
     * Show usage of the PayReliabilityBonus.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("PayReliabilityBonus:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        fatal_error();
    }



}