package com.examen.examen_final.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "cajero")
@Data
public class Cajero {
    @Id
    private int id;
    private String nombre;
    private String documento;
    private int tiendaId;
    private String email;
    private String token;
}
