package com.movie.os.repository;

import com.movie.os.model.MovieScoreEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * Created by Kevin on 2017/5/24.
 */
public interface MovieScoreRepository extends PagingAndSortingRepository<MovieScoreEntity, Integer> , JpaRepository<MovieScoreEntity, Integer> {
//public interface MovieScoreRepository extends JpaSpecificationExecutor<MovieScoreEntity>, JpaRepository<MovieScoreEntity, Integer> {

    Page<MovieScoreEntity> findByMid(int mid,Pageable var1);
    MovieScoreEntity findByMidAndUid(int mid,int uid);
    Page<MovieScoreEntity> findByUid(int Uid,Pageable var1);

    @Modifying      // 说明该方法是修改操作
    @Transactional  // 说明该方法是事务性操作
    // 定义查询
    // @Param注解用于提取参数
    @Query("update MovieScoreEntity ms set ms.mid=:qMid, ms.uid=:qUid, ms.score=:qScore, ms.time=:qTime where ms.sid=:qSid")
    public void updateMS(@Param("qMid") Integer mid, @Param("qUid") Integer uid,
                                 @Param("qScore") Integer score, @Param("qTime") Date time,
                                 @Param("qSid") Integer sid);
}
