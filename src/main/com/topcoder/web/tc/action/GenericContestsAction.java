/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;
import com.topcoder.web.tc.CategoriesManager;
import com.topcoder.web.tc.CategoriesManagerException;
import com.topcoder.web.tc.Helper;

/**
 * The action to display contests pages.
 * <p>
 * <b>Thread Safety:</b> This class is not thread safe because its base class is
 * not thread safe.
 * </p>
 * 
 * @author TCSASSEMBLIER
 * @version 1.0
 */
public class GenericContestsAction extends ActionSupport {
    /**
     * The category of the contests.
     */
    private String category;

    /**
     * The page title.
     */
    private String title;

    /**
     * The contest name.
     */
    private String contestName;

    /**
     * The contest type.
     */
    private String type;

    /**
     * The contest catalog;
     */
    private String catalog;

    /**
     * The CategoriesManager for getting contest types, sub-types, and catalogs.
     */
    private CategoriesManager categoriesManager;

    /**
     * The mapping between catalogs and the corresponding categories.
     */
    private Map<String, List<String>> categoriesByCatalog;

    /**
     * The mapping between categories and the corresponding sub categories.
     */
    private Map<String, List<String>> subCategoriesByCategory;

    /**
     * The list of catalogs.
     */
    private List<String> catalogs;

    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be
     * that constant value It is final and won't change once it is initialized
     * as part of variable declaration to:
     * Logger.getLogger(GenericContestsAction.class). It is used throughout the
     * class wherever logging is needed.
     * </p>
     */
    private static final Logger LOGGER = Logger
            .getLogger(GenericContestsAction.class);

    /**
     * The mapping between titles and categories.
     */
    private static final Map<String, String> titleMap;

    /**
     * Initializes the static members.
     */
    static {
        titleMap = new HashMap<String, String>();
        titleMap.put("ActiveContests", "Active Contests");
        titleMap.put("ContestStatus", "Contests Status");
        titleMap.put("PastContests", "Past Contests");
        titleMap.put("UpcomingContests", "Upcoming Contests");
        titleMap.put("ReviewOpportunities", "Review Opportunities");
        titleMap.put("SearchContests", "Search Contests");
    }

    /**
     * Executes the action.
     * 
     * @return SUCCESS.
     * @throws CategoriesManagerException
     *             if any error occurs while accessing the database.
     */
    public String execute() throws CategoriesManagerException {
        final String signature = "execute";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        // Get the categories by catalogs
        categoriesByCatalog = new HashMap<String, List<String>>();
        subCategoriesByCategory = new HashMap<String, List<String>>();
        catalogs = categoriesManager.getCatalogs();
        for (String c : catalogs) {
            List<String> categories = categoriesManager.getContestTypes(c);
            categoriesByCatalog.put(c, categories);

            // Get sub categories by categories
            for (String cat : categories) {
                List<String> subCategories = categoriesManager
                        .getContestSubTypes(cat);
                subCategoriesByCategory.put(cat, subCategories);
            }
        }

        if ("ActiveContests".equals(category)) {
            // Sets the current catalog
            for (String c : categoriesByCatalog.keySet()) {
                if (categoriesByCatalog.get(c).contains(type)) {
                    catalog = c;
                    break;
                }
            }
        }
        title = titleMap.get(category);
        Helper.logExit(LOGGER, signature, startTime, new Object[] { SUCCESS });
        return SUCCESS;
    }

    /**
     * Sets the contest type.
     * 
     * @param type
     *            the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * Gets the contest type.
     * 
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * Sets the contest name.
     * 
     * @param contestName
     *            the contestName to set
     */
    public void setContestName(String contestName) {
        this.contestName = contestName;
    }

    /**
     * Gets the contest name.
     * 
     * @return the contestName
     */
    public String getContestName() {
        return contestName;
    }

    /**
     * Gets the contest catalog.
     * 
     * @return the contest catalog.
     */
    public String getCatalog() {
        return catalog;
    }

    /**
     * Sets the category of the contests.
     * 
     * @param category
     *            the category.
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * Gets the category of the contests.
     * 
     * @return the category.
     */
    public String getCategory() {
        return category;
    }

    /**
     * Gets the page title.
     * 
     * @return the page title.
     */
    public String getTitle() {
        return title;
    }

    /**
     * Gets the mapping between catalogs and the corresponding categories.
     * 
     * @return mapping between catalogs and the corresponding categories.
     */
    public Map<String, List<String>> getCategoriesByCatalog() {
        return categoriesByCatalog;
    }

    /**
     * Gets the list of catalogs.
     * 
     * @return the list of catalogs.
     */
    public List<String> getCatalogs() {
        return catalogs;
    }

    /**
     * Gets the mapping between categories and the corresponding sub categories.
     * 
     * @return the mapping between categories and the corresponding sub
     *         categories.
     */
    public Map<String, List<String>> getSubCategoriesByCategory() {
        return subCategoriesByCategory;
    }

    /**
     * Sets the categories manager.
     * 
     * @param categoriesManager
     *            the categories manager to set.
     */
    public void setCategoriesManager(CategoriesManager categoriesManager) {
        this.categoriesManager = categoriesManager;
    }
}