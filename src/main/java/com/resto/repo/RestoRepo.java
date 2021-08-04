package com.resto.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.resto.model.Restaurant;

@Repository
public interface RestoRepo extends CrudRepository<Restaurant, Long>{

}
