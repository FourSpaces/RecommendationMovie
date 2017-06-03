package com.movie.os.repository;

import com.movie.os.model.LoginRecordEntity;
import com.movie.os.model.MovieScoreEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created by Kevin on 2017/5/26.
 */
public interface LoginRecordRepository extends PagingAndSortingRepository<LoginRecordEntity, Integer>, JpaRepository<LoginRecordEntity, Integer> {

    public Page<LoginRecordEntity> findByUid(String uid, Pageable var1);

}
