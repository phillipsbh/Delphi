object FLoginAutorizaQualidade: TFLoginAutorizaQualidade
  Left = 676
  Top = 275
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Inspe'#231#227'o de Qualidade'
  ClientHeight = 136
  ClientWidth = 205
  Color = 9729377
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 34
    Top = 14
    Width = 82
    Height = 13
    Caption = 'Reg. Inspetor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 36
    Top = 66
    Width = 41
    Height = 13
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdSenha: TEdit
    Left = 33
    Top = 80
    Width = 139
    Height = 26
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    OnKeyDown = EdSenhaKeyDown
  end
  object EdRegistro: TEdit
    Left = 33
    Top = 29
    Width = 139
    Height = 26
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyDown = EdRegistroKeyDown
    OnKeyPress = EdRegistroKeyPress
  end
end
