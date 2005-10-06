package com.topcoder.web.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.Map;

public interface TCRequest {
    String getParameter(String name);

    String getServletPath();

    String getContextPath();

    void setAttribute(String name, Object o);

    Object getAttribute(String name);

    String getMethod();

    Enumeration getParameterNames();

    String getQueryString();

    String[] getParameterValues(String name);

    HttpSession getSession();

    HttpSession getSession(boolean create);

    String getServerName();

    Cookie[] getCookies();

    String getProtocol();

    String getRemoteAddr();

    String getRemoteHost();

    void removeAttribute(java.lang.String name);

    Map getParameterMap();

    String getHeader(String s);
}
