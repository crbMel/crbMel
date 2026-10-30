USE Empresa;
GO

/* ==========================
   CONSULTAS COM WHERE
   ========================== */

-- 1
SELECT DISTINCT C.*
FROM Clientes C, Pedidos P
WHERE C.CodigoCliente = P.CodigoCliente
  AND YEAR(P.DataPedido) = 1996;
GO

-- 2
SELECT DISTINCT F.*
FROM Funcionarios F, Pedidos P, Clientes C
WHERE F.CodigoFuncionario = P.CodigoFuncionario
  AND C.CodigoCliente = P.CodigoCliente
  AND C.NomeEmpresa = 'Around the Horn';
GO

-- 3
SELECT P.*
FROM Pedidos P, Clientes C
WHERE P.CodigoCliente = C.CodigoCliente
  AND C.NomeEmpresa = 'Comercio Mineiro';
GO

-- 4
SELECT DISTINCT F.*
FROM Funcionarios F, Pedidos P
WHERE F.CodigoFuncionario = P.CodigoFuncionario
  AND MONTH(P.DataPedido) = 9
  AND YEAR(P.DataPedido) = 1996;
GO

-- 5
SELECT PR.*, CA.*
FROM Produtos PR, Categorias CA
WHERE PR.CodigoCategoria = CA.CodigoCategoria
  AND CA.NomeCategoria = 'Laticinios';
GO

-- 6
SELECT PR.*, DP.NumeroPedido
FROM Produtos PR, DetalhesPedidos DP, Pedidos P
WHERE PR.CodigoProduto = DP.CodigoProduto
  AND DP.NumeroPedido = P.NumeroPedido
  AND P.DataPedido = '1996-07-08';
GO

-- 7
SELECT F.Nome, F.Sobrenome, P.NumeroPedido
FROM Funcionarios F, Pedidos P
WHERE F.CodigoFuncionario = P.CodigoFuncionario
  AND P.DataPedido = '1997-05-01';
GO

-- 8
SELECT P.NumeroPedido, C.NomeEmpresa
FROM Pedidos P, Clientes C
WHERE P.CodigoCliente = C.CodigoCliente
  AND MONTH(P.DataPedido) = 5
  AND YEAR(P.DataPedido) = 1997;
GO


/* ==========================
   CONSULTAS COM JOIN
   ========================== */

-- 1
SELECT DISTINCT C.*
FROM Clientes C
INNER JOIN Pedidos P
    ON C.CodigoCliente = P.CodigoCliente
WHERE MONTH(P.DataPedido) = 3
  AND YEAR(P.DataPedido) = 1997;
GO

-- 2
SELECT DISTINCT F.*
FROM Funcionarios F
INNER JOIN Pedidos P
    ON F.CodigoFuncionario = P.CodigoFuncionario
INNER JOIN Clientes C
    ON C.CodigoCliente = P.CodigoCliente
WHERE C.NomeEmpresa = 'Around the Horn';
GO

-- 3
SELECT P.*
FROM Pedidos P
INNER JOIN Clientes C
    ON P.CodigoCliente = C.CodigoCliente
WHERE C.NomeEmpresa = 'Comercio Mineiro';
GO

-- 4
SELECT DISTINCT F.*
FROM Funcionarios F
INNER JOIN Pedidos P
    ON F.CodigoFuncionario = P.CodigoFuncionario
WHERE MONTH(P.DataPedido) = 9
  AND YEAR(P.DataPedido) = 1996;
GO

-- 5
SELECT PR.*, CA.*
FROM Produtos PR
INNER JOIN Categorias CA
    ON PR.CodigoCategoria = CA.CodigoCategoria
WHERE CA.NomeCategoria = 'Laticinios';
GO

-- 6
SELECT PR.*, DP.NumeroPedido
FROM Produtos PR
INNER JOIN DetalhesPedidos DP
    ON PR.CodigoProduto = DP.CodigoProduto
INNER JOIN Pedidos P
    ON DP.NumeroPedido = P.NumeroPedido
WHERE P.DataPedido = '1996-07-08';
GO

-- 7
SELECT F.Nome, F.Sobrenome, P.NumeroPedido
FROM Funcionarios F
INNER JOIN Pedidos P
    ON F.CodigoFuncionario = P.CodigoFuncionario
WHERE P.DataPedido = '1997-05-01';
GO

-- 8
SELECT P.NumeroPedido, C.NomeEmpresa
FROM Pedidos P
INNER JOIN Clientes C
    ON P.CodigoCliente = C.CodigoCliente
WHERE MONTH(P.DataPedido) = 5
  AND YEAR(P.DataPedido) = 1997;
GO
