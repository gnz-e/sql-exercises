-- Problema: Managers with at Least 5 Direct Reports.

-- =========================================================
-- Tabla: Employee
--
-- +---------------+---------+
-- | Nombre Campo  | Tipo    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- | department    | varchar |
-- | managerId     | int     |
-- +---------------+---------+
--
-- id es la llave primaria
-- (valores únicos) de esta tabla.
--
-- Cada fila representa:
--
-- - el nombre de un empleado,
-- - su departamento,
-- - y el id de su gerente.
--
-- Si managerId es NULL,
-- significa que el empleado
-- no tiene gerente.
--
-- Ningún empleado será gerente
-- de sí mismo.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Escriba una consulta SQL para encontrar
-- los gerentes que tienen
-- al menos cinco empleados directos.
--
-- El resultado puede devolverse
-- en cualquier orden.
-- =========================================================

-- =========================================================
-- Ejemplo:
--
-- Entrada:
--
-- Tabla Employee
--
-- +-----+-------+------------+-----------+
-- | id  | name  | department | managerId |
-- +-----+-------+------------+-----------+
-- | 101 | John  | A          | null      |
-- | 102 | Dan   | A          | 101       |
-- | 103 | James | A          | 101       |
-- | 104 | Amy   | A          | 101       |
-- | 105 | Anne  | A          | 101       |
-- | 106 | Ron   | B          | 101       |
-- +-----+-------+------------+-----------+
--
--
-- Salida esperada:
--
-- +------+
-- | name |
-- +------+
-- | John |
-- +------+
--
--
-- Explicación:
--
-- El empleado John (id = 101)
-- es gerente de:
--
-- - Dan
-- - James
-- - Amy
-- - Anne
-- - Ron
--
-- Como tiene 5 empleados directos,
-- debe aparecer en el resultado.
-- =========================================================

SELECT
    emp1.name
FROM Employee emp1
INNER JOIN Employee emp2
ON emp1.id = emp2.managerId
GROUP BY emp1.id, emp1.name
HAVING COUNT(*) >= 5;