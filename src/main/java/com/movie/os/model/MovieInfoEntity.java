package com.movie.os.model;

import javax.persistence.*;

/**
 * Created by Kevin on 2017/5/30.
 */
@Entity
@Table(name = "movie_info", schema = "movie_system", catalog = "")
public class MovieInfoEntity {
    private int mid;
    private String name;
    private String tag;
    private String poster;
    private String director;
    private String screenwriter;
    private String performer;
    private Integer score;
    private Integer scoreitem;
    private Integer time;
    private String details;
    private Byte status;

    @Id
    @Column(name = "mid", nullable = false)
    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 40)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "tag", nullable = true, length = 240)
    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Basic
    @Column(name = "poster", nullable = true, length = 240)
    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    @Basic
    @Column(name = "director", nullable = true, length = 240)
    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    @Basic
    @Column(name = "screenwriter", nullable = true, length = 240)
    public String getScreenwriter() {
        return screenwriter;
    }

    public void setScreenwriter(String screenwriter) {
        this.screenwriter = screenwriter;
    }

    @Basic
    @Column(name = "performer", nullable = true, length = 240)
    public String getPerformer() {
        return performer;
    }

    public void setPerformer(String performer) {
        this.performer = performer;
    }

    @Basic
    @Column(name = "score", nullable = true)
    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Basic
    @Column(name = "scoreitem", nullable = true)
    public Integer getScoreitem() {
        return scoreitem;
    }

    public void setScoreitem(Integer scoreitem) {
        this.scoreitem = scoreitem;
    }

    @Basic
    @Column(name = "time", nullable = true)
    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    @Basic
    @Column(name = "details", nullable = true, length = -1)
    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    @Basic
    @Column(name = "status", nullable = true)
    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MovieInfoEntity that = (MovieInfoEntity) o;

        if (mid != that.mid) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (tag != null ? !tag.equals(that.tag) : that.tag != null) return false;
        if (poster != null ? !poster.equals(that.poster) : that.poster != null) return false;
        if (director != null ? !director.equals(that.director) : that.director != null) return false;
        if (screenwriter != null ? !screenwriter.equals(that.screenwriter) : that.screenwriter != null) return false;
        if (performer != null ? !performer.equals(that.performer) : that.performer != null) return false;
        if (score != null ? !score.equals(that.score) : that.score != null) return false;
        if (scoreitem != null ? !scoreitem.equals(that.scoreitem) : that.scoreitem != null) return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;
        if (details != null ? !details.equals(that.details) : that.details != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = mid;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (tag != null ? tag.hashCode() : 0);
        result = 31 * result + (poster != null ? poster.hashCode() : 0);
        result = 31 * result + (director != null ? director.hashCode() : 0);
        result = 31 * result + (screenwriter != null ? screenwriter.hashCode() : 0);
        result = 31 * result + (performer != null ? performer.hashCode() : 0);
        result = 31 * result + (score != null ? score.hashCode() : 0);
        result = 31 * result + (scoreitem != null ? scoreitem.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + (details != null ? details.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
