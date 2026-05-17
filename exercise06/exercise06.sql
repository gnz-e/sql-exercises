-- Problema: Employees Earning More Than Their Managers.

-- =========================================================
-- Tabla: Employee
--
-- +-------------+---------+
-- | Nombre Campo| Tipo    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | salary      | int     |
-- | managerId   | int     |
-- +-------------+---------+
--
-- id es la llave primaria (valores únicos) de esta tabla.
--
-- Cada fila de esta tabla representa:
--
-- - el ID del empleado
-- - su nombre
-- - su salario
-- - el ID de su gerente (manager)
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Escriba una consulta SQL para encontrar
-- los empleados que ganan más dinero
-- que sus propios gerentes.
--
-- El resultado puede devolverse en cualquier orden.
-- =========================================================

-- =========================================================
-- Ejemplo:
--
-- Entrada:
--
-- Tabla Employee
--
-- +----+-------+--------+-----------+
-- | id | name  | salary | managerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+
--
--
-- Salida esperada:
--
-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+
--
--
-- Explicación:
--
-- Joe gana 70000
-- y su gerente (Sam) gana 60000.
--
-- Como 70000 > 60000,
-- Joe debe aparecer en el resultado.
--
-- Henry no aparece porque su gerente (Max)
-- gana más que él.
-- =========================================================

SELECT
    E.name AS Employee
FROM Employee E, Employee M
WHERE 
    E.managerId = M.id AND 
    E.salary > M.salary;