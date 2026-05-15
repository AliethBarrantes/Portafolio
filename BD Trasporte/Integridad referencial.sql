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