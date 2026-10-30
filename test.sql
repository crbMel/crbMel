USE Locadora;
GO

-- 1) Inserir clientes

INSERT INTO tbClientes
(CodCli, Nome, Endereco, Cidade, Sexo, DataNasc, CNH)
VALUES
(1,'José de Oliveira','Av. Jatobá','Jundiaí','M','1965-05-11','0009'),
(2,'Maria da Silva','Av. Presidente','Itatiba','F','1979-10-08','0008'),
(3,'Antonio Carlos','R. Florença','Jundiaí','M','1980-09-20','0007'),
(4,'Luisa de Souza','Av. Jequitibá','Jundiaí','F','1975-10-10','0005');
GO

-- 2) Inserir carros

SET IDENTITY_INSERT tbCarros ON;

INSERT INTO tbCarros
(CodCarro, Marca, Modelo, Placa, ValorDiaria, Categoria)
VALUES
(1,'Ford','Ka','AAA-0001',180.00,'Econômico'),
(2,'GM','Onix','AAA-0002',180.00,'Econômico'),
(3,'Honda','HRV','AAA-0003',270.00,'SUV'),
(4,'Jeep','Compass','AAA-0004',310.00,'SUV Média'),
(5,'VW','Jetta','AAA-0005',270.00,'Sedan'),
(6,'Fiat','Mobi','AAA-0006',130.00,'Compacto');

SET IDENTITY_INSERT tbCarros OFF;
GO

-- 3) Inserir aluguéis

SET IDENTITY_INSERT tbAluguel ON;

INSERT INTO tbAluguel
(CodAluguel, CodCli, CodCarro, DataRet, DataDev, ValorPago)
VALUES
(1,1,1,'2019-08-02','2019-08-07',900),
(2,2,3,'2019-08-12','2019-08-15',500),
(3,3,2,'2019-08-02','2019-08-07',900),
(4,4,5,'2019-08-12','2019-08-15',700);

SET IDENTITY_INSERT tbAluguel OFF;
GO

-- 4) Atualizar estado para SP

UPDATE tbClientes
SET Estado = 'SP';
GO

-- 5) Atualizar valor da diária do Compass para 350

UPDATE tbCarros
SET ValorDiaria = 350
WHERE Modelo = 'Compass';
GO

-- 6) Alterar cidade do cliente código 2

UPDATE tbClientes
SET Cidade = 'Vinhedo'
WHERE CodCli = 2;
GO

-- 7) Apagar o carro Mobi

DELETE FROM tbCarros
WHERE Modelo = 'Mobi';
GO

-- 8) Apagar os aluguéis do cliente código 3

DELETE FROM tbAluguel
WHERE CodCli = 3;
GO

-- 9) Apagar os aluguéis do carro código 2

DELETE FROM tbAluguel
WHERE CodCarro = 2;
GO

-- 10) Atualizar valor da diária em 7%

UPDATE tbCarros
SET ValorDiaria = ValorDiaria * 1.07;
GO
