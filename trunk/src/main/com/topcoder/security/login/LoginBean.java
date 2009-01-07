package com.topcoder.security.login;

import com.topcoder.security.*;
import org.apache.log4j.Logger;

import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;

/**
 * Use for logging users into a system.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */
public class LoginBean extends BaseEJB {

    private static final Logger logger = Logger.getLogger(LoginBean.class);
    private static final String DATA_SOURCE = "java:comp/env/jdbc/DefaultDS";


    public TCSubject login(String username, String password)
            throws AuthenticationException, GeneralSecurityException {
        return login(username, password, DATA_SOURCE);
    }


    /**
     * Logs users into a system.  Checks username and password, returns a
     * TCSubject representation of the user that includes the user's roles.
     * Encrypts password, compares to stored, encrypted password.
     *
     * @param username
     * @param password Plain text password
     * @return TCSubject
     * @throws AuthenticationException Thrown when username/password
     *                                 combination does not exist in the db.
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */
    public TCSubject login(String username, String password, String dataSource)
            throws AuthenticationException, GeneralSecurityException {

        logger.debug("LoginBean.login: " + username);

        checkLength(username, SecurityDB.maxUsernameLength);
        checkLength(password, SecurityDB.maxPasswordLength);

        long userId;
        Set pl = new HashSet();

        //encode password
        String encPassword = Util.encodePassword(password, "users");

        String query =
                "SELECT login_id FROM security_user " +
                "WHERE user_id = ? AND password = ?";

        InitialContext ctx = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);
            ps1 = conn.prepareStatement(query);
            ps1.setString(1, username);
            ps1.setString(2, encPassword);
            rs1 = ps1.executeQuery();

            //if this returns a result there was an exact username and password match
            //ResultSet rs1 = Util.getResults(conn, query);
            logger.debug("LoginBean.login got ResultSet");

            if (rs1.next()) { //was a match
                userId = rs1.getLong(1);
                logger.debug("Logging in login_id: " + userId);
            } else { //username and password didn't match or weren't in db
                throw new AuthenticationException("Username and/or password are incorrect");
            }
            //get user's id and roles

            query =
                    "SELECT security_roles.role_id, description " +
                    "FROM user_role_xref, security_roles " +
                    "WHERE user_role_xref.login_id = ? " +
                    "AND user_role_xref.role_id = security_roles.role_id" +
                    " AND user_role_xref.security_status_id = ?"+
                    " UNION " +
                    "SELECT security_roles.role_id, description " +
                    "FROM security_roles, user_group_xref, group_role_xref " +
                    "WHERE user_group_xref.login_id = ? " +
                    "AND user_group_xref.group_id = group_role_xref.group_id " +
                    " and user_group_xref.security_status_id = ? " + 
                    " and group_role_xref.security_status_id = ? " +
                    "AND group_role_xref.role_id = security_roles.role_id";
            ps2 = conn.prepareStatement(query);
            ps2.setLong(1, userId);
            ps2.setInt(2, SecurityDB.STATUS_ACTIVE);
            ps2.setLong(3, userId);
            ps2.setInt(4, SecurityDB.STATUS_ACTIVE);
            ps2.setInt(5, SecurityDB.STATUS_ACTIVE);
            rs2 = ps2.executeQuery();

            //build list of RolePrincipals
            RolePrincipal rp = null;
            while (rs2.next()) {
                //logger.debug(rs2.getRow() + " adding principal: " + rs2.getLong(1));
                rp = new RolePrincipal(rs2.getString(2), rs2.getLong(1));
                pl.add(rp);
            }
        } catch (GeneralSecurityException e) {
            throw e;
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs1);
            close(rs2);
            close(ps1);
            close(ps2);
            close(conn);
            close(ctx);
        }
        //create TCSubject
        TCSubject sub = new TCSubject(pl, userId);
        return sub;
    }
}