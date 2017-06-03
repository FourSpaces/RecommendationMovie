package com.movie.os.repository;
import com.movie.os.model.MovieScoreEntity;
import com.movie.os.model.RecommendValueEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by Kevin on 2017/5/30.
 */
public interface RecommendValueRepository extends PagingAndSortingRepository <RecommendValueEntity, Integer> , JpaRepository<RecommendValueEntity, Integer> {

    Page<RecommendValueEntity> findByUid(String uid, Pageable var1);

}
