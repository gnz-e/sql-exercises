-- Problema: Consecutive Numbers.

-- =========================================================
-- Tabla: Logs
--
-- +-------------+---------+
-- | Nombre Campo| Tipo    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
--
-- En SQL, id es la llave primaria de esta tabla.
--
-- id es una columna autoincremental
-- que comienza desde 1.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Encuentre todos los números que aparezcan
-- al menos tres veces consecutivas.
--
-- El resultado puede devolverse en cualquier orden.
-- =========================================================

-- =========================================================
-- Ejemplo:
--
-- Entrada:
--
-- Tabla Logs
--
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
--
--
-- Salida esperada:
--
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
--
--
-- Explicación:
--
-- El número 1 aparece tres veces consecutivas:
--
-- id = 1 -> 1
-- id = 2 -> 1
-- id = 3 -> 1
--
-- Por lo tanto, debe mostrarse en el resultado.
--
-- Ningún otro número aparece
-- al menos tres veces seguidas.
-- =========================================================

SELECT
    DISTINCT A.num AS ConsecutiveNums
FROM Logs A, Logs B, logs C
WHERE
    B.id = A.id + 1 AND 
    C.id = B.id + 1 AND 
    A.num = B.num AND 
    B.num = C.num;