update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'CODPEDIDO') and
(RDB$RELATION_NAME = 'ITEMPEDIDO');
