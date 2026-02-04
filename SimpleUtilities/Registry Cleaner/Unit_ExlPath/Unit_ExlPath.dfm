object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1080#1103
  ClientHeight = 289
  ClientWidth = 420
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 13
  object TabControl4: TTabControl
    Left = 0
    Top = 254
    Width = 420
    Height = 35
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 4
      Top = 6
      Width = 412
      Height = 25
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Ok'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object TabOption: TTabControl
    Left = 0
    Top = 0
    Width = 420
    Height = 254
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 4
      Top = 6
      Width = 412
      Height = 244
      Align = alClient
      BiDiMode = bdLeftToRight
      MultiLine = True
      ParentBiDiMode = False
      TabOrder = 0
    end
    object ListView2: TListView
      Left = 4
      Top = 6
      Width = 412
      Height = 244
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          AutoSize = True
          Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1080#1103
          MinWidth = 200
        end
        item
          AutoSize = True
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          MinWidth = 200
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      PopupMenu = PopupMenu3
      TabOrder = 1
      ViewStyle = vsReport
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 400
    Top = 80
    object MenuItem4: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16467
      OnClick = MenuItem4Click
    end
    object N23: TMenuItem
      Caption = '-'
    end
    object MenuItem7: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077
      ShortCut = 8238
      OnClick = MenuItem7Click
    end
    object N15: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
      OnClick = N15Click
    end
  end
end
