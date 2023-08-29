-- Criação do Banco de Dados
CREATE DATABASE OficinaDB;

-- Utilização do Banco de Dados
USE OficinaDB;

-- Tabela Cliente
CREATE TABLE Cliente (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(15),
    Endereco VARCHAR(200)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    ID INT PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Ano INT,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID)
);

-- Tabela Serviço
CREATE TABLE Servico (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(10, 2)
);

-- Tabela OrdemServico
CREATE TABLE OrdemServico (
    ID INT PRIMARY KEY,
    Data DATE,
    Status VARCHAR(50),
    ClienteID INT,
    VeiculoID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculo(ID)
);

-- Tabela ItemServico
CREATE TABLE ItemServico (
    ID INT PRIMARY KEY,
    OrdemServicoID INT,
    ServicoID INT,
    FOREIGN KEY (OrdemServicoID) REFERENCES OrdemServico(ID),
    FOREIGN KEY (ServicoID) REFERENCES Servico(ID)
);
