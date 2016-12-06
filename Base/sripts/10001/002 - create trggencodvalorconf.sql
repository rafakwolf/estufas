CREATE trigger TRGGENCODVALORCONFIGURACAO for VALORCONFIGURACAO
active before insert position 0
AS
begin
  if ((new.CODVALORCONFIGURACAO = 0)or(new.CODVALORCONFIGURACAO is null)) then
    new.CODVALORCONFIGURACAO = gen_id(GENCODVALORCONFIGURACAO,1);
end;
