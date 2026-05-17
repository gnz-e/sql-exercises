-- Problema: Nth Highest Salary.

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
-- Cada fila de esta tabla contiene información
-- sobre el salario de un empleado.
-- =========================================================

-- =========================================================
-- Instrucción:
--
-- Escriba una solución para encontrar el enésimo
-- salario más alto distinto (nth highest distinct salary)
-- de la tabla Employee.
--
-- Si existen menos de n salarios distintos,
-- se debe devolver NULL.
--
-- El resultado debe mostrarse con el nombre:
--
-- getNthHighestSalary(n)
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
-- n = 2
--
--
-- Salida esperada:
--
-- +------------------------+
-- | getNthHighestSalary(2) |
-- +------------------------+
-- | 200                    |
-- +------------------------+
--
--
-- Explicación:
--
-- Los salarios distintos ordenados de mayor a menor son:
--
-- 300
-- 200
-- 100
--
-- El segundo salario más alto es 200.
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
-- n = 2
--
--
-- Salida esperada:
--
-- +------------------------+
-- | getNthHighestSalary(2) |
-- +------------------------+
-- | NULL                   |
-- +------------------------+
--
--
-- Explicación:
--
-- Solo existe un salario distinto,
-- por lo tanto no existe un segundo salario más alto.
-- =========================================================

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N - 1;
  
  RETURN (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET N
  );
END