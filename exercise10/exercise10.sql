-- Problema: Department Top Three Salaries.

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
-- Cada fila representa el ID
-- y nombre de un departamento.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Los ejecutivos de la empresa desean conocer
-- quiénes ganan más dinero en cada departamento.
--
-- Un empleado es considerado un "high earner"
-- si su salario se encuentra dentro
-- de los tres salarios únicos más altos
-- de su departamento.
--
-- Escriba una consulta SQL para encontrar
-- todos los empleados que sean "high earners"
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
-- | 1  | Joe   | 85000  | 1            |
-- | 2  | Henry | 80000  | 2            |
-- | 3  | Sam   | 60000  | 2            |
-- | 4  | Max   | 90000  | 1            |
-- | 5  | Janet | 69000  | 1            |
-- | 6  | Randy | 85000  | 1            |
-- | 7  | Will  | 70000  | 1            |
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
-- | IT         | Max      | 90000  |
-- | IT         | Joe      | 85000  |
-- | IT         | Randy    | 85000  |
-- | IT         | Will     | 70000  |
-- | Sales      | Henry    | 80000  |
-- | Sales      | Sam      | 60000  |
-- +------------+----------+--------+
--
--
-- Explicación:
--
-- En el departamento IT:
--
-- - Max tiene el salario único más alto.
-- - Joe y Randy tienen el segundo salario único más alto.
-- - Will tiene el tercer salario único más alto.
--
-- En el departamento Sales:
--
-- - Henry tiene el salario más alto.
-- - Sam tiene el segundo salario más alto.
-- - No existe un tercer salario más alto
--   porque solo hay dos empleados.
-- =========================================================

SELECT
    dp.name AS Department,
    em.name AS Employee,
    em.salary AS Salary
FROM Employee em
INNER JOIN Department dp
    ON em.departmentId = dp.id
WHERE 3 > (
    SELECT COUNT(DISTINCT em2.salary)
    FROM Employee em2
    WHERE 
        em2.departmentId = em.departmentId
        AND em2.salary > em.salary
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
) AS ranked_employees
WHERE ranking <= 3;