package com.examen.examen_final.repostitories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.examen.examen_final.models.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Integer> {

}
