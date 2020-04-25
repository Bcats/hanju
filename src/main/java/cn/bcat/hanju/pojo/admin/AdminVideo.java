package cn.bcat.hanju.pojo.admin;

import java.util.Date;

public class AdminVideo {
    private int v_id;
    private String v_name;
    private String class_name;
    private String status;
    private String year;
    private int play;
    private double beanscore;
    private int visit;
    private Date updatetime;
    private String supdatetime;

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public AdminVideo() {
    }

    public int getV_id() {
        return v_id;
    }

    public void setV_id(int v_id) {
        this.v_id = v_id;
    }

    public String getV_name() {
        return v_name;
    }

    public void setV_name(String v_name) {
        this.v_name = v_name;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPlay() {
        return play;
    }

    public void setPlay(int play) {
        this.play = play;
    }

    public double getBeanscore() {
        return beanscore;
    }

    public void setBeanscore(double beanscore) {
        this.beanscore = beanscore;
    }

    public int getVisit() {
        return visit;
    }

    public void setVisit(int visit) {
        this.visit = visit;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getSupdatetime() {
        return supdatetime;
    }

    public void setSupdatetime(String supdatetime) {
        this.supdatetime = supdatetime;
    }
}
