CREATE DATABASE examen3
GO

USE examen3
GO

CREATE TABLE ENCUESTAS
( 
    NumEncuesta int identity(1,1),
    Nombre Varchar(50) NOT NULL, 
    Edad int NOT NULL,
    Correo varchar(50) NOT NULL,
    PartidoPolitico varchar(50) NOT NULL
)
GO

CREATE PROCEDURE AGREGARENCUEST
    @Nombre VARCHAR(50),
    @Edad INT,
    @Correo VARCHAR(50),
    @PartidoPolitico VARCHAR(50)
AS 
BEGIN 
    IF DATEDIFF(YEAR, DATEADD(YEAR, -@Edad, GETDATE()), GETDATE()) BETWEEN 18 AND 49
    BEGIN
        IF @Correo LIKE '%_@__%.%' AND CHARINDEX('@', @Correo) < CHARINDEX('.', @Correo)
        BEGIN
            INSERT INTO ENCUESTAS (Nombre, Edad, Correo, PartidoPolitico)
            VALUES (@Nombre, @Edad, @Correo, @PartidoPolitico);
        END
        ELSE
        BEGIN
            THROW 50000, 'Correo no valido', 1;
        END
    END
    ELSE
    BEGIN
        THROW 50000, 'La edad debe ser entre 18 y 49 años', 1;
    END
END;

CREATE PROCEDURE REPORTES
AS
BEGIN
    SELECT * FROM ENCUESTAS;
END;

EXEC AGREGARENCUEST 'Maria', 20, 'M@gmail.com', 'PLN';
EXEC REPORTES;
