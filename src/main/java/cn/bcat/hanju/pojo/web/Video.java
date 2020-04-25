package cn.bcat.hanju.pojo.web;

import java.util.Date;

public class Video {

    private String v_name;
    private String year;
    private String actor;
    private String director;
    private String class_name;
    private String status;
    private String detail;
    private String imgurl;
    private int v_id;
    private int visit;
    private int play;
    private int download;
    private Date updatetime;

    public String getV_name() {
        return v_name;
    }

    public void setV_name(String v_name) {
        this.v_name = v_name;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
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

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public int getV_id() {
        return v_id;
    }

    public void setV_id(int v_id) {
        this.v_id = v_id;
    }

    public int getVisit() {
        return visit;
    }

    public void setVisit(int visit) {
        this.visit = visit;
    }

    public int getPlay() {
        return play;
    }

    public void setPlay(int play) {
        this.play = play;
    }

    public int getDownload() {
        return download;
    }

    public void setDownload(int download) {
        this.download = download;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}
