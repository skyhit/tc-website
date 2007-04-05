package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class EventType extends Base {

    public static final Integer CONTEST_ID = new Integer(1);
    public static final Integer INVITATIONAL_ID = new Integer(2);
    public static final Integer ROUND_ID = new Integer(3);
    public static final Integer TOURNAMENT_ID = new Integer(4);
    public static final Integer COMPONENT_TOURNAMENT_ID = new Integer(5);
    public static final Integer ALGORITHM_TOURNAMENT_ID = new Integer(6);
    public static final Integer STUDIO_TOURNAMENT_ID = new Integer(7);
    public static final Integer HIGH_SCHOOL_TOURNAMENT_ID = new Integer(8);
    public static final Integer MARATHON_TOURNAMENT_ID = new Integer(9);

    public EventType() {

    }

    private Integer id;
    private String description;

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

}

