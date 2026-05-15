create database proyecto;

use proyecto;

----------------------------------------------------Creación de tablas----------------------------------------------------------------------------

create table Viaje(
    idViaje int primary key,
    horaRealRegreso time,
    horaRealSalida time,
    kmRecorridos int,
    justificacion varchar(150),
    horasExtra int not null
);


create table Gasolinera(
    idGasolinera int primary key,
    nombre varchar(50) not null,
    direccion varchar(150) not null
);


create table Chofer(
    idChofer int primary key,
    nombre varchar(50) not null, 
    apellido1 varchar(50) not null,
    apellido2 varchar(50) not null,
    tipo varchar(50) not null
);


create table zonasParada(
    idParada int primary key,
    lugar varchar(100) not null
);


create table Destino(
    idDestino int primary key,
    distrito varchar(50) not null,
    canton varchar(50) not null,
    provincia varchar(50) not null
);


create table Responsable(
    idResponsable int primary key,
    nombre varchar(50) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar(50) not null
);


create table Participantes(
    cedula int primary key,
    nombre varchar(50) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar(50) not null
);


create table Asistente (
    idAsistente int primary key,
    nombre varchar(50) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar(50) not null
);


create table Vehiculo(
    placaVehiculo int primary key,
    disponibilidadGira int not null,
    capacidad int not null,
    estado varchar(50) not null,
    marca varchar(50) not null,
    modelo varchar(50) not null,
    anio int not null
);


create table HistorialAccidentes(
    idAccidente int primary key,
    fecha date not null,
    hora time not null,
    observaciones varchar(200) not null
);


create table Repuestos(
    idRepuestos int primary key,
    nombre varchar(100) not null
);


create table Reparaciones(
    idReparaciones int primary key,
    fechaInicioReparacion date not null,
    fechaFinalReparacion date,
    descripcionReparacion varchar(100) not null
);


create table unidadSolicitante(
    idSolicitante int primary key,
    sedeRegional varchar(50) not null,
    unidad varchar(50) not null
);


create table Guarda(
    idGuarda int primary key,
    nombre varchar(50) not null,
	apellido1 varchar(50) not null, 
	apellido2 varchar(50) not null
);


-- Creación de tablas con claves foráneas (relaciones 1:N)----------------------------------------------------------------------

create table AsistenteTelefono(
idAsistente int,
telefono int,
primary key(idAsistente, telefono)
);


create table ChoferTelefono(
idChofer int,
telefono int,
primary key(idChofer, telefono)
);


create table ResponsableTelefono(
idResponsable int,
telefono int,
primary key(idResponsable, telefono)
);


create table ParticipanteTelefono(
cedulaParticipante int,
telefono int,
primary key(cedulaParticipante, telefono)
);


create table GasolineraTelefono(
idGasolinera int,
telefono int,
primary key(idGasolinera, telefono)
);


create table GuardaTelefono(
idGuarda int,
telefono int,
primary key(idGuarda, telefono)
);


create table Licencia(
    numero int primary key,
    idChofer int,
    tipo varchar(25),
    anioVencimiento date not null
);


create table Factura (
    idFactura int primary key,
    fecha date not null,
    hora time not null,
    monto int not null,
    litrosDiesel int not null,
    idViaje int,
	idGasolinera int
);


create table Boleta (
    idBoleta int primary key,
    cantidadPasajeros int not null,
    lugarPartida varchar(200) not null,
    fechaRegreso date not null,
    horaRegreso time not null,
    fechaPartida date not null,
    horaPartida time not null,
    vehiculoPerteneceGira int,
    observacion varchar(200),
    objetivoViaje varchar(200) not null,
    itinerario varchar(200),
    lugarHospedaje varchar(100),
    fechaCreacion date not null,
    idSolicitante int,
    idAsistente int,
	idResponsable int,
	idGuardaSalida int,
	idGuardaRegreso int,
	idViaje int
);


-- Creación de tablas de relación N:M (tablas intermedias)-------------------------------------------------------------------------

