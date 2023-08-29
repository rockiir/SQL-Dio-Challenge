-- Criação do Banco de Dados
CREATE DATABASE EcommerceDB;

-- Utilização do Banco de Dados
USE EcommerceDB;

-- Tabela Cliente
CREATE TABLE Cliente (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Tipo VARCHAR(2),
    CPF VARCHAR(14),
    CNPJ VARCHAR(18)
);

-- Tabela Forma de Pagamento
CREATE TABLE FormaPagamento (
    ID INT PRIMARY KEY,
    Descricao VARCHAR(50)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    ID INT PRIMARY KEY,
    DataPedido DATE,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID)
);

-- Tabela Item do Pedido
CREATE TABLE ItemPedido (
    ID INT PRIMARY KEY,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(ID),
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ID)
);

-- Tabela Produto
CREATE TABLE Produto (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao TEXT,
    Preco DECIMAL(10, 2),
    Estoque INT,
    FornecedorID INT,
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedor(ID)
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100)
);

-- Tabela Estoque
CREATE TABLE Estoque (
    ProdutoID INT PRIMARY KEY,
    Quantidade INT,
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ID)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    ID INT PRIMARY KEY,
    PedidoID INT,
    Status VARCHAR(50),
    CodigoRastreio VARCHAR(20),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(ID)
);
