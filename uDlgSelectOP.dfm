object frmDlgSelectOP: TfrmDlgSelectOP
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Selecione OP'
  ClientHeight = 122
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 63
    Width = 96
    Height = 15
    Caption = 'Data Registro OP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 162
    Top = 63
    Width = 171
    Height = 15
    Caption = 'Ordem de Produ'#231#227'o - Relat'#243'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cbListaOP: TComboBox
    Left = 162
    Top = 78
    Width = 183
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 17
    ParentFont = False
    TabOrder = 0
  end
  object bitOK: TBitBtn
    Left = 358
    Top = 76
    Width = 102
    Height = 29
    Caption = 'Aplicar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = bitOKClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
  object dtpDataRegOP: TDateTimePicker
    Left = 18
    Top = 78
    Width = 129
    Height = 24
    Date = 42458.481294456020000000
    Time = 42458.481294456020000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = dtpDataRegOPChange
  end
  object rgMotivo: TRadioGroup
    Left = 18
    Top = 8
    Width = 442
    Height = 44
    Columns = 3
    Items.Strings = (
      'Libera'#231#227'o Setup '
      'Medi'#231#227'o Final'
      'Retomada de Trabalho')
    TabOrder = 3
  end
end
