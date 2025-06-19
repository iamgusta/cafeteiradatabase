-- unindo as duas tabelas e informaçoes 
SELECT nome, rua, bairro,cidade,  estado,cep FROM colaboradores
UNION ALL
SELECT nome, rua, bairro, cidade, estado,cep  FROM fornecedores;


--aqui estou procurando id do cliente
select idcliente from pedidos where datahora ='2023-01-02 08:15:00'

--aqui estou procurando o nome dessa pessoa com o id 10
select nome, telefone, endereço ,id_clientes from clientes where id_clientes = '10'

-- cliente que fizeram pedidos em janeiro
Select idcliente from pedidos WHERE strftime('%m', datahora) = '01'

-- cliente que fizeram pedidos em janeiro porem com ajuda do in e adicionando nome no select podemos saber todos os clientes
SELECT nome, id_clientes from clientes where id_clientes IN ( select idcliente from pedidos WHERE strftime('%m', datahora) = '01')


-- informaçoes sobre as outras tabelas 

select * from produtos;

-- seria a media de preço da tabela produtos
select avg(preço)from produtos

-- estou pegando todos os maiores valores da media preço
select nome, preço from produtos GROUP by nome, preço
HAVING preço >(select avg(preço)from produtos)

-- estou selecionando os dados da duas tabelas usando o inner join 
SELECT c.nome, p.id_pedidos, p.datahora from clientes c
INNER join pedidos p 
on c.id_clientes = p.idcliente 

-- esse select tem todas as informaçoes na tabela da direita porem apenas só as que correpondem na tabela da esquerda (então significa que se na tabela itenspedidos estiver fazia nada foi vendido na tabela produtos)
SELECT pr.nome, ip.idprodutos, ip.idpedidos FROM itenspedidos ip
RIGHT JOIN produtos pr 
on pr.id_produtos = ip.idprodutos;

-- esse select e para pesquisar quais produtos não foram vendidos no mes
SELECT pr.nome, x.idproduto, x.idpedido
FROM (
    SELECT ip.idpedidos,ip.idprodutos
    FROM pedidos p
    JOIN itenspedidos ip 
    ON p.id_pedidos = ip.idpedidos
    WHERE strftime('%m', p.datahora) = '10'
) x
RIGHT JOIN produtos pr
ON pr.id_produtos = x.idproduto;


-- Esse select mostra todos os clientes que nao fizeram pedidos 
SELECT c.nome, c.id_clientes
FROM clientes c
LEFT JOIN (
    SELECT p.id_pedidos, p.idcliente
    FROM pedidos p
    WHERE strftime('%m', p.datahora) = '10'
) x
ON c.id_clientes = x.idcliente
WHERE x.idcliente IS NULL;

-- Estou combinando os registros de duas tabelas para mostrar todo os dados, mesmo quando não há correspondência entre elas.
SELECT c.nome, p.id_pedidos
FROM clientes c
FULL JOIN pedidos p
ON c.id_clientes = p.idcliente
WHERE c.id_clientes IS NULL;


-- consulta unindo três tabelas com join para ter o valor total dos pedidos 
SELECT 
  p.id_pedidos AS id_pedido,
  c.nome AS nome_cliente,
  SUM(ip.precounitario * ip.quantidade) AS valor_total_pedido
FROM 
  clientes c
JOIN 
  pedidos p ON c.id_clientes = p.idcliente
JOIN 
  itenspedidos ip ON p.id_pedidos = ip.idpedidos
GROUP BY 
  p.id_pedidos, c.nome;











