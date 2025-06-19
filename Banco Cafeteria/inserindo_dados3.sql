-- Observações:Cada pedido pode ter vários itens (relacionamento 1:N entre Pedidos e ItensPedidos)
-- O preço unitário pode refletir descontos ou promoções específicas do momento da venda
-- Esses dados são úteis para cálculos de faturamento, estoque e relatórios de vendas detalhados
-- Múltiplos registros na tabela ItensPedidos
-- Cada linha representa um item específico dentro de um pedido, permitindo múltimos produtos por pedid

SELECT * from itenspedidos;
INSERT INTO itenspedidos (idPedidos,idprodutos,Quantidade,PrecoUnitario) VALUES 
 ('1','5','1','2.00'), 
 ('1','2','2','7.00'), 
 ('2','12','3','13.50'), 
 ('3','8','1','8.00'), 
 ('3','20','1','4.00'), 
 ('3','15','2','22.00'), 
 ('4','6','1','2.00'), 
 ('4','10','4','20.00'), 
 ('5','19','1','10.00'), 
 ('6','25','1','5.00'), 
 ('6','1','2','5.00'), 
 ('7','18','3','7.50'), 
 ('8','27','1','4.50'), 
 ('8','21','2','13.00'), 
 ('9','9','1','9.00'), 
 ('9','13','1','7.00'), 
 ('9','4','2','9.00'), 
 ('10','14','1','6.00'), 
 ('10','3','3','12.00'), 
 ('11','7','1','7.50'), 
 ('11','28','2','7.00'), 
 ('12','11','4','14.00'), 
 ('13','22','1','3.00'), 
 ('13','30','1','8.00'), 