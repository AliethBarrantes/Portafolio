-------------------------------------------------------------Ingreso de datos-------------------------------------------------------------

-- Tabla Viaje
INSERT INTO Viaje (idViaje, horaRealRegreso, horaRealSalida, kmRecorridos, justificacion, horasExtra)
VALUES
(1, '15:00:00', '10:00:00', 150, 'La actividad se extendió', 2),
(2, '18:30:00', '12:00:00', 200, 'Se tuvo que hacer una parada extra por emergencia', 3),
(3, '15:20:00', '07:00:00', 300, 'La actividad se extendió', 3),
(4, '16:30:00', '08:00:00', 150, 'Exceso de tráfico', 3),
(5, '17:30:00', '09:00:00', 300, 'Sucedió un accidente en el camino', 3),
(6, '15:30:00', '07:00:00', 200, null , 0);


-- Tabla Gasolinera
INSERT INTO Gasolinera (idGasolinera, nombre, direccion)
VALUES
(1, 'Gasolinera Full', 'Avenida Principal, Ciudad San Jose'),
(2, 'Gasolinera Gato', 'Calle Secundaria, Ciudad Cartago'),
(3, 'Gasolinera GG', 'Avenida 2, Ciudad Cruz'),
(4, 'Gasolinera Toronto', 'Calle primera, Ciudad Liberia');


-- Tabla Chofer
INSERT INTO Chofer (idChofer, nombre, apellido1, apellido2, tipo) 
VALUES 
(1, 'Carlos', 'López', 'García', 'Planilla'),
(2, 'Ana', 'Martínez', 'Hernández', 'Planilla'),
(3, 'José', 'Pérez', 'Rodríguez', 'Particular'),
(4, 'María', 'González', 'Sánchez', 'Particular');



--TABLA GUARDA
INSERT INTO Guarda(idGuarda, nombre, apellido1, apellido2)
VALUES
(1, 'Emmanuen', 'Campos', 'Pena'),
(2, 'Carlos','Torres','Peralta' ),
(3, 'Roberto','Torres','Casares');



-- Tabla zonasParada
INSERT INTO zonasParada (idParada, lugar) 
VALUES 
(1, 'Centro Histórico'),
(2, 'Parque Industrial'),
(3, 'Terminal de Autobuses Pulmitan'),
(4, 'Aeropuerto Internacional'),
(5, 'Plaza Comercial Las Américas'),
(6, 'Hospital General Monseñor Sanabria');


-- Tabla Destino
INSERT INTO Destino (idDestino, distrito, canton, provincia) 
VALUES 
(1, 'San José', 'Central', 'San José'),
(2, 'Escazú', 'Escazú', 'San José'),
(3, 'La Fortuna', 'San Carlos', 'Alajuela'),
(4, 'Liberia', 'Liberia', 'Guanacaste'),
(5, 'Cartago', 'Central', 'Cartago'),
(6, 'Quepos', 'Aguirre', 'Puntarenas');

-- Tabla Responsable
INSERT INTO Responsable (idResponsable, nombre, apellido1, apellido2)
VALUES
(1, 'Ana', 'Martínez', 'Fernández'),
(2, 'Luis', 'García', 'Ramírez'),
(3, 'Elena', 'Jiménez', 'Hernández'),
(4, 'Javier', 'Martínez', 'Vargas'),
(5, 'Paula', 'Castro', 'Torres'),
(6, 'Andrés', 'López', 'Rojas');



-- Tabla Participantes
INSERT INTO Participantes (cedula, nombre, apellido1, apellido2)
VALUES
(101, 'Pedro', 'Ruiz', 'Hernández'),
(102, 'María', 'López', 'Torres'),
(103, 'Ana', 'Castro', 'Jiménez'),
(104, 'Luis', 'Soto', 'Ramírez'),
(105, 'Carlos', 'Fernández', 'Vargas'),
(106, 'Sofía', 'Gómez', 'Rodríguez'),
(107, 'Miguel', 'Hernández', 'Morales'),
(108, 'Lucía', 'Vega', 'Ortega'),
(109, 'Jorge', 'Pérez', 'Alfaro'),
(110, 'Elena', 'Díaz', 'Salazar'),
(111, 'Raúl', 'Martínez', 'Chacón'),
(112, 'Andrea', 'Solano', 'Méndez');



