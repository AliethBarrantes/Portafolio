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