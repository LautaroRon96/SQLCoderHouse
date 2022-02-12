#Creacion de tablas de proyecto Lautaro Ron
#Encuentro errores al asignar mis foreign keys que no encuentro la solucion,
#A veces muestra de sintaxis y en Servicios_Contratados me dice que la columna no existe,
#cuando claramente ya esta creada

Create database	Primer_entrega_Lautaro_Ron;
USE Primer_entrega_Lautaro_Ron;

CREATE TABLE usuario (Id_Cliente INT NOT NULL PRIMARY KEY,
FecNac DATE NOT NULL, EstCiv VARCHAR(7) NOT NULL, 
CUIL_CUIT VARCHAR(11) NOT NULL, Ocup VARCHAR(20) NOT NULL, 
EMPLEADOR VARCHAR(50), usuario VARCHAR(8) NOT NULL, 
Nomb VARCHAR (50) NOT NULL, Apellido VARCHAR(50) NOT NULL,Clave CHAR(4) NOT NULL);

CREATE TABLE Servicios_Contratados (Id_Producto INT NOT NULL, FecVenc CHAR(5) NOT NULL,
NumProd INT NOT NULL, CCV INT NOT NULL, Alias CHAR(15) NOT NULL,
PRIMARY KEY (Id_Producto),
FOREIGN KEY fk_usuario (Id_Cliente)
REFERENCES usuario(Id_Cliente));
 
CREATE TABLE Adicionales (Id_Usuarios INT NOT NULL PRIMARY KEY,
Vinc VARCHAR(15), Lim INT NOT NULL,Cons FLOAT NOT NULL, 
Nomb VARCHAR(50) NOT NULL, Apellido VARCHAR(50) NOT NULL,
FOREIGN KEY fk_Servicios (Id_Producto)
REFERENCES Servicios_Contratados (Id_Producto));

CREATE TABLE Resumen (Id_Transaccion INT NOT NULL, Moneda VARCHAR(10) NOT NULL,
Saldos FLOAT NOT NULL, Negocio VARCHAR(50) NOT NULL, Cuotas INT NOT NULL,
Financiacion VARCHAR(50), Intereses FLOAT,
PRIMARY KEY (Id_Transaccion),
FOREIGN KEY fk_usuario(Id_Cliente),
REFERENCES usuario(Id_Cliente),
FOREIGN KEY fk_producto(Id_Producto),
REFERENCES Servicios_Contratados(Id_Producto));

CREATE TABLE Agenda_Transferencias (Id_CuentaForanea INT NOT NULL,
AliasFor VARCHAR(15) NOT NULL, EntRec VARCHAR(20) NOT NULL, CUIL_for INT NOT NULL,
Saldo FLOAT NOT NULL, CBU_For INT NOT NULL, NombRec VARCHAR(50) NOT NULL, ApellidoRec VARCHAR(50) NOT NULL,
PRIMARY KEY(Id_CuentaForanea),
FOREIGN KEY fk_Transaccion (Id_Transaccion),
REFERENCES Resumen(Id_Transaccion),
FOREIGN KEY fk_producto(Id_Producto),
REFERENCES Servicios_Contratados(Id_Producto));
 