create table BoletaParada (
    idBoleta int not null,
    idParada int not null,
    hora time not null,
    primary key (idBoleta, idParada)
);


create table BoletaVehiculo (
    idBoleta int not null,
    idVehiculo int not null,
    fechaRevisionSalida date not null,
    horaRevisionSalida time not null,
    kmSalida int,
    CombustibleSalida int,
    fechaRevisionRegreso date not null,
    horaRevisionRegreso time not null,
    kmRegreso int,
    CombustibleRegreso int,
    primary key (idBoleta, idVehiculo)
);


create table BoletaDestino (
    idBoleta int not null,
    idDestino int not null,
    primary key (idBoleta, idDestino)
);


create table BoletaChofer (
    idBoleta int not null,
    idChofer int not null,
    primary key (idBoleta, idChofer)
);


create table VehiculoHistorialAccidentes (
    idVehiculo int not null,
    idAccidente int not null,
    primary key (idVehiculo, idAccidente)
);


create table VehiculoReparaciones (
    idVehiculo int not null,
    idReparacion int not null,
    primary key (idVehiculo, idReparacion)
);


create table ReparacioRepuestos (
    idReparacion int not null,
    idRepuestos int not null,
    primary key (idReparacion, idRepuestos)
);


create table ParticipantesBoleta (
    cedulaParticipante int not null,
    idBoleta int not null,
    primary key (cedulaParticipante, idBoleta)
);



----------------------------------------------integridad referencial---------------------------------------------------------------------------------

alter table Licencia add foreign key (idChofer) references Chofer(idChofer);

alter table Factura add foreign key (idViaje) references Viaje(idViaje);
alter table Factura add foreign key (idGasolinera) references Gasolinera(idGasolinera);

alter table Boleta add foreign key (idAsistente) references Asistente(idAsistente);
alter table Boleta add foreign key (idSolicitante) references unidadSolicitante(idSolicitante);
alter table Boleta add foreign key (idResponsable) references Responsable(idResponsable);
alter table Boleta add foreign key (idGuardaRegreso) references Guarda(idGuarda);
alter table Boleta add foreign key (idGuardaSalida) references Guarda(idGuarda);
alter table Boleta add foreign key (idViaje) references Viaje(idViaje);

alter table BoletaParada add foreign key (idBoleta) references Boleta(idBoleta);
alter table BoletaParada add foreign key (idParada) references zonasParada(idParada);

alter table BoletaVehiculo add foreign key (idBoleta) references Boleta(idBoleta);
alter table BoletaVehiculo add foreign key (idVehiculo) references Vehiculo(placaVehiculo);

alter table BoletaDestino add foreign key (idBoleta) references Boleta(idBoleta);
alter table BoletaDestino add foreign key (idDestino) references Destino(idDestino);

alter table BoletaChofer add foreign key (idBoleta) references Boleta(idBoleta);
alter table BoletaChofer add foreign key (idChofer) references Chofer(idChofer);

alter table VehiculoHistorialAccidentes add foreign key (idVehiculo) references Vehiculo(placaVehiculo);
alter table VehiculoHistorialAccidentes add foreign key (idAccidente) references HistorialAccidentes(idAccidente);

alter table VehiculoReparaciones add foreign key (idVehiculo) references Vehiculo(placaVehiculo);
alter table VehiculoReparaciones add foreign key (idReparacion) references Reparaciones(idReparaciones);

alter table ReparacioRepuestos add foreign key (idReparacion) references Reparaciones(idReparaciones);
alter table ReparacioRepuestos add foreign key (idRepuestos) references Repuestos(idRepuestos);

alter table ParticipantesBoleta add foreign key (cedulaParticipante) references Participantes(cedula);
alter table ParticipantesBoleta add foreign key (idBoleta) references Boleta(idBoleta);

alter table ResponsableTelefono add foreign key (idResponsable) references Responsable(idResponsable);

alter table ParticipanteTelefono add foreign key (cedulaParticipante) references Participantes(cedula);

alter table GasolineraTelefono add foreign key (idGasolinera) references Gasolinera(idGasolinera);

