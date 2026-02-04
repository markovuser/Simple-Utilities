object Form2: TForm2
  Left = 0
  Top = 0
  Cursor = crHandPoint
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 411
  ClientWidth = 484
  Color = clBtnFace
  Constraints.MinHeight = 450
  Constraints.MinWidth = 500
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object TabControlButtons: TTabControl
    Left = 0
    Top = 376
    Width = 484
    Height = 35
    Align = alBottom
    TabOrder = 3
    object ButtonSave: TButton
      Left = 4
      Top = 6
      Width = 476
      Height = 25
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Ok'
      TabOrder = 0
      OnClick = ButtonSaveClick
    end
  end
  object TabControlTitle: TTabControl
    Left = 0
    Top = 0
    Width = 484
    Height = 70
    Align = alTop
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    DesignSize = (
      484
      70)
    object Image1: TImage
      Left = 4
      Top = 6
      Width = 476
      Height = 60
      Align = alClient
      Center = True
      ExplicitLeft = 101
      ExplicitTop = 7
      ExplicitWidth = 346
      ExplicitHeight = 70
    end
    object LabelInfo: TLabel
      Left = 382
      Top = 44
      Width = 90
      Height = 20
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '##########'
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 386
    end
  end
  object TabControlBodyLeft: TTabControl
    Left = 0
    Top = 70
    Width = 121
    Height = 306
    Align = alLeft
    TabOrder = 1
    object TreeViewOptions: TTreeView
      Left = 4
      Top = 6
      Width = 113
      Height = 296
      Align = alClient
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      HideSelection = False
      HotTrack = True
      Indent = 19
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      RowSelect = True
      ShowHint = False
      ShowLines = False
      ShowRoot = False
      TabOrder = 0
      OnClick = TreeViewOptionsClick
      Items.NodeData = {
        070100000009540054007200650065004E006F00640065002F00000000000000
        00000000FFFFFFFFFFFFFFFF0000000000000000000000000001081E0441043D
        043E0432043D044B043504}
    end
  end
  object TabControlBody: TTabControl
    Left = 121
    Top = 70
    Width = 363
    Height = 306
    Align = alClient
    TabOrder = 2
    object PageControlOptions: TPageControl
      Left = 4
      Top = 6
      Width = 355
      Height = 296
      Cursor = crHandPoint
      ActivePage = A0
      Align = alClient
      MultiLine = True
      TabHeight = 20
      TabOrder = 0
      TabPosition = tpBottom
      TabWidth = 20
      object A0: TTabSheet
        Caption = '0'
        ImageIndex = -1
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 347
          Height = 62
          Align = alTop
          Caption = #1042#1080#1076
          TabOrder = 0
          object WindowCenter: TCheckBox
            Left = 16
            Top = 24
            Width = 313
            Height = 17
            Cursor = crHandPoint
            Caption = #1043#1083#1072#1074#1085#1086#1077' '#1086#1082#1085#1086' '#1087#1086' '#1094#1077#1085#1090#1088#1091
            TabOrder = 0
          end
        end
      end
    end
  end
end
