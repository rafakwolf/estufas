inherited DmPrincipal: TDmPrincipal
  OldCreateOrder = True
  Height = 135
  Width = 308
  inherited sqlcPrincipal: TPLSQLConnection
    BeforeConnect = sqlcPrincipalBeforeConnect
    Left = 80
    Top = 40
  end
end