-- Tabla Asistente
INSERT INTO Asistente (idAsistente, nombre, apellido1, apellido2)
VALUES
(1, 'Sandra', 'Vega', 'Morales'),
(2, 'Oscar', 'Pinto', 'Salazar');


-- Tabla Vehiculo
INSERT INTO Vehiculo (placaVehiculo, disponibilidadGira, capacidad, estado, marca, modelo, anio)
VALUES
(110296, 0, 20, 'Utilizando', 'Toyota', 'Corolla', 2019),
(209540, 1, 30, 'disponible', 'Honda', 'Civic', 2021),
(371044, 1, 25, 'disponible', 'Ford', 'Explorer', 2018),
(404762, 0, 15, 'mantenimiento', 'Chevrolet', 'Tahoe', 2020),
(518404, 1, 40, 'disponible', 'Mercedes-Benz', 'Sprinter', 2022),
(101234, 0, 15, 'mantenimiento', 'Toyota', 'Hiace', 2019),
(102345, 1, 12, 'disponible', 'Hyundai', 'H1', 2018),
(103456, 0, 8, 'utilizando', 'Nissan', 'Urvan', 2020),
(104567, 0, 20, 'irreparable', 'Mercedes-Benz', 'Sprinter', 2021),
(105678, 1, 10, 'disponible', 'Ford', 'Transit', 2017),
(106789, 1, 25, 'disponible', 'Volkswagen', 'Crafter', 2022);

--disponibilidadGira (0=No, 1=Si)

--irreparable
--mantenimiento
--disponible
--Utilizando

-- Tabla HistorialAccidentes
INSERT INTO HistorialAccidentes (idAccidente, fecha, hora, observaciones)
VALUES
(1, '2023-05-10', '14:00:00', 'Accidente menor en carretera'),
(2, '2023-06-15', '09:30:00', 'Accidente de tránsito con daños materiales'),
(3, '2024-01-20', '18:45:00', 'Deslizamiento por lluvia en curva cerrada. Daños leves.'),
(4, '2024-05-05', '22:00:00', 'Colisión lateral por imprudencia de otro conductor.'),
(5, '2024-08-12', '12:20:00', 'Accidente en estacionamiento. Daños menores.'),
(6, '2024-10-28', '07:50:00', 'Golpe con objeto fijo al retroceder. Daños en la puerta trasera.'),
(7, '2023-03-15', '14:30:00', 'Colision con auto en movimiento mientras estaba estacionado, sin heridos, auto destrozado');



-- Tabla Repuestos
INSERT INTO Repuestos (idRepuestos, nombre)
VALUES
(1, 'Neumático'),
(2, 'Bujías de encendido'),
(3, 'Batería de 12V'),
(4, 'Faro tracero izquierdo'),
(5, 'Faro delantero derecho'),
(6, 'Escobilla limpiaparabrisas'),
(7, 'Freno de disco delantero'),
(8, 'Termostato de motor'),
(9, 'Radiador'),
(10, 'Filtro de aire'),
(11, 'Bombas de agua'),
(12, 'Cables eléctricos'),
(13, 'Correa de distribución'),
(14, 'Bujías'),
(15, 'Pastillas de freno'),
(16, 'Filtro de aceite'),
(17, 'Sistema de frenos completo'),
(18, 'Embrague completo'),
(19, 'Sistema de suspensión'),
(20, 'Sistema de escape'),
(21, 'Radiador adicional'),
(22, 'Aceite hidráulico'),
(23, 'Caja de cambios completa'),
(24, 'Junta de culata'),
(25, 'Inyectores de combustible'),
(26, 'Filtro de cabina'),
(27, 'Aceite para motor'),
(28, 'Sistema de dirección hidráulica'),
(29, 'Sistema de aire acondicionado');

