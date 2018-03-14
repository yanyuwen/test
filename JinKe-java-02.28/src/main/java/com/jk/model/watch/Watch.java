package com.jk.model.watch;


import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Watch implements Serializable {

    private Integer id;
    private String watchname;
    private Integer watchtype;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date watchdate;
    private Integer watchcolor;
    private Integer watchprice;
    private String watchjianjie;
    private String watchimg;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWatchname() {
        return watchname;
    }

    public void setWatchname(String watchname) {
        this.watchname = watchname;
    }

    public Integer getWatchtype() {
        return watchtype;
    }

    public void setWatchtype(Integer watchtype) {
        this.watchtype = watchtype;
    }

    public String getWatchdate() {
        if(watchdate==null){
            return null;
        }
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        return sim.format(watchdate);
    }

    public void setWatchdate(Date watchdate) {
        this.watchdate = watchdate;
    }

    public Integer getWatchcolor() {
        return watchcolor;
    }

    public void setWatchcolor(Integer watchcolor) {
        this.watchcolor = watchcolor;
    }

    public Integer getWatchprice() {
        return watchprice;
    }

    public void setWatchprice(Integer watchprice) {
        this.watchprice = watchprice;
    }

    public String getWatchjianjie() {
        return watchjianjie;
    }

    public void setWatchjianjie(String watchjianjie) {
        this.watchjianjie = watchjianjie;
    }

    public String getWatchimg() {
        return watchimg;
    }

    public void setWatchimg(String watchimg) {
        this.watchimg = watchimg;
    }

    @Override
    public String toString() {
        return "Watch{" +
                "id=" + id +
                ", watchname='" + watchname + '\'' +
                ", watchtype=" + watchtype +
                ", watchdate=" + watchdate +
                ", watchcolor=" + watchcolor +
                ", watchprice=" + watchprice +
                ", watchjianjie='" + watchjianjie + '\'' +
                ", watchimg='" + watchimg + '\'' +
                '}';
    }
}
