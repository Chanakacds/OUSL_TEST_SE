package com.openuniversity.springjwt.controllers;

import com.openuniversity.springjwt.models.*;
import com.openuniversity.springjwt.payload.request.BookMaterialRequest;
import com.openuniversity.springjwt.payload.response.MessageResponse;
import com.openuniversity.springjwt.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/student")
public class StudentController {
    @Autowired
    BooksRepo booksRepo;

    @Autowired
    MagazinesRepo magazinesRepo;

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserMaterialRepo userMaterialRepo;

    @Autowired
    com.openuniversity.springjwt.repository.materialTypeRepo materialTypeRepo;


    @PostMapping("/bookMaterial")
    @PreAuthorize("hasRole('STUDENT')")
    public ResponseEntity<?> bookMaterial(@RequestBody BookMaterialRequest bookMaterialRequest){
        User user = userRepository.findById(bookMaterialRequest.getUserId()).orElse(null);
        materialTypes materialTypes = materialTypeRepo.findById(bookMaterialRequest.getMaterialTypeId()).orElse(null);
        if(bookMaterialRequest.getMaterialTypeId() == 1){
            Books books = booksRepo.findById(bookMaterialRequest.getMaterialId()).orElse(null);
            userMaterial userMaterial = new userMaterial(user, materialTypes, books, null);
            if(!userMaterialRepo.existsByUserAndBooks(user, books)) {
                userMaterialRepo.save(userMaterial);
            }
        }
        else{
            Magazines magazines = magazinesRepo.findById(bookMaterialRequest.getMaterialId()).orElse(null);
            userMaterial userMaterial = new userMaterial(user, materialTypes, null, magazines);
            if(!userMaterialRepo.existsByUserAndMagazines(user, magazines)) {
                userMaterialRepo.save(userMaterial);
            }
        }
        return ResponseEntity.ok().body(new MessageResponse("Success!"));
    }
}