alter table GuardaTelefono add foreign key (idGuarda) references Guarda(idGuarda);

alter table ChoferTelefono add foreign key (idChofer) references Chofer(idChofer);

alter table AsistenteTelefono add foreign key (idAsistente) references Asistente(idAsistente);


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


------------------------------------------------------Consultas-------------------------------------------------------------------
---SELECT------
SELECT * FROM Boleta; --1
SELECT * FROM BoletaChofer; --2
SELECT * FROM BoletaDestino; --3
SELECT * FROM BoletaParada; --4
SELECT * FROM BoletaVehiculo; --5
SELECT * FROM Vehiculo; --6
SELECT * FROM VehiculoHistorialAccidentes; --7
SELECT * FROM VehiculoReparaciones; --8
SELECT * FROM Viaje; --9
SELECT * FROM HistorialAccidentes; --10
SELECT * FROM ChoferTelefono; --11
SELECT * FROM zonasParada; --12
SELECT * FROM ParticipanteTelefono; --13
SELECT * FROM Gasolinera; --14
SELECT * FROM Licencia; --15
SELECT * FROM Responsable; --16
SELECT * FROM ResponsableTelefono; --17
SELECT * FROM Repuestos; --18
SELECT * FROM ReparacioRepuestos; --19
SELECT * FROM Reparaciones; --20
SELECT * FROM Chofer; --21
SELECT * FROM Destino; --22
SELECT * FROM AsistenteTelefono; --23
SELECT * FROM Participantes; --24
SELECT * FROM ParticipantesBoleta; --25
SELECT * FROM Asistente; --26
SELECT * FROM GasolineraTelefono; --27
SELECT * FROM BoletaParada; --28
SELECT * FROM Factura; --29
SELECT * FROM Boleta
SELECT * FROM BoletaDestino; --30
SELECT * FROM Guarda; --31
SELECT * FROM unidadSolicitante; --32
SELECT * FROM GuardaTelefono; --33
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

------------------------------------------------------Consultas--------------------------------------------------------------------------
--1. Consultar los viajes que superaron los kilómetros estimados y su justificación
SELECT v.idViaje, v.kmRecorridos, v.justificacion, v.horasExtra
FROM Viaje v
WHERE v.kmRecorridos > 200;

--2. Consultar las facturas generadas en un rango de fechas, incluyendo detalles del viaje y gasolinera
SELECT f.idFactura, f.fecha, f.hora, f.monto, f.litrosDiesel, v.idViaje, g.nombre AS gasolinera
FROM Factura f
JOIN Viaje v ON f.idViaje = v.idViaje
JOIN Gasolinera g ON f.idGasolinera = g.idGasolinera
WHERE f.fecha BETWEEN '2023-06-01' AND '2023-12-31';

--3. Consultar los vehículos disponibles para futuras giras (no en mantenimiento ni irreparables)
SELECT placaVehiculo, marca, modelo, anio
FROM Vehiculo
WHERE disponibilidadGira = 1 AND estado != 'mantenimiento' AND estado != 'irreparable';

--4. Obtener el historial de accidentes de los vehículos que están en uso, con los detalles del accidente
SELECT v.placaVehiculo, h.fecha, h.hora, h.observaciones
FROM Vehiculo v
JOIN VehiculoHistorialAccidentes vha ON v.placaVehiculo = vha.idVehiculo
JOIN HistorialAccidentes h ON vha.idAccidente = h.idAccidente
WHERE v.estado = 'Utilizando';

--5. Consultar los viajes y los choferes asignados, con sus datos de contacto
SELECT v.idViaje, v.horaRealSalida, v.horaRealRegreso, c.nombre, c.apellido1, c.apellido2, t.telefono
FROM Viaje v
JOIN Boleta b ON v.idViaje = b.idViaje
JOIN BoletaChofer bc ON b.idBoleta = bc.idBoleta
JOIN Chofer c ON bc.idChofer = c.idChofer
JOIN ChoferTelefono t ON c.idChofer = t.idChofer;

