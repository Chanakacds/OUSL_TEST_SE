package com.openuniversity.springjwt.repository;


import com.openuniversity.springjwt.models.materialTypes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface materialTypeRepo extends JpaRepository<materialTypes, Long> {

}
