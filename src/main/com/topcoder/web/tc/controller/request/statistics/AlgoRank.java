package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import java.util.Map;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 25, 2005
 */
public class AlgoRank extends Base {



    public void businessProcessing() throws Exception {
        Request r = new Request();
        //can't do school because we allow people to not make their school known
        //a list could be a give-away as to who goes where
        String countryCode = StringUtils.checkNull(getRequest().getParameter(Constants.COUNTRY_CODE));
//        String schoolId = StringUtils.checkNull(getRequest().getParameter(Constants.SCHOOL_ID));
        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));

        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        if (!(sortCol.equals("") || sortDir.equals(""))) {
            r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
            r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
        }

        SortInfo s = new SortInfo();
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);



        if ("".equals(numRecords)) {
            numRecords = "50";
        } else if (Integer.parseInt(numRecords)>200) {
            numRecords="200";
        }
        setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);

        if ("".equals(startRank)||Integer.parseInt(startRank)<=0) {
            startRank = "1";
        }
        setDefault(DataAccessConstants.START_RANK, startRank);

        r.setProperty(DataAccessConstants.START_RANK, startRank);
        r.setProperty(DataAccessConstants.END_RANK,
            String.valueOf(Integer.parseInt(startRank)+Integer.parseInt(numRecords)-1));

        ResultSetContainer ret = null;
        if (!"".equals(countryCode)) {
            r.setContentHandle("country_algo_coder_rank");
            if (countryCode.length()!=3)  {
                throw new NavigationException("Sorry, You entered an invalid request parameter");
            }
            r.setProperty(Constants.COUNTRY_CODE, countryCode);
            r.setProperty(DataAccessConstants.SORT_QUERY, "country_algo_coder_rank");
        
            Map m = getDataAccess().getData(r);
            
            ret = (ResultSetContainer)m.get("country_algo_coder_rank");
            String countryName = ((ResultSetContainer)m.get("country_info")).getStringItem(0, "country_name");
            setDefault(Constants.COUNTRY_CODE, countryCode);
            getRequest().setAttribute("countryName", countryName);
        }/* else if (!"".equals(schoolId)) {
            r.setContentHandle("school_algo_coder_rank");
            r.setProperty(Constants.SCHOOL_ID, schoolId);
            ret = (ResultSetContainer)getDataAccess().getData(r).get("school_algo_coder_rank");
        }*/ else {
            r.setContentHandle("coder_ratings");
            r.setProperty(DataAccessConstants.SORT_QUERY, "Coder_Ratings");
            ret = (ResultSetContainer)getDataAccess().getData(r).get("Coder_Ratings");
        }

        getRequest().setAttribute("list", ret);
        setNextPage("/statistics/algorithmRankList.jsp");
        setIsNextPageInContext(true);


    }
}
