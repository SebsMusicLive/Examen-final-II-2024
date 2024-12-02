package com.examen.examen_final.models;

import java.math.BigDecimal;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "producto")
@Data
public class Producto {
    @Id
    private int id;
    private String nombre;
    private BigDecimal precio;
    private String descripcion;
    private String referencia;
    private int cantidad;
    private int tipoProductoId;
}
