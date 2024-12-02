package com.examen.examen_final.services;

import org.springframework.stereotype.Service;

import com.examen.examen_final.models.Factura;
import com.examen.examen_final.repostitories.FacturaRepository;
import com.examen.examen_final.request.FacturaRequest;

@Service
public class FacturaService {

    private final FacturaRepository facturaRepository;

    public FacturaService(FacturaRepository facturaRepository) {
        this.facturaRepository = facturaRepository;
    }

    public void procesarFactura(String tiendaId, FacturaRequest facturaRequest) {
        // Validar que la tienda existe
        if (!facturaRepository.tiendaExiste(tiendaId)) {
            throw new RuntimeException("La tienda no existe.");
        }

        // Crear la entidad de Factura
        Factura factura = new Factura();
        factura.setClienteId(facturaRequest.getClienteId());
        factura.setTiendaId(tiendaId);
        factura.setCajeroId(facturaRequest.getCajeroId());
        factura.setVendedorId(facturaRequest.getVendedorId());
        factura.setTotal(facturaRequest.getTotal());
        factura.setImpuestos(facturaRequest.getImpuestos());
        factura.setFecha(facturaRequest.getFecha());
        factura.setObservaciones(facturaRequest.getObservaciones());

        // Guardar la factura en la base de datos
        facturaRepository.guardarFactura(factura);

        // Procesar detalles de la factura
        facturaRequest.getDetallesCompra().forEach(detalle -> {
            facturaRepository.guardarDetalleFactura(factura.getId(), detalle);
        });

        // Procesar pagos
        facturaRequest.getPagos().forEach(pago -> {
            facturaRepository.guardarPago(factura.getId(), pago);
        });
    }
}
