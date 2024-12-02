package com.examen.examen_final.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "cajero")
@Data
public class Cajero {
    private int id;
    private String nombre;
    private String documento;
    private int tiendaId;
    private String email;
    private String token;
}
