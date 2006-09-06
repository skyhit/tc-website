package com.topcoder.web.studio.dao;

import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class FileTypeDAOTestCase extends TCHibernateTestCase {
    public void testGetFileTypes() {
        assertFalse("couldn't find the file types", StudioDAOUtil.getFactory().getFileTypeDAO().getFileTypes().isEmpty());
    }

    public void testFindById() {
        assertFalse("couldn't find type 1", StudioDAOUtil.getFactory().getFileTypeDAO().find(new Integer(1)) == null);
    }

    public void testMimeType() {
        assertFalse("couldn't find type text/plain", StudioDAOUtil.getFactory().getFileTypeDAO().find("text/plain") == null);
    }
}
