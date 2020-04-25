package cn.bcat.hanju.pojo.web;

public class Index {
    private int v_id;
    private String v_name ;
    private String actor;
    private String status;
    private String imgurl;

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

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    @Override
    public String toString() {
        return "Index{" +
                "v_id='" + v_id + '\'' +
                ", v_name='" + v_name + '\'' +
                ", actor='" + actor + '\'' +
                ", status='" + status + '\'' +
                ", imgurl='" + imgurl + '\'' +
                '}';
    }
}
