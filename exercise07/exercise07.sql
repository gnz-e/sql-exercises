-- Problema: Duplicate Emails.

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
-- Cada fila de esta tabla contiene un correo electrónico.
--
-- Los correos no contienen letras mayúsculas.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Escriba una consulta SQL para mostrar
-- todos los correos electrónicos duplicados.
--
-- Está garantizado que el campo email
-- nunca será NULL.
--
-- El resultado puede devolverse en cualquier orden.
-- =========================================================

-- =========================================================
-- Ejemplo:
--
-- Entrada:
--
-- Tabla Person
--
-- +----+---------+
-- | id | email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+
--
--
-- Salida esperada:
--
-- +---------+
-- | Email   |
-- +---------+
-- | a@b.com |
-- +---------+
--
--
-- Explicación:
--
-- El correo a@b.com aparece repetido dos veces,
-- por lo tanto debe mostrarse en el resultado.
-- =========================================================

SELECT 
    DISTINCT P1.email AS Email
FROM Person P1, Person P2
WHERE 
    P1.id > P2.id AND
    P1.email = P2.email;

SELECT
    email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;