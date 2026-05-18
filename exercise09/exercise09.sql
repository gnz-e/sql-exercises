-- Problema: Department Highest Salary.

-- =========================================================
-- Tabla: Employee
--
-- +--------------+---------+
-- | Nombre Campo | Tipo    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+
--
-- id es la llave primaria (valores únicos) de esta tabla.
--
-- departmentId es una llave foránea que hace
-- referencia al campo id de la tabla Department.
--
-- Cada fila representa el ID, nombre,
-- salario y departamento de un empleado.
-- =========================================================

-- =========================================================
-- Tabla: Department
--
-- +-------------+---------+
-- | Nombre Campo| Tipo    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
--
-- id es la llave primaria de esta tabla.
--
-- Se garantiza que el nombre del departamento
-- nunca será NULL.
--
-- Cada fila representa un departamento y su nombre.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Escriba una consulta SQL para encontrar
-- los empleados que tienen el salario más alto
-- en cada departamento.
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
-- +----+-------+--------+--------------+
-- | id | name  | salary | departmentId |
-- +----+-------+--------+--------------+
-- | 1  | Joe   | 70000  | 1            |
-- | 2  | Jim   | 90000  | 1            |
-- | 3  | Henry | 80000  | 2            |
-- | 4  | Sam   | 60000  | 2            |
-- | 5  | Max   | 90000  | 1            |
-- +----+-------+--------+--------------+
--
--
-- Tabla Department
--
-- +----+-------+
-- | id | name  |
-- +----+-------+
-- | 1  | IT    |
-- | 2  | Sales |
-- +----+-------+
--
--
-- Salida esperada:
--
-- +------------+----------+--------+
-- | Department | Employee | Salary |
-- +------------+----------+--------+
-- | IT         | Jim      | 90000  |
-- | Sales      | Henry    | 80000  |
-- | IT         | Max      | 90000  |
-- +------------+----------+--------+
--
--
-- Explicación:
--
-- Jim y Max tienen el salario más alto
-- en el departamento IT.
--
-- Henry tiene el salario más alto
-- en el departamento Sales.
-- =========================================================

SELECT
    dp.name AS Department,
    em.name AS Employee,
    em.salary AS salary
FROM Employee em
INNER JOIN Department dp
ON em.departmentId = dp.id
WHERE em.salary = (
    SELECT
        MAX(salary)
    FROM Employee
    WHERE departmentId = dp.id
);

SELECT
    Department,
    Employee,
    Salary
FROM (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,

        DENSE_RANK() OVER (
            PARTITION BY e.departmentId
            ORDER BY e.salary DESC
        ) AS ranking

    FROM Employee e
    INNER JOIN Department d
        ON e.departmentId = d.id
) ranked
WHERE ranking = 1;