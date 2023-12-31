## Esquema Conceitual

O esquema conceitual representa as principais entidades e seus relacionamentos no contexto de uma oficina:

- **Cliente**: Armazena informações sobre os clientes da oficina, como nome, telefone e endereço.
- **Veículo**: Registra detalhes sobre os veículos dos clientes, como marca, modelo e ano.
- **Serviço**: Descreve os serviços oferecidos pela oficina, incluindo nome e preço.
- **Ordem de Serviço**: Associa um cliente e um veículo a um ou mais serviços prestados, com informações sobre a data e o status da ordem.

## Esquema Lógico

Com base no esquema conceitual, podemos criar o esquema lógico usando o modelo relacional:

- **Tabela Cliente**:
  
  - ID (Primary Key)
  - Nome
  - Telefone
  - Endereço

- **Tabela Veículo**:
  
  - ID (Primary Key)
  - Marca
  - Modelo
  - Ano
  - ClienteID (Foreign Key para Cliente)

- **Tabela Serviço**:
  
  - ID (Primary Key)
  - Nome
  - Preço

- **Tabela OrdemServico**:
  
  - ID (Primary Key)
  - Data
  - Status
  - ClienteID (Foreign Key para Cliente)
  - VeiculoID (Foreign Key para Veículo)

- **Tabela ItemServico**:
  
  - ID (Primary Key)
  - OrdemServicoID (Foreign Key para OrdemServico)
  - ServicoID (Foreign Key para Serviço)

![oficina.png](https://github.com/rockiir/SQL-Dio-Challenge/blob/main/oficina.png)



## Querys

Recuperação simples de clientes e seus veículos:

`SELECT c.Nome AS Cliente, v.Marca, v.Modelo
FROM Cliente c
INNER JOIN Veiculo v ON c.ID = v.ClienteID;`

![](https://github.com/rockiir/SQL-Dio-Challenge/blob/main/img/5.png)

Filtragem de ordens de serviço em andamento:

`SELECT os.ID, os.Data, os.Status, c.Nome AS Cliente
FROM OrdemServico os
INNER JOIN Cliente c ON os.ClienteID = c.ID
WHERE os.Status = 'Em Andamento';`

![](https://github.com/rockiir/SQL-Dio-Challenge/blob/main/img/6.png)

Expressão para calcular o valor total de uma ordem de serviço:

`SELECT os.ID, SUM(s.Preco) AS ValorTotal
FROM OrdemServico os
INNER JOIN ItemServico it ON os.ID = it.OrdemServicoID
INNER JOIN Servico s ON it.ServicoID = s.ID
GROUP BY os.ID;`

![](https://github.com/rockiir/SQL-Dio-Challenge/blob/main/img/7.png)

Ordenação de clientes por nome:

`SELECT * FROM Cliente
ORDER BY Nome;`

![](https://github.com/rockiir/SQL-Dio-Challenge/blob/main/img/8.png)



Condição de filtro em um grupo de serviços:

`SELECT os.ID, os.Data, os.Status, c.Nome AS Cliente
FROM OrdemServico os
INNER JOIN Cliente c ON os.ClienteID = c.ID
INNER JOIN ItemServico it ON os.ID = it.OrdemServicoID
INNER JOIN Servico s ON it.ServicoID = s.ID
GROUP BY os.ID
HAVING SUM(s.Preco) > 10;

![](https://github.com/rockiir/SQL-Dio-Challenge/blob/main/img/9.png)


















