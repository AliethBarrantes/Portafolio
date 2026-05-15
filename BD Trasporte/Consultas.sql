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
