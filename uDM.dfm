object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 425
  Width = 555
  object DB_SDBConvert: TADOConnection
    CommandTimeout = 50
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=komax;Persist Security Info=True;Us' +
      'er ID=komax;Initial Catalog=SDBConvert;Data Source=172.18.148.14' +
      '\INST_001;Use Procedure for Prepare=1;Auto Translate=True;Packet' +
      ' Size=4096;Workstation ID=komaxsystem;Use Encryption for Data=Fa' +
      'lse;Tag with column collation when possible=False'
    IsolationLevel = ilReadUncommitted
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object adoTBL_DADOS_CORTE: TADOTable
    Connection = DB_SDBConvert
    CursorType = ctStatic
    TableName = 'Dados_Relat_Corte'
    Left = 80
    Top = 72
    object adoTBL_DADOS_CORTEID_REGISTRO: TAutoIncField
      FieldName = 'ID_REGISTRO'
      ReadOnly = True
    end
    object adoTBL_DADOS_CORTEOrderID: TIntegerField
      FieldName = 'OrderID'
    end
    object adoTBL_DADOS_CORTECOMPR_OBTIDO: TIntegerField
      FieldName = 'COMPR_OBTIDO'
    end
    object adoTBL_DADOS_CORTENF_CABO: TStringField
      FieldName = 'NF_CABO'
      Size = 15
    end
    object adoTBL_DADOS_CORTECOD_MA_A: TStringField
      FieldName = 'COD_MA_A'
      Size = 10
    end
    object adoTBL_DADOS_CORTENF_TERM_A: TStringField
      FieldName = 'NF_TERM_A'
      Size = 15
    end
    object adoTBL_DADOS_CORTEALT_COND_A_OBTIDO: TStringField
      FieldName = 'ALT_COND_A_OBTIDO'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_ISOL_A_OBTIDO: TStringField
      FieldName = 'ALT_ISOL_A_OBTIDO'
      Size = 10
    end
    object adoTBL_DADOS_CORTEFORCA_TRACAO_A_OBTIDO: TStringField
      FieldName = 'FORCA_TRACAO_A_OBTIDO'
      Size = 10
    end
    object adoTBL_DADOS_CORTECOD_MA_B: TStringField
      FieldName = 'COD_MA_B'
      Size = 10
    end
    object adoTBL_DADOS_CORTENF_TERM_B: TStringField
      FieldName = 'NF_TERM_B'
      Size = 15
    end
    object adoTBL_DADOS_CORTEALT_COND_B_OBTIDO: TStringField
      FieldName = 'ALT_COND_B_OBTIDO'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_ISOL_B_OBTIDO: TStringField
      FieldName = 'ALT_ISOL_B_OBTIDO'
      Size = 10
    end
    object adoTBL_DADOS_CORTEFORCA_TRACAO_B_OBTIDO: TStringField
      FieldName = 'FORCA_TRACAO_B_OBTIDO'
      Size = 10
    end
    object adoTBL_DADOS_CORTEMaquina_Corte: TStringField
      FieldName = 'Maquina_Corte'
      Size = 10
    end
    object adoTBL_DADOS_CORTEDATA_RELATORIO: TDateTimeField
      FieldName = 'DATA_RELATORIO'
    end
    object adoTBL_DADOS_CORTELIBERA_SETUP_QUALIDADE: TStringField
      FieldName = 'LIBERA_SETUP_QUALIDADE'
      Size = 10
    end
    object adoTBL_DADOS_CORTEREGISTRO_OPERADOR: TStringField
      FieldName = 'REGISTRO_OPERADOR'
      Size = 10
    end
    object adoTBL_DADOS_CORTETRACAO_RETOMA_TRAB_A: TStringField
      FieldName = 'TRACAO_RETOMA_TRAB_A'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_COND_RETOMA_TRAB_A: TStringField
      FieldName = 'ALT_COND_RETOMA_TRAB_A'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_COND_RETOMA_TRAB_B: TStringField
      FieldName = 'ALT_COND_RETOMA_TRAB_B'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_ISOL_RETOMA_TRAB_A: TStringField
      FieldName = 'ALT_ISOL_RETOMA_TRAB_A'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_ISOL_RETOMA_TRAB_B: TStringField
      FieldName = 'ALT_ISOL_RETOMA_TRAB_B'
      Size = 10
    end
    object adoTBL_DADOS_CORTETRACAO_RETOMA_TRAB_B: TStringField
      FieldName = 'TRACAO_RETOMA_TRAB_B'
      Size = 10
    end
    object adoTBL_DADOS_CORTETRACAO_A_QUALIDADE: TStringField
      FieldName = 'TRACAO_A_QUALIDADE'
      Size = 10
    end
    object adoTBL_DADOS_CORTETRACAO_B_QUALIDADE: TStringField
      FieldName = 'TRACAO_B_QUALIDADE'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_COND_A_QUALIDADE: TStringField
      FieldName = 'ALT_COND_A_QUALIDADE'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_COND_B_QUALIDADE: TStringField
      FieldName = 'ALT_COND_B_QUALIDADE'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_ISOL_A_QUALIDADE: TStringField
      FieldName = 'ALT_ISOL_A_QUALIDADE'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_ISOL_B_QUALIDADE: TStringField
      FieldName = 'ALT_ISOL_B_QUALIDADE'
      Size = 10
    end
    object adoTBL_DADOS_CORTEREGISTRO_INSP_QUALIDADE: TStringField
      FieldName = 'REGISTRO_INSP_QUALIDADE'
      Size = 10
    end
    object adoTBL_DADOS_CORTEOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 100
    end
    object adoTBL_DADOS_CORTEF_INPUT: TStringField
      FieldName = 'F_INPUT'
      FixedChar = True
      Size = 2
    end
    object adoTBL_DADOS_CORTEALT_COND_A_INICIAL: TStringField
      FieldName = 'ALT_COND_A_INICIAL'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_ISOL_A_INICIAL: TStringField
      FieldName = 'ALT_ISOL_A_INICIAL'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_ISOL_B_INICIAL: TStringField
      FieldName = 'ALT_ISOL_B_INICIAL'
      Size = 10
    end
    object adoTBL_DADOS_CORTEALT_COND_B_INICIAL: TStringField
      FieldName = 'ALT_COND_B_INICIAL'
      Size = 10
    end
    object adoTBL_DADOS_CORTETRACAO_A_INICIAL: TStringField
      FieldName = 'TRACAO_A_INICIAL'
      Size = 10
    end
    object adoTBL_DADOS_CORTETRACAO_B_INICIAL: TStringField
      FieldName = 'TRACAO_B_INICIAL'
      Size = 10
    end
    object adoTBL_DADOS_CORTEOPS_AGRUPADAS: TStringField
      FieldName = 'OPS_AGRUPADAS'
      Size = 50
    end
    object adoTBL_DADOS_CORTEINPUT_OK: TStringField
      FieldName = 'INPUT_OK'
      FixedChar = True
      Size = 1
    end
    object adoTBL_DADOS_CORTEINPUT_OP_LINK: TIntegerField
      FieldName = 'INPUT_OP_LINK'
    end
    object adoTBL_DADOS_CORTENOTA_MEDICAO: TStringField
      FieldName = 'NOTA_MEDICAO'
      Size = 100
    end
    object adoTBL_DADOS_CORTECOMPR_CABO_INICIAL: TStringField
      FieldName = 'COMPR_CABO_INICIAL'
      Size = 10
    end
    object adoTBL_DADOS_CORTECIRCUITO: TStringField
      FieldName = 'CIRCUITO'
      Size = 40
    end
    object adoTBL_DADOS_CORTECABO: TStringField
      FieldName = 'CABO'
      Size = 30
    end
  end
  object DB_TopNet: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=komax;Persist Security Info=True;Us' +
      'er ID=komax;Initial Catalog=KomaxTopSuite;Data Source=172.18.148' +
      '.14\INST_001;Use Procedure for Prepare=1;Auto Translate=True;Pac' +
      'ket Size=4096;Workstation ID=komaxsystem;Use Encryption for Data' +
      '=False;Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 220
  end
  object adoQyFixOPStarted: TADOQuery
    Connection = DB_TopNet
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pMaq'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      ' select o.UserId "OP",p.UserId "Circuito" '
      
        '  from ProductionJob pj,OrderProductionPosition opp,[Order] o,Pr' +
        'oduct p, Client c'
      'with (nolock)'
      
        'where pj.ProductionJobNo = opp.ProductionJobNo and o.OrderNo = o' +
        'pp.OrderNo'
      '  and c.ClientNo = pj.MachineNo'
      '  and p.ProductNo = pj.ProductNo'
      '  and  c.ClientName =:pMaq and pj.started = 1 and pj.sent = 1'
      ' and (pj.PiecesGood < pj.TotalPieces or pj.PiecesGood = 0  )'
      'order by convert(int ,pj.priority)')
    Left = 112
    Top = 220
    object adoQyFixOPStartedOP: TStringField
      FieldName = 'OP'
      Size = 25
    end
    object adoQyFixOPStartedCircuito: TStringField
      FieldName = 'Circuito'
      Size = 25
    end
  end
  object adoQyFixOPFinished: TADOQuery
    Connection = DB_TopNet
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pOrdem'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end>
    SQL.Strings = (
      
        ' select count(*) CNT from [Order] with (nolock) where UserId = :' +
        'pOrdem')
    Left = 128
    Top = 172
    object adoQyFixOPFinishedCNT: TIntegerField
      FieldName = 'CNT'
      ReadOnly = True
    end
  end
  object adoQyDadosRelat: TADOQuery
    Connection = DB_SDBConvert
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pOP'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from dados_relat_corte where OrderId = :pOP')
    Left = 264
    Top = 32
    object adoQyDadosRelatID_REGISTRO: TAutoIncField
      FieldName = 'ID_REGISTRO'
      ReadOnly = True
    end
    object adoQyDadosRelatOrderID: TIntegerField
      FieldName = 'OrderID'
    end
    object adoQyDadosRelatCOMPR_OBTIDO: TIntegerField
      FieldName = 'COMPR_OBTIDO'
    end
    object adoQyDadosRelatNF_CABO: TStringField
      FieldName = 'NF_CABO'
      Size = 15
    end
    object adoQyDadosRelatCOD_MA_A: TStringField
      FieldName = 'COD_MA_A'
      Size = 10
    end
    object adoQyDadosRelatNF_TERM_A: TStringField
      FieldName = 'NF_TERM_A'
      Size = 15
    end
    object adoQyDadosRelatALT_COND_A_OBTIDO: TStringField
      FieldName = 'ALT_COND_A_OBTIDO'
      Size = 10
    end
    object adoQyDadosRelatALT_ISOL_A_OBTIDO: TStringField
      FieldName = 'ALT_ISOL_A_OBTIDO'
      Size = 10
    end
    object adoQyDadosRelatFORCA_TRACAO_A_OBTIDO: TStringField
      FieldName = 'FORCA_TRACAO_A_OBTIDO'
      Size = 10
    end
    object adoQyDadosRelatCOD_MA_B: TStringField
      FieldName = 'COD_MA_B'
      Size = 10
    end
    object adoQyDadosRelatNF_TERM_B: TStringField
      FieldName = 'NF_TERM_B'
      Size = 15
    end
    object adoQyDadosRelatALT_COND_B_OBTIDO: TStringField
      FieldName = 'ALT_COND_B_OBTIDO'
      Size = 10
    end
    object adoQyDadosRelatALT_ISOL_B_OBTIDO: TStringField
      FieldName = 'ALT_ISOL_B_OBTIDO'
      Size = 10
    end
    object adoQyDadosRelatFORCA_TRACAO_B_OBTIDO: TStringField
      FieldName = 'FORCA_TRACAO_B_OBTIDO'
      Size = 10
    end
    object adoQyDadosRelatMaquina_Corte: TStringField
      FieldName = 'Maquina_Corte'
      Size = 10
    end
    object adoQyDadosRelatDATA_RELATORIO: TDateTimeField
      FieldName = 'DATA_RELATORIO'
    end
    object adoQyDadosRelatLIBERA_SETUP_QUALIDADE: TStringField
      FieldName = 'LIBERA_SETUP_QUALIDADE'
      Size = 10
    end
    object adoQyDadosRelatREGISTRO_OPERADOR: TStringField
      FieldName = 'REGISTRO_OPERADOR'
      Size = 10
    end
    object adoQyDadosRelatTRACAO_RETOMA_TRAB_A: TStringField
      FieldName = 'TRACAO_RETOMA_TRAB_A'
      Size = 10
    end
    object adoQyDadosRelatALT_COND_RETOMA_TRAB_A: TStringField
      FieldName = 'ALT_COND_RETOMA_TRAB_A'
      Size = 10
    end
    object adoQyDadosRelatALT_COND_RETOMA_TRAB_B: TStringField
      FieldName = 'ALT_COND_RETOMA_TRAB_B'
      Size = 10
    end
    object adoQyDadosRelatALT_ISOL_RETOMA_TRAB_A: TStringField
      FieldName = 'ALT_ISOL_RETOMA_TRAB_A'
      Size = 10
    end
    object adoQyDadosRelatALT_ISOL_RETOMA_TRAB_B: TStringField
      FieldName = 'ALT_ISOL_RETOMA_TRAB_B'
      Size = 10
    end
    object adoQyDadosRelatTRACAO_RETOMA_TRAB_B: TStringField
      FieldName = 'TRACAO_RETOMA_TRAB_B'
      Size = 10
    end
    object adoQyDadosRelatTRACAO_A_QUALIDADE: TStringField
      FieldName = 'TRACAO_A_QUALIDADE'
      Size = 10
    end
    object adoQyDadosRelatTRACAO_B_QUALIDADE: TStringField
      FieldName = 'TRACAO_B_QUALIDADE'
      Size = 10
    end
    object adoQyDadosRelatALT_COND_A_QUALIDADE: TStringField
      FieldName = 'ALT_COND_A_QUALIDADE'
      Size = 10
    end
    object adoQyDadosRelatALT_COND_B_QUALIDADE: TStringField
      FieldName = 'ALT_COND_B_QUALIDADE'
      Size = 10
    end
    object adoQyDadosRelatALT_ISOL_A_QUALIDADE: TStringField
      FieldName = 'ALT_ISOL_A_QUALIDADE'
      Size = 10
    end
    object adoQyDadosRelatALT_ISOL_B_QUALIDADE: TStringField
      FieldName = 'ALT_ISOL_B_QUALIDADE'
      Size = 10
    end
    object adoQyDadosRelatREGISTRO_INSP_QUALIDADE: TStringField
      FieldName = 'REGISTRO_INSP_QUALIDADE'
      Size = 10
    end
    object adoQyDadosRelatOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 100
    end
    object adoQyDadosRelatF_INPUT: TStringField
      FieldName = 'F_INPUT'
      FixedChar = True
      Size = 2
    end
    object adoQyDadosRelatALT_COND_A_INICIAL: TStringField
      FieldName = 'ALT_COND_A_INICIAL'
      Size = 10
    end
    object adoQyDadosRelatALT_ISOL_A_INICIAL: TStringField
      FieldName = 'ALT_ISOL_A_INICIAL'
      Size = 10
    end
    object adoQyDadosRelatALT_ISOL_B_INICIAL: TStringField
      FieldName = 'ALT_ISOL_B_INICIAL'
      Size = 10
    end
    object adoQyDadosRelatALT_COND_B_INICIAL: TStringField
      FieldName = 'ALT_COND_B_INICIAL'
      Size = 10
    end
    object adoQyDadosRelatTRACAO_A_INICIAL: TStringField
      FieldName = 'TRACAO_A_INICIAL'
      Size = 10
    end
    object adoQyDadosRelatTRACAO_B_INICIAL: TStringField
      FieldName = 'TRACAO_B_INICIAL'
      Size = 10
    end
    object adoQyDadosRelatOPS_AGRUPADAS: TStringField
      FieldName = 'OPS_AGRUPADAS'
      Size = 50
    end
    object adoQyDadosRelatINPUT_OK: TStringField
      FieldName = 'INPUT_OK'
      FixedChar = True
      Size = 1
    end
    object adoQyDadosRelatINPUT_OP_LINK: TIntegerField
      FieldName = 'INPUT_OP_LINK'
    end
  end
  object adoQySDBConvert1: TADOQuery
    Connection = DB_SDBConvert
    Parameters = <>
    Left = 160
    Top = 16
  end
  object adoQyConvertFunc: TADOQuery
    Connection = DB_SDBConvert
    Parameters = <>
    Left = 248
    Top = 104
  end
  object adoQyTopnetFunc: TADOQuery
    Connection = DB_TopNet
    Parameters = <>
    Left = 320
    Top = 184
  end
  object adoQyTopNextOP: TADOQuery
    Connection = DB_TopNet
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pMaq'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'select TOP(1)  o.UserId "OP",p.UserId "Circuito"'
      
        'from ProductionJob pj,OrderProductionPosition opp,[Order] o,Prod' +
        'uct p,Client c'
      
        'where pj.ProductionJobNo = opp.ProductionJobNo and o.OrderNo = o' +
        'pp.OrderNo'
      
        'and p.ProductNo = pj.ProductNo and pj.started = 1 and pj.sent = ' +
        '1'
      'and pj.MachineNo = c.ClientNo'
      'and ClientName =:pMaq'
      'order by pj.priority')
    Left = 216
    Top = 184
    object adoQyTopNextOPOP: TStringField
      FieldName = 'OP'
      Size = 25
    end
    object adoQyTopNextOPCircuito: TStringField
      FieldName = 'Circuito'
      Size = 25
    end
  end
  object adoQyConvertFunc2: TADOQuery
    Connection = DB_SDBConvert
    Parameters = <>
    Left = 376
    Top = 104
  end
  object adoQyGeral1: TADOQuery
    Connection = DB_SDBConvert
    Parameters = <>
    Left = 368
    Top = 16
  end
  object adoTBLControlOP: TADOTable
    Connection = DB_SDBConvert
    CursorType = ctStatic
    TableName = 'Dados_Medicao_SYMK'
    Left = 40
    Top = 128
    object adoTBLControlOPID_Control: TAutoIncField
      FieldName = 'ID_Control'
      ReadOnly = True
    end
    object adoTBLControlOPMaquinaCorte: TStringField
      FieldName = 'MaquinaCorte'
      Size = 12
    end
    object adoTBLControlOPDataOperacao: TDateTimeField
      FieldName = 'DataOperacao'
    end
    object adoTBLControlOPOp_Iniciada: TIntegerField
      FieldName = 'Op_Iniciada'
    end
    object adoTBLControlOPOp_Anterior: TIntegerField
      FieldName = 'Op_Anterior'
    end
    object adoTBLControlOPOp_Proxima: TIntegerField
      FieldName = 'Op_Proxima'
    end
    object adoTBLControlOPCircuito_Iniciado: TStringField
      FieldName = 'Circuito_Iniciado'
      Size = 30
    end
    object adoTBLControlOPCircuito_Proximo: TStringField
      FieldName = 'Circuito_Proximo'
      Size = 30
    end
    object adoTBLControlOPALT_COND_A_INICIAL: TStringField
      FieldName = 'ALT_COND_A_INICIAL'
      Size = 10
    end
    object adoTBLControlOPALT_COND_B_INICIAL: TStringField
      FieldName = 'ALT_COND_B_INICIAL'
      Size = 10
    end
    object adoTBLControlOPALT_ISOL_A_INICIAL: TStringField
      FieldName = 'ALT_ISOL_A_INICIAL'
      Size = 10
    end
    object adoTBLControlOPALT_ISOL_B_INICIAL: TStringField
      FieldName = 'ALT_ISOL_B_INICIAL'
      Size = 10
    end
    object adoTBLControlOPTRACAO_A_INICIAL: TStringField
      FieldName = 'TRACAO_A_INICIAL'
      Size = 10
    end
    object adoTBLControlOPTRACAO_B_INICIAL: TStringField
      FieldName = 'TRACAO_B_INICIAL'
      Size = 10
    end
    object adoTBLControlOPNF_TERM_A: TStringField
      FieldName = 'NF_TERM_A'
      Size = 10
    end
    object adoTBLControlOPNF_TERM_B: TStringField
      FieldName = 'NF_TERM_B'
      Size = 10
    end
    object adoTBLControlOPNF_CABO: TStringField
      FieldName = 'NF_CABO'
      Size = 10
    end
    object adoTBLControlOPCOMPR_CABO_INICIAL: TStringField
      FieldName = 'COMPR_CABO_INICIAL'
      Size = 10
    end
    object adoTBLControlOPNOTA_MEDICAO: TStringField
      FieldName = 'NOTA_MEDICAO'
      Size = 50
    end
  end
  object adoQyOPErr: TADOQuery
    Connection = DB_TopNet
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pMaq'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'pOP'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end>
    SQL.Strings = (
      'select count(*)cnt'
      
        'from ProductionJob pj,OrderProductionPosition opp,[Order] o,Prod' +
        'uct p,Client c'
      
        'where pj.ProductionJobNo = opp.ProductionJobNo and o.OrderNo = o' +
        'pp.OrderNo'
      'and p.ProductNo = pj.ProductNo and pj.sent=0'
      'and pj.MachineNo = c.ClientNo'
      'and ClientName =:pMaq and o.UserId =:pOP')
    Left = 248
    Top = 272
    object adoQyOPErrcnt: TIntegerField
      FieldName = 'cnt'
      ReadOnly = True
    end
  end
end
