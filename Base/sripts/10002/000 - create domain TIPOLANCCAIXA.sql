CREATE DOMAIN TIPOLANCCAIXA AS
CHAR(1) CHARACTER SET NONE
CHECK (VALUE IN ('C', 'D', 'T'))
