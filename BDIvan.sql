DROP DATABASE BDIvan;

CREATE DATABASE BDIvan

USE BDIvan

CREATE TABLE Persona (
    PersonaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    FechaNacimiento DATE,
    Direccion VARCHAR(200)
);

CREATE TABLE CuentaBancaria (
    CuentaID INT AUTO_INCREMENT PRIMARY KEY,
    PersonaID INT,
    TipoCuenta VARCHAR(50),
    Saldo DECIMAL(18, 2),
    FechaApertura TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Utiliza CURRENT_TIMESTAMP como valor predeterminado para obtener la fecha y hora actuales
    FOREIGN KEY (PersonaID) REFERENCES Persona(PersonaID)
);

CREATE TABLE TransaccionesBancarias (
    TransaccionID INT AUTO_INCREMENT PRIMARY KEY,
    CuentaID INT,
    TipoTransaccion VARCHAR(50),
    Monto DECIMAL(18, 2),
    FechaTransaccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Utiliza CURRENT_TIMESTAMP como valor predeterminado para obtener la fecha y hora actuales
    CONSTRAINT CHK_Monto_Positive CHECK (Monto >= 0),
    FOREIGN KEY (CuentaID) REFERENCES CuentaBancaria(CuentaID)
);

INSERT INTO Persona (Nombre, Apellido, FechaNacimiento, Direccion) 
VALUES 
('Juan', 'Perez', '1990-05-15', 'Calle Principal 123'),
('Maria', 'Gonzalez', '1985-08-20', 'Avenida Central 456'),
('Pedro', 'Martinez', '1978-12-10', 'Plaza Mayor 789');

INSERT INTO CuentaBancaria (PersonaID, TipoCuenta, Saldo)
VALUES 
(1, 'Ahorros', 5000.00),
(1, 'Corriente', 10000.00),
(2, 'Ahorros', 400.00),
(2, 'Corriente', 2000.00),
(3, 'Ahorros', 3000.00),
(3, 'Corriente', 11000.00);

INSERT INTO TransaccionesBancarias (CuentaID, TipoTransaccion, Monto)
VALUES 
(2, 'Deposito', 1000.00),
(3, 'Retiro', 300.00);



select * from Persona;
select * from CuentaBancaria;
select * from TransaccionesBancarias;

SELECT c.*, p.Nombre AS NombrePersona FROM CuentaBancaria c JOIN Persona p ON c.PersonaID = p.PersonaID

SELECT c.*, p.Nombre AS NombrePersona FROM CuentaBancaria c JOIN Persona p ON c.PersonaID = p.PersonaID WHERE c.CuentaID = 4;


