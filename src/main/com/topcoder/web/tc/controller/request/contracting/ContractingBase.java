/*
 * ContractingBase.java
 *
 * Created on October 1, 2004, 11:18 AM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.shared.security.Persistor;
import com.topcoder.web.tc.Constants;

import com.topcoder.web.tc.model.ContractingInfo;
/**
 *
 * @author  rfairfax
 */
abstract public class ContractingBase extends BaseProcessor {
     
    protected Persistor p; 
    protected ContractingInfo info;
    
    protected void businessProcessing() throws TCWebException {
        try {
            p = new SessionPersistor(getRequest().getSession(true));

            info = getInfoFromPersistor();
            
            if(info == null) {
                info = getInfoFromDB();
            }
            
            info = updateContractingInfo(info);
            
            p.setObject(Constants.CONTRACTING_INFO, info);
            
            setDefaults(info);
            
            contractingProcessing();  
            
            setNextPage();
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    protected abstract void setDefaults(ContractingInfo info);
    
    protected abstract void setNextPage();
    
    protected abstract ContractingInfo updateContractingInfo(ContractingInfo info);
    
    protected abstract void contractingProcessing() throws TCWebException;

    protected ContractingInfo getInfoFromPersistor() {
        ContractingInfo info = null;
        info = (ContractingInfo)p.getObject(Constants.CONTRACTING_INFO);
        return info;
    }
    
    protected ContractingInfo getInfoFromDB() {
        ContractingInfo info = new ContractingInfo();
        
        info.setUserID(getUser().getId());
        
        return info;
    }
    
}
