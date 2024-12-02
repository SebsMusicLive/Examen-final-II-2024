package com.examen.examen_final.request;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class PagoRequest {
    private Long tipoPagoId;
    private String tarjetaTipo;
    private int cuotas;
    private BigDecimal valor;

    // Getters y Setters
}
