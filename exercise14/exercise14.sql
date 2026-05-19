-- Problema: Game Play Analysis I.

-- =========================================================
-- Tabla: Activity
--
-- +--------------+---------+
-- | Nombre Campo | Tipo    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
--
-- La combinación:
--
-- (player_id, event_date)
--
-- es la llave primaria de esta tabla.
--
-- Esta tabla almacena la actividad
-- de jugadores en distintos juegos.
--
-- Cada fila representa:
--
-- - el jugador,
-- - el dispositivo utilizado,
-- - la fecha de inicio de sesión,
-- - y la cantidad de juegos jugados
--   antes de cerrar sesión.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Escriba una consulta SQL para encontrar
-- la primera fecha de inicio de sesión
-- de cada jugador.
--
-- El resultado puede devolverse
-- en cualquier orden.
-- =========================================================

-- =========================================================
-- Ejemplo:
--
-- Entrada:
--
-- Tabla Activity
--
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-05-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+
--
--
-- Salida esperada:
--
-- +-----------+-------------+
-- | player_id | first_login |
-- +-----------+-------------+
-- | 1         | 2016-03-01  |
-- | 2         | 2017-06-25  |
-- | 3         | 2016-03-02  |
-- +-----------+-------------+
--
--
-- Explicación:
--
-- - El jugador 1 inició sesión
--   por primera vez el 2016-03-01.
--
-- - El jugador 2 inició sesión
--   por primera vez el 2017-06-25.
--
-- - El jugador 3 inició sesión
--   por primera vez el 2016-03-02.
-- =========================================================

SELECT
    player_id,
    event_date AS first_login
FROM (
    SELECT
        player_id,
        event_date,

        ROW_NUMBER() OVER (
            PARTITION BY player_id
            ORDER BY event_date
        ) AS rn
    FROM Activity
) t
WHERE rn = 1;

SELECT
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;