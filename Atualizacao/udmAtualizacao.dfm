object DmAtualizacao: TDmAtualizacao
  OldCreateOrder = True
  Height = 249
  Width = 228
  object ibtTransac: TIBTransaction
    Left = 144
    Top = 56
  end
  object ibtbVersao: TIBTable
    Transaction = ibtTransac
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SISTEMA'
    UniDirectional = False
    Left = 56
    Top = 104
    object ibtbVersaoCODSISTEMA: TIntegerField
      FieldName = 'CODSISTEMA'
      Required = True
    end
    object ibtbVersaoVERSAO: TIBStringField
      FieldName = 'VERSAO'
      Size = 25
    end
  end
  object ibInfoConexao: TIBDatabaseInfo
    Left = 56
    Top = 160
  end
  object ibsScript: TIBScript
    Transaction = ibtTransac
    Terminator = ';'
    Left = 144
    Top = 112
  end
  object IBDbConexao: TIBDatabase
    ServerType = 'IBServer'
    Left = 48
    Top = 32
  end
end
