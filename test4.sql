USE Empresa;
GO

-- =========================
-- FUNÇÕES DE AGREGAÇÃO
-- =========================

-- 1. Maior e menor salário dos funcionários do Reino Unido
SELECT MAX(Salario) AS MaiorSalario,
       MIN(Salario) AS MenorSalario
FROM Funcionarios
WHERE Pais = 'Reino Unido';

-- 2. Soma dos salários dos funcionários dos EUA
SELECT SUM(Salario) AS SomaSalarios
FROM Funcionarios
WHERE Pais = 'EUA';

-- 3. Média dos fretes dos pedidos de 1996
SELECT AVG(Frete) AS MediaFretes
FROM Pedidos
WHERE YEAR(DataPedido) = 1996;

-- 4. Quantidade de clientes do México
SELECT COUNT(*) AS QuantidadeClientes
FROM Clientes
WHERE Pais = 'Mexico';

-- 5. Menor data de nascimento dos funcionários
SELECT MIN(DataNascimento) AS MenorDataNascimento
FROM Funcionarios;

-- =========================
-- FUNÇÕES DE AGRUPAMENTO
-- =========================

-- 1. Cargo e quantidade de funcionários por cargo
SELECT Cargo,
       COUNT(*) AS Quantidade
FROM Funcionarios
GROUP BY Cargo
ORDER BY Quantidade;

-- 2. Cargo e quantidade de funcionários por país
SELECT Pais,
       COUNT(*) AS Quantidade
FROM Funcionarios
GROUP BY Pais;

-- 3. Cargo e média dos salários por cargo
SELECT Cargo,
       AVG(Salario) AS Media_Salarios_Cargo
FROM Funcionarios
GROUP BY Cargo;

-- 4. Cargo e soma dos salários maiores que 3000
SELECT Cargo,
       SUM(Salario) AS SomaSalarios
FROM Funcionarios
GROUP BY Cargo
HAVING SUM(Salario) > 3000;

-- 5. País e quantidade de clientes por país
SELECT Pais,
       COUNT(*) AS QuantidadeClientes
FROM Clientes
GROUP BY Pais;

-- =========================
-- SUBCONSULTAS
-- =========================

-- 1. Todos os dados dos pedidos dos clientes da Alemanha
SELECT *
FROM Pedidos
WHERE CodigoCliente IN
(
    SELECT CodigoCliente
    FROM Clientes
    WHERE Pais = 'Alemanha'
);

-- 2. Todos os produtos da categoria Condimentos
SELECT *
FROM Produtos
WHERE CodigoCategoria =
(
    SELECT CodigoCategoria
    FROM Categorias
    WHERE NomeCategoria = 'Condimentos'
);

-- 3. Descrição dos produtos NÃO fornecidos por fornecedores dos EUA
SELECT Descricao
FROM Produtos
WHERE CodigoFornecedor NOT IN
(
    SELECT CodigoFornecedor
    FROM Fornecedores
    WHERE Pais = 'EUA'
);

-- 4. Código, descrição e preço do produto mais barato
SELECT CodigoProduto,
       Descricao,
       Preco
FROM Produtos
WHERE Preco =
(
    SELECT MIN(Preco)
    FROM Produtos
);

-- 5. Nome, sobrenome, cargo e salário dos coordenadores
-- com salário superior ao de algum representante de vendas
SELECT Nome,
       Sobrenome,
       Cargo,
       Salario
FROM Funcionarios
WHERE Cargo = 'Coordenador'
  AND Salario > ANY
(
    SELECT Salario
    FROM Funcionarios
    WHERE Cargo = 'Representante de Vendas'
);
