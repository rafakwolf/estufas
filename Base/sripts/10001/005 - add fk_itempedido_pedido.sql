alter table ITEMPEDIDO
add constraint FK_ITEMPEDIDO_PEDIDO
foreign key (CODPEDIDO)
references PEDIDO(CODPEDIDO)
on delete CASCADE
using index FK_ITEMPEDIDO_PEDIDO;
