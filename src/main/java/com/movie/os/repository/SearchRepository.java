package com.movie.os.repository;

import com.movie.os.model.RecommendValueEntity;
import com.movie.os.model.SearchEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by Kevin on 2017/5/30.
 */
public interface SearchRepository  extends PagingAndSortingRepository<SearchEntity, Integer>, JpaRepository<SearchEntity, Integer> {
    Page<SearchEntity> findByUid(Integer uid, Pageable var1);

}
