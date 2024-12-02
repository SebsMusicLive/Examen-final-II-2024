package com.examen.examen_final.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "tipo_pago")
@Data
public class TipoPago {

    private int id;
    private String nombre;

}
