-- Problema: Rising Temperature.

-- =========================================================
-- Tabla: Weather
--
-- +---------------+---------+
-- | Nombre Campo  | Tipo    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
--
-- id contiene valores únicos para esta tabla.
--
-- No existen filas diferentes
-- con la misma fecha (recordDate).
--
-- Esta tabla contiene información
-- sobre la temperatura de un día específico.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Escriba una consulta SQL para encontrar
-- los id de las fechas cuya temperatura
-- sea mayor que la del día anterior.
--
-- El resultado puede devolverse en cualquier orden.
-- =========================================================

-- =========================================================
-- Ejemplo:
--
-- Entrada:
--
-- Tabla Weather
--
-- +----+------------+-------------+
-- | id | recordDate | temperature |
-- +----+------------+-------------+
-- | 1  | 2015-01-01 | 10          |
-- | 2  | 2015-01-02 | 25          |
-- | 3  | 2015-01-03 | 20          |
-- | 4  | 2015-01-04 | 30          |
-- +----+------------+-------------+
--
--
-- Salida esperada:
--
-- +----+
-- | id |
-- +----+
-- | 2  |
-- | 4  |
-- +----+
--
--
-- Explicación:
--
-- En 2015-01-02,
-- la temperatura fue mayor
-- que la del día anterior:
--
-- 10 -> 25
--
-- En 2015-01-04,
-- la temperatura fue mayor
-- que la del día anterior:
--
-- 20 -> 30
-- =========================================================

SELECT 
    w1.id
FROM Weather w1
JOIN Weather w2
WHERE 
    DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND
    w1.temperature > w2.temperature;

SELECT
    w1.id
FROM Weather w1
JOIN Weather w2
WHERE 
    w2.recordDate = DATE_SUB(w1.recordDate, INTERVAL 1 DAY) AND 
    w1.temperature > w2.temperature;

SELECT id
FROM (
    SELECT
        id,
        temperature,

        LAG(temperature) OVER (
            ORDER BY recordDate
        ) AS prev_temp
    FROM Weather
) w
WHERE temperature > prev_temp;