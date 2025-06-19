-- Cria a tabela que armazena o faturamento total por dia
CREATE TABLE FaturamentoDiario (
    Dia DATE PRIMARY KEY,                     -- Data do faturamento (chave primária)
    FaturamentoTotal DECIMAL(10, 2) NOT NULL  -- Valor total faturado naquele dia
);

-- Insere os dados de faturamento diário calculando o total por data
INSERT INTO FaturamentoDiario (Dia, FaturamentoTotal)
SELECT 
    DATE(p.datahora) AS Dia,                                            -- Extrai apenas a data
    SUM(ip.quantidade * ip.precounitario) AS FaturamentoDiario         -- Soma o total de cada item (quantidade x preço)
FROM pedidos p
JOIN itenspedidos ip ON p.id_pedidos = ip.idpedidos                    -- Relaciona pedidos com seus itens
GROUP BY Dia
ORDER BY Dia;


-- Cria uma trigger que será executada após a inserção de um novo item de pedido
CREATE TRIGGER AtualizaFaturamentoDiario
AFTER INSERT ON itenspedidos
FOR EACH ROW
BEGIN
    -- Apaga os dados antigos da tabela de faturamento
    DELETE FROM FaturamentoDiario;

    -- Reinsere os dados atualizados do faturamento por dia
    INSERT INTO FaturamentoDiario (Dia, FaturamentoTotal)
    SELECT 
        DATE(p.datahora) AS Dia,
        SUM(ip.quantidade * ip.precounitario) AS FaturamentoDiario
    FROM pedidos p
    JOIN itenspedidos ip ON p.id_pedidos = ip.idpedidos
    GROUP BY Dia;
END
