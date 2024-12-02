package com.examen.examen_final.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "tienda")
@Data
public class Tienda {
    @Id
    private int id;
    private String nombre;
    private String direccion;
    private String uuid;
}
