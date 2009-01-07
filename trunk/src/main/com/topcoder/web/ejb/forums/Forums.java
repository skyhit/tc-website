package com.topcoder.web.ejb.forums;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;

import javax.ejb.EJBException;

import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.UserNotFoundException;
import com.jivesoftware.forum.ForumCategoryNotFoundException;
import com.jivesoftware.forum.ForumNotFoundException;

public interface Forums extends EJBObject {
    
    public void assignRole(long userID, long groupID) throws EJBException, RemoteException;
    
    public void assignRole(long userID, String groupName) throws EJBException, RemoteException;
    
    public void removeRole(long userID, long groupID) throws EJBException, RemoteException;
    
    public void removeRole(long userID, String groupName) throws EJBException, RemoteException;
    
    public void setPublic(long categoryID, boolean isPublic) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException;
    
    public boolean isPublic(long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException;
    
    public void closeCategory(long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException;
    
    public boolean canReadCategory(long userID, long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException;
    
    public void createCategoryWatch(long userID, long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException;
    
    public void createCategoryWatches(long userID, long[] categoryIDs) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException;
    
    public void deleteCategoryWatch(long userID, long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException;
    
    public ArrayList getSoftwareForumCategoryData(long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException; 
    
    public String[][] getSoftwareCategoriesData() throws EJBException, RemoteException;
    
    public String[][] getWatchedSoftwareCategoriesData(long userID, boolean isWatched) throws EJBException, RemoteException;
    
    public String[][] getSoftwareRolesData(long userID) throws EJBException, RemoteException;
    
    public String[][] getAllSoftwareRolesData() throws EJBException, RemoteException;
    
    public long createSoftwareComponentForums(String componentName, long componentID, long versionID,
    		long phaseID, long componentStatusID, long rootCategoryID, String description, String versionText, 
    		boolean isPublic)
    	throws EJBException, RemoteException, Exception;
    
    public void updateComponentVersion(long categoryID, String versionText) throws EJBException, RemoteException, Exception;
    
    //public long getSoftwareComponentID(ForumCategory category) throws EJBException, RemoteException, SQLException;
    
    public long createMarathonForum(long roundID, String name) throws EJBException, RemoteException;
    
    public long createStudioForum(String name) throws EJBException, RemoteException;
    
    public void createForumWatch(long userID, long forumID) throws Exception, EJBException, RemoteException;

}