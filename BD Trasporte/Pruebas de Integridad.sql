-----------------------------------------------------Pruebas de Integridad---------------------------------------------------------------
--Inserción de nuevos datos para las pruebas

--Se completa de forma correcta ya que no incumple nada.
INSERT INTO Chofer (idChofer, nombre, apellido1, apellido2, tipo) 
VALUES (5, 'Juan', 'Pérez', 'González', 'Planilla');

--Se completa de forma correcta ya que no incumple nada.
INSERT INTO Licencia (numero, idChofer, tipo, anioVencimiento) 
VALUES (1, 5, 'A', '2027-12-04');

-- Intento fallido de insersion de una licencia con un id de un chofer que no existe en la tabla Chofer
INSERT INTO Licencia (numero, idChofer, tipo, anioVencimiento) 
VALUES (2, 99, 'B', '2028-06-10'); 

--Se completa de forma correcta ya que no incumple nada.
INSERT INTO Viaje (idViaje, horaRealRegreso, horaRealSalida, kmRecorridos, justificacion, horasExtra)
VALUES
(7, '20:00:00', '12:00:00', 150, 'La actividad se extendió', 2),
(8, '18:30:00', '13:00:00', 200, 'Se tuvo que hacer dos paradas extras', 3);

--Se completa de forma correcta ya que no incumple nada.
INSERT INTO Factura (idFactura, fecha, hora, monto, litrosDiesel, idViaje, idGasolinera)
VALUES
(9, '2023-05-10', '15:30:00', 100, 50, 7, 1),
(10, '2023-06-15', '09:30:00', 150, 80, 8, 2);

-- Intento fallido de insersion de una factura con un id de un viaje que no existe 
INSERT INTO Factura (idFactura, fecha, hora, monto, litrosDiesel, idViaje, idGasolinera)
VALUES
(7, '2023-11-30', '14:00:00', 250, 120, 99, 1);

--Actualizacion de los nuevos datos ingresados para las pruebas

-- Se actualiza correctamente el tipo de licencia de un chofer existente
UPDATE Licencia
SET tipo = 'B'
WHERE numero = 1 AND idChofer = 5;

-- Intento fallido de asignar un idChofer inexistente a una licencia
UPDATE Licencia
SET idChofer = 99
WHERE numero = 1;

-- Se actualiza correctamente el viaje asociado a una factura existente
UPDATE Factura
SET idViaje = 8
WHERE idFactura = 9;

UPDATE Factura
SET idViaje = 7
WHERE idFactura = 10;

-- Intentar fallido de actualizar una factura con un idViaje que no existe
UPDATE Factura
SET idViaje = 99
WHERE idFactura = 9;

--Eliminacion de datos de prueba

-- Intento fallido de eliminar un chofer que tiene licencias asociadas
DELETE FROM Chofer WHERE idChofer = 5;

--  Eliminacion correcta de la licencia asociada al chofer
DELETE FROM Licencia WHERE idChofer = 5;

-- Eliminacion correcta del chofer
DELETE FROM Chofer WHERE idChofer = 5;

-- Intento fallido de eliminar un viaje que tiene facturas asociadas
DELETE FROM Viaje WHERE idViaje = 8;

-- Eliminacion correcta de las facturas asociadas
DELETE FROM Factura WHERE idViaje = 7 ;
DELETE FROM Factura WHERE idViaje = 8;

-- Eliminacion correctade los viajes
DELETE FROM Viaje WHERE idViaje= 7;
DELETE FROM Viaje WHERE idViaje = 8;