SELECT Precio FROM Asientos;
SELECT CantAsientos FROM Camiones;
SELECT nombre FROM Personas;
SELECT Destino, Tiempo FROM Rutas;
SELECT Asiento,Precio FROM Boleto;

SELECT Precio
From Asientos
GROUP BY fecha;

SELECT nombre
From Personas
GROUP BY choferes;

SELECT Boletos
FROM Boletos
GROUP BY Asiento;

SELECT Zona
From Lugar
GROUP BY numeroDeAsiento;

SELECT numeroDeAsientos
From Asientos
GROUP BY fecha;

SELECT Venta
From Detalle Venta
GROUP BY tipo de pago
HAVING cantidad > 1000;

SELECT idVenta
From Venta
GROUP BY vendedor
HAVING vendedor > 7;

SELECT idEmpleado
From Venta
GROUP BY idCliente
HAVING idEmpleado > 1261;

SELECT Nombre
FROM Cliente
GROUP BY Edad
HAVING Edad > 50;

SELECT Nombre
From Cliente
GROUP BY Edad
HAVING Edad > 30;