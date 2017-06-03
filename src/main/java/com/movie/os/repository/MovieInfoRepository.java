package com.movie.os.repository;

import com.movie.os.model.MovieInfoEntity;
import com.movie.os.model.RecommendValueEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created by Kevin on 2017/5/24.
 */
public interface MovieInfoRepository extends PagingAndSortingRepository<MovieInfoEntity, Integer> {

    public MovieInfoEntity findByMid(int mid);
    public List<MovieInfoEntity> findByMidIn(Integer[] midlist);
    public List<MovieInfoEntity> findByMidIn(List<Integer> midlist);
    public Page<MovieInfoEntity> findByTagLike(String tag, Pageable var1);
    public Page<MovieInfoEntity> findByNameLike(String name, Pageable var1);

}