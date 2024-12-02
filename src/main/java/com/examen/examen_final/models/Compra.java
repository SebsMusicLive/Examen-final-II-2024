package com.examen.examen_final.models;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "compra")
@Data
public class Compra {
    @Id
    private int id;
    private int cliente_id;
    private int tienda_id;
    private int vendedor_id;
    private int cajero_id;
    private BigDecimal total;
    private BigDecimal impuestos;
    private LocalDateTime fecha;
    private String observaciones;
}
