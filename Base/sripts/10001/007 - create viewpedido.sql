CREATE VIEW VIEWPEDIDO(
    "_C�DIGO",
    "DATA DO PEDIDO",
    CLIENTE,
    "TOTAL DESC.",
    TOTAL)
AS
select P.CODPEDIDO, 
       P.DATAPEDIDO, 
       c.RAZAOSOCIAL,
       P.TOTALDESCONTO, 
       P.TOTAL
from PEDIDO P
join CLIENTE c on (c.CODCLIENTE = p.CODCLIENTE);