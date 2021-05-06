package com.openuniversity.springjwt.models;


import javax.persistence.*;

@Entity
@Table(name = "books")
public class Books {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "description")
    private String description;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "material_type_id", referencedColumnName = "id", nullable = false)
    private materialTypes materialTypes;

    public Books() {
    }

    public Books(String description, com.openuniversity.springjwt.models.materialTypes materialTypes) {
        this.description = description;
        this.materialTypes = materialTypes;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public com.openuniversity.springjwt.models.materialTypes getMaterialTypes() {
        return materialTypes;
    }

    public void setMaterialTypes(com.openuniversity.springjwt.models.materialTypes materialTypes) {
        this.materialTypes = materialTypes;
    }
}
