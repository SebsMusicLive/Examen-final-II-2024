package com.examen.examen_final.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "vendedor")
@Data
public class Vendedor {

    private int id;
    private String nombre;
    private String documento;
    private String email;
}