--6. Obtener las boletas de viaje con los vehículos asignados y su disponibilidad
SELECT b.idBoleta, b.lugarPartida, b.fechaPartida, b.horaPartida, v.placaVehiculo, v.estado
FROM Boleta b
JOIN BoletaVehiculo bv ON b.idBoleta = bv.idBoleta
JOIN Vehiculo v ON bv.idVehiculo = v.placaVehiculo;

--7. Consultar los participantes de las boletas, con su información de contacto
SELECT p.nombre, p.apellido1, p.apellido2, pt.telefono, b.idBoleta
FROM Participantes p
JOIN ParticipantesBoleta pb ON p.cedula = pb.cedulaParticipante
JOIN ParticipanteTelefono pt ON p.cedula = pt.cedulaParticipante
JOIN Boleta b ON pb.idBoleta = b.idBoleta;

--8. Consultar las reparaciones realizadas en los vehículos que estuvieron involucrados en accidentes
SELECT v.placaVehiculo, r.fechaInicioReparacion, r.fechaFinalReparacion, r.descripcionReparacion
FROM Vehiculo v
JOIN VehiculoHistorialAccidentes vha ON v.placaVehiculo = vha.idVehiculo
JOIN HistorialAccidentes h ON vha.idAccidente = h.idAccidente
JOIN VehiculoReparaciones vr ON v.placaVehiculo = vr.idVehiculo
JOIN Reparaciones r ON vr.idReparacion = r.idReparaciones
WHERE h.fecha BETWEEN '2023-01-01' AND '2024-12-31';

--9. Consultar la cantidad de litros de diesel consumidos por cada gasolinera en un rango de fechas
SELECT g.nombre AS gasolinera, SUM(f.litrosDiesel) AS totalLitros
FROM Factura f
JOIN Gasolinera g ON f.idGasolinera = g.idGasolinera
WHERE f.fecha BETWEEN '2023-06-01' AND '2023-12-31'
GROUP BY g.nombre;

--10. Consultar las boletas de viaje que incluyeron paradas en ciertas zonas
SELECT b.idBoleta, b.lugarPartida, b.fechaPartida, p.lugar AS parada
FROM Boleta b
JOIN BoletaParada bp ON b.idBoleta = bp.idBoleta
JOIN zonasParada p ON bp.idParada = p.idParada
WHERE p.lugar IN ('Centro Histórico', 'Plaza Comercial Las Américas');

--11.Consultar los viajes realizados por un chofer especifico
SELECT V.idViaje, V.horaRealSalida, V.horaRealRegreso, V.kmRecorridos
FROM Viaje V
JOIN BoletaChofer BC ON V.idViaje = BC.idBoleta
WHERE BC.idChofer = 1;

--12.Listar los vehículos que están disponibles para giras
SELECT V.placaVehiculo, V.marca, V.modelo, V.estado
FROM Vehiculo V
WHERE V.disponibilidadGira = 1;

--13.Ver los detalles de las reparaciones y los repuestos utilizados para un vehiculo
SELECT VR.idVehiculo, R.descripcionReparacion, RP.nombre AS Repuesto
FROM VehiculoReparaciones VR
JOIN Reparaciones R ON VR.idReparacion = R.idReparaciones
JOIN ReparacioRepuestos RR ON R.idReparaciones = RR.idReparacion
JOIN Repuestos RP ON RR.idRepuestos = RP.idRepuestos
WHERE VR.idVehiculo = 102345;

--14.Mostrar aquellos vehiculos que no hayan recibido accidentes
SELECT placaVehiculo,marca,modelo,anio
FROM Vehiculo
WHERE placaVehiculo not in(
SELECT idVehiculo
FROM VehiculoHistorialAccidentes);

--15.Ver el último viaje realizado
SELECT TOP 1 * 
FROM Boleta
ORDER BY fechaRegreso DESC;

--16. Mostrar el monto total gastado en combustible por una boleta específica "viaje del idBoleta = 1"
SELECT SUM(F.monto) AS 'MontoTotal'
FROM Factura F
JOIN Viaje V ON F.idViaje = V.idViaje
JOIN Boleta B ON V.idViaje = B.idViaje
WHERE B.idBoleta = 1;

