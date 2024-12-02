package com.examen.examen_final.models;

import java.math.BigDecimal;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "pago")
@Data
public class Pago {
    @Id
    private int id;
    private int compra_id;
    private int tipo_pago_id;
    private String tarjeta_tipo;
    private int cuotas;
    private long valor;
}
