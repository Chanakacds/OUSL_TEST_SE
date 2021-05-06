package com.openuniversity.springjwt.repository;

import com.openuniversity.springjwt.models.Books;
import com.openuniversity.springjwt.models.materialTypes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BooksRepo extends JpaRepository<Books, Long> {
    List<Books> findByMaterialTypes(materialTypes materialTypes);
}
