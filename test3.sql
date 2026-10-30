USE Empresa;
GO

-- 01) Funcionários que nasceram no dia 19
SELECT *
FROM Funcionarios
WHERE DAY(DataNascimento) = 19;
GO

-- 02) Nome dos funcionários nascidos em julho
SELECT Nome
FROM Funcionarios
WHERE MONTH(DataNascimento) = 7;
GO

-- 03) Nome e idade dos funcionários
SELECT Nome,
       DATEDIFF(YEAR, DataNascimento, GETDATE()) AS Idade
FROM Funcionarios;
GO

-- 05) Número do pedido, data do pedido, data de entrega
-- e diferença de dias
SELECT NumeroPedido,
       DataPedido,
       DataEntrega,
       DATEDIFF(DAY, DataPedido, DataEntrega) AS DiferencaDias
FROM Pedidos;
GO

-- 1) Nome dos clientes em maiúsculo
SELECT UPPER(Nome) AS NomeCliente
FROM Clientes;
GO

-- 2) Nome do mês e quantidade de caracteres
SELECT DISTINCT
       DATENAME(MONTH, DataNascimento) AS Mes,
       LEN(DATENAME(MONTH, DataNascimento)) AS QuantidadeCaracteres
FROM Funcionarios;
GO

-- 3) Substituir espaços por traço
SELECT REPLACE(Nome, ' ', '-') AS NomeCliente
FROM Clientes;
GO

-- 4) Três primeiras e três últimas letras do contato
SELECT Contato,
       LEFT(Contato, 3) AS Primeiras3,
       RIGHT(Contato, 3) AS Ultimas3
FROM Fornecedores;
GO

-- 5) Cidade a partir da terceira posição,
-- com cinco caracteres, sem repetição
SELECT DISTINCT
       SUBSTRING(Cidade, 3, 5) AS Cidade
FROM Clientes;
GO
