package com.topcoder.web.tc.model;

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import java.text.NumberFormat;
import java.text.FieldPosition;

public class ProblemRatingResult {

    private List frequencies = null;
    private String name = null;

    public ProblemRatingResult() {
        frequencies = new ArrayList();
        name = "";
    }

    public List getFrequencies() {
        return frequencies;
    }

    public void setFrequencies(List frequencies) {
        this.frequencies = frequencies;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getList() {
        StringBuffer buf = new StringBuffer(frequencies.size() * 5);
        NumberFormat format = NumberFormat.getInstance();
        format.setMaximumFractionDigits(2);
        FieldPosition fp = new FieldPosition(NumberFormat.FRACTION_FIELD);
        for (Iterator it = frequencies.iterator(); it.hasNext();) {
            format.format(it.next(), buf, fp);
            buf.append(',');
        }
        return buf.substring(0, buf.length() - 1);  //skip that last comma
    }


}