-- Tabla Reparaciones
INSERT INTO Reparaciones (idReparaciones, fechaInicioReparacion, fechaFinalReparacion, descripcionReparacion)
VALUES
(1, '2023-07-01', '2023-07-05', 'Reemplazo de frenos'),
(2, '2023-08-10', '2023-08-12', 'Cambio de aceite'),
(3, '2023-09-12', '2023-09-20', 'Revision completa de daños graves tras accidente, imposible reparar'),
(4, '2024-03-05', '2024-03-06', 'Sustitución de neumático trasero y revisión del sistema de frenos'),
(5, '2024-09-20', '2024-09-22', 'Reparación de faro delantero y ajustes en sistema de luces'),
(6, '2024-11-01', '2024-11-03', 'Reemplazo de escobillas limpiaparabrisas y cambio de aceite'),
(7, '2024-04-01', '2024-04-04', 'Reemplazo completo del sistema de suspensión y revisión de frenos traseros'),
(8, '2024-05-10', '2024-05-12', 'Reparación de motor por sobrecalentamiento y revisión del radiador'),
(9, '2024-06-15', '2024-06-17', 'Cambio de embrague y revisión del sistema de transmisión'),
(10, '2024-07-01', '2024-07-03', 'Reemplazo de sistema de escape y revisión de inyectores'),
(11, '2024-08-05', '2024-08-07', 'Reparación de dirección hidráulica y ajuste de volante'),
(12, '2024-09-10', '2024-09-13', 'Reparación de sistema de aire acondicionado y cambio de filtro de cabina'),
(13, '2024-10-01', '2024-10-03', 'Reemplazo de junta de culata y revisión de compresión del motor'),
(14, '2024-11-05', '2024-11-07', 'Reparación del sistema de frenos y cambio de pastillas'),
(15, '2024-12-01', '2024-12-03', 'Reparación de caja de cambios y revisión de la transmisión'),
(16, '2024-12-15', '2024-12-17', 'Cambio de aceite y revisión completa del motor'),
(17, '2024-12-20', '2024-12-22', 'Reemplazo de radiador y revisión del sistema de refrigeración'),
(18, '2024-12-30', '2024-12-31', 'Reemplazo de batería y revisión del sistema eléctrico completo');

--TABLA unidadSolicitante
INSERT INTO unidadSolicitante (idSolicitante, sedeRegional, unidad)
VALUES
(1,'Sede del Pacifico','Docencia'),
(2,'Sede del Pacifico','Estudios Generales');
 

----DATOS DE TABLAS (1,N) --------------------------------------------------------------------------------------


--Tabla ChoferTelefono
INSERT INTO ChoferTelefono (idChofer, telefono)
VALUES
(1, 76462842),
(2, 93658374),
(3, 27485023),
(4, 45374837);

--Tabla Guardatelefono
INSERT INTO Guardatelefono (idGuarda, telefono)
VALUES
(1, 67572835),
(2, 87462849),
(3, 45274593);

INSERT INTO GasolineraTelefono (idGasolinera, telefono)
VALUES
(1, 22223333),  -- Gasolinera Full
(2, 33334444),  -- Gasolinera Gato
(3, 44445555),  -- Gasolinera GG
(4, 55556666);  -- Gasolinera Toronto

--Tabla ResponsableTelefono
INSERT INTO ResponsableTelefono (idResponsable, telefono)
VALUES
(1, 46184053),
(2, 19375728),
(3, 75920257),
(4, 10485729),
(5, 65829758),
(6, 79275922);

--Tabla ParticipantesTelefono
INSERT INTO ParticipanteTelefono (cedulaParticipante, telefono)
VALUES
(101, 26482937),
(102, 46284724),
(103, 26482927),
(104, 97536395),
(105, 56824714),
(106, 26194828),
(107, 46284568),
(108, 57294747),
(109, 82527373),
(110, 82642944),
(111, 37385586),
(112, 24937478);

--tabla AsistenteTelefono
INSERT INTO AsistenteTelefono(idAsistente, telefono)
VALUES
(1, 196536581),
(2, 674927193);

-- Tabla Licencia
INSERT INTO Licencia (numero, idChofer, tipo, anioVencimiento)
VALUES
(12345, 1, 'A', '2025-12-01'),
(67890, 2, 'B', '2026-06-15'),
(14568, 3, 'A', '2028-12-01'),
(76543, 4, 'A', '2026-07-15');

