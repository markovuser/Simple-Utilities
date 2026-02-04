object Form1: TForm1
  Left = 600
  Top = 250
  Caption = 'File EnCrypt DeCrypt'
  ClientHeight = 511
  ClientWidth = 684
  Color = clBtnFace
  Constraints.MinHeight = 550
  Constraints.MinWidth = 700
  Font.Charset = OEM_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  PopupMenu = PopupMenuGeneral
  Position = poDesigned
  PrintScale = poPrintToFit
  SnapBuffer = 0
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 492
    Width = 684
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object TabControl2: TTabControl
    Left = 184
    Top = 32
    Width = 500
    Height = 425
    Align = alClient
    TabOrder = 2
    object ListViewEnCrypt: TListView
      Left = 4
      Top = 6
      Width = 492
      Height = 415
      Align = alClient
      Columns = <
        item
          AutoSize = True
          Caption = #1048#1084#1103
          MinWidth = 100
        end
        item
          AutoSize = True
          Caption = #1055#1091#1090#1100
          MinWidth = 100
        end
        item
          Caption = #1058#1080#1087
          MinWidth = 100
          Width = 180
        end
        item
          Caption = #1056#1072#1079#1084#1077#1088
          MinWidth = 100
          Width = 100
        end>
      DoubleBuffered = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      ParentDoubleBuffered = False
      PopupMenu = PopupMenuEnCrypt
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ListViewEnCryptClick
      OnSelectItem = ListViewEnCryptSelectItem
    end
  end
  object TabControl3: TTabControl
    Left = 0
    Top = 32
    Width = 184
    Height = 425
    Align = alLeft
    TabOrder = 1
    object CheckBoxShowPass: TCheckBox
      Left = 14
      Top = 122
      Width = 156
      Height = 17
      Cursor = crHandPoint
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
      TabOrder = 2
      OnClick = CheckBoxShowPassClick
    end
    object GroupBoxEnCrypt1: TGroupBox
      Left = 4
      Top = 6
      Width = 176
      Height = 55
      Align = alTop
      Caption = #1055#1072#1088#1086#1083#1100
      TabOrder = 0
      object EditPass: TEdit
        Left = 10
        Top = 20
        Width = 156
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBoxEnCrypt2: TGroupBox
      Left = 4
      Top = 61
      Width = 176
      Height = 55
      Align = alTop
      Caption = #1055#1086#1074#1090#1086#1088
      TabOrder = 1
      object EditRepeatPass: TEdit
        Left = 10
        Top = 20
        Width = 156
        Height = 21
        TabOrder = 0
      end
    end
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 684
    Height = 32
    Align = alTop
    TabOrder = 0
    object SpeedButton_GeneralMenu: TSpeedButton
      Left = 658
      Top = 6
      Width = 22
      Height = 22
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Caption = #8801
      Flat = True
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = SpeedButton_GeneralMenuClick
      ExplicitLeft = 657
      ExplicitTop = 5
    end
  end
  object TabControl4: TTabControl
    Left = 0
    Top = 457
    Width = 684
    Height = 35
    Align = alBottom
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    DesignSize = (
      684
      35)
    object ButtonEnCrypt: TButton
      Left = 4
      Top = 6
      Width = 95
      Height = 25
      Cursor = crHandPoint
      Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
      DoubleBuffered = True
      Enabled = False
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = ButtonEnCryptClick
    end
    object ButtonDeCrypt: TButton
      Left = 585
      Top = 6
      Width = 95
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
      Enabled = False
      TabOrder = 1
      OnClick = ButtonDeCryptClick
    end
  end
  object OpenDialogAddFile: TOpenDialog
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083' '#1076#1083#1103' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103
    Left = 416
    Top = 144
  end
  object PopupMenuEnCrypt: TPopupMenu
    OnPopup = PopupMenuEnCryptPopup
    Left = 448
    Top = 216
    object AddFileMenu: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083
      ImageIndex = 47
      ShortCut = 16462
      OnClick = AddFileMenuClick
    end
    object OpenFolderMenu: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091
      ImageIndex = 53
      ShortCut = 16463
      OnClick = OpenFolderMenuClick
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object EnCryptMenu: TMenuItem
      Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
      ImageIndex = 45
      OnClick = EnCryptMenuClick
    end
    object DeCryptMenu: TMenuItem
      Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
      ImageIndex = 64
      OnClick = DeCryptMenuClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object ClearListMenu: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 70
      ShortCut = 8238
      OnClick = ClearListMenuClick
    end
    object DeleteItemMenu: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 46
      ShortCut = 46
      OnClick = DeleteItemMenuClick
    end
  end
  object PopupMenuGeneral: TPopupMenu
    Alignment = paRight
    AutoPopup = False
    Left = 584
    Top = 144
  end
  object PopupMenuLanguage: TPopupMenu
    Left = 272
    Top = 214
    object LangError: TMenuItem
      Caption = #1054#1096#1080#1073#1082#1072'!'
    end
    object LangNoPass: TMenuItem
      Caption = #1053#1077' '#1074#1074#1077#1076#1077#1085' '#1087#1072#1088#1086#1083#1100
    end
    object LangRepeatPass: TMenuItem
      Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
    end
    object LangIncorrectPass: TMenuItem
      Caption = #1055#1072#1088#1086#1083#1100' '#1074#1074#1077#1076#1077#1085' '#1085#1077' '#1074#1077#1088#1085#1086'!'
    end
    object LangAddFile: TMenuItem
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083
    end
    object LangFileEncrypted: TMenuItem
      Caption = #1060#1072#1081#1083' '#1047#1072#1096#1080#1092#1088#1086#1074#1072#1085
    end
    object LangFileDecrypted: TMenuItem
      Caption = #1060#1072#1081#1083' '#1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1085
    end
    object LangOnlyWindows: TMenuItem
      Caption = #1069#1090#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1089#1086#1074#1084#1077#1089#1090#1080#1084#1072' '#1090#1086#1083#1100#1082#1086' '#1089' Windows 10 '#1080' Windows 11.'
    end
  end
end
