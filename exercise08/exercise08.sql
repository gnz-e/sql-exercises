-- Problema: Customers Who Never Order.

-- =========================================================
-- Tabla: Customers
--
-- +-------------+---------+
-- | Nombre Campo| Tipo    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
--
-- id es la llave primaria (valores únicos) de esta tabla.
--
-- Cada fila de esta tabla representa el ID y
-- nombre de un cliente.
-- =========================================================

-- =========================================================
-- Tabla: Orders
--
-- +-------------+------+
-- | Nombre Campo| Tipo |
-- +-------------+------+
-- | id          | int  |
-- | customerId  | int  |
-- +-------------+------+
--
-- id es la llave primaria de esta tabla.
--
-- customerId es una llave foránea que hace
-- referencia al campo id de la tabla Customers.
--
-- Cada fila representa un pedido realizado
-- por un cliente.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Escriba una consulta SQL para encontrar
-- todos los clientes que nunca han realizado
-- un pedido.
--
-- El resultado puede devolverse en cualquier orden.
-- =========================================================

-- =========================================================
-- Ejemplo:
--
-- Entrada:
--
-- Tabla Customers
--
-- +----+-------+
-- | id | name  |
-- +----+-------+
-- | 1  | Joe   |
-- | 2  | Henry |
-- | 3  | Sam   |
-- | 4  | Max   |
-- +----+-------+
--
--
-- Tabla Orders
--
-- +----+------------+
-- | id | customerId |
-- +----+------------+
-- | 1  | 3          |
-- | 2  | 1          |
-- +----+------------+
--
--
-- Salida esperada:
--
-- +-----------+
-- | Customers |
-- +-----------+
-- | Henry     |
-- | Max       |
-- +-----------+
--
--
-- Explicación:
--
-- Henry y Max no aparecen en la tabla Orders,
-- por lo tanto nunca han realizado pedidos.
-- =========================================================

SELECT
    name AS Customers
FROM Customers
WHERE id NOT IN (
    SELECT
        customerId
    FROM Orders
);