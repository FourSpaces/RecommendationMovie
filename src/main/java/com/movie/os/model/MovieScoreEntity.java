package com.movie.os.model;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by Kevin on 2017/5/30.
 */
@Entity
@Table(name = "movie_score", schema = "movie_system", catalog = "")
public class MovieScoreEntity {
    private int sid;
    private Integer mid;
    private Integer uid;
    private Integer score;
    private Date time;



//    private MovieInfoEntity movieInfoEntity;
//
//    @OneToOne
//    @JoinColumn(name="midbak")
//    public MovieInfoEntity getMovieInfoEntity() {
//        return movieInfoEntity;
//    }
//
//    public void setMovieInfoEntity(MovieInfoEntity movieInfoEntity) {
//        this.movieInfoEntity = movieInfoEntity;
//    }

    @Id
    @Column(name = "sid", nullable = false)
    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    @Basic
    @Column(name = "mid", nullable = true)
    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    @Basic
    @Column(name = "uid", nullable = true)
    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
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
    @Column(name = "time", nullable = true)
    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MovieScoreEntity that = (MovieScoreEntity) o;

        if (sid != that.sid) return false;
        if (mid != null ? !mid.equals(that.mid) : that.mid != null) return false;
        if (uid != null ? !uid.equals(that.uid) : that.uid != null) return false;
        if (score != null ? !score.equals(that.score) : that.score != null) return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sid;
        result = 31 * result + (mid != null ? mid.hashCode() : 0);
        result = 31 * result + (uid != null ? uid.hashCode() : 0);
        result = 31 * result + (score != null ? score.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        return result;
    }
}
