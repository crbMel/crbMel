-- 1. Criar banco de dados
CREATE DATABASE Locadora;
GO

-- 2. Selecionar banco
USE Locadora;
GO

-- 3. Criar tabela Clientes
CREATE TABLE tbClientes (
    CodCli INT PRIMARY KEY,
    Nome VARCHAR(50),
    Endereco VARCHAR(50),
    Cidade VARCHAR(50),
    Sexo CHAR(1),
    DataNasc DATETIME,
    CNH VARCHAR(25),
    DataHabilitacao DATE
);
GO

-- 4. Criar tabela Carros
CREATE TABLE tbCarros (
    CodCarro INT IDENTITY(1,1) PRIMARY KEY,
    Marca VARCHAR(30),
    Modelo VARCHAR(30),
    Placa VARCHAR(8),
    ValorDiaria DECIMAL(10,2),
    Fornecedor VARCHAR(50)
);
GO

-- 5. Criar tabela Aluguel
CREATE TABLE tbAluguel (
    CodAluguel INT IDENTITY(1,1) PRIMARY KEY,
    CodCli INT,
    CodCarro INT,
    DataRet DATETIME,
    DataDev DATETIME,
    ValorPago DECIMAL(10,2),

    CONSTRAINT FK_Aluguel_Cliente
        FOREIGN KEY (CodCli)
        REFERENCES tbClientes(CodCli),

    CONSTRAINT FK_Aluguel_Carro
        FOREIGN KEY (CodCarro)
        REFERENCES tbCarros(CodCarro)
);
GO

-- 6. Adicionar campo Estado na tabela Clientes
ALTER TABLE tbClientes
ADD Estado CHAR(2);
GO

-- 7. Adicionar campo Categoria na tabela Carros
ALTER TABLE tbCarros
ADD Categoria VARCHAR(30);
GO

-- 8. Adicionar campo Cor na tabela Carros
ALTER TABLE tbCarros
ADD Cor VARCHAR(20);
GO

-- 9. Remover campo DataHabilitacao da tabela Clientes
ALTER TABLE tbClientes
DROP COLUMN DataHabilitacao;
GO

-- 10. Remover campo Fornecedor da tabela Carros
ALTER TABLE tbCarros
DROP COLUMN Fornecedor;
GO

-- 11. Excluir tabela Aluguel
DROP TABLE tbAluguel;
GO

-- 12. Excluir banco de dados Locadora
USE master;
GO

DROP DATABASE Locadora;
GO
