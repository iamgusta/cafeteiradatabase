-- Cria uma visão chamada 'viewclientes' que seleciona o nome e o endereço dos clientes
CREATE VIEW viewclientes AS
SELECT nome, endereço 
FROM clientes;

-- Seleciona todos os registros da visão 'viewclientes'
SELECT * FROM viewclientes;

-- Cria uma visão chamada 'ViewValorTotalPedido' que calcula o valor total de cada pedido
CREATE VIEW ViewValorTotalPedido AS
SELECT 
  p.id_pedidos,                                   -- Seleciona o identificador único do pedido
  c.nome,                                         -- Seleciona o nome do cliente
  p.datahora,                                     -- Seleciona a data do pedido
  SUM(ip.quantidade * ip.precounitario) AS ValorTotalPedido  -- Calcula o valor total do pedido
FROM clientes c
JOIN pedidos p ON c.id_clientes = p.idcliente    -- Junta a tabela de clientes com a tabela de pedidos
JOIN itenspedidos ip ON p.id_pedidos = ip.idpedidos  -- Junta a tabela de pedidos com a tabela de itens de pedidos
GROUP BY p.id_pedidos, c.nome, p.datahora;       -- Agrupa os resultados pelo ID do pedido, nome do cliente e data do pedido

-- Seleciona todos os registros da visão 'ViewValorTotalPedido'
SELECT * FROM ViewValorTotalPedido;


-- Cria uma visão chamada 'ViewEstoqueBaixo' que mostra os produtos com estoque abaixo de 10 unidades
CREATE VIEW ViewEstoqueBaixo AS
SELECT 
  nomeproduto, 
  quantidadeemestoque, 
  precounitario 
FROM produtos
WHERE quantidadeemestoque < 10;  -- Filtra apenas os produtos com menos de 10 unidades no estoque

-- Consulta os produtos com estoque baixo
SELECT * FROM ViewEstoqueBaixo;

-- Cria uma visão chamada 'ViewPedidosColaboradores' que exibe os pedidos com os colaboradores responsáveis
CREATE VIEW ViewPedidosColaboradores AS
SELECT 
  p.id_pedidos,
  c.nome AS nome_cliente,
  col.nome AS nome_colaborador,
  p.datahora
FROM pedidos p
JOIN clientes c ON p.idcliente = c.id_clientes          -- Junta pedidos com clientes
JOIN colaboradores col ON p.idcolaborador = col.id_colaboradores;  -- Junta pedidos com colaboradores

-- Consulta os pedidos com seus respectivos colaboradores
SELECT * FROM ViewPedidosColaboradores;



-- Cria uma visão chamada 'ViewItensPedidoDetalhado' que mostra os itens de todos os pedidos com detalhes
CREATE VIEW ViewItensPedidoDetalhado AS
SELECT 
  p.id_pedidos,
  c.nome AS nome_cliente,
  prod.nomeproduto,
  ip.quantidade,
  ip.precounitario,
  (ip.quantidade * ip.precounitario) AS subtotal
FROM itenspedidos ip
JOIN pedidos p ON ip.idpedidos = p.id_pedidos
JOIN clientes c ON p.idcliente = c.id_clientes
JOIN produtos prod ON ip.idproduto = prod.id_produtos;

-- Consulta os itens de pedidos com detalhes
SELECT * FROM ViewItensPedidoDetalhado;


-- Cria uma visão chamada 'ViewProdutosFornecedores' que mostra os produtos junto com seus fornecedores
CREATE VIEW ViewProdutosFornecedores AS
SELECT 
  prod.nomeproduto,
  prod.precounitario,
  f.nome AS nome_fornecedor,
  f.cidade
FROM produtos prod
JOIN fornecedores f ON prod.idfornecedor = f.id_fornecedores;

-- Consulta os produtos e seus respectivos fornecedores
SELECT * FROM ViewProdutosFornecedores;

CREATE VIEW FaturamentoDiario AS
SELECT 
    DATE(data_pedido) AS Dia,
    SUM(valor_total) AS Faturamento
FROM pedidos
GROUP BY Dia;



