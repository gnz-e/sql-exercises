-- Problema: Second Highest Salary.

-- =========================================================
-- Tabla: Employee
--
-- +-------------+------+
-- | Nombre Campo| Tipo |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
--
-- id es la llave primaria (valores únicos) de esta tabla.
--
-- Cada fila de esta tabla contiene información sobre
-- el salario de un empleado.
-- =========================================================


-- =========================================================
-- Instrucción:
--
-- Escriba una consulta SQL para encontrar el segundo
-- salario más alto distinto de la tabla Employee.
--
-- Si no existe un segundo salario más alto,
-- se debe devolver NULL.
--
-- El resultado debe mostrarse con el nombre:
-- SecondHighestSalary
-- =========================================================


-- =========================================================
-- Ejemplo 1:
--
-- Entrada:
--
-- Tabla Employee
--
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
--
--
-- Salida esperada:
--
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+
--
--
-- Explicación:
--
-- El salario más alto es 300.
-- El segundo salario más alto distinto es 200.
-- =========================================================


-- =========================================================
-- Ejemplo 2:
--
-- Entrada:
--
-- Tabla Employee
--
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- +----+--------+
--
--
-- Salida esperada:
--
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | NULL                |
-- +---------------------+
--
--
-- Explicación:
--
-- Solo existe un salario en la tabla,
-- por lo tanto no hay un segundo salario más alto.
-- =========================================================

SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

-- Si existe -> devuelve el valor
-- Si no existe -> devuelve null