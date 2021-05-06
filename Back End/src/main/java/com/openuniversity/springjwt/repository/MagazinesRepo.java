package com.openuniversity.springjwt.repository;

import com.openuniversity.springjwt.models.Magazines;
import com.openuniversity.springjwt.models.materialTypes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MagazinesRepo extends JpaRepository<Magazines, Long> {
    List<Magazines> findByMaterialTypes(materialTypes materialTypes);
}
