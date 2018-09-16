/*
Filter by id, name, age, date. Include information about users per page.
Used in POST requests.
*/
package com.santika.parts.model;

public class PartsFilter {

    private String name;
    private String need;
    private int page, partsPerPage;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNeed() {
        return need;
    }

    public void setNeed(String need) {
        this.need = need;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPartsPerPage() {
        return partsPerPage;
    }

    public void setPartsPerPage(int partsPerPage) {
        this.partsPerPage = partsPerPage;
    }


}
