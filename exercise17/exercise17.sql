-- Problema: Employee Bonus.

-- =========================================================
-- Tabla: Employee
--
-- +-------------+---------+
-- | Nombre Campo| Tipo    |
-- +-------------+---------+
-- | empId       | int     |
-- | name        | varchar |
-- | supervisor  | int     |
-- | salary      | int     |
-- +-------------+---------+
--
-- empId contiene valores únicos
-- para cada empleado.
--
-- Cada fila representa:
--
-- - el id del empleado,
-- - el nombre,
-- - el id de su supervisor,
-- - y su salario.
-- =========================================================

-- =========================================================
-- Tabla: Bonus
--
-- +-------------+------+
-- | Nombre Campo| Tipo |
-- +-------------+------+
-- | empId       | int  |
-- | bonus       | int  |
-- +-------------+------+
--
-- empId contiene valores únicos.
--
-- empId es llave foránea
-- que referencia Employee.empId.
--
-- Cada fila almacena
-- el bono correspondiente
-- a un empleado.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Escriba una consulta SQL para mostrar:
--
-- - el nombre,
-- - y el bono
--
-- de cada empleado que cumpla
-- alguna de las siguientes condiciones:
--
-- 1. El bono es menor a 1000.
--
-- 2. El empleado no tiene bono.
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
-- +-------+--------+------------+--------+
-- | empId | name   | supervisor | salary |
-- +-------+--------+------------+--------+
-- | 3     | Brad   | null       | 4000   |
-- | 1     | John   | 3          | 1000   |
-- | 2     | Dan    | 3          | 2000   |
-- | 4     | Thomas | 3          | 4000   |
-- +-------+--------+------------+--------+
--
--
-- Tabla Bonus
--
-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+
--
--
-- Salida esperada:
--
-- +------+-------+
-- | name | bonus |
-- +------+-------+
-- | Brad | null  |
-- | John | null  |
-- | Dan  | 500   |
-- +------+-------+
--
--
-- Explicación:
--
-- - Brad no tiene bono.
--
-- - John no tiene bono.
--
-- - Dan tiene un bono de 500,
--   que es menor a 1000.
--
-- - Thomas no aparece porque
--   su bono es 2000.
-- =========================================================

SELECT
    emp.name as name,
    bon.bonus as bonus
FROM Employee emp
LEFT JOIN Bonus bon
ON emp.empId = bon.empId
WHERE bon.bonus < 1000
    OR bon.bonus is NULL;