# Ecommerce - SQL - Desafio DIO

Este repositório contém a implementação do desafio de modelagem de banco de dados e consultas SQL proposto no contexto de um projeto de e-commerce. O desafio faz parte do curso da Digital Innovation One (DIO) e tem como objetivo aplicar conceitos de modelagem lógica de banco de dados e consultas SQL.

## Descrição do Projeto

O projeto consiste na criação de um banco de dados para um cenário de e-commerce, considerando clientes, produtos, pedidos, formas de pagamento, fornecedores, estoque e entregas. Além disso, são elaboradas consultas SQL para a realização de análises e extração de informações relevantes.

## Modelagem Lógica

A modelagem lógica do banco de dados envolve as seguintes entidades principais:

- **Cliente:** Armazena informações sobre clientes, tanto pessoas físicas quanto jurídicas, incluindo nome, tipo (PF ou PJ), CPF (opcional) e CNPJ (opcional).

- **Produto:** Contém detalhes dos produtos disponíveis para venda, como nome, descrição, preço, estoque e fornecedor.

- **Pedido:** Registra os pedidos realizados pelos clientes, incluindo data, cliente e produtos relacionados.

- **Forma de Pagamento:** Representa as diferentes formas de pagamento disponíveis.

- **Fornecedor:** Armazena informações sobre os fornecedores dos produtos.

- **Item do Pedido:** Detalha os produtos incluídos em cada pedido, com informações como quantidade e preço unitário.

- **Estoque:** Mantém o registro da quantidade de produtos em estoque.

- **Entrega:** Registra informações sobre as entregas dos pedidos, incluindo status e código de rastreio.



![Diagrama.png](D:\Git%20Repositorios\SQL-Dio-Challenge\Diagrama.png)

## Consultas SQL

Foram desenvolvidas consultas SQL para realizar análises e obter informações úteis a partir do banco de dados. As consultas abordam tópicos como recuperação de dados, filtragem, ordenação, agregação e junção de tabelas.

## Perguntas

- Quantos pedidos foram feitos por cada cliente?

`SELECT c.Nome AS Cliente, COUNT(p.ID) AS TotalPedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.ID = p.ClienteID
GROUP BY c.Nome;`



![](D:\Git%20Repositorios\SQL-Dio-Challenge\img\1.png)

- Algum vendedor também é fornecedor?

`SELECT Nome
FROM Fornecedor
WHERE ID IN (
    SELECT FornecedorID
    FROM Produto
);`

![](D:\Git%20Repositorios\SQL-Dio-Challenge\img\2.png)



- Relação de produtos fornecedores e estoques;

`SELECT p.Nome AS Produto, f.Nome AS Fornecedor, e.Quantidade AS Estoque
FROM Produto p
INNER JOIN Fornecedor f ON p.FornecedorID = f.ID
INNER JOIN Estoque e ON p.ID = e.ProdutoID;`

![](D:\Git%20Repositorios\SQL-Dio-Challenge\img\3.png)



- Relação de nomes dos fornecedores e nomes dos produtos;

`SELECT f.Nome AS Fornecedor, GROUP_CONCAT(p.Nome) AS Produtos
FROM Fornecedor f
INNER JOIN Produto p ON f.ID = p.FornecedorID
GROUP BY f.Nome;`

![](D:\Git%20Repositorios\SQL-Dio-Challenge\img\4.png)



## Autor

Raquel Matos

## Referências

- [Digital Innovation One](https://digitalinnovation.one/)