-- Tabla Factura
INSERT INTO Factura (idFactura, fecha, hora, monto, litrosDiesel, idViaje, idGasolinera)
VALUES
(1, '2023-05-10', '15:30:00', 100, 50, 1, 1),
(2, '2023-06-15', '09:30:00', 150, 80, 2, 2),
(3, '2023-07-20', '12:00:00', 200, 100, 3, 1),
(4, '2023-08-05', '14:30:00', 120, 60, 4, 2),
(5, '2023-09-10', '10:00:00', 180, 90, 5, 3),
(6, '2023-10-22', '16:30:00', 220, 110, 6, 1);

-- Tabla Boleta
INSERT INTO Boleta (idBoleta, cantidadPasajeros, lugarPartida, fechaRegreso, horaRegreso, fechaPartida, horaPartida, vehiculoPerteneceGira, observacion, objetivoViaje, itinerario, lugarHospedaje, fechaCreacion, idSolicitante, idAsistente, idResponsable, idGuardaSalida, idGuardaRegreso, idViaje)
VALUES
(1, 12, 'Ciudad A', '2023-05-11', '16:00:00', '2023-05-10', '10:00:00', 1, 'Sin observaciones', 'Gira educativa', 'Itinerario A', 'Hotel A', '2023-05-05', 1, 1, 1, 1, 1, 1),
(2, 10, 'Ciudad B', '2023-06-16', '17:30:00', '2023-06-15', '11:00:00', 0, 'Sin observaciones', 'Reunion', 'Itinerario B', 'Hotel B', '2023-06-10', 2, 2, 2, 2, 2, 2),
(3, 7, 'Ciudad C', '2023-07-21', '18:30:00', '2023-07-20', '12:00:00', 1, 'Sin observaciones', 'Taller de capacitación', 'Itinerario C', 'Hotel C', '2023-07-10',1, 1, 1, 2, 1, 1),
(4, 9, 'Ciudad D', '2023-08-10', '19:30:00', '2023-08-09', '13:00:00', 0, 'Sin observaciones', 'Conferencia', 'Itinerario D', 'Hotel D', '2023-08-05',2, 2, 2, 2, 2, 2),
(5, 12, 'Ciudad E', '2023-09-12', '17:30:00', '2023-09-12', '09:00:00', 1, 'Sin observaciones', 'Viaje de negocios', 'Itinerario E', 'Sin hospedaje', '2023-09-06', 2, 2, 2, 1, 2, 2);


-- DATOS DE TABLAS INTERMEDIAS (N,M) ----------------------------------------------------------------------------

--TABLA BoletaParada
INSERT INTO BoletaParada (idBoleta, idParada, hora)
VALUES 
-- Relación para Boleta 1
(1, 1, '10:30:00'), -- Centro Histórico, cerca del lugar de partida
(1, 3, '12:00:00'), -- Terminal de Autobuses, en ruta
(1, 5, '15:30:00'), -- Plaza Comercial Las Américas, previo al destino

-- Relación para Boleta 2
(2, 2, '11:30:00'), -- Parque Industrial, en la mañana
(2, 4, '14:00:00'), -- Aeropuerto Internacional, punto final del recorrido

-- Relación para Boleta 3
(3, 6, '12:30:00'), -- Hospital General, al mediodía
(3, 3, '14:00:00'), -- Terminal de Autobuses, en ruta al destino

-- Relación para Boleta 4
(4, 1, '13:30:00'), -- Centro Histórico, punto de salida
(4, 2, '15:00:00'), -- Parque Industrial, en ruta
(4, 5, '18:00:00'), -- Plaza Comercial Las Américas, antes del destino final

-- Relación para Boleta 5
(5, 2, '09:30:00'), -- Parque Industrial, al inicio del viaje
(5, 4, '12:00:00'); -- Aeropuerto Internacional, último punto antes del regreso



-- Tabla BoletaVehiculo
-- Relación para Boleta 1 (12 pasajeros, 14 personas en total)
-- Insertar en BoletaVehiculo (considerando horas de salida y regreso)
-- Datos tomados de la tabla BoletaParada (asumiendo horas de salida y regreso)

INSERT INTO BoletaVehiculo (idBoleta, idVehiculo, fechaRevisionSalida, horaRevisionSalida, kmSalida, CombustibleSalida, fechaRevisionRegreso, horaRevisionRegreso, kmRegreso, CombustibleRegreso)
VALUES
-- Relación para Boleta 1
(1, 209540, '2024-11-24', '10:30:00', 10000, 80, '2024-11-24', '17:00:00', 12000, 70),  -- Honda Civic (Salida: Centro Histórico, Regreso: Plaza Comercial Las Américas)

