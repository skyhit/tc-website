package com.topcoder.web.csf.dao;


import com.topcoder.web.csf.model.ContestStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public interface ContestStatusDAO {
    ContestStatus find(Integer id);

    List getContestStatuses();
}
