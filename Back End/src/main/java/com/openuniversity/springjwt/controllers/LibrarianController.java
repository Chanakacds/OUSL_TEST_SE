package com.openuniversity.springjwt.controllers;

import com.openuniversity.springjwt.models.*;
import com.openuniversity.springjwt.payload.request.AddBookRequest;
import com.openuniversity.springjwt.payload.response.MessageResponse;
import com.openuniversity.springjwt.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/librarian")
public class LibrarianController {
    @Autowired
    BooksRepo booksRepo;

    @Autowired
    MagazinesRepo magazinesRepo;

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserMaterialRepo userMaterialRepo;

    @Autowired
    materialTypeRepo materialTypeRepo;


    @PostMapping("/addBook")
    @PreAuthorize("hasRole('LIBRARIAN')")
    public ResponseEntity<?> addBook(@RequestBody AddBookRequest addBookRequest){
        String name = addBookRequest.getBookName();
        materialTypes materialTypes = materialTypeRepo.findById(1L).orElse(null);
        Books books = new Books(name, materialTypes);

        booksRepo.save(books);

        return ResponseEntity.ok().body(new MessageResponse("Success!"));
    }

    @PostMapping("/addMagazine")
    @PreAuthorize("hasRole('LIBRARIAN')")
    public ResponseEntity<?> addMagazine(@RequestBody AddBookRequest addBookRequest){
        String name = addBookRequest.getBookName();
        materialTypes materialTypes = materialTypeRepo.findById(2L).orElse(null);

        Magazines books = new Magazines(name, materialTypes);

        magazinesRepo.save(books);

        return ResponseEntity.ok().body(new MessageResponse("Success!"));
    }

    @GetMapping("/viewMaterials/{type}")
    public ResponseEntity<?> viewMaterials(@PathVariable("type") long type){
        materialTypes materialTypes = materialTypeRepo.findById(type).orElse(null);

        if(type == 1) {
            List<Books> books = booksRepo.findByMaterialTypes(materialTypes);
            return new ResponseEntity<List<Books>>(books, HttpStatus.OK);
        }else {
            List<Magazines> magazines = magazinesRepo.findByMaterialTypes(materialTypes);
            return new ResponseEntity<List<Magazines>>(magazines, HttpStatus.OK);
        }
    }

    @GetMapping("/viewUsers")
    @PreAuthorize("hasRole('LIBRARIAN')")
    public ResponseEntity<?> viewUsers(){
        List<User> users = userRepository.findAll();

        return new ResponseEntity<List<User>>(users, HttpStatus.OK);
    }

    @GetMapping("viewByUser/{userId}")
    @PreAuthorize("hasRole('LIBRARIAN')")
    public ResponseEntity<?> viewByUser(@PathVariable("userId") long userId){
        User user = userRepository.findById(userId).orElse(null);

        List<userMaterial> userMaterials = userMaterialRepo.findByUser(user);

        return new ResponseEntity<List<userMaterial>>(userMaterials, HttpStatus.OK);
    }
}
