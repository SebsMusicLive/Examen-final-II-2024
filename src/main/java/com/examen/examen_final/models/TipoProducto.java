package com.examen.examen_final.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "tipo_producto")
@Data
public class TipoProducto {

    private int id;
    private String nombre;
}
