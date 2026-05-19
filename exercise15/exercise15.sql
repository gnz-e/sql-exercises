-- Problema: Game Play Analysis IV.

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
-- Escriba una consulta SQL para calcular
-- la fracción de jugadores que iniciaron sesión
-- nuevamente al día siguiente
-- de su primer inicio de sesión.
--
-- En otras palabras:
--
-- - encuentre los jugadores que volvieron
--   exactamente un día después
--   de su primera fecha de inicio de sesión,
--
-- - y divida esa cantidad
--   entre el número total de jugadores.
--
-- Redondee el resultado
-- a 2 decimales.
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
-- | 1         | 2         | 2016-03-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+
--
--
-- Salida esperada:
--
-- +----------+
-- | fraction |
-- +----------+
-- | 0.33     |
-- +----------+
--
--
-- Explicación:
--
-- - El jugador 1 volvió a iniciar sesión
--   al día siguiente de su primer login:
--
--   2016-03-01 -> 2016-03-02
--
-- - El jugador 2 no volvió al día siguiente.
--
-- - El jugador 3 tampoco volvió
--   al día siguiente.
--
-- Entonces:
--
-- jugadores válidos = 1
-- total jugadores   = 3
--
-- fracción:
--
-- 1 / 3 = 0.33
-- =========================================================

SELECT
    ROUND(
        COUNT(DISTINCT next_day_login.player_id)
        /
        (
            SELECT COUNT(DISTINCT total_players.player_id)
            FROM Activity total_players
        ),
        2
    ) AS fraction
FROM (
    SELECT
        first_login_players.player_id,
        MIN(first_login_players.event_date) AS first_login
    FROM Activity first_login_players
    GROUP BY first_login_players.player_id
) AS first_login_table
JOIN Activity next_day_login
    ON first_login_table.player_id =
       next_day_login.player_id
WHERE next_day_login.event_date =
    DATE_ADD(
        first_login_table.first_login,
        INTERVAL 1 DAY
    );