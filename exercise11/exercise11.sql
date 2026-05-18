-- Problema: Delete Duplicate Emails.

-- =========================================================
-- Tabla: Person
--
-- +-------------+---------+
-- | Nombre Campo| Tipo    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+
--
-- id es la llave primaria (valores únicos) de esta tabla.
--
-- Cada fila de esta tabla contiene
-- un correo electrónico.
--
-- Los correos no contienen letras mayúsculas.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Escriba una consulta SQL para eliminar
-- todos los correos electrónicos duplicados,
-- conservando únicamente un correo único
-- con el id más pequeño.
--
-- Importante:
--
-- Para usuarios de SQL, debe escribir
-- una sentencia DELETE y no una consulta SELECT.
--
-- Después de ejecutar el script,
-- el resultado mostrado será la tabla Person.
--
-- El orden final de la tabla no importa.
-- =========================================================

-- =========================================================
-- Ejemplo:
--
-- Entrada:
--
-- Tabla Person
--
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
--
--
-- Salida esperada:
--
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+
--
--
-- Explicación:
--
-- El correo john@example.com aparece repetido
-- dos veces.
--
-- Se conserva únicamente la fila
-- con el id más pequeño (id = 1).
-- =========================================================

DELETE FROM Person
WHERE id NOT IN (
    SELECT *
    FROM (
        SELECT MIN(id)
        FROM Person
        GROUP BY email
    ) AS temp
);

DELETE
    P1
FROM Person P1, Person P2
WHERE 
    P1.email = P2.email AND
    P1.id > P2.id;