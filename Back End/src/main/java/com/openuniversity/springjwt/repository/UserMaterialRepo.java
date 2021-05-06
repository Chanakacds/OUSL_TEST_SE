package com.openuniversity.springjwt.repository;


import com.openuniversity.springjwt.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMaterialRepo extends JpaRepository<userMaterial, Long> {
    List<userMaterial> findByUser(User user);

    boolean existsByUserAndBooks(User user, Books b);

    boolean existsByUserAndMagazines(User user, Magazines magazines);
}