--17. Mostrar la información del guarda que revisó un vehículo específico cuando partio y cuando regreso, en una fecha específica
SELECT DISTINCT
    g_salida.idGuarda AS GuardaSalida, 
    g_salida.nombre AS NombreGuardaSalida,
    g_regreso.idGuarda AS GuardaRegreso, 
    g_regreso.nombre AS NombreGuardaRegreso,
    bv.fechaRevisionSalida, 
    bv.fechaRevisionRegreso
FROM Boleta b
JOIN BoletaVehiculo bv ON b.idBoleta = bv.idBoleta
JOIN Vehiculo v ON bv.idVehiculo = v.placaVehiculo
LEFT JOIN Guarda g_salida ON g_salida.idGuarda = b.idGuardaSalida
LEFT JOIN Guarda g_regreso ON g_regreso.idGuarda = b.idGuardaRegreso
WHERE v.placaVehiculo = '105678' AND bv.fechaRevisionSalida = '2024-11-24';

--18.Mostrar el numero de telefono de un responsable por la boleta generada
SELECT rt.telefono,r.nombre,r.apellido1
FROM ResponsableTelefono rt
JOIN Boleta b ON b.idResponsable = rt.idResponsable
JOIN Responsable r ON b.idResponsable=r.idResponsable
WHERE b.idBoleta = 2;

--19.Obtener los nombres de los choferes y el número de licencias que cada uno posee.
SELECT C.nombre, C.apellido1, L.tipo AS tipoLicencia
FROM Chofer C
JOIN Licencia L ON C.idChofer = L.idChofer
GROUP BY C.nombre, C.apellido1, L.tipo;

--20.Obtener aquellos viajes con su respectiva boleta que no llegaron a la hora colocada en la boleta (se atrasaron)
SELECT B.idBoleta, V.idViaje, B.horaRegreso,V.horaRealRegreso, V.justificacion
FROM Boleta B
JOIN Viaje V ON B.idViaje = V.idViaje
WHERE V.horaRealRegreso > B.horaRegreso;

--21. Mostrar el nombre y teléfono de las gasolineras por las que tuvieron que pasar en una gira
SELECT B.idBoleta, G.nombre AS nombreGasolinera, GT.telefono
FROM Boleta B
JOIN Factura F ON B.idViaje = F.idViaje  -- Relacionamos Boleta y Factura a través de idViaje
JOIN Gasolinera G ON F.idGasolinera = G.idGasolinera
JOIN GasolineraTelefono GT ON G.idGasolinera = GT.idGasolinera;

--22.Ver una lista de todos los participantes de un viaje
SELECT P.*
FROM Participantes P
JOIN ParticipantesBoleta PB ON P.cedula = PB.cedulaParticipante
JOIN Boleta B ON B.idBoleta = PB.idBoleta
WHERE B.idBoleta=1;

--23. Mostrar una lista de vehiculos que se encuentran en mal estado
SELECT *
FROM Vehiculo 
WHERE estado = 'Mantenimiento';

--24. Consultar la nformacion de un destino y sus paradas durante el viaje
SELECT b.idBoleta, b.objetivoViaje, d.provincia, d.canton, d.distrito, zp.lugar AS lugarParada, bp.hora AS horaParada
FROM boleta b
JOIN BoletaDestino bd ON bd.idBoleta = b.idBoleta
JOIN Destino d ON d.idDestino = bd.idDestino
JOIN BoletaParada bp ON bp.idBoleta = b.idBoleta
JOIN zonasParada zp ON zp.idParada = bp.idParada;

--25. Consultar la facturación total por viaje, incluyendo responsables y vehículos asignados
SELECT v.idViaje, r.nombre AS responsableNombre, r.apellido1 AS responsableApellido, 
		v.horasExtra, SUM(f.monto) AS totalFacturacion, COUNT(f.idFactura) AS totalFacturas, veh.marca, veh.modelo
