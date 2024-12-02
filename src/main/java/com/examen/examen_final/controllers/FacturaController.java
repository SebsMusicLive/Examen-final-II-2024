package com.examen.examen_final.controllers;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.examen.examen_final.request.FacturaRequest;
import com.examen.examen_final.services.FacturaService;

@RestController
@RequestMapping("/crear")
public class FacturaController {

    private final FacturaService facturaService;

    public FacturaController(FacturaService facturaService) {
        this.facturaService = facturaService;
    }

    @PostMapping("/{tiendaId}")
    public ResponseEntity<String> crearFactura(
            @PathVariable("tiendaId") String tiendaId,
            @RequestBody FacturaRequest facturaRequest) {
        try {
            facturaService.procesarFactura(tiendaId, facturaRequest);
            return ResponseEntity.ok("Factura creada exitosamente.");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error al procesar la factura: " + e.getMessage());
        }
    }
}
