-- Problema: Trips and Users.

-- =========================================================
-- Tabla: Trips
--
-- +-------------+----------+
-- | Nombre Campo| Tipo     |
-- +-------------+----------+
-- | id          | int      |
-- | client_id   | int      |
-- | driver_id   | int      |
-- | city_id     | int      |
-- | status      | enum     |
-- | request_at  | varchar  |
-- +-------------+----------+
--
-- id es la llave primaria (valores únicos) de esta tabla.
--
-- Esta tabla almacena todos los viajes de taxi.
--
-- Cada viaje tiene:
-- - un id único,
-- - un cliente,
-- - un conductor,
-- - una ciudad,
-- - un estado del viaje,
-- - y la fecha de solicitud.
--
-- client_id y driver_id son llaves foráneas
-- que hacen referencia al campo users_id
-- de la tabla Users.
--
-- status puede tener los valores:
-- - 'completed'
-- - 'cancelled_by_driver'
-- - 'cancelled_by_client'
-- =========================================================

-- =========================================================
-- Tabla: Users
--
-- +-------------+----------+
-- | Nombre Campo| Tipo     |
-- +-------------+----------+
-- | users_id    | int      |
-- | banned      | enum     |
-- | role        | enum     |
-- +-------------+----------+
--
-- users_id es la llave primaria de esta tabla.
--
-- Cada usuario tiene un identificador único.
--
-- role puede tener los valores:
-- - 'client'
-- - 'driver'
-- - 'partner'
--
-- banned puede tener los valores:
-- - 'Yes'
-- - 'No'
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- La tasa de cancelación se calcula dividiendo:
--
-- número de viajes cancelados
-- --------------------------------
-- total de viajes
--
-- Solo deben considerarse los viajes
-- donde tanto el cliente como el conductor
-- NO estén bloqueados (banned = 'No').
--
-- Escriba una consulta SQL para encontrar
-- la tasa de cancelación diaria
-- entre las fechas:
--
-- '2013-10-01' y '2013-10-03'
--
-- Considere únicamente los días
-- con al menos un viaje.
--
-- Redondee el resultado
-- a dos decimales.
--
-- El resultado puede devolverse en cualquier orden.
-- =========================================================

-- =========================================================
-- Ejemplo:
--
-- Entrada:
--
-- Tabla Trips
--
-- +----+-----------+-----------+---------+---------------------+------------+
-- | id | client_id | driver_id | city_id | status              | request_at |
-- +----+-----------+-----------+---------+---------------------+------------+
-- | 1  | 1         | 10        | 1       | completed           | 2013-10-01 |
-- | 2  | 2         | 11        | 1       | cancelled_by_driver | 2013-10-01 |
-- | 3  | 3         | 12        | 6       | completed           | 2013-10-01 |
-- | 4  | 4         | 13        | 6       | cancelled_by_client | 2013-10-01 |
-- | 5  | 1         | 10        | 1       | completed           | 2013-10-02 |
-- | 6  | 2         | 11        | 6       | completed           | 2013-10-02 |
-- | 7  | 3         | 12        | 6       | completed           | 2013-10-02 |
-- | 8  | 2         | 12        | 12      | completed           | 2013-10-03 |
-- | 9  | 3         | 10        | 12      | completed           | 2013-10-03 |
-- | 10 | 4         | 13        | 12      | cancelled_by_driver | 2013-10-03 |
-- +----+-----------+-----------+---------+---------------------+------------+
--
--
-- Tabla Users
--
-- +----------+--------+--------+
-- | users_id | banned | role   |
-- +----------+--------+--------+
-- | 1        | No     | client |
-- | 2        | Yes    | client |
-- | 3        | No     | client |
-- | 4        | No     | client |
-- | 10       | No     | driver |
-- | 11       | No     | driver |
-- | 12       | No     | driver |
-- | 13       | No     | driver |
-- +----------+--------+--------+
--
--
-- Salida esperada:
--
-- +------------+-------------------+
-- | Day        | Cancellation Rate |
-- +------------+-------------------+
-- | 2013-10-01 | 0.33              |
-- | 2013-10-02 | 0.00              |
-- | 2013-10-03 | 0.50              |
-- +------------+-------------------+
--
--
-- Explicación:
--
-- En 2013-10-01:
--
-- - Hubo 4 viajes en total.
-- - 2 fueron cancelados.
-- - El viaje con id = 2 se ignora
--   porque el cliente está bloqueado.
-- - Entonces quedan 3 viajes válidos,
--   de los cuales 1 fue cancelado.
--
-- Tasa de cancelación:
--
-- 1 / 3 = 0.33
--
--
-- En 2013-10-02:
--
-- - Hubo 3 viajes.
-- - Ninguno fue cancelado.
-- - El viaje con id = 6 se ignora
--   porque el cliente está bloqueado.
-- - Quedan 2 viajes válidos.
--
-- Tasa de cancelación:
--
-- 0 / 2 = 0.00
--
--
-- En 2013-10-03:
--
-- - Hubo 3 viajes.
-- - 1 fue cancelado.
-- - El viaje con id = 8 se ignora
--   porque el cliente está bloqueado.
-- - Quedan 2 viajes válidos,
--   de los cuales 1 fue cancelado.
--
-- Tasa de cancelación:
--
-- 1 / 2 = 0.50
-- =========================================================

SELECT
    request_at AS `Day`,
    ROUND(
        SUM(
            CASE
                WHEN status != 'completed' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS `Cancellation Rate`
FROM Trips t
JOIN Users cliente
    ON t.client_id = cliente.users_id
JOIN Users conductor
    ON t.driver_id = conductor.users_id
WHERE 
    cliente.banned = 'No' AND 
    conductor.banned = 'No' AND
    request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at;