FROM viaje v
JOIN boleta b ON v.idViaje = b.idViaje
JOIN responsable r ON b.idResponsable = r.idResponsable
JOIN factura f ON v.idViaje = f.idViaje
JOIN boletavehiculo bv ON b.idBoleta = bv.idBoleta
JOIN vehiculo veh ON bv.idVehiculo = veh.placaVehiculo
GROUP BY v.idViaje, r.nombre, r.apellido1, v.horasExtra, veh.marca, veh.modelo;

--26. Consultar el historial de participantes en viajes con múltiples responsables y choferes
SELECT p.cedula, p.nombre, p.apellido1, b.objetivoViaje, r.nombre AS responsableNombre, c.nombre AS choferNombre
FROM participantes p
JOIN participantesboleta pb ON p.cedula = pb.cedulaParticipante
JOIN boleta b ON pb.idBoleta = b.idBoleta
JOIN responsable r ON b.idResponsable = r.idResponsable
JOIN boletachofer bc ON b.idBoleta = bc.idBoleta
JOIN chofer c ON bc.idChofer = c.idChofer;

--27. Consultar la boleta que tenga un viaje registrado entre los meses de mayo y junio en las facturas registradas
SELECT b.idBoleta, v.idViaje, 
    CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS chofer,
    CONCAT(a.nombre, ' ', a.apellido1, ' ', a.apellido2) AS asistente,
    COUNT(pb.cedulaParticipante) AS cantidadPasajeros, f.fecha
FROM factura f
JOIN viaje v ON f.idViaje = v.idViaje
JOIN boleta b ON b.idViaje = v.idViaje
JOIN boletachofer bc ON b.idBoleta = bc.idBoleta
JOIN chofer c ON bc.idChofer = c.idChofer
JOIN asistente a ON b.idAsistente = a.idAsistente
JOIN participantesboleta pb ON b.idBoleta = pb.idBoleta
WHERE MONTH(f.fecha) IN (5,6)
GROUP BY b.idBoleta, v.idViaje, c.nombre, c.apellido1, c.apellido2, a.nombre, a.apellido1, a.apellido2, f.fecha;

--28. Consultar los viajes que se han recorrido mas de 100 km, mostrar la boleta que se genero el viaje, el chofer
--que condujo ese dia y el los guardas que registraron la salida y la entrada del vehiculo a la sede
SELECT b.idBoleta, b.objetivoViaje, b.fechaPartida, b.horaPartida, v.idViaje, v.kmRecorridos, 
    CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS chofer,
    CONCAT(a.nombre, ' ', a.apellido1, ' ', a.apellido2) AS asistente,
    CONCAT(gs.nombre, ' (Salida)') AS guardaSalida,
    CONCAT(gr.nombre, ' (Regreso)') AS guardaRegreso
FROM boleta b
JOIN viaje v ON b.idViaje = v.idViaje
JOIN boletachofer bc ON b.idBoleta = bc.idBoleta
JOIN chofer c ON bc.idChofer = c.idChofer
JOIN asistente a ON b.idAsistente = a.idAsistente
LEFT JOIN guarda gs ON b.idGuardaSalida = gs.idGuarda
LEFT JOIN guarda gr ON b.idGuardaRegreso = gr.idGuarda
WHERE v.kmRecorridos > 100
ORDER BY v.kmRecorridos DESC;

--29. Consultar todos los choferes que recibieron pagos por horas extras y cuanto fue, mostrar la boleta en que se genero 
--el viaje
SELECT b.idBoleta, CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS nombre_chofer, v.horasExtra AS horas_extras,
    v.horasExtra * 20 AS monto_extra, b.objetivoViaje, b.fechaPartida, b.horaPartida, b.fechaRegreso, b.horaRegreso
FROM viaje v
JOIN boleta b ON v.idViaje = b.idViaje
JOIN boletachofer bc ON b.idBoleta = bc.idBoleta
JOIN chofer c ON bc.idChofer = c.idChofer
WHERE v.horasExtra > 0
ORDER BY v.horasExtra DESC;

