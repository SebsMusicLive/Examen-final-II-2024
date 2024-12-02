package com.examen.examen_final.models;

import java.math.BigDecimal;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "detalles_compra")
@Data
public class DetallesCompra {
    private int id;
    private int compra_id;
    private int producto_id;
    private int cantidad;
    private BigDecimal precio;
    private BigDecimal descuento;
}
