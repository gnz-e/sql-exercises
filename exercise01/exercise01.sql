-- Problema: Combine Two Tables.

-- =========================================================
-- Tabla: Person
--
-- +-------------+---------+
-- | Nombre Campo| Tipo    |
-- +-------------+---------+
-- | personId    | int     |
-- | lastName    | varchar |
-- | firstName   | varchar |
-- +-------------+---------+
--
-- personId es la llave primaria (valores únicos) de esta tabla.
--
-- Esta tabla contiene información sobre el ID de algunas
-- personas, junto con sus nombres y apellidos.
-- =========================================================

-- =========================================================
-- Tabla: Address
--
-- +-------------+---------+
-- | Nombre Campo| Tipo    |
-- +-------------+---------+
-- | addressId   | int     |
-- | personId    | int     |
-- | city        | varchar |
-- | state       | varchar |
-- +-------------+---------+
--
-- addressId es la llave primaria (valores únicos) de esta tabla.
--
-- Cada fila de esta tabla contiene información sobre
-- la ciudad y el estado de una persona con ID = personId.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Escriba una consulta SQL para mostrar:
-- - nombre (firstName)
-- - apellido (lastName)
-- - ciudad (city)
-- - estado (state)
--
-- de cada persona registrada en la tabla Person.
--
-- Si la dirección de una persona no existe en la tabla
-- Address, se deben mostrar valores NULL en city y state.
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
-- +----------+----------+-----------+
-- | personId | lastName | firstName |
-- +----------+----------+-----------+
-- | 1        | Wang     | Allen     |
-- | 2        | Alice    | Bob       |
-- +----------+----------+-----------+
--
--
-- Tabla Address
--
-- +-----------+----------+---------------+------------+
-- | addressId | personId | city          | state      |
-- +-----------+----------+---------------+------------+
-- | 1         | 2        | New York City | New York   |
-- | 2         | 3        | Leetcode      | California |
-- +-----------+----------+---------------+------------+
--
--
-- Salida esperada:
--
-- +-----------+----------+---------------+----------+
-- | firstName | lastName | city          | state    |
-- +-----------+----------+---------------+----------+
-- | Allen     | Wang     | NULL          | NULL     |
-- | Bob       | Alice    | New York City | New York |
-- +-----------+----------+---------------+----------+
--
--
-- Explicación:
--
-- La persona con personId = 1 no tiene dirección registrada
-- en la tabla Address, por lo tanto city y state son NULL.
--
-- El registro con addressId = 1 contiene la dirección
-- correspondiente a la persona con personId = 2.
-- =========================================================

SELECT firstName,
    lastName,
    city,
    state
FROM Person
LEFT JOIN Address ON Person.personId = Address.personId;