--30. Obtener las boletas de viaje con los vehículos asignados y su disponibilidad
SELECT b.idBoleta, b.lugarPartida, b.fechaPartida, b.horaPartida, v.placaVehiculo, v.estado
FROM Boleta b
JOIN BoletaVehiculo bv ON b.idBoleta = bv.idBoleta
JOIN Vehiculo v ON bv.idVehiculo = v.placaVehiculo;

--31. Consultar la informacion de los viajes con su boleta, chofer, asistente, fecha partida y regreso, dureacion del viaje
--cantidad de pasajeros y lugar de destino
SELECT b.idBoleta, CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS chofer,
    CONCAT(a.nombre, ' ', a.apellido1, ' ', a.apellido2) AS asistente, b.fechaPartida, b.fechaRegreso,
    DATEDIFF(day, b.fechaPartida, b.fechaRegreso) AS duracion_viaje, COUNT(pb.cedulaParticipante) AS cantidadPasajeros,
    d.distrito AS lugarDestino
FROM boleta b
JOIN viaje v ON b.idViaje = v.idViaje
JOIN boletachofer bc ON b.idBoleta = bc.idBoleta
JOIN chofer c ON bc.idChofer = c.idChofer
JOIN asistente a ON b.idAsistente = a.idAsistente
JOIN boletadestino bd ON b.idBoleta = bd.idBoleta
JOIN destino d ON bd.idDestino = d.idDestino
LEFT JOIN participantesboleta pb ON b.idBoleta = pb.idBoleta
GROUP BY b.idBoleta, c.nombre, c.apellido1, c.apellido2, a.nombre,a.apellido1, a.apellido2, b.fechaPartida, 
		b.fechaRegreso, d.distrito
ORDER BY duracion_viaje DESC;

--32. Consultar las giras que se han realizado en San Jose pero que no incluyan las giras en Escazu
SELECT b.idBoleta, CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS chofer,
    CONCAT(a.nombre, ' ', a.apellido1, ' ', a.apellido2) AS asistente, CONCAT(d.distrito, ', ', d.canton, ', ', d.provincia) AS destino,
    COUNT(pb.cedulaParticipante) AS cantidadPasajeros
FROM boleta b
JOIN boletachofer bc ON b.idBoleta = bc.idBoleta
JOIN chofer c ON bc.idChofer = c.idChofer
JOIN asistente a ON b.idAsistente = a.idAsistente
JOIN boletadestino bd ON b.idBoleta = bd.idBoleta
JOIN destino d ON bd.idDestino = d.idDestino
LEFT JOIN participantesboleta pb ON b.idBoleta = pb.idBoleta
WHERE d.provincia = 'San José' AND d.canton != 'Escazú'
GROUP BY b.idBoleta, c.nombre, c.apellido1, c.apellido2, a.nombre, a.apellido1, a.apellido2, d.distrito, d.canton, d.provincia
ORDER BY b.idBoleta;

--33. Consultar las giras que se han realizado fuera de puntarenas
SELECT b.idBoleta, CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS chofer,
    CONCAT(a.nombre, ' ', a.apellido1, ' ', a.apellido2) AS asistente, CONCAT(d.distrito, ', ', d.canton, ', ', d.provincia) AS destino,
    COUNT(pb.cedulaParticipante) AS cantidadPasajeros
FROM boleta b
JOIN boletachofer bc ON b.idBoleta = bc.idBoleta
JOIN chofer c ON bc.idChofer = c.idChofer
JOIN asistente a ON b.idAsistente = a.idAsistente
JOIN boletadestino bd ON b.idBoleta = bd.idBoleta
JOIN destino d ON bd.idDestino = d.idDestino
LEFT JOIN participantesboleta pb ON b.idBoleta = pb.idBoleta
WHERE d.provincia != 'Puntarenas'
GROUP BY b.idBoleta, c.nombre, c.apellido1, c.apellido2, a.nombre, a.apellido1, a.apellido2, d.distrito, d.canton, d.provincia
ORDER BY b.idBoleta;




















