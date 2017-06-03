package com.movie.os.model;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by Kevin on 2017/5/30.
 */
@Entity
@Table(name = "login_record", schema = "movie_system", catalog = "")
public class LoginRecordEntity {
    private int lid;
    private String uid;
    private String ip;
    private Date loginTime;

    @Id
    @Column(name = "lid", nullable = false)
    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    @Basic
    @Column(name = "uid", nullable = true, length = 20)
    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "ip", nullable = true, length = 16)
    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    @Basic
    @Column(name = "login_time", nullable = true)
    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LoginRecordEntity that = (LoginRecordEntity) o;

        if (lid != that.lid) return false;
        if (uid != null ? !uid.equals(that.uid) : that.uid != null) return false;
        if (ip != null ? !ip.equals(that.ip) : that.ip != null) return false;
        if (loginTime != null ? !loginTime.equals(that.loginTime) : that.loginTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = lid;
        result = 31 * result + (uid != null ? uid.hashCode() : 0);
        result = 31 * result + (ip != null ? ip.hashCode() : 0);
        result = 31 * result + (loginTime != null ? loginTime.hashCode() : 0);
        return result;
    }
}
