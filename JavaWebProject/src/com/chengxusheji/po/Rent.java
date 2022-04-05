package com.chengxusheji.po;

import org.json.JSONException;
import org.json.JSONObject;

public class Rent {
    private int id;
    private Hourse hourseObj;
    private UserInfo userInfoObj;
    private String starttime;
    private String endtime;
    private float rentprice;
    private String nowtime;
    public JSONObject getJsonObject() throws JSONException {
        JSONObject jsonHourse=new JSONObject();
        jsonHourse.accumulate("id", this.getId());
        jsonHourse.accumulate("hourseObj", this.getHourseObj().getHourseId());
        jsonHourse.accumulate("userInfoObj", this.getUserInfoObj().getUser_name());
        jsonHourse.accumulate("starttime", this.getStarttime());
        jsonHourse.accumulate("endtime", this.getEndtime());
        jsonHourse.accumulate("rentprice", this.getRentprice());
        jsonHourse.accumulate("nowtime", this.getNowtime());
        return jsonHourse;
    }

    public String getNowtime() {
        return nowtime;
    }

    public void setNowtime(String nowtime) {
        this.nowtime = nowtime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Hourse getHourseObj() {
        return hourseObj;
    }

    public void setHourseObj(Hourse hourseObj) {
        this.hourseObj = hourseObj;
    }

    public UserInfo getUserInfoObj() {
        return userInfoObj;
    }

    public void setUserInfoObj(UserInfo userInfoObj) {
        this.userInfoObj = userInfoObj;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public float getRentprice() {
        return rentprice;
    }

    public void setRentprice(float rentprice) {
        this.rentprice = rentprice;
    }

    @Override
    public String toString() {
        return "Rent{" +
                "id=" + id +
                ", hourseObj=" + hourseObj +
                ", userInfoObj=" + userInfoObj +
                ", starttime='" + starttime + '\'' +
                ", endtime='" + endtime + '\'' +
                ", rentprice=" + rentprice +
                ", nowtime='" + nowtime + '\'' +
                '}';
    }
}