(2, 105678, '2024-11-24', '11:30:00', 5000, 90, '2024-11-24', '18:00:00', 5500, 85),  -- Ford Transit (Salida: Parque Industrial, Regreso: Aeropuerto Internacional)

(3, 371044, '2024-11-24', '12:30:00', 15000, 75, '2024-11-24', '19:30:00', 16000, 60),  -- Ford Explorer (Salida: Hospital General, Regreso: Terminal de Autobuses)

(4, 105678, '2024-11-24', '13:30:00', 8000, 85, '2024-11-24', '20:00:00', 8500, 80),  -- Ford Transit (Salida: Centro Histórico, Regreso: Plaza Comercial Las Américas)

(5, 106789, '2024-11-24', '09:30:00', 12000, 60, '2024-11-24', '16:00:00', 12500, 55);  -- Volkswagen Crafter (Salida: Parque Industrial, Regreso: Aeropuerto Internacional)


-- Tabla ParticipantesBoleta
-- Boleta 1 (12 pasajeros)
INSERT INTO ParticipantesBoleta (cedulaParticipante, idBoleta) VALUES
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1);

-- Boleta 2 (10 pasajeros)
INSERT INTO ParticipantesBoleta (cedulaParticipante, idBoleta) VALUES
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(109, 2),
(110, 2);

-- Boleta 3 (7 pasajeros)
INSERT INTO ParticipantesBoleta (cedulaParticipante, idBoleta) VALUES
(101, 3),
(102, 3),
(103, 3),
(104, 3),
(105, 3),
(106, 3),
(107, 3);

-- Boleta 4 (9 pasajeros)
INSERT INTO ParticipantesBoleta (cedulaParticipante, idBoleta) VALUES
(101, 4),
(102, 4),
(103, 4),
(104, 4),
(105, 4),
(106, 4),
(107, 4),
(108, 4),
(109, 4);

-- Boleta 5 (12 pasajeros)
INSERT INTO ParticipantesBoleta (cedulaParticipante, idBoleta) VALUES
(101, 5),
(102, 5),
(103, 5),
(104, 5),
(105, 5),
(106, 5),
(107, 5),
(108, 5),
(109, 5),
(110, 5),
(111, 5),
(112, 5);


-- Tabla ReparacioRepuestos

INSERT INTO ReparacioRepuestos (idReparacion, idRepuestos)
VALUES
-- Reemplazo de frenos
(1, 7), 
(1, 15), 

-- Cambio de aceite
(2, 16), 
(2, 27),

-- Revisión completa de daños graves tras accidente
(3, 17), 
(3, 9), 
(3, 11), 

-- Sustitución de neumático y revisión del sistema de frenos
(4, 1), 
(4, 15), 

-- Reparación de faro delantero y ajustes en sistema de luces
(5, 5), 
(5, 4), 

-- Reemplazo de escobillas limpiaparabrisas y cambio de aceite
(6, 6), 
(6, 16),

-- Reemplazo completo del sistema de suspensión
(7, 19), 
(7, 15),

-- Reparación de motor por sobrecalentamiento y revisión del radiador
(8, 9), 
(8, 21), 

-- Cambio de embrague y revisión del sistema de transmisión
(9, 18), 
(9, 23), 

-- Reemplazo de sistema de escape y revisión de inyectores
(10, 20), 
(10, 25), 

-- Reparación de dirección hidráulica y ajuste de volante
(11, 28), 

-- Reparación de sistema de aire acondicionado y cambio de filtro de cabina
(12, 29), 
(12, 26), 

-- Reemplazo de junta de culata y revisión de compresión del motor
(13, 24), 
(13, 14), 

-- Reparación del sistema de frenos y cambio de pastillas
(14, 7), 
(14, 15), 

-- Reparación de caja de cambios y revisión de la transmisión
(15, 23), 
(15, 13), 

-- Cambio de aceite y revisión completa del motor
(16, 16), 
(16, 27), 

-- Reemplazo de radiador y revisión del sistema de refrigeración
(17, 9), 
(17, 21), 

-- Reemplazo de batería y revisión del sistema eléctrico completo
(18, 3), 
(18, 12);



