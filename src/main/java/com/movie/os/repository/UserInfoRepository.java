package com.movie.os.repository;

import com.movie.os.model.UserInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by Kevin on 2017/5/7.
 */
public interface UserInfoRepository extends JpaRepository<UserInfoEntity, Integer> {

    @Modifying      // 说明该方法是修改操作
    @Transactional  // 说明该方法是事务性操作
    @Query("update UserInfoEntity ui set ui.username=:qUsername, ui.nickname=:qNickname,ui.regTime=:qRegTime where ui.uid=:qUid")
    public void updateUI(@Param("qUsername") String username, @Param("qNickname") String nickname,
                         @Param("qRegTime") Date regTime, @Param("qUid") Integer uid);

    @Modifying      // 说明该方法是修改操作
    @Transactional  // 说明该方法是事务性操作
    @Query("update UserInfoEntity ui set ui.password=:qPassword where ui.uid=:qUid")
    public void updatePassword(@Param("qPassword") String password, @Param("qUid") Integer uid);

    @Modifying      // 说明该方法是修改操作
    @Transactional  // 说明该方法是事务性操作
    @Query("update UserInfoEntity ui set ui.remark=:qRemark where ui.uid=:qUid")
    public void updateRemark(@Param("qRemark") String remark, @Param("qUid") Integer uid);

    public List<UserInfoEntity> findByUsername(String Username);
}
