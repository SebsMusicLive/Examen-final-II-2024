package com.examen.examen_final.models;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Data
public class Factura {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long clienteId;
    private String tiendaId;
    private Long cajeroId;
    private Long vendedorId;
    private BigDecimal total;
    private BigDecimal impuestos;
    private LocalDateTime fecha;
    private String observaciones;

    // Getters y Setters
}