-- Tabla VehiculoReparaciones
INSERT INTO VehiculoReparaciones (idVehiculo, idReparacion)
VALUES
-- Reemplazo de frenos
(110296, 1),
-- Cambio de aceite
(209540, 2),
-- Revisión completa de daños graves tras accidente (irreparable)
(104567, 3),
-- Sustitución de neumático y revisión del sistema de frenos
(371044, 4),
-- Reparación de faro delantero y ajustes en sistema de luces
(404762, 5),
-- Reemplazo de escobillas limpiaparabrisas y cambio de aceite
(102345, 6),
-- Reemplazo completo del sistema de suspensión
(106789, 7),
-- Reparación de motor por sobrecalentamiento y revisión del radiador
(103456, 8),
-- Cambio de embrague y revisión del sistema de transmisión
(105678, 9),
-- Reemplazo de sistema de escape y revisión de inyectores
(518404, 10),
-- Reparación de dirección hidráulica y ajuste de volante
(404762, 11),
-- Reparación de sistema de aire acondicionado y cambio de filtro de cabina
(102345, 12),
-- Reemplazo de junta de culata y revisión de compresión del motor
(103456, 13),
-- Reparación del sistema de frenos y cambio de pastillas
(101234, 14),
-- Reparación de caja de cambios y revisión de la transmisión
(105678, 15),
-- Cambio de aceite y revisión completa del motor
(209540, 16),
-- Reemplazo de radiador y revisión del sistema de refrigeración
(518404, 17),
-- Reemplazo de batería y revisión del sistema eléctrico completo
(110296, 18);



-- Tabla VehiculoHistorialAccidentes
INSERT INTO VehiculoHistorialAccidentes (idVehiculo, idAccidente)
VALUES
-- Toyota Corolla - Accidente menor en carretera
(110296, 1), 
-- Honda Civic - Accidente de tránsito con daños materiales
(209540, 2),
-- Ford Explorer - Deslizamiento por lluvia, daños leves
(371044, 3),
-- Chevrolet Tahoe - Colisión lateral por imprudencia
(404762, 4),
-- Mercedes-Benz Sprinter (irreparable) - Peor accidente
(104567, 7),
-- Hyundai H1 - Accidente en estacionamiento, daños menores
(102345, 5),
-- Nissan Urvan - Golpe con objeto fijo al retroceder
(103456, 6);



-- Tabla BoletaChofer
INSERT INTO BoletaChofer (idBoleta, idChofer)
VALUES
-- Boleta 1: Gira educativa, vehículo para 15 pasajeros (planilla)
(1, 1), -- Carlos López, chofer de planilla, ideal para grupos grandes

-- Boleta 2: Reunión, vehículo particular
(2, 3), -- José Pérez, profesor con vehículo particular

-- Boleta 3: Taller de capacitación, vehículo para 25 pasajeros (planilla)
(3, 1), -- Carlos López, chofer de planilla, para manejar el grupo

-- Boleta 4: Conferencia, vehículo particular
(4, 4), -- María González, profesora con vehículo particular

-- Boleta 5: Viaje de negocios, vehículo para 12 pasajeros (planilla)
(5, 2); -- Ana Martínez, chofer de planilla, adecuada para un viaje pequeño


-- Tabla BoletaDestino
INSERT INTO BoletaDestino (idBoleta, idDestino)
VALUES
-- Relación para Boleta 1 (Gira educativa)
(1, 3), -- La Fortuna, un destino educativo y turístico
(1, 5), -- Cartago, cultural e histórico

-- Relación para Boleta 2 (Reunión)
(2, 1), -- San José, centro administrativo y de negocios
(2, 2), -- Escazú, cerca de San José para reuniones empresariales

-- Relación para Boleta 3 (Taller de capacitación)
(3, 3), -- La Fortuna, destino de retiro o talleres
(3, 6), -- Quepos, lugar ideal para actividades y eventos

-- Relación para Boleta 4 (Conferencia)
(4, 4), -- Liberia, centro de conferencias y turismo en Guanacaste
(4, 1), -- San José, punto de llegada y actividades complementarias

-- Relación para Boleta 5 (Viaje de negocios)
(5, 2), -- Escazú, ideal para negocios y reuniones
(5, 1); -- San José, destino principal para negocios
