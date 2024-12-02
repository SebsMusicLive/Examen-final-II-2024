package com.examen.examen_final.request;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class FacturaRequest {
    private Long clienteId;
    private Long cajeroId;
    private Long vendedorId;
    private BigDecimal total;
    private BigDecimal impuestos;
    private LocalDateTime fecha;
    private String observaciones;
    private List<DetalleCompraRequest> detallesCompra;
    private List<PagoRequest> pagos;

    // Getters y Setters
}
