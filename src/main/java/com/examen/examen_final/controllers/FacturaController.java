package com.examen.examen_final.controllers;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.examen.examen_final.request.FacturaRequest;

@RestController
@RequestMapping("/api/facturas")
@Tag(name = "Facturas", description = "Operaciones relacionadas con las facturas")
public class FacturaController {

    @PostMapping("/{tiendaId}")
    @Operation(summary = "Crear factura", description = "Permite crear una factura para una tienda específica")
    public ResponseEntity<String> crearFactura(
            @PathVariable("tiendaId") String tiendaId,
            @RequestBody FacturaRequest facturaRequest) {
        // Lógica para crear la factura
        return ResponseEntity.ok("Factura creada exitosamente para la tienda: " + tiendaId);
    }
}
