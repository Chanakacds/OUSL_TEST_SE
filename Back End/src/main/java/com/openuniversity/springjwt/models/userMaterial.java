package com.openuniversity.springjwt.models;


import javax.persistence.*;
import java.awt.print.Book;

@Entity
@Table(name = "user_material_info")
public class userMaterial {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    private User user;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "material_type_id", referencedColumnName = "id", nullable = false)
    private materialTypes materialTypes;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "book_id", referencedColumnName = "id")
    private Books books;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "magazine_id", referencedColumnName = "id")
    private Magazines magazines;

    public userMaterial(User user, com.openuniversity.springjwt.models.materialTypes materialTypes, Books books, Magazines magazines) {
        this.user = user;
        this.materialTypes = materialTypes;
        this.books = books;
        this.magazines = magazines;
    }

    public userMaterial() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public com.openuniversity.springjwt.models.materialTypes getMaterialTypes() {
        return materialTypes;
    }

    public void setMaterialTypes(com.openuniversity.springjwt.models.materialTypes materialTypes) {
        this.materialTypes = materialTypes;
    }

    public Books getBooks() {
        return books;
    }

    public void setBooks(Books books) {
        this.books = books;
    }

    public Magazines getMagazines() {
        return magazines;
    }

    public void setMagazines(Magazines magazines) {
        this.magazines = magazines;
    }
}
