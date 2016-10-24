/**
 * @date 2016/10/17
 * @author 王梓
 */
package com.icss.bean;

public class UserRole {
    private Integer id;

    private Integer eid;

    private Integer rid;
    
    private String ridlist;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public String getRidlist() {
        return ridlist;
    }

    public void setRidlist(String ridlist) {
        this.ridlist = ridlist;
    }
    
    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }
}