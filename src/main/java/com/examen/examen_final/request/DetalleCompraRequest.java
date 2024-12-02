package com.examen.examen_final.request;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class DetalleCompraRequest {
    private Long productoId;
    private int cantidad;
    private BigDecimal precio;
    private BigDecimal descuento;

    // Getters y Setters
}

