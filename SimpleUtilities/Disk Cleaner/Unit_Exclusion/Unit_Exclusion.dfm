object Form2: TForm2
  Left = 496
  Top = 169
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1080#1103
  ClientHeight = 186
  ClientWidth = 384
  Color = clBtnFace
  Constraints.MinHeight = 225
  Constraints.MinWidth = 400
  DoubleBuffered = True
  Font.Charset = OEM_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  SnapBuffer = 0
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 0
    Top = 151
    Width = 384
    Height = 35
    Align = alBottom
    TabOrder = 0
    object ButtonCancelException: TButton
      Left = 305
      Top = 6
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = ButtonCancelExceptionClick
    end
    object ButtonAddExceptions: TButton
      Left = 79
      Top = 6
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Align = alLeft
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 1
      OnClick = ButtonAddExceptionsClick
    end
    object ButtonChangeExceptions: TButton
      Left = 4
      Top = 6
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Align = alLeft
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = ButtonChangeExceptionsClick
    end
  end
  object TabControl2: TTabControl
    Left = 0
    Top = 0
    Width = 384
    Height = 151
    Align = alClient
    TabOrder = 1
    DesignSize = (
      384
      151)
    object LabelException: TLabel
      Left = 10
      Top = 60
      Width = 70
      Height = 225
      Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1080#1077': '
      Constraints.MinHeight = 225
    end
    object EditExceptions: TEdit
      Left = 10
      Top = 75
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = EditExceptionsChange
    end
  end
end
