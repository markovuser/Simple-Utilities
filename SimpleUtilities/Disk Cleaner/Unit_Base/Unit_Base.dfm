object Form1: TForm1
  Left = 600
  Top = 250
  Caption = 'Disk Cleaner'
  ClientHeight = 511
  ClientWidth = 684
  Color = clBtnFace
  Constraints.MinHeight = 550
  Constraints.MinWidth = 700
  DoubleBuffered = True
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
  object PageControl: TPageControl
    Left = 108
    Top = 32
    Width = 576
    Height = 479
    ActivePage = TabSheet1
    Align = alClient
    DoubleBuffered = True
    HotTrack = True
    MultiLine = True
    OwnerDraw = True
    ParentDoubleBuffered = False
    RaggedRight = True
    TabHeight = 20
    TabOrder = 2
    TabPosition = tpBottom
    TabWidth = 100
    object TabSheet1: TTabSheet
      AlignWithMargins = True
      Caption = 'Clean'
      ImageIndex = -1
      OnShow = TabSheet1Show
      object TabControl6: TTabControl
        Left = 165
        Top = 0
        Width = 397
        Height = 386
        Align = alClient
        TabOrder = 1
        object ListViewDiskCleaner: TListView
          Left = 4
          Top = 6
          Width = 389
          Height = 359
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              Caption = #1060#1072#1081#1083#1099
              MinWidth = 250
              Width = 250
            end
            item
              Alignment = taRightJustify
              Caption = #1056#1072#1079#1084#1077#1088
              MinWidth = 70
              Width = 70
            end
            item
              Caption = #1058#1080#1087
              MinWidth = 120
              Width = 120
            end
            item
              Caption = #1048#1079#1084#1077#1085#1077#1085
              MinWidth = 150
              Width = 150
            end>
          DoubleBuffered = True
          ReadOnly = True
          RowSelect = True
          ParentDoubleBuffered = False
          PopupMenu = PopupMenuSearch
          TabOrder = 0
          ViewStyle = vsReport
          OnColumnClick = ListViewDiskCleanerColumnClick
          OnEditing = ListViewDiskCleanerEditing
        end
        object ProgressBarCleanDisk: TProgressBar
          Left = 4
          Top = 365
          Width = 389
          Height = 17
          Align = alBottom
          TabOrder = 1
        end
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 426
        Width = 562
        Height = 19
        Panels = <
          item
            Width = 200
          end>
      end
      object TabControl5: TTabControl
        Left = 0
        Top = 0
        Width = 165
        Height = 386
        Align = alLeft
        TabOrder = 0
        object CheckBoxRecycleBin: TCheckBox
          Left = 6
          Top = 88
          Width = 153
          Height = 20
          Cursor = crHandPoint
          Caption = #1059#1076#1072#1083#1103#1090#1100'  '#1074' '#1082#1086#1088#1079#1080#1085#1091
          TabOrder = 3
          WordWrap = True
          OnClick = CheckBoxRecycleBinClick
        end
        object CheckBoxProgress: TCheckBox
          Left = 6
          Top = 65
          Width = 153
          Height = 17
          Cursor = crHandPoint
          Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1088#1086#1075#1088#1077#1089#1089
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 1
        end
        object ComboBoxDrive: TComboBox
          Left = 6
          Top = 38
          Width = 153
          Height = 21
          Cursor = crHandPoint
          Style = csDropDownList
          TabOrder = 0
        end
        object HeaderControl: THeaderControl
          Left = 4
          Top = 6
          Width = 157
          Height = 24
          Enabled = False
          Sections = <
            item
              Alignment = taCenter
              ImageIndex = -1
              Text = #1054#1087#1094#1080#1080' '#1086#1095#1080#1089#1090#1082#1080
              Width = 165
            end>
        end
      end
      object TabControl4: TTabControl
        Left = 0
        Top = 386
        Width = 562
        Height = 40
        Align = alBottom
        TabOrder = 2
        object ButtonDelete: TButton
          Left = 443
          Top = 6
          Width = 115
          Height = 30
          Cursor = crHandPoint
          Align = alRight
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1077
          TabOrder = 1
          OnClick = ButtonDeleteClick
        end
        object ButtonSearch: TButton
          Left = 4
          Top = 6
          Width = 115
          Height = 30
          Cursor = crHandPoint
          Align = alLeft
          Caption = #1055#1086#1080#1089#1082
          TabOrder = 0
          OnClick = ButtonSearchClick
        end
      end
    end
    object TabSheet2: TTabSheet
      AlignWithMargins = True
      Caption = 'QuickClean'
      ImageIndex = -1
      OnShow = TabSheet2Show
      object StatusBar2: TStatusBar
        Left = 0
        Top = 426
        Width = 562
        Height = 19
        Panels = <
          item
            Width = 200
          end>
      end
      object TabControlOption: TTabControl
        Left = 0
        Top = 0
        Width = 165
        Height = 386
        Align = alLeft
        PopupMenu = PopupMenuQuickClean
        TabOrder = 0
        object HeaderControl3: THeaderControl
          Left = 4
          Top = 6
          Width = 157
          Height = 24
          Enabled = False
          Sections = <
            item
              Alignment = taCenter
              ImageIndex = -1
              Text = #1054#1087#1094#1080#1080' '#1086#1095#1080#1089#1090#1082#1080
              Width = 165
            end>
        end
        object CheckBoxTempWindows: TCheckBox
          Left = 4
          Top = 30
          Width = 157
          Height = 17
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Temp '#1092#1072#1081#1083#1099' Windows'
          TabOrder = 1
        end
        object CheckBoxTempAPP: TCheckBox
          Left = 4
          Top = 47
          Width = 157
          Height = 17
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Temp '#1092#1072#1081#1083#1099' '#1087#1088#1086#1075#1088#1072#1084#1084
          TabOrder = 2
        end
        object CheckBoxTrash: TCheckBox
          Left = 4
          Top = 81
          Width = 157
          Height = 17
          Cursor = crHandPoint
          Align = alTop
          Caption = #1050#1086#1088#1079#1080#1085#1072
          TabOrder = 4
        end
        object CheckBoxClipboard: TCheckBox
          Left = 4
          Top = 98
          Width = 157
          Height = 17
          Cursor = crHandPoint
          Align = alTop
          Caption = #1041#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
          TabOrder = 5
        end
        object CheckBoxWindowsLogs: TCheckBox
          Left = 4
          Top = 64
          Width = 157
          Height = 17
          Cursor = crHandPoint
          Align = alTop
          Caption = #1046#1091#1088#1085#1072#1083#1099' Windows'
          TabOrder = 3
        end
        object CheckBoxFontCache: TCheckBox
          Left = 4
          Top = 115
          Width = 157
          Height = 17
          Cursor = crHandPoint
          Align = alTop
          Caption = #1050#1101#1096' '#1096#1088#1080#1092#1090#1086#1074
          TabOrder = 6
        end
        object CheckBoxRegistry: TCheckBox
          Left = 4
          Top = 132
          Width = 157
          Height = 17
          Cursor = crHandPoint
          Align = alTop
          Caption = #1056#1077#1077#1089#1090#1088' Windows'
          TabOrder = 7
        end
      end
      object TabControl9: TTabControl
        Left = 165
        Top = 0
        Width = 397
        Height = 386
        Align = alClient
        TabOrder = 1
        object ListViewQuicSearch: TListView
          Left = 4
          Top = 6
          Width = 389
          Height = 359
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1080', '#1060#1072#1081#1083#1099
              MinWidth = 250
              Width = 250
            end
            item
              Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              MinWidth = 200
              Width = 200
            end
            item
              Alignment = taRightJustify
              Caption = #1056#1072#1079#1084#1077#1088
              MinWidth = 100
              Width = 100
            end
            item
              Alignment = taCenter
              Caption = #1069#1083#1077#1084#1077#1085#1090#1099
              MinWidth = 120
              Width = 120
            end>
          DoubleBuffered = True
          ReadOnly = True
          RowSelect = True
          ParentDoubleBuffered = False
          PopupMenu = PopupMenuQuicSearch
          ShowWorkAreas = True
          TabOrder = 0
          ViewStyle = vsReport
          OnClick = ListViewQuicSearchClick
          OnEditing = ListViewQuicSearchEditing
          OnSelectItem = ListViewQuicSearchSelectItem
        end
        object ProgressBarQuickClean: TProgressBar
          Left = 4
          Top = 365
          Width = 389
          Height = 17
          Align = alBottom
          TabOrder = 1
        end
      end
      object TabControl3: TTabControl
        Left = 0
        Top = 386
        Width = 562
        Height = 40
        Align = alBottom
        TabOrder = 2
        object ButtonQuickDelete: TButton
          Left = 443
          Top = 6
          Width = 115
          Height = 30
          Cursor = crHandPoint
          Align = alRight
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1077
          TabOrder = 1
          OnClick = ButtonQuickDeleteClick
        end
        object ButtonQuickSearch: TButton
          Left = 4
          Top = 6
          Width = 115
          Height = 30
          Cursor = crHandPoint
          Align = alLeft
          Caption = #1055#1086#1080#1089#1082
          TabOrder = 0
          OnClick = ButtonQuickSearchClick
        end
      end
    end
    object TabSheet6: TTabSheet
      AlignWithMargins = True
      Caption = 'Option'
      ImageIndex = -1
      OnShow = TabSheet6Show
      object StatusBar4: TStatusBar
        Left = 0
        Top = 426
        Width = 562
        Height = 19
        Panels = <
          item
            Width = 50
          end>
      end
      object TabControl11: TTabControl
        Left = 0
        Top = 0
        Width = 165
        Height = 386
        Align = alLeft
        TabOrder = 0
        DesignSize = (
          165
          386)
        object TreeViewOption: TTreeView
          Left = 4
          Top = 38
          Width = 157
          Height = 343
          Anchors = [akLeft, akTop, akRight, akBottom]
          DoubleBuffered = True
          HotTrack = True
          Indent = 19
          ParentDoubleBuffered = False
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          OnClick = TreeViewOptionClick
          Items.NodeData = {
            070300000009540054007200650065004E006F00640065002D00000000000000
            00000000FFFFFFFFFFFFFFFF000000000000000000000000000107240438043B
            044C04420440044B040000330000000000000000000000FFFFFFFFFFFFFFFF00
            000000000000000000000000010A180441043A043B044E04470435043D043804
            4F040000430000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
            00000000000112180441043A043B044E04470435043D0438044F042000200435
            0435044104420440043004}
        end
        object MemoHKCU: TMemo
          Left = 20
          Top = 135
          Width = 128
          Height = 49
          Lines.Strings = (
            
              '\Identities\{9745A9A1-95D3-4584-B4E8-C9C2374B3BD3}\Software\Micr' +
              'osoft\Outlook Express\5.0\Recent Stationery List'
            '\Software\3delite\Filesystem Dialogs\Last config folder\Folder'
            
              '\Software\4kdownload.com\4K Video Downloader\Download\downloaded' +
              'Items'
            
              '\Software\4kdownload.com\4K YouTube to MP3\Download\downloadedIt' +
              'ems'
            '\Software\7 Taskbar Tweaker\MementoSectionUsed'
            '\Software\7Star\7Star\BrowserExitCodes'
            '\Software\7z SFX Builder\MRU'
            '\Software\7-Zip-Zstandard\Compression\ArcHistory'
            
              '\Software\ABBYY\Bonus.ScreenshotReader\9.00\Options\LastSaveImag' +
              'ePath'
            '\Software\ABBYY\FineReader\7.00\Shell\Dialogs\LoadImagePath'
            '\Software\ABBYY\Lingvo\15.0\Dictionaries\FavoriteDirections'
            
              '\Software\ABBYY\PDFTransformer\3.00\Transform\MRURecognitionLang' +
              'uages'
            '\Software\abgx360gui\RecentFiles'
            '\Software\Ability 6.0\Ability Database\Recent File List'
            '\Software\Abyssmedia\Quick Batch File Compiler\Settings\savedir'
            '\Software\Abyssmedia\ScriptCryptor\Settings\mrucount'
            '\Software\AC74\View64\MRU1'
            '\Software\AccessData\Registry Viewer\Recent File List'
            '\Software\ACD Systems\ACDSee Pro\90\HistMCFDestFolder'
            '\Software\Ace Explorer\Ace Explorer\Recent File List'
            '\Software\Acelogix\Ace Utilities\Settings\UsageHistory'
            
              '\Software\Acon Digital\Acoustica Premium Edition 6\General\Brows' +
              'erFolder'
            '\Software\AcooBrowser\Acoo Browser\Recent Document List'
            '\Software\Acro Software Inc\CPW\Filename'
            '\Software\Actual Tools\Actual Window Guard\LastNagScreenDate'
            '\Software\Adaptec\AUDIO_CD_INFO'
            '\Software\Adobe\Acrobat Distiller\PrinterJobControl'
            '\Software\Adobe\Acrobat Reader\11.0\AVConversionFromPDF'
            '\Software\Adobe\Acrobat Reader\2015\AVGeneral\cRecentFiles'
            '\Software\Adobe\Acrobat Reader\7.0\Collab\cWorkflowFolders'
            '\Software\Adobe\Acrobat Reader\DC\AVConnector\cIconCache'
            '\Software\Adobe\Adobe Acrobat\11.0\AVGeneral\cRecentFolders'
            '\Software\Adobe\Adobe Acrobat\2015\AVGeneral\cRecentFiles'
            '\Software\Adobe\Adobe Acrobat\DC\AVConnector\cIconCache'
            '\Software\Adobe\Adobe ARM\1.0\ARM\tLastT_Reader'
            '\Software\Adobe\Adobe Customization Wizard 8\Recent File List'
            
              '\Software\Adobe\Backup\Preferences\brr1\Software\Adobe\Acrobat R' +
              'eader\8.0\AVGeneral\cRecentFiles'
            '\Software\Adobe\Elements Organizer\11.0\CurrentMediaFilePath'
            '\Software\Adobe\MediaBrowser\MRU'
            
              '\Software\Adobe\Photoshop Elements\11.0\common\settings\Elements' +
              ' MRU'
            '\Software\Adobe\Premiere Elements\11.0\MRUDocuments'
            '\Software\Agnitum\Outpost Firewall Pro\Recent File List'
            '\Software\ahead\Nero PhotoSnap\Recent File List'
            
              '\Software\Aiseesoft Studio\Aiseesoft Media Converter Ultimate\Ed' +
              'it\LastVideoFilePath'
            '\Software\AKi-Software\Kool-Playa\VideoHistory'
            '\Software\Alcohol Soft\Alcohol 52%\Basic\Image File Path'
            '\Software\AloneWolf\BForce\ArcName'
            '\Software\AloneWolf\DosWinConverter\Dir'
            '\Software\AloneWolf\FFRestorer\SaveDir'
            '\Software\AloneWolf\FileRen\Dir'
            '\Software\AloneWolf\HideTrace\LogDir'
            '\Software\AloneWolf\HTMLOpt\Dir1'
            '\Software\AloneWolf\IconScanner\SourceFolder'
            '\Software\AloneWolf\LRemover\Path'
            '\Software\AloneWolf\RSD\LastSearch'
            '\Software\AloneWolf\SignPhoto\Dir'
            '\Software\AloneWolf\TestYourSelf\QuestionFile'
            '\Software\AloneWolf\TextReplacer\Dir'
            '\Software\Amazon\Kindle\User Settings\last_getitems_date'
            '\Software\AMP Soft\Font Viewer\Default copy folder'
            '\Software\Andrew Zhezherun\WinDjView\Documents'
            '\Software\AnnyStudio\JPEGRotator\Main\LastFolder'
            
              '\Software\Ant.com\AVD\Ant Video downloader\Settings\TemporaryFil' +
              'esLocation'
            
              '\Software\Antibody Software\Bulk Image Downloader\frmBIM\edDir.T' +
              'ext'
            '\Software\antiufo\TrackFolderChanges\LastFolder'
            '\Software\A-PDF\PDFContentSplitter\Setting\hloadpdfpath'
            '\Software\A-PDF\Watermark\Setting\hdIndir'
            '\Software\AppDataLow\IEPro\ClosedTabs'
            '\Software\Arasan\Arasan\Recent File List'
            '\Software\Ares\GUI.LastChatRoomBrowse'
            '\Software\Artifex Software\gsview 6.0\File'
            '\Software\ASCOMP\Cleaning Suite\ClientID'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 5\Burn Image Project\' +
              'SelectImage'
            '\Software\Ashampoo\Ashampoo PDF\Find Replace'
            
              '\Software\Atlantis Word Processor\ClipLib\AddGraphicClip_RecentF' +
              'older'
            '\Software\AtomicWare\Atomic Cleaner\Last Scan'
            '\Software\Attribute Changer\File Settings\!DTDateMax'
            '\Software\Audacity\Audacity\DefaultOpenPath'
            
              '\Software\Aurigma\ImageUploader\Image Uploader 5.0\LastVisitedAs' +
              'String2'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\DiskCleaner.AppLogic' +
              '.ErrorsFailed'
            
              '\Software\Auslogics\Registry Cleaner\2.x\Settings\RegCleaner.App' +
              'Logic.ErrorsFailed'
            '\Software\Autodesk\AutoCAD\R17.0\ACAD-5001:409\Recent File List'
            '\Software\AutoDesk\DWF Common\Preferences\MRUList'
            '\Software\Autodesk\Inventor\RegistryVersion19.0\Recent File List'
            '\Software\AutoIt v3\Aut2Exe\LastExeDir'
            '\Software\AVAST Software\Avast Browser Cleanup'
            '\Software\AVAST Software\Tuneup\FixProblems'
            '\Software\Axialis\IconWorkshop\folders\CurrentExportDirectory'
            '\Software\Babylon\Babylon Translator\UserInfo\History'
            '\Software\BarcodeOK ist OK\BarcodeOK\Recent File List'
            '\Software\Benthic\PLEdit32\RecentFiles'
            '\Software\BenVista\PhotoZoom Pro 6\FileDir'
            '\Software\Bitstream\Font Navigator\6.0\Copy\Folders'
            '\Software\BitTorrent\computerID'
            
              '\Software\Blizzard Entertainment\StarCraft II Editor\Recent File' +
              's'
            '\Software\BlueBeam\WebReaper\URL History'
            '\Software\Bluefive\Beyondo\RecentFiles'
            '\Software\Bomers\Restorator\Restorator\Current\LastSearchString'
            '\Software\Borland\BDS\4.0\Closed Files'
            '\Software\Borland\C++Builder\5.0\Closed Files'
            '\Software\Borland\Delphi\7.0\Closed Files'
            '\Software\Bradbury\TopStyle\5.0\RecentFiles'
            '\Software\BraveSoftware\Brave-Browser\BrowserExitCodes'
            '\Software\BraveSoftware\Promo\StubInstallerPath'
            '\Software\BreakPoint\Hex Workshop 3.1\Recent File List'
            '\Software\BreakPoint\SIP Workbench\file1'
            '\Software\Bugsplat\gaspowered\SupremeCommander'
            '\Software\CBS Interactive\CNET TechTracker\Recent File List'
            '\Software\CDROM_Productions\CDRDIAG\LastCopyDir'
            '\Software\Centarsia\RecentImage0'
            '\Software\Centered Systems\Second Copy 2000\MRU'
            '\Software\ChemTable Software\Registry Life\ExploredKeysEx'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d' +
              '8bbwe\MicrosoftEdge\Recovery\PendingDelete'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppContainer\Storage\windows_ie_ac_001\Internet Explo' +
              'rer\DOMStorage'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\PolicyCache'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\19120CensoredUser.HyperforYouT' +
              'ube_c0tqyanwsgfn6\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\4DF9E0F8.Netflix_mcm4njqhnhss8' +
              '\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\55382ross456.RedditToGo_02dxdb' +
              'b1qg9kw\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\AdobeSystemsIncorporated.Adobe' +
              'Reader_ynb6jyjzte8ga\PersistedStorageItemTable\MostRecentlyUsed'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\FilmOnLiveTVFree.FilmOnLiveTVF' +
              'ree_zx03kxexxb716\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.Bing_8wekyb3d8bbwe\S' +
              'earchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.BingMaps_8wekyb3d8bb' +
              'we\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.BingNews_8wekyb3d8bb' +
              'we\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.BingSports_8wekyb3d8' +
              'bbwe\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.BingTravel_8wekyb3d8' +
              'bbwe\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.BingWeather_8wekyb3d' +
              '8bbwe\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.Camera_8wekyb3d8bbwe' +
              '\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.Microsoft3DViewer_8w' +
              'ekyb3d8bbwe\PersistedStorageItemTable\MostRecentlyUsed'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\microsoft.microsoftskydrive_8w' +
              'ekyb3d8bbwe\PersistedPickerData\microsoft.microsoftskydrive_8wek' +
              'yb3d8bbwe!Microsoft.MicrosoftSkyDrive\DefaultOpenFileMultiple\La' +
              'stLocation'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.Office.OneNote_8weky' +
              'b3d8bbwe\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.Reader_8wekyb3d8bbwe' +
              '\PersistedStorageItemTable\ManagedByApp'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.ScreenSketch_8wekyb3' +
              'd8bbwe\PersistedPickerData\Microsoft.ScreenSketch_8wekyb3d8bbwe!' +
              'App\AppSnipAndSketchFileSaveSettings\LastLocation'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.Windows.Photos_8weky' +
              'b3d8bbwe\PersistedPickerData\Microsoft.Windows.Photos_8wekyb3d8b' +
              'bwe!App\DefaultSaveFileSingle'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\microsoft.windowscommunication' +
              'sapps_8wekyb3d8bbwe\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\microsoft.windowsphotos_8wekyb' +
              '3d8bbwe\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.WindowsScan_8wekyb3d' +
              '8bbwe\PersistedStorageItemTable\ManagedByApp'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.XboxLIVEGames_8wekyb' +
              '3d8bbwe\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.ZuneMusic_8wekyb3d8b' +
              'bwe\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.ZuneVideo_8wekyb3d8b' +
              'bwe\SearchHistory\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\windows.immersivecontrolpanel_' +
              'cw5n1h2txyewy\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Shel' +
              'l\BagMRU'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Shel' +
              'l\MuiCache'
            '\Software\Classes\MIME\Database\Content Type'
            
              '\Software\CleanMyPC\CleanMyPC - Registry Cleaner\Recent File Lis' +
              't'
            '\Software\ClearProg\PlugIns'
            '\Software\CocCoc'
            '\Software\Code Sector\TeraCopy\LastTargetFolder'
            '\Software\CodeGear\BDS\6.0\Closed Files'
            '\Software\CoffeeCup Software\GIF Animator\Settings\MRU'
            '\Software\CompSoft\PortScan\ScanEnd'
            '\Software\Conceiva\Mezzmo\General\LastWatchFolder'
            '\Software\Corel\PaintShop Pro\X7\CoreMemoryManager\0'
            '\Software\Corel\User Assistant\11\Recent Work\Presentations'
            '\Software\Creative Element\File Type Doctor\LastSelected'
            '\Software\Creative Professional\Proteus VX VSTi\Recent File List'
            '\Software\CrypTool2.0\recentFileList'
            '\Software\csvconverter\EXPORTPATH'
            '\Software\CubicDesign\GetMyIP'
            '\Software\CursorArts\MRU Items'
            '\Software\CursorFX Theme Editor\Recent File List'
            '\Software\CyberLink\AudioDirector4\MediaObj\MediaCache5\Data5'
            '\Software\CyberLink\ColorDirector3\MediaObj\MediaCache5\Data5'
            '\Software\CyberLink\DSSharedMediaInfo\SharedInfoCache'
            '\Software\CyberLink\Hanuman'
            '\Software\CyberLink\LabelPrint\Recent File List'
            
              '\Software\CyberLink\PowerDVD15\CLMPSvc\MediaObj\MediaCache5\Data' +
              '5'
            '\Software\DAMN\DAMN NFO Viewer\WorkingDirectory'
            '\Software\DAMN\Hash Calculator\Settings\LastDir'
            '\Software\Daum\PotPlayerMini\RememberFiles'
            '\Software\DBFView\DBFView\Recent File List'
            '\Software\DDKI\Misc\OpenDirectory'
            '\Software\Death Knight\DivFix++\PathLog'
            '\Software\Debenu\Debenu PDF Maximus 2\MaximusViewerRecentDocs'
            '\Software\Disc Soft\DAEMON Tools Pro\GuiNamespace\MountFolder'
            '\Software\DivX\Settings\Converter\lastBrowseDir'
            '\Software\DJI Interprises\Newsbin Pro\FilterHistory'
            '\Software\DjVuReader\MRUList'
            '\Software\DOLKR\Misc\OpenDirectory'
            '\Software\DOPR\Misc\OpenDirectory'
            '\Software\DownloadManager\1'
            '\Software\Dragon Software\Dragon UnPACKer 5\HyperRipper\Source'
            '\Software\Drowse\Injector\DLL'
            '\Software\Duplicate Photo Finder\AddFolderWiz'
            '\Software\DVDx\LastDir'
            '\Software\e-academy Inc.\SecureDownloadManager\Recent File list'
            '\Software\EasyBoot Systems\UltraISO\5.0\LogFile'
            '\Software\eBay\eBayToolbar\History'
            '\Software\EBooksys\FlipBook CD 1\Typed URLs'
            '\Software\Echo Software\PN2\Find\FindText'
            '\Software\Eclipsit\Microangelo\Toolset 6\Animator\MRU List'
            '\Software\Eden\ConTEXT\FileHistory'
            '\Software\EffeTech\EffeTech HTTP Sniffer\Recent File List'
            '\Software\Elcom\ART\Recent File List'
            '\Software\ElcomSoft\Advanced Archive Password Recovery\Paths'
            
              '\Software\eMingSoftware\Net-Peeker Group Console\Recent File Lis' +
              't'
            '\Software\EmSoft\EmEditor v3\Recent File List'
            '\Software\Enplase Research\Encryption Xpert\Settings\LastFile'
            '\Software\ENT3\Recent'
            '\Software\ESRI\ArcMap\Recent File List'
            '\Software\Evernote\Skitch\lastDoc'
            '\Software\EvolutionComputing\CC3View\1'
            '\Software\ExactFile\CDLastFolderSelected'
            '\Software\Exifer\Browse\History'
            '\Software\ExpertGHID\Recent File List'
            '\Software\FabPlayer\DefaultDir'
            '\Software\famatech\Advanced IP Scanner\LastLoadedListName'
            '\Software\famatech\Advanced Port Scanner\LastUsedIPsListPath'
            '\Software\Far\Editor\LastPositions'
            '\Software\FastStone\_LastClipPlayed'
            '\Software\FerretSoft\NetFerret\CurrentVersion\Web\Search History'
            
              '\Software\Foxit Software Company\Foxit PDF Editor\Recent File Li' +
              'st'
            
              '\Software\Foxit Software\Foxit PDF Editor 11.0\CommentPanel\Filt' +
              'er'
            
              '\Software\Foxit Software\Foxit Reader 6.0\Preferences\History\Op' +
              'tions'
            '\Software\Freeware\VirtualDubMod\MRU List'
            '\Software\Frhed\Settings\0\MRU_File1'
            '\Software\FTP Password Kracker\File'
            '\Software\FTweak\FCleaner\programfile'
            '\Software\FutureFog\MyToolkit\Options\LastUsedFolder'
            '\Software\FutureFog\Phorest\Layout\SelectionHeight'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 0'
            '\Software\Gabest\vsfilter\DefTextPathes\Path0'
            '\Software\Gabriele Ponti\Send To Toys\LastFolder'
            '\Software\Game Maker 4\Preferences\GameDir'
            '\Software\gBurner\Reopen0'
            '\Software\GetFLV\AutoCaptureURL'
            '\Software\GlarySoft\Glary Utilities 5\RegistryRepair\History'
            '\Software\GlobalSCAPE\CuteHTML\2.3\Recent File List'
            '\Software\GlobFX Technologies\Swiff Player\Recent File List'
            '\Software\GNU\Xvid\stats'
            '\Software\GOFF Concepts\FileSearchEX\Sys_ContainingTextHistory'
            '\Software\Google\Google Video Player\MRUList'
            '\Software\GPF Comics\WinHasher\LastDirectory'
            '\Software\GRAHL\PDFAnnotator\3.0\Files\MRUItems'
            '\Software\grepWin\searchpath'
            '\Software\GRETECH\GomPlayer\OPTION\sRecentPLFolder'
            '\Software\GridinSoft\Notepad3\Files'
            '\Software\grigsoft.com\Synchronize It!\Combos'
            '\Software\Grokster\Grokster\Recent File List'
            '\Software\Groupwyse Software\Recent Files Scanner\Paths'
            '\Software\GSettings\org\gnucash\history'
            '\Software\GSpot Appliance Corp\GSpot\v2.6 Settings\LastMediaFile'
            '\Software\H&&M System Software\Twain\Recent File List'
            '\Software\Headlight\GetRight\FileQueue'
            '\Software\HHD Software\Hex Editor 6.sm\MRU'
            '\Software\HighCriteria\TotalRecorder\Recent File list\File1'
            '\Software\HM Software\Nis Edit\Recent'
            '\Software\Honeyview\BMPath0'
            '\Software\Honeyview\RecentFolder0'
            '\Software\Hotbar\hotbar\ImagesHistory'
            '\Software\Hyperionics\HyperSnap 7\Recent File List'
            '\Software\IdeaSoft\Scrapbooks Plus\1.0\Recent File List'
            '\Software\IE7pro\ClosedTabs'
            '\Software\iExpertSoft\Registry Clean Expert\Recent File List'
            
              '\Software\ImageDupeless\ImageDupeless\Parameters\Last Decoded Fi' +
              'le'
            '\Software\ImgBurn\ISOREAD_RecentFiles_Destination'
            
              '\Software\ImTOO\Video Converter Ultimate\Settings\last_openfile_' +
              'dir'
            '\Software\Infospace\DogpileToolbar\History\1-terms'
            '\Software\Ingit\MapGPS\MapGPS\RARU0205\LastOpenChart'
            
              '\Software\Innovative Solutions\Advanced Uninstaller PRO\9\compre' +
              'ss\listHistoryText'
            
              '\Software\Innovative Solutions\System Tray Cleaner\TrayApplicati' +
              'ons'
            '\Software\Insight Software Solutions\ShortKeys\MRU'
            '\Software\InstallBuilders\Smart Install Maker\Reopen'
            '\Software\InstallShield\16.0\Professional\Recent File List'
            '\Software\instedit.com\insted\MRU'
            '\Software\ION Tek\UPX Shell\3.x\History'
            '\Software\IrekZielinskiSoft\TimeAdjuster\LDIR1'
            '\Software\IvoSoft\ClassicStartMenu\MRU'
            '\Software\jack1024\WinInfo\1.0\FirstRun'
            '\Software\Jasc\Animation Shop 2\Recent File List'
            '\Software\Jasc\Paint Shop Pro 6\Recent File List'
            '\Software\JBSoftware\MemoMaster5\FileMRU1'
            '\Software\JetCar\JetCar\Recent File List'
            '\Software\Jordan Russell\Inno Setup\ScriptFileHistoryNew'
            '\Software\Josip Medved\VHD Attach\LastSize'
            '\Software\KarenWare\Power Tools\Hasher\LastRun'
            '\Software\Kazaa\Kazaa Lite Resurrection\Recent File List'
            '\Software\KillBox\LastPath'
            '\Software\kishDesign\CopyTo\settings3\scutFolder00'
            '\Software\Kodak\Imaging\Recent File List'
            '\Software\Korbos\VirtualFDD\Recent File List'
            '\Software\L0pht Holdings LLC\L0phtCrack 6\Recent File List'
            '\Software\L0pht\AntiSniff\Recent File List'
            '\Software\Lavasoft\Reghance\Last key'
            '\Software\LDAPSearch_Nag\BaseDN'
            '\Software\Leadtek\Video\WFFM\Last Name'
            
              '\Software\LexmarkPhoto\Lexmark Photo Software\pheditor\Recent Fi' +
              'le List'
            '\Software\LibreCAD\/LibreCAD\Paths\Open'
            '\Software\LimePro\GUI.LastChatRoomBrowse'
            '\Software\Local AppWizard-Generated Applications'
            
              '\Software\Local AppWizard-Generated Applications\Machete\Recent ' +
              'File List'
            
              '\Software\Local AppWizard-Generated Applications\PictureTrail Ph' +
              'oto Editor\Recent File List'
            '\Software\Local AppWizard-Generated Applications\SamsungMagician'
            '\Software\LockTime\NetLimiter\Recent File List'
            '\Software\LOKIBIT.COM\VSLogonScreenCustomizer\LastInputDir'
            '\Software\M.Dev Software\ZG5\MRU Items'
            '\Software\Macromedia\Shockwave 8\movies'
            '\Software\Mael\HxD\History Lists\Recent Files'
            
              '\Software\MAGIX AG\Videodeluxe19_pro\ExportConfigurator\DialogIt' +
              'ems\LastFile'
            '\Software\ManiacTools\mp3Tag Pro\fmImageOpen'
            '\Software\ManiacTools\MusicDuplicate\DateLastLaunch'
            '\Software\Meauxsoft\Mo-Search\Mo-Search v4.0.13\Last Position'
            '\Software\Mediachance\UtraSnapPRO\Disk\Filename'
            '\Software\MediaScience\Sonique\Play_History'
            '\Software\Metafile Viewer\WMF Viewer\Recent File List'
            '\Software\metapad\mru_1'
            '\Software\Microsoft\.NETFramework\SQM\Apps'
            '\Software\Microsoft\ClipArt Gallery\2.0\MRUDescription'
            '\Software\Microsoft\Conferencing\UI\CallMRU'
            '\Software\Microsoft\Dependency Walker\Recent File List'
            '\Software\Microsoft\DevStudio\6.0\Recent File List'
            '\Software\Microsoft\Direct3D\MostRecentApplication'
            '\Software\Microsoft\Edge Beta\BrowserExitCodes'
            '\Software\Microsoft\Expression\Web Designer\FindMRU'
            '\Software\Microsoft\HTML Help Workshop\Compressed HTML'
            '\Software\Microsoft\IntelliPoint\AppSpecific'
            
              '\Software\Microsoft\Internet Explorer\LowRegistry\Audio\PolicyCo' +
              'nfig\PropertyStore'
            '\Software\Microsoft\Keyboard\Native Media Players'
            '\Software\Microsoft\MediaPlayer\Player\Settings\OpenDir'
            '\Software\Microsoft\Microsoft DVD Wizard Settings\Browse 2'
            '\Software\Microsoft\Microsoft Help Workshop\Cnt Files'
            
              '\Software\Microsoft\Microsoft SQL Server\80\Tools\Shell\FileMRUL' +
              'ist'
            '\Software\Microsoft\MM20\ImportDirAllMedia'
            '\Software\Microsoft\MPEG2Demultiplexer\WriteCaptureDir'
            '\Software\Microsoft\Notepad\replaceString'
            '\Software\Microsoft\Office\11.0\Common\General\SymbolMRU'
            '\Software\Microsoft\Office\11.0\Outlook\Office Finder\MRU 1'
            '\Software\Microsoft\Office\12.0\Common\OfficeStart\Web\Templates'
            '\Software\Microsoft\Office\14.0\MS Project\Recent File List'
            '\Software\Microsoft\Office\9.0\Outlook\Preferences\LocationMRU'
            '\Software\Microsoft\Orca\Recent File List'
            '\Software\Microsoft\Phone\ShellUI\WindowSizing'
            '\Software\Microsoft\PhotoDraw\1.0\Recent File List'
            '\Software\Microsoft\VBExpress\10.0\FileMRUList'
            '\Software\Microsoft\VBExpress\10.0\Find\Find'
            '\Software\Microsoft\VCExpress\10.0\FileMRUList'
            '\Software\Microsoft\VCExpress\10.0\Find\Find'
            '\Software\Microsoft\VCSExpress\10.0\FileMRUList'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 0'
            '\Software\Microsoft\Windows Live Mail\SearchFolderVersion'
            
              '\Software\Microsoft\Windows Live\Movie Maker\browseformusicdirec' +
              'tory'
            
              '\Software\Microsoft\Windows Live\Photo Aquisition\Camera\Finenam' +
              'eTemplate'
            
              '\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Com' +
              'patibility Assistant\Persisted'
            
              '\Software\Microsoft\Windows Photo Gallery\Library\PreviewAssignm' +
              'ent\MRU'
            
              '\Software\Microsoft\Windows\CurrentVersion\Action Center\Provide' +
              'rs\EventLog'
            
              '\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManage' +
              'r\Subscriptions'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHand' +
              'lers\KnownDevices'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\CD Burning\S' +
              'tagingInfo'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage' +
              '\AppBadgeUpdated'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\SearchHistor' +
              'y'
            '\Software\Microsoft\Windows\CurrentVersion\Explorer\SharingMFU'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\Pr' +
              'ogramsCache'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\Fav' +
              'oritesChanges'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\ScreenshotIn' +
              'dex'
            
              '\Software\Microsoft\Windows\CurrentVersion\Media Center\MRU\Sett' +
              'ingsMRU'
            
              '\Software\Microsoft\Windows\CurrentVersion\PushNotifications\wpn' +
              'idm'
            '\Software\Microsoft\Windows\CurrentVersion\Run\APR_DEACTIVATED'
            '\Software\Microsoft\Windows\CurrentVersion\Search\JumplistData'
            
              '\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Cach' +
              'ed'
            '\Software\Microsoft\Windows\CurrentVersion\Themes\History\Colors'
            '\Software\Microsoft\Windows\CurrentVersion\UFH\SHC'
            '\Software\Microsoft\Windows\CurrentVersion\WIA'
            '\Software\Microsoft\Works\8.0\Recent File List'
            '\Software\Microsoft\XML Notepad\Recent File List'
            '\Software\MindGems\Audio Dedupe\MRU1'
            '\Software\MindGems\Easy Web Gallery Builder\2.2\MRU1'
            '\Software\MindGems\Fast Duplicate File Finder\MRU1'
            '\Software\MindGems\Visual Similarity Duplicate Image Finder\MRU1'
            '\Software\MiTeC\DFM Editor\5.x\Main\MRUHistory'
            '\Software\MiTeC\HexEditor\4.x\wnd_hex_Main\od_InitialDir'
            '\Software\MiTeC\Icon Explorer\4.x\wnd_icoexp_Main\de_Text'
            '\Software\MiTeC\INI Editor\1.0\od_InitialDir'
            '\Software\MiTeC\RFV\2.x\Recent Files'
            '\Software\MiTeC\SSViewer\3.x\MRU'
            '\Software\MiTeC\WRA\1.x\Main\MRUHistory'
            '\Software\MiTeC\WRR\1.x\dlg_wrr_Find\eFind_Text'
            
              '\Software\MiTeC\XMLViewer\4.x\wnd_xmlv_Main\Twnd_xmlv_Main.MRUMa' +
              'nager'
            '\Software\MKowalski\ExifPro\1.0\Browser\View 0\LastPath'
            '\Software\Monkey'#39's Audio\Settings\Add Files MRU List'
            '\Software\Moon Valley Software\CD Ultra\Recent File List'
            '\Software\MPEG Audio Collection\LastNameText1'
            '\Software\MSDART\Explorer\Recent File List'
            '\Software\MySoftware\IEToy\FRAGS_ad'
            '\Software\Mythicsoft\FileLocatorPro\RecentContains'
            '\Software\N64 Emulation\Project64 Version 1.6\RecentFile1'
            '\Software\NativeWinds\Tomahawk\MRU'
            '\Software\NCH Software\ExpressPoints\RecentFileList'
            '\Software\NCH Software\PhotoPad\RecentFileList'
            '\Software\NCH Software\PicoPDF\General\lastfile'
            '\Software\NCH Software\Pixillion\Options\Image path'
            '\Software\NCH Software\WavePad\Recent'
            '\Software\NeoSoftTools\System Manager\Common\FileInfo'
            '\Software\nesterJ\Recent'
            '\Software\Netants\MRU'
            '\Software\NetUtils\WNetStat\LastFile'
            '\Software\Neuber GbR\Security Task Manager\Options\HistoryExe'
            '\Software\NextSecurity\GetKey\Recent File List'
            '\Software\NextUpTech\TextAloud3\AudioClipFileOpenDirectory'
            '\Software\Nico Mak Computing\WinZip\Mru'
            '\Software\NirSoft\AddrView\LastUrlAddr'
            '\Software\NirSoft\RegScanner\BaseKey'
            '\Software\Nitro PDF\Reader\1.0\Recent File List'
            '\Software\No Bull Software\MetaX\Preferences\lastDir'
            '\Software\NoVirusThanks\DriverRadarPro\edCopyDrvTo'
            '\Software\O&O\O&O SafeErase\7\LastAnalysisAdditionalErrorMessage'
            '\Software\OmniNet\OmniTracker\MRU'
            '\Software\OneSafe PC Cleaner\InstallationDate'
            '\Software\OpenArgs\History'
            '\Software\Opera Software\Last CommandLine v2'
            '\Software\Outertech\GetDiz\Recent Files_1'
            '\Software\Paint.NET\LastFileDialogDirectory'
            
              '\Software\Parallel Password Recovery\Parallel recovery server\1.' +
              '0\Last stored job'
            '\Software\PDFExplorer\Options\LastDiskTreeFolder'
            '\Software\Pelikan Software KFT\priPrinter\lastCleanUp'
            '\Software\Pelle Orinius\PellesC\Recent File List'
            '\Software\PepiMK Software\Analysis tools\RegAlyzer\LastKey'
            '\Software\PFU\ScanToOffice\History'
            '\Software\photoflare.io\PhotoFlare\OpenFolder'
            '\Software\Pintosoft\FocusOn Renamer\BRMRN1'
            '\Software\Piriform\Kamo\epochAtInstall'
            '\Software\pledit\PropertyList Editor\Recent File List'
            '\Software\Poikosoft\Easy CD-DA Extractor 8\k8c'
            '\Software\Polybytes\PolyView\Recent File List'
            '\Software\Pothos\Red Button\LastUpdateCheck'
            '\Software\PowerISO\SCDEmu\ImageName0'
            '\Software\PrestoSoft\ExamDiff Pro\Recent Binary Find Strings'
            '\Software\Prineas\FileViewer\History'
            '\Software\Prismatic Software\PhotoBatch\Dialogs\LastBatchFile'
            '\Software\QtProject\OrganizationDefaults\FileDialog\history'
            '\Software\Quizo\QTTabBar\TabsOnLastClosedWindow'
            '\Software\QwertyLab\RunAsSystem\mru'
            '\Software\RasterVect Software\Free Image Editor\Options\CurrDir'
            '\Software\RealNetworks\RealJukebox\1.0\Preferences\WatchFolders'
            '\Software\Reason\ShouldIRemoveIt\Cache'
            '\Software\ReGet Software\ReGetDx\FtpExplorer\Hist'
            
              '\Software\Registry Recovery Toolbox\List Source Registry Files E' +
              'xt'
            
              '\Software\Resplendence Sp\Registrar Registry Manager\Settings\Ex' +
              'portForm.saveDialogExportFilename'
            '\Software\Roadkil\Source_Unstp'
            '\Software\Rosegardenmusic\Rosegarden\recent-0'
            '\Software\RouterPasswordKracker\File'
            '\Software\Roxio\EMC13\VideoUI\RecentFiles\Catalogs'
            '\Software\Sanderson Forensics\LinkAlyzer\LastOpenFolder'
            '\Software\Scooter Software\Beyond Compare\Recent'
            '\Software\SecurityXploded\DirectoryScanner\EndHostAddress'
            '\Software\SecurityXploded\HashKracker\File'
            '\Software\SecurityXploded\LDAPPasswordKracker\File'
            '\Software\SecurityXploded\MysqlPasswordAuditor\File'
            '\Software\SecurityXploded\NetDatabaseScanner\DatabaseType'
            '\Software\SecurityXploded\SaltedHashKracker\File'
            '\Software\SecurityXploded\SSLCertScanner\Port'
            '\Software\SecurityXploded\VirusTotalScanner\File'
            '\Software\SecurityXploded\WiFiNetworkMonitor\EndHostAddress'
            '\Software\SecurityXploded\WindowsPasswordKracker\File'
            '\Software\ShellLess1.10b\ShellLess\Recent File List'
            '\Software\Shredder\{FF14D9EE-48EB-4873-80AC-8E224BEE5823}'
            '\Software\Siber Systems\_InstallerDir'
            '\Software\Silicon Valley Software\Anim8or\File1'
            '\Software\SketchUp\SketchUp 2013\Recent File List'
            '\Software\Smart PC Solutions\Document Trace Remover\LastFile'
            '\Software\Smart PC Solutions\Metadata Analyzer\LastFile'
            '\Software\Smart Projects\IsoBuster\RecentImages'
            '\Software\Smartque\Smart Explorer\Opened Pages'
            '\Software\sms.at\mysms\cookies'
            '\Software\SnapShot\RecentFile0'
            '\Software\Softany\WinCHM\RecentFile1'
            '\Software\softorbits\PhotoStampRemover\currentFile'
            '\Software\Softpointer\Tag&Rename\Config\FCurrentFolder'
            '\Software\Solidworks\SolidWorks 2012\Recent File List'
            '\Software\SolwaySoftware\Control3\LastUserName'
            '\Software\SolwaySoftware\PasswordKernel\LastFile'
            '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-0'
            '\Software\SoulSeek\SoulSeek\Recent File List'
            '\Software\Spaceblue\Venis IX\FileHistory'
            '\Software\SQLite Expert\Personal\3.x\DB'
            '\Software\sqlitebrowser\sqlitebrowser\db\lastlocation'
            '\Software\STDUtility\STDUExplorerApp\PathMRUList'
            '\Software\Stepok\Light Developer\Last Path'
            '\Software\stevengould.org\CleanUp!\Statistics'
            '\Software\Stilesoft\NetCaptor\CurrentVersion\Last Open Sites'
            
              '\Software\STOIK Smart Resizer 1.0\STOIK Smart Resizer\Recent Fil' +
              'e List'
            
              '\Software\Symantec\Symantec Ghost\Explorer\Ghost Explorer\Recent' +
              ' File List'
            '\Software\Sysinternals\DbgView\Recent'
            '\Software\Sysinternals\Process Explorer\SymbolPath'
            '\Software\Sysinternals\Process Monitor\Logfile'
            '\Software\Sysinternals\VMMap\SourcePath'
            '\Software\Sysinternals\ZoomIt\FilePath'
            '\Software\Systems Internals\Tdimon\Recent'
            '\Software\SystemTools\Exporter\Recent File List'
            '\Software\TeamViewer\Version5\Last_Machine_Connections'
            
              '\Software\TechSmith\Camtasia Studio\9.0\Camtasia Recorder\9.0\Ge' +
              'neral\lstLastSaveDir'
            '\Software\TechSmith\DubIt\Recent Audio Files'
            '\Software\TechSmith\Snagit\9\StampCustomFolder'
            '\Software\Teorex\Inpaint\Recent File List'
            '\Software\Teorex\iResizer\RecentFileList'
            '\Software\Teorex\MultiViewInpaint\Recent File List'
            '\Software\Teorex\PhotoScissors\Recent File List'
            '\Software\TGRMN Software\Bulk Rename Utility\Recent File List'
            '\Software\Thingamahoochie\WinMerge\Files\Ext'
            
              '\Software\Tipard Studio\Tipard Total Media Converter Platinum\Ed' +
              'it\LastVideoFilePath'
            
              '\Software\Tipard Studio\Tipard Video Converter Ultimate\Edit\Las' +
              'tVideoFilePath'
            '\Software\ToolsCenter\TeXnicCenter\Recent File List'
            '\Software\TopoGrafix\EasyGPS\Error Log'
            '\Software\TortoiseSVN\History'
            '\Software\Tracker Software\PDFViewer\Documents\LastOpened'
            '\Software\Trident Software\PowerZip\Doc'
            '\Software\Two Pilots\Form Pilot\Settings\GraphicInitialDir'
            
              '\Software\Ulead Systems\Corel VideoStudio Pro\14.0\Preference\Wo' +
              'rking Folder'
            '\Software\Ulead Systems\Ulead GIF Animator\5.05\Recent File List'
            '\Software\Unigraphics Solutions\Solid Edge\Version 109\MRUex'
            '\Software\Update\Locate32\Dialogs\Advanced/ContainData'
            '\Software\UsbFix\LastReport'
            '\Software\Van Dyke Technologies\AbsoluteFTP\Recent File List'
            
              '\Software\VB and VBA Program Settings\MP3GainAnalysis\StartUp\Ad' +
              'dFilesPath'
            
              '\Software\VB and VBA Program Settings\PDFStreamDumper\Settings\L' +
              'astFile'
            
              '\Software\VB and VBA Program Settings\PFPortChecker\Settings\Por' +
              't'
            
              '\Software\VB and VBA Program Settings\RL Vision\Exif Tag Remover' +
              '\sLastAddDir'
            
              '\Software\VB and VBA Program Settings\Sobolsoft\Remove Metadata ' +
              'In Multiple Files Software\Output Folder'
            '\Software\VB and VBA Program Settings\Wake-On-Lan\IP Broadcast'
            '\Software\VeryPDF PDF Manual Splitter\pdfms\Recent File List'
            '\Software\VicMan Software\Photo! Editor\LastFolder'
            '\Software\VicMan Software\Web Photo Album\RecentFile0'
            '\Software\VietUnicode\VeryPDF OCR to Any Converter3\MruList'
            '\Software\VirtualDub.org\VirtualDub\MRU List'
            '\Software\Vitaliy Levchenko\Exportizer 5\Settings\LastExt'
            '\Software\Vitaliy Levchenko\Icons from File\Recent'
            '\Software\Vitaliy Levchenko\Renamus\Recent Projects'
            '\Software\Vivaldi\BrowserExitCodes'
            '\Software\VK\zx32\1.03\FileMRU'
            '\Software\VOS'
            '\Software\VSO\Blu-ray Converter Ultimate\2\BDMVInputFolders'
            '\Software\VSO\VSO Batcher\1\VideoFilesLastFlder'
            '\Software\VSO\VSO Media Player\1\RecentlyOpenedFiles'
            
              '\Software\Win Sniffer\Etherscan Password Sniffer\Recent File Lis' +
              't'
            '\Software\Winaero.com\Winaero Tweaker\SetupDir'
            
              '\Software\Windows Grep\Windows Grep\Current Version\Replace Opti' +
              'ons\Replace String'
            
              '\Software\WinGuides\WinGuides Tweak Manager\Settings\RecentTweak' +
              's'
            
              '\Software\WinHTTrack Website Copier\WinHTTrack Website Copier\Re' +
              'cent File List'
            '\Software\WinImage\File1'
            '\Software\WinMount Applications\WinMount\Recent File List'
            '\Software\WinRAR SFX'
            '\Software\WinSKApp'
            '\Software\WinSweeper2\LastScan'
            '\Software\WinThruster\InstallerName'
            '\Software\Woozle\PE Module Explorer\Recent Files'
            '\Software\Woozle\XN Resource Editor\Recent Files'
            '\Software\Wowhead\WowHead Client\Statistics'
            '\Software\Xara\WebDesigner\8.0\Workspace\MDI'
            '\Software\Xara\Xtreme\9.2\Options\Recent File List'
            '\Software\Xenocode\SandboxCache'
            '\Software\xlsconverter\EXPORTPATH'
            '\Software\XnView\Start\DirName_0'
            '\Software\XRayz\LinkStash\Recent File List'
            '\Software\Yadu Digital\Finders Keepers\Options\General\Last file'
            '\Software\yarpen.cz\sqliteman\lastDatabase'
            '\Software\Ying3\DLExpert\ftp'
            
              '\Software\ZabaraKatranemia Plc\xplorer2\MainFrame Settings\Folde' +
              'r History'
            '\Software\ABBYY\FineReader\8.00\Shell\Dialogs\ImportTAPath'
            '\Software\ABBYY\ScreenshotReader\9.00\Options\SaveTextPath'
            '\Software\ACD Systems\ACDSee Professional\110\OnlineHistPaths'
            
              '\Software\Adobe\Acrobat Reader\DC\SessionManagement\cWindowsCurr' +
              'ent'
            '\Software\Adobe\Adobe Acrobat\DC\AVGeneral\cRecentToolsList'
            
              '\Software\Adobe\Photoshop Elements\15.0\common\settings\Elements' +
              ' MRU'
            '\Software\Amazon\Kindle\User Settings\LastSyncDate7'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 7\Unknown Project\Add' +
              'Dialog'
            '\Software\Atlantis Word Processor\Internal\LastFavSubfolder'
            '\Software\Attribute Changer\File Settings\LimitTimeMin'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\TrackEraser.LastScan' +
              '.DateTimeLo'
            '\Software\Autodesk\R19.0\ACAD-B005:409\Recent File List'
            '\Software\Axialis\IconWorkshop\rss\News6'
            
              '\Software\BreakPoint\Hex Workshop v6.7\Compare\recent_MRU_0targe' +
              'tLength'
            
              '\Software\CyberLink\AudioDirector8\MediaObj\MediaCache5\Thumbnai' +
              'l5'
            
              '\Software\CyberLink\ColorDirector7\MediaObj\MediaCache5\Thumbnai' +
              'l5'
            '\Software\CyberLink\Power2Go9\9.0\MonitorPaths'
            '\Software\CyberLink\PowerDirector14\MediaObj\MediaCache5\Data5'
            
              '\Software\CyberLink\PowerDVD18\CLMPSvc\MediaObj\MediaCache5\Data' +
              '5'
            '\Software\DivXNetworks\DivX Player\LastOpenFileFolder'
            '\Software\DownloadManager\10'
            '\Software\Dragon Software\Dragon UnPACKer 5\Options\Recent_6'
            
              '\Software\ElcomSoft\Advanced Office Password Recovery\Recent fil' +
              'e 8'
            '\Software\Far2\SavedDialogHistory\PersPath'
            
              '\Software\Foxit Software\Foxit PhantomPDF 8.0\Foxit PhantomPDF A' +
              'dvanced Editor\Recent File List'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 9'
            '\Software\Game Maker\Version 5\Preferences\Recent3'
            '\Software\Google\Chrome SxS\BrowserExitCodes'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\ExtEditor\Replace' +
              '\Recent2'
            '\Software\Honeyview\BMPath9'
            '\Software\Honeyview\RecentFolder9'
            
              '\Software\InstallShield\InstallShield Professional\6.0\IsCabVu\M' +
              'RU3'
            '\Software\JBSoftware\MemoMaster5\FileMRU10'
            '\Software\kishDesign\CopyTo\settings3\scutFolder09'
            '\Software\metapad\mru_10'
            
              '\Software\Microsoft\Office\14.0\Common\Internet\UseRWHlinkNaviga' +
              'tion'
            '\Software\Microsoft\Office\15.0\Excel\Recent Templates'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 8'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 8'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 8'
            '\Software\Microsoft\VisualStudio\10.0\LastLoadedSolution'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 9'
            
              '\Software\MindGems\Audio Dedupe\Settings\FiltExcludeFolderNameWo' +
              'rds'
            
              '\Software\MindGems\Fast Duplicate File Finder\Settings\FiltExclu' +
              'deFolderNameWords'
            
              '\Software\MindGems\Visual Similarity Duplicate Image Finder\Sett' +
              'ings\FiltExcludeFolderNameWords'
            '\Software\N64 Emulation\Project64 Version 1.6\RecentFile10'
            '\Software\Nero\Nero 11\Nero Burning ROM\Settings\NeroCompilation'
            '\Software\Outertech\GetDiz\Recent Files_10'
            '\Software\PowerISO\SCDEmu\ImageName9'
            '\Software\Rosegardenmusic\Rosegarden\recent-9'
            '\Software\Roxio\EMC14\VideoConvert\MediaSelector'
            '\Software\SnapShot\RecentFile9'
            '\Software\Solidworks\SOLIDWORKS 2019\Recent Folder List'
            '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-9'
            
              '\Software\TechSmith\Camtasia Studio\18.0\Camtasia Studio\18.0\MR' +
              'UImportFolder'
            '\Software\TechSmith\Snagit\12\OutputDirLastUsed'
            '\Software\VSO\DVD Converter Ultimate\2\BDMVInputFolders'
            '\Software\WinImage\PathExtract'
            '\Software\XnView\Start\DirName_9'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\VIDEO_TS Disc Proj' +
              'ect\SelectVideoTSFolder\VideoTSPath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 19'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2007\Burn Image Proje' +
              'ct\AddDialog'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 0'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2007\Data Disc Projec' +
              't\AddDialog'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 1'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2007\Dump Image Proje' +
              'ct\DumpImage'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 2'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2007\Unknown Project\' +
              'AddDialog'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 3'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2016\Audio Disc Proje' +
              'ct\SaveDialog_CPlaylistDlgEx\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 4'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2016\Backup Project\B' +
              'ackupOptions\CustomLocation'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 5'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2016\Browse Image Pro' +
              'ject\BrowseImageFile\ImagePath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 6'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2016\Browse Image Pro' +
              'ject\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 7'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2016\Burn Image Proje' +
              'ct\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 8'
            '\Software\ABBYY\FineReader\8.00\Shell\Dialogs\LoadImagePath'
            '\Software\ACD Systems\ACDSee Professional\110\OpenFolder'
            '\Software\Adobe\Acrobat Reader\DC\SessionManagement\cWindowsPrev'
            '\Software\Adobe\Adobe Acrobat\DC\AVGeneral\cToolbars'
            '\Software\Adobe\Photoshop Elements\15.0\CurrentMediaFilePath'
            '\Software\Amazon\Kindle\User Settings\OpenBook'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 8\Data Disc Project\A' +
              'ddDialog'
            '\Software\Atlantis Word Processor\Internal\LastUsedDocTemplate'
            '\Software\Attribute Changer\File Settings\ModifiedValue'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\TrackEraser.LastScan' +
              '.FailedToRemove'
            '\Software\Autodesk\R22.0\ACAD-1001:409\Recent File List'
            '\Software\Axialis\IconWorkshop\rss\News7'
            
              '\Software\BreakPoint\Hex Workshop v6.7\Compare\recent_MRU_0targe' +
              'tOffset'
            '\Software\CyberLink\AudioDirector9\MediaObj\MediaCache5\Data5'
            '\Software\CyberLink\Power2Go9\9.0\OpenPrjFilePath'
            
              '\Software\CyberLink\PowerDirector14\MediaObj\MediaCache5\Thumbna' +
              'il5'
            
              '\Software\CyberLink\PowerDVD18\CLMPSvc\MediaObj\MediaCache5\Prog' +
              'ramInfo'
            '\Software\DivXNetworks\DivX4Windows\MP4 File Name'
            '\Software\DownloadManager\11'
            '\Software\Dragon Software\Dragon UnPACKer 5\Options\Recent_7'
            
              '\Software\ElcomSoft\Advanced Office Password Recovery\Recent fil' +
              'e 9'
            '\Software\Far2\SavedFolderHistory'
            '\Software\Foxit Software\Foxit PhantomPDF 8.0\MRU\File MRU'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 10'
            '\Software\Game Maker\Version 5\Preferences\Recent4'
            '\Software\Google\Chrome\BrowserExitCodes'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\FindInFiles\Find\' +
              'History'
            '\Software\Honeyview\BMPath10'
            '\Software\Honeyview\sRecentFolder'
            
              '\Software\InstallShield\InstallShield Professional\6.0\IsCabVu\M' +
              'RU4'
            '\Software\JBSoftware\MemoMaster5\FileMRU11'
            '\Software\kishDesign\CopyTo\settings3\scutname00'
            '\Software\metapad\szLastDirectory'
            
              '\Software\Microsoft\Office\14.0\Common\Open Find\Microsoft Word\' +
              'Settings\Print to file\File Name MRU'
            '\Software\Microsoft\Office\15.0\PowerPoint\Recent Templates'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 9'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 9'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 9'
            '\Software\Microsoft\VisualStudio\10.0\ProjectMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 10'
            '\Software\MindGems\Audio Dedupe\Settings\LastFolder'
            
              '\Software\MindGems\Fast Duplicate File Finder\Settings\LastFolde' +
              'r'
            
              '\Software\MindGems\Visual Similarity Duplicate Image Finder\Sett' +
              'ings\LastFolder'
            '\Software\Nero\Nero 11\Nero Burning ROM\Settings\TrackSaveDir'
            '\Software\PowerISO\SCDEmu\ImageName10'
            '\Software\Roxio\EMC14\VideoUI\RecentFiles\Albums'
            '\Software\SnapShot\RecentHashFile0'
            '\Software\SolidWorks\SOLIDWORKS 2020\Recent File List'
            
              '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-1' +
              '0'
            
              '\Software\TechSmith\Camtasia Studio\18.0\Camtasia Studio\18.0\MR' +
              'UOpenProjectFolder'
            '\Software\TechSmith\Snagit\12\VidOutputDirLastUsed'
            '\Software\VSO\DVD Converter Ultimate\2\ISOInputFolders'
            '\Software\XnView\Start\FileName_0'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2016\Burn Image Proje' +
              'ct\SelectImage\ImagePath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 9'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2016\Data Disc Projec' +
              't\DumpImage\ImagePath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 10'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2016\Data Disc Projec' +
              't\SaveDialog_AddFilesAndDirs\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 11'
            '\Software\Ashampoo\Ashampoo Burning Studio 2016\Logs'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 12'
            '\Software\Ashampoo\Ashampoo Burning Studio 2016\tempFiles'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 13'
            '\Software\Ashampoo\Ashampoo Burning Studio 2016\Unknown Project'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 14'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2016\VCD Project\Save' +
              'Dialog_OnAddMovies\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 15'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2016\VIDEO_TS Disc Pr' +
              'oject\DumpImage\ImagePath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 16'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2016\VIDEO_TS Disc Pr' +
              'oject\SelectVideoTSFolder\VideoTSPath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 17'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2017\Audio Disc Proje' +
              'ct\SaveDialog_CPlaylistDlgEx\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 18'
            '\Software\ABBYY\FineReader\8.00\Shell\Dialogs\SaveImagePath'
            '\Software\ACD Systems\ACDSee Professional\120\HistMCFDestFolder'
            '\Software\Adobe\Acrobat Reader\DC\ShareIdentity'
            '\Software\Adobe\Adobe Acrobat\DC\CompoundDocs\cStoredBinder'
            
              '\Software\Adobe\Photoshop Elements\15.0\VisitedDirs\STARTUPIMAGE' +
              'DIRECTORY'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 14\Data Disc Project\' +
              'SaveDialog_AddFilesAndDirs\InitialDirectory'
            '\Software\Atlantis Word Processor\Internal\Envelopes\LastAddr'
            '\Software\Attribute Changer\File Settings\PhotoValue'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\TrackEraser.LastScan' +
              '.Found'
            '\Software\Axialis\IconWorkshop\rss\News8'
            '\Software\BreakPoint\Hex Workshop v6.7\Compare\recent_MRU_count'
            
              '\Software\CyberLink\AudioDirector9\MediaObj\MediaCache5\Thumbnai' +
              'l5'
            '\Software\CyberLink\Power2Go9\9.0\SelectedFolderPath'
            '\Software\CyberLink\PowerDirector15\MediaObj\MediaCache5\Data5'
            
              '\Software\CyberLink\PowerDVD18\CLMPSvc\MediaObj\MediaCache5\Thum' +
              'bnail5'
            '\Software\DivXNetworks\DivX4Windows\MV File Name'
            '\Software\DownloadManager\12'
            '\Software\Dragon Software\Dragon UnPACKer 5\Options\Recent_8'
            
              '\Software\ElcomSoft\Advanced Office Password Recovery\Recent fil' +
              'e 10'
            '\Software\Far2\SavedHistory'
            '\Software\Foxit Software\Foxit PhantomPDF 8.0\MRU\Place MRU'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 11'
            '\Software\Game Maker\Version 5\Preferences\Recent5'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\FindInFiles\Find\' +
              'Patterns'
            '\Software\Honeyview\BMPath11'
            '\Software\Honeyview\sStoreFilePath'
            '\Software\Iridium\BrowserExitCodes'
            '\Software\JBSoftware\MemoMaster5\FileMRU12'
            '\Software\kishDesign\CopyTo\settings3\scutname01'
            
              '\Software\Microsoft\Office\14.0\Excel\Security\Trusted Documents' +
              '\TrustRecords'
            '\Software\Microsoft\Office\15.0\Word\Recent Templates'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 10'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 10'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 10'
            '\Software\Microsoft\VisualStudio\11.0\FileMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 11'
            '\Software\MindGems\Audio Dedupe\Settings\MoveToFolder'
            
              '\Software\MindGems\Fast Duplicate File Finder\Settings\MoveToFol' +
              'der'
            
              '\Software\MindGems\Visual Similarity Duplicate Image Finder\Sett' +
              'ings\MoveToFolder'
            '\Software\Nero\Nero 11\Nero Burning ROM\Settings\WorkingDir'
            '\Software\PowerISO\SCDEmu\ImageName11'
            '\Software\Roxio\EMC14\VideoUI\RecentFiles\Catalogs'
            '\Software\SnapShot\RecentHashFile1'
            '\Software\SolidWorks\SOLIDWORKS 2020\Recent Folder List'
            
              '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-1' +
              '1'
            
              '\Software\TechSmith\Camtasia Studio\18.0\Camtasia Studio\18.0\Re' +
              'centRecordingsMru'
            '\Software\TechSmith\Snagit\12\SnagItEditor\Tray\Thumbnailsize'
            '\Software\VSO\DVD Converter Ultimate\2\MediaLabel'
            '\Software\XnView\Start\FileName_1'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2017\Backup Project\B' +
              'ackupOptions\CustomLocation'
            '\Software\Microsoft\VisualStudio\11.0\Find\Replace 19'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2017\Browse Image Pro' +
              'ject\BrowseImageFile\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2017\Browse Image Pro' +
              'ject\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 0'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2017\Burn Image Proje' +
              'ct\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 1'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2017\Burn Image Proje' +
              'ct\SelectImage\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 2'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2017\Data Disc Projec' +
              't\DumpImage\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 3'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2017\Data Disc Projec' +
              't\SaveDialog_AddFilesAndDirs\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 4'
            '\Software\Ashampoo\Ashampoo Burning Studio 2017\Logs'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 5'
            '\Software\Ashampoo\Ashampoo Burning Studio 2017\tempFiles'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 6'
            '\Software\Ashampoo\Ashampoo Burning Studio 2017\Unknown Project'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 7'
            '\Software\ABBYY\FineReader\8.00\Shell\Dialogs\SaveToPath'
            '\Software\ACD Systems\ACDSee Professional\120\HistPaths'
            
              '\Software\Adobe\Adobe Acrobat\DC\RememberedViews\cNoCategoryFile' +
              's'
            '\Software\Adobe\Adobe Synchronizer\DC'
            
              '\Software\Adobe\Photoshop Elements\16.0\common\settings\Elements' +
              ' MRU'
            '\Software\Ashampoo\Ashampoo Burning Studio 14\tempFiles'
            
              '\Software\Atlantis Word Processor\Internal\Envelopes\LastAddrBoo' +
              'k'
            '\Software\Attribute Changer\File Settings\RandomDateMax'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\TrackEraser.LastScan' +
              '.Removed'
            '\Software\Axialis\IconWorkshop\rss\News9'
            '\Software\BreakPoint\Hex Workshop v6.7\Compare\Source File'
            '\Software\CyberLink\Power2Go9\9.0\MediaObj\MediaCache5\Data5'
            
              '\Software\CyberLink\PowerDirector15\MediaObj\MediaCache5\Thumbna' +
              'il5'
            
              '\Software\CyberLink\PowerDVD19\CLMPSvc\MediaObj\MediaCache5\Data' +
              '5'
            '\Software\DivXNetworks\DivX4Windows\YUV Dir Name'
            '\Software\DownloadManager\13'
            '\Software\Dragon Software\Dragon UnPACKer 5\Options\Recent_9'
            '\Software\ElcomSoft\Advanced PDF Password Recovery\Recent Files'
            '\Software\Far2\SavedViewHistory'
            '\Software\Foxit Software\Foxit PhantomPDF 8.0\plugins\JSPlugins'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 12'
            '\Software\Game Maker\Version 5\Preferences\Recent6'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\FindInFiles\Repla' +
              'ce\History'
            '\Software\Honeyview\BMPath12'
            '\Software\Honeyview\sStoreFilePath2'
            '\Software\JBSoftware\MemoMaster5\FileMRU13'
            '\Software\kishDesign\CopyTo\settings3\scutname02'
            '\Software\Microsoft\Office\14.0\Word\Reading Locations'
            '\Software\Microsoft\Office\16.0\Common\OfficeStart\Web\Templates'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 11'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 11'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 11'
            '\Software\Microsoft\VisualStudio\11.0\LastLoadedSolution'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 12'
            '\Software\MindGems\Audio Dedupe\Settings\QuickCheckExt'
            
              '\Software\MindGems\Fast Duplicate File Finder\Settings\QuickChec' +
              'kExt'
            
              '\Software\MindGems\Visual Similarity Duplicate Image Finder\Sett' +
              'ings\QuickCheckExt'
            '\Software\Nero\Nero 11\Nero CoverDesigner\Recent File List'
            '\Software\PowerISO\SCDEmu\ImageName12'
            '\Software\Roxio\EMC14\VideoUI\RecentFiles\DVD Projects'
            '\Software\Slimjet\BrowserExitCodes'
            '\Software\SnapShot\RecentHashFile2'
            
              '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-1' +
              '2'
            '\Software\TechSmith\Snagit\13\CaptureCount'
            '\Software\VSO\DVD Converter Ultimate\3\input_MRUfiles_audio'
            '\Software\XnView\Start\FileName_2'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2017\VCD Project\Save' +
              'Dialog_OnAddMovies\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 8'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2017\VIDEO_TS Disc Pr' +
              'oject\DumpImage\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 9'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2017\VIDEO_TS Disc Pr' +
              'oject\SelectVideoTSFolder\VideoTSPath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 10'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2018\Audio Disc Proje' +
              'ct\SaveDialog_CPlaylistDlgEx\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 11'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2018\Backup Project\B' +
              'ackupOptions\CustomLocation'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 12'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2018\Browse Image Pro' +
              'ject\BrowseImageFile\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 13'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2018\Browse Image Pro' +
              'ject\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 14'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2018\Burn Image Proje' +
              'ct\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 15'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2018\Burn Image Proje' +
              'ct\SelectImage\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 16'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2018\Data Disc Projec' +
              't\DumpImage\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 17'
            
              '\Software\ABBYY\FineReader\8.00\Shell\Dialogs\StandardBatchOptio' +
              'nsPath'
            '\Software\ACD Systems\ACDSee Professional\120\LastOptionPageName'
            
              '\Software\Adobe\Adobe Acrobat\DC\SessionManagement\uLastAppExitT' +
              'imeStamp'
            '\Software\Adobe\Photoshop Elements\16.0\CurrentMediaFilePath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 15\Data Disc Project\' +
              'SaveDialog_AddFilesAndDirs\InitialDirectory'
            '\Software\Atlantis Word Processor\Internal\Envelopes\RetAddr'
            '\Software\Attribute Changer\File Settings\RandomDateMin'
            '\Software\Axialis\IconWorkshop\rss\News10'
            '\Software\BreakPoint\Hex Workshop v6.7\Compare\Target File'
            
              '\Software\CyberLink\Power2Go9\9.0\MediaObj\MediaCache5\Thumbnail' +
              '5'
            '\Software\CyberLink\PowerDirector16\MediaObj\MediaCache5\Data5'
            
              '\Software\CyberLink\PowerDVD19\CLMPSvc\MediaObj\MediaCache5\Prog' +
              'ramInfo'
            '\Software\DivXNetworks\DivXBrowserPlugin\cacheEntry1'
            '\Software\DownloadManager\14'
            '\Software\Far2\Viewer\LastPositions'
            
              '\Software\Foxit Software\Foxit PhantomPDF 8.0\Preferences\Histor' +
              'y'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 13'
            '\Software\Game Maker\Version 5\Preferences\Recent7'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\FindInFiles\Repla' +
              'ce\Patterns'
            '\Software\Honeyview\BMPath13'
            '\Software\Honeyview\transf.sTargetFolder'
            '\Software\JBSoftware\MemoMaster5\FileMRU14'
            '\Software\kishDesign\CopyTo\settings3\scutname03'
            
              '\Software\Microsoft\Office\14.0\Word\Security\Trusted Documents\' +
              'TrustRecords'
            '\Software\Microsoft\Office\16.0\Excel\Recent Templates'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 12'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 12'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 12'
            '\Software\Microsoft\VisualStudio\11.0\ProjectMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 13'
            '\Software\MindGems\Audio Dedupe\Settings\QuickCheckFileNameWords'
            
              '\Software\MindGems\Fast Duplicate File Finder\Settings\QuickChec' +
              'kFileNameWords'
            
              '\Software\MindGems\Visual Similarity Duplicate Image Finder\Sett' +
              'ings\QuickCheckFileNameWords'
            
              '\Software\Nero\Nero 11\Nero Express\Compilation\VolumeLabelAutoT' +
              'emplate'
            '\Software\PowerISO\SCDEmu\ImageName13'
            '\Software\Roxio\EMC14\VideoUI\RecentFiles\Productions'
            '\Software\SnapShot\RecentHashFile3'
            
              '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-1' +
              '3'
            '\Software\Superbird\BrowserExitCodes'
            '\Software\TechSmith\Snagit\13\CaptureOpenCount'
            '\Software\VSO\DVD Converter Ultimate\3\input_MRUfiles_bluray'
            '\Software\XnView\Start\FileName_3'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2018\Data Disc Projec' +
              't\SaveDialog_AddFilesAndDirs\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 18'
            '\Software\Ashampoo\Ashampoo Burning Studio 2018\Logs'
            '\Software\Microsoft\VisualStudio\12.0\Find\Find 19'
            '\Software\Ashampoo\Ashampoo Burning Studio 2018\tempFiles'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace'
            '\Software\Ashampoo\Ashampoo Burning Studio 2018\Unknown Project'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 0'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2018\VCD Project\Save' +
              'Dialog_OnAddMovies\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 1'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2018\VIDEO_TS Disc Pr' +
              'oject\DumpImage\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 2'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2018\VIDEO_TS Disc Pr' +
              'oject\SelectVideoTSFolder\VideoTSPath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 3'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2019\Audio Disc Proje' +
              'ct\SaveDialog_CPlaylistDlgEx\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 4'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2019\Backup Project\B' +
              'ackupOptions\CustomLocation'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 5'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2019\Browse Image Pro' +
              'ject\BrowseImageFile\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 6'
            '\Software\ABBYY\FineReader\8.00\Shell\Options\LastBatchPath'
            '\Software\ACD Systems\ACDSee Professional\120\OnlineHistPaths'
            '\Software\Adobe\Adobe Acrobat\DC\ShareIdentity'
            
              '\Software\Adobe\Photoshop Elements\16.0\VisitedDirs\STARTUPIMAGE' +
              'DIRECTORY'
            '\Software\Ashampoo\Ashampoo Burning Studio 15\tempFiles'
            '\Software\Atlantis Word Processor\Internal\FindReplace'
            '\Software\Attribute Changer\File Settings\RandomTimeMax'
            '\Software\Axialis\IconWorkshop\rss\News11'
            
              '\Software\BreakPoint\Hex Workshop v6.7\Expression Calc\LastExpre' +
              'ssion'
            '\Software\CyberLink\Power2Go10\10.0\CDRippingPath'
            
              '\Software\CyberLink\PowerDirector16\MediaObj\MediaCache5\Thumbna' +
              'il5'
            
              '\Software\CyberLink\PowerDVD19\CLMPSvc\MediaObj\MediaCache5\Thum' +
              'bnail5'
            '\Software\DivXNetworks\DivXBrowserPlugin\cacheEntry2'
            '\Software\DownloadManager\15'
            '\Software\Far18\Editor\LastPositions'
            '\Software\Foxit Software\Foxit PhantomPDF 8.0\Recent File List'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 14'
            '\Software\Game Maker\Version 6\Preferences\GameDir'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\FindInFiles\Setti' +
              'ngs\RecentMasks'
            '\Software\Honeyview\BMPath14'
            '\Software\JBSoftware\MemoMaster5\FileMRU15'
            '\Software\kishDesign\CopyTo\settings3\scutname04'
            
              '\Software\Microsoft\Office\15.0\Common\Internet\UseRWHlinkNaviga' +
              'tion'
            '\Software\Microsoft\Office\16.0\PowerPoint\Recent Templates'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 13'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 13'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 13'
            '\Software\Microsoft\VisualStudio\12.0\FileMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 14'
            
              '\Software\Nero\Nero 11\Nero Express\Compilation\VolumeLabelISOTe' +
              'mplate'
            '\Software\PowerISO\SCDEmu\ImageName14'
            '\Software\SnapShot\RecentHashFile4'
            
              '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-1' +
              '4'
            '\Software\TechSmith\Snagit\13\OutputDirLastUsed'
            '\Software\Torch\BrowserExitCodes'
            '\Software\VSO\DVD Converter Ultimate\3\input_MRUfiles_dvd'
            '\Software\XnView\Start\FileName_4'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2019\Browse Image Pro' +
              'ject\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 7'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2019\Burn Image Proje' +
              'ct\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 8'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2019\Burn Image Proje' +
              'ct\SelectImage\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 9'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2019\Data Disc Projec' +
              't\DumpImage\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 10'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2019\Data Disc Projec' +
              't\SaveDialog_AddFilesAndDirs\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 11'
            '\Software\Ashampoo\Ashampoo Burning Studio 2019\Logs'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 12'
            '\Software\Ashampoo\Ashampoo Burning Studio 2019\tempFiles'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 13'
            '\Software\Ashampoo\Ashampoo Burning Studio 2019\Unknown Project'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 14'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2019\VCD Project\Save' +
              'Dialog_OnAddMovies\InitialDirectory'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 15'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2019\VIDEO_TS Disc Pr' +
              'oject\DumpImage\ImagePath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 16'
            '\Software\ABBYY\FineReader\8.00\Shell\Options\LastTAScenario'
            '\Software\ACD Systems\ACDSee Professional\120\OpenFolder'
            '\Software\Adobe\Adobe Synchronizer\DC'
            
              '\Software\Adobe\Photoshop Elements\17.0\common\settings\Elements' +
              ' MRU'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\Audio Disc Project' +
              '\SaveDialog_CPlaylistDlgEx\InitialDirectory'
            '\Software\Atlantis Word Processor\LangHistory'
            '\Software\Attribute Changer\File Settings\RandomTimeMin'
            '\Software\Axialis\IconWorkshop\rss\News12'
            '\Software\BreakPoint\Hex Workshop v6.7\FileGoto\goto_MRU_0'
            '\Software\CyberLink\Power2Go10\10.0\CUEName'
            '\Software\CyberLink\PowerDirector17\MediaObj\MediaCache5\Data5'
            
              '\Software\CyberLink\PowerDVD20\CLMPSvc\MediaObj\MediaCache5\Data' +
              '5'
            '\Software\DivXNetworks\DivXBrowserPlugin\cacheEntry3'
            '\Software\DownloadManager\16'
            '\Software\Far18\SavedDialogHistory'
            
              '\Software\Foxit Software\Foxit PhantomPDF 9.0\CommentPanel\Filte' +
              'r'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 15'
            '\Software\Game Maker\Version 6\Preferences\Recent0'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\FindInFiles\Setti' +
              'ngs\RecentPaths'
            '\Software\Honeyview\BMPath15'
            '\Software\kishDesign\CopyTo\settings3\scutname05'
            '\Software\Microsoft\Office\15.0\Word\Reading Locations'
            '\Software\Microsoft\Office\16.0\Word\Recent Templates'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 14'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 14'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 14'
            '\Software\Microsoft\VisualStudio\12.0\LastLoadedSolution'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 15'
            
              '\Software\Nero\Nero 11\Nero Express\Compilation\VolumelabelJolie' +
              'tTemplate'
            '\Software\PowerISO\SCDEmu\ImageName15'
            '\Software\SnapShot\RecentHashFile5'
            
              '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-1' +
              '5'
            '\Software\TechSmith\Snagit\13\VidOutputDirLastUsed'
            '\Software\VSO\DVD Converter Ultimate\3\input_MRUfiles_iso'
            '\Software\XnView\Start\FileName_5'
            '\Software\Yandex\YandexBrowser\BrowserExitCodes'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 2019\VIDEO_TS Disc Pr' +
              'oject\SelectVideoTSFolder\VideoTSPath'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 17'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 18'
            '\Software\Microsoft\VisualStudio\12.0\Find\Replace 19'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 0'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 1'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 2'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 3'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 4'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 5'
            '\Software\ABBYY\FineReader\9.00\Shell\Dialogs\ExportTAPath'
            '\Software\ACD Systems\ACDSee Standard\210\HistMCFDestFolder'
            '\Software\Adobe\Photoshop Elements\17.0\CurrentMediaFilePath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\Backup Project\Bac' +
              'kupOptions\CustomLocation'
            '\Software\Atlantis Word Processor\LoadSave\DocFolder'
            '\Software\Attribute Changer\Folder Settings\!DTDateMax'
            '\Software\Axialis\IconWorkshop\rss\News13'
            '\Software\BreakPoint\Hex Workshop v6.7\FileGoto\goto_MRU_count'
            '\Software\CyberLink\Power2Go10\10.0\CUEPath'
            
              '\Software\CyberLink\PowerDirector17\MediaObj\MediaCache5\Thumbna' +
              'il5'
            
              '\Software\CyberLink\PowerDVD20\CLMPSvc\MediaObj\MediaCache5\Prog' +
              'ramInfo'
            '\Software\DivXNetworks\DivXBrowserPlugin\cacheEntry4'
            '\Software\DownloadManager\17'
            '\Software\Far18\SavedDialogHistory\PersPath'
            
              '\Software\Foxit Software\Foxit PhantomPDF 9.0\Foxit PhantomPDF A' +
              'dvanced Editor\Recent File List'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 16'
            '\Software\Game Maker\Version 6\Preferences\Recent1'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\Arith\Rec' +
              'ent'
            '\Software\Honeyview\BMPath16'
            '\Software\kishDesign\CopyTo\settings3\scutname06'
            
              '\Software\Microsoft\Office\16.0\Common\Internet\UseRWHlinkNaviga' +
              'tion'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 15'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 15'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 15'
            '\Software\Microsoft\VisualStudio\12.0\ProjectMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 16'
            
              '\Software\Nero\Nero 11\Nero Express\Compilation\VolumeLabelUDFTe' +
              'mplate'
            '\Software\PowerISO\SCDEmu\ImageName16'
            '\Software\SnapShot\RecentHashFile6'
            
              '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-1' +
              '6'
            '\Software\TechSmith\Snagit\13\Recent Captures'
            '\Software\VSO\DVD Converter Ultimate\3\input_MRUfiles_subtitle'
            '\Software\XnView\Start\FileName_6'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 6'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 7'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 8'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 9'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 10'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 11'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 12'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 13'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 14'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 15'
            '\Software\ABBYY\FineReader\9.00\Shell\Dialogs\ImportTAPath'
            '\Software\ACD Systems\ACDSee Standard\210\HistPaths'
            
              '\Software\Adobe\Photoshop Elements\17.0\VisitedDirs\STARTUPIMAGE' +
              'DIRECTORY'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\BDMV Disc Project\' +
              'SelectBDMVFolder\BdmvPath'
            '\Software\Atlantis Word Processor\LoadSave\DocsToReload'
            '\Software\Attribute Changer\Folder Settings\!DTDateMin'
            '\Software\Axialis\IconWorkshop\rss\News14'
            '\Software\BreakPoint\Hex Workshop v6.7\FileGoto\lastStr'
            '\Software\CyberLink\Power2Go10\10.0\DestFolder'
            '\Software\CyberLink\PowerDirector17\OldCacheFolder'
            
              '\Software\CyberLink\PowerDVD20\CLMPSvc\MediaObj\MediaCache5\Thum' +
              'bnail5'
            '\Software\DivXNetworks\DivXBrowserPlugin\cacheEntry5'
            '\Software\DownloadManager\18'
            '\Software\Far18\SavedFolderHistory'
            '\Software\Foxit Software\Foxit PhantomPDF 9.0\MRU\File MRU'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 17'
            '\Software\Game Maker\Version 6\Preferences\Recent2'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\Bitwise\H' +
              'istory'
            '\Software\Honeyview\BMPath17'
            '\Software\kishDesign\CopyTo\settings3\scutname07'
            '\Software\Microsoft\Office\16.0\PowerPoint\RecentAnimationList'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 16'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 16'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 16'
            '\Software\Microsoft\VisualStudio\14.0\FileMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 17'
            '\Software\Nero\Nero 11\Nero Express\General\OFDLastAudioDir'
            '\Software\PowerISO\SCDEmu\ImageName17'
            '\Software\SnapShot\RecentHashFile7'
            
              '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-1' +
              '7'
            '\Software\TechSmith\Snagit\13\SnagitEditor\Recent File List'
            '\Software\VSO\DVD Converter Ultimate\3\input_MRUfiles_video'
            '\Software\XnView\Start\FileName_7'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 16'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 17'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 18'
            '\Software\Microsoft\VisualStudio\14.0\Find\Replace 19'
            '\Software\ABBYY\FineReader\9.00\Shell\Dialogs\LoadImagePath'
            '\Software\ACD Systems\ACDSee Standard\210\LastOptionPageName'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\Browse Image Proje' +
              'ct\BrowseImageFile\ImagePath'
            '\Software\Atlantis Word Processor\LoadSave\Ebook_LastSavedDoc'
            '\Software\Attribute Changer\Folder Settings\!DTTimeMax'
            '\Software\Axialis\IconWorkshop\rss\News15'
            '\Software\BreakPoint\Hex Workshop v6.7\Find\Value0'
            '\Software\CyberLink\Power2Go10\10.0\DVDFolderPath'
            
              '\Software\CyberLink\PowerDVD20\CoarseSnapshot\MediaObj\MediaCach' +
              'e5\Data5'
            '\Software\DivXNetworks\DivXBrowserPlugin\cacheEntry6'
            '\Software\DownloadManager\19'
            '\Software\Far18\SavedHistory'
            '\Software\Foxit Software\Foxit PhantomPDF 9.0\MRU\Place MRU'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 18'
            '\Software\Game Maker\Version 6\Preferences\Recent3'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\Bitwise\P' +
              'atterns'
            '\Software\Honeyview\BMPath18'
            '\Software\kishDesign\CopyTo\settings3\scutname08'
            '\Software\Microsoft\Office\16.0\Word\Reading Locations'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 17'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 17'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 17'
            '\Software\Microsoft\VisualStudio\14.0\LastLoadedSolution'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 18'
            '\Software\Nero\Nero 11\Nero Express\General\OFDLastISODir'
            '\Software\PowerISO\SCDEmu\ImageName18'
            '\Software\SnapShot\RecentHashFile8'
            
              '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-1' +
              '8'
            '\Software\TechSmith\Snagit\13\SnagItEditor\Tray\Thumbnailsize'
            '\Software\VSO\VSO Video Converter\1\input_MRUfiles_audio'
            '\Software\XnView\Start\FileName_8'
            
              '\Software\4kdownload.com\4K Video Downloader\Download\downloaded' +
              'ItemsDb'
            '\Software\4kdownload.com\4K YouTube to MP3\Settings\outputPath'
            '\Software\7-Zip-Zstandard\Extraction\PathHistory'
            
              '\Software\ABBYY\Bonus.ScreenshotReader\9.00\Options\SaveTablePat' +
              'h'
            '\Software\ABBYY\FineReader\7.00\Shell\Dialogs\OpenBatchPath'
            '\Software\ABBYY\Lingvo\15.0\View\LastText'
            '\Software\ABBYY\PDFTransformer\3.00\Transform\TransformOpenPath'
            '\Software\Ability 6.0\Ability PhotoPaint Studio\Recent File List'
            '\Software\Abyssmedia\ScriptCryptor\Settings\mruitem0'
            '\Software\AC74\View64\MRU2'
            '\Software\ACD Systems\ACDSee Pro\90\HistPaths'
            
              '\Software\Acon Digital\Acoustica Premium Edition 6\General\LastA' +
              'udioDir'
            '\Software\AcooBrowser\Acoo Browser\Search\History'
            '\Software\Acro Software Inc\CPW\Title'
            '\Software\Adobe\Acrobat Reader\11.0\AVConversionToPDF'
            '\Software\Adobe\Acrobat Reader\2015\AVGeneral\cRecentFolders'
            '\Software\Adobe\Acrobat Reader\DC\AVConversionFromPDF'
            '\Software\Adobe\Adobe Acrobat\2015\AVGeneral\cRecentFolders'
            '\Software\Adobe\Adobe Acrobat\DC\AVConversionFromPDF\cSettings'
            '\Software\Adobe\Adobe Customization Wizard 9\Recent File List'
            
              '\Software\Adobe\Backup\Preferences\brr2\Software\Adobe\Acrobat R' +
              'eader\8.0\AVGeneral\cRecentFiles'
            '\Software\Adobe\Elements Organizer\13.0\CurrentMediaFilePath'
            '\Software\Adobe\Photoshop Elements\11.0\CurrentMediaFilePath'
            '\Software\Adobe\Premiere Elements\13.0\MRUDocuments'
            '\Software\Ahead\NeroSearch\NeroSavedSearches\SavedSearches'
            '\Software\AKi-Software\Kool-Playa\Videos'
            '\Software\Alcohol Soft\Alcohol 52%\Images'
            '\Software\AloneWolf\FileRen\LastExt'
            '\Software\AloneWolf\HideTrace\PathHt'
            '\Software\AloneWolf\HTMLOpt\Dir2'
            '\Software\AloneWolf\SignPhoto\Text'
            '\Software\AloneWolf\TextReplacer\String1'
            '\Software\Amazon\Kindle\User Settings\last_syncmetadata_date'
            '\Software\Amigo\BrowserExitCodes'
            '\Software\AMP Soft\Font Viewer\Last file operarion folder'
            '\Software\Andrew Zhezherun\WinDjView\Recent File List'
            
              '\Software\Antibody Software\Bulk Image Downloader\frmBIM\OpenDia' +
              'log1.InitialDir'
            '\Software\A-PDF\PDFContentSplitter\Setting\hSaveallpdfpath'
            '\Software\A-PDF\Watermark\Setting\hdoutDir'
            '\Software\AppDataLow\IEPro\VisitedTabs'
            '\Software\Ares\GUI.LastSearch'
            '\Software\Artifex Software\gsview 6.0\Page'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 5\Data Disc Project\A' +
              'ddDialog'
            '\Software\Ashampoo\Ashampoo PDF\Recent File List'
            
              '\Software\Atlantis Word Processor\ClipLib\AddTextClip_RecentFold' +
              'er'
            '\Software\AtomicWare\Atomic Cleaner\Last Used'
            '\Software\Attribute Changer\File Settings\!DTDateMin'
            
              '\Software\Aurigma\ImageUploader\Image Uploader 5.0\LastVisitedAs' +
              'StringHash'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\DiskCleaner.AppLogic' +
              '.ErrorsFound'
            
              '\Software\Auslogics\Registry Cleaner\2.x\Settings\RegCleaner.App' +
              'Logic.ErrorsFound'
            '\Software\Autodesk\AutoCAD\R18.0\ACAD-8001:409\Recent File List'
            '\Software\Autodesk\Inventor\RegistryVersion20.0\Recent File List'
            '\Software\AutoIt v3\Aut2Exe\LastIcon'
            '\Software\Axialis\IconWorkshop\folders\CurrentImportDirectory'
            '\Software\BenVista\PhotoZoom Pro 6\Recent Images'
            '\Software\Bitstream\Font Navigator\6.0\Move\Folders'
            '\Software\Bomers\Restorator\Restorator\FindDialog'
            '\Software\Borland\BDS\4.0\Closed Projects'
            '\Software\Borland\C++Builder\5.0\Closed Projects'
            '\Software\Borland\Delphi\7.0\Closed Projects'
            '\Software\BraveSoftware\Brave-Browser-Beta\BrowserExitCodes'
            '\Software\BreakPoint\Hex Workshop v5\FileGoto\lastStr'
            '\Software\BreakPoint\SIP Workbench\file2'
            '\Software\Bugsplat\lol_beta_riotgames_com\LOL_Public'
            '\Software\CDROM_Productions\CDRDIAG\LastDevice'
            '\Software\Centarsia\RecentImage1'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.MicrosoftEdge_8wekyb' +
              '3d8bbwe\PersistedPickerData\Microsoft.MicrosoftEdge_8wekyb3d8bbw' +
              'e!MicrosoftEdge\DefaultOpenFileMultiple'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\microsoft.microsoftskydrive_8w' +
              'ekyb3d8bbwe\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.Reader_8wekyb3d8bbwe' +
              '\SearchHistory'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.ScreenSketch_8wekyb3' +
              'd8bbwe\PersistedPickerData\Microsoft.ScreenSketch_8wekyb3d8bbwe!' +
              'App\DefaultOpenFileSingle\LastLocation'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.Windows.Photos_8weky' +
              'b3d8bbwe\PersistedStorageItemTable\ManagedByApp'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Shel' +
              'l\Bags'
            '\Software\CodeGear\BDS\6.0\Closed Projects'
            '\Software\CompSoft\PortScan\ScanStart'
            '\Software\Corel\PaintShop Pro\X10\CoreMemoryManager\0'
            '\Software\Corel\User Assistant\12\Recent Work\Presentations'
            '\Software\csvconverter\LASTEXPORT'
            '\Software\CursorArts\MRU Library Items'
            
              '\Software\CyberLink\AudioDirector4\MediaObj\MediaCache5\Thumbnai' +
              'l5'
            
              '\Software\CyberLink\ColorDirector3\MediaObj\MediaCache5\Thumbnai' +
              'l5'
            '\Software\CyberLink\MediaCache\Data4'
            '\Software\CyberLink\Power2Go9\9.0\CDRippingPath'
            '\Software\CyberLink\PowerDirector10\MediaObj\MediaCache5\Data5'
            
              '\Software\CyberLink\PowerDVD15\CLMPSvc\MediaObj\MediaCache5\Prog' +
              'ramInfo'
            '\Software\DAMN\DAMN NFO Viewer\Recently Viewed Files'
            '\Software\Daum\PotPlayerMini64\RememberFiles'
            '\Software\Death Knight\DivFix++\PathOut'
            '\Software\Debenu\Debenu PDF Maximus 2\MaximusViewerRecentFolders'
            '\Software\DivX\Settings\Converter\outputDir'
            '\Software\DJI Interprises\Newsbin Pro\Recent File List'
            '\Software\DOLKR64\Misc\OpenDirectory'
            '\Software\DownloadManager\2'
            
              '\Software\Dragon Software\Dragon UnPACKer 5\Options\LastFilterIn' +
              'dex'
            '\Software\DT Soft\DAEMON Tools Pro\GuiNamespace\MountFolder'
            '\Software\Duplicate Photo Finder\last1'
            '\Software\DVDx\LastOutput'
            '\Software\EasyBoot Systems\UltraISO\5.0\OpenFolder'
            '\Software\eBay\eBayToolbar\RecentSearches'
            '\Software\Echo Software\PN2\Find\ReplaceText'
            '\Software\Eclipsit\Microangelo\Toolset 6\Librarian\MRU List'
            '\Software\Eden\ConTEXT\FindHistory'
            
              '\Software\ElcomSoft\Advanced Archive Password Recovery\Recent Fi' +
              'les'
            '\Software\EmSoft\EmEditor v3\Recent Folder List'
            '\Software\ESRI\Desktop10.0\ArcMap\Recent File List'
            '\Software\EvolutionComputing\CC3View\2'
            
              '\Software\ExactFile\FormMain_Properties\EditCDFolderOutputFileNa' +
              'me.Text'
            '\Software\FabPlayer\DefaultFile'
            '\Software\famatech\Advanced Port Scanner\LastUsedPortsListPath'
            '\Software\famatech\advanced_ip_scanner\State\IpRangesMruList'
            '\Software\Far\SavedDialogHistory'
            '\Software\FastStone\_LastRecordingFileName'
            '\Software\Foxit Software\Foxit PDF Editor 11.0\MRU\File MRU'
            
              '\Software\Foxit Software\Foxit PhantomPDF 6.0\Preferences\Histor' +
              'y'
            '\Software\Foxit Software\Foxit Reader 7.0\MRU'
            '\Software\Frhed\Settings\0\MRU_File2'
            '\Software\FTP Password Kracker\Port'
            '\Software\FutureFog\Phorest\Layout\SelectionLeft'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 1'
            '\Software\Gabest\vsfilter\DefTextPathes\Path1'
            '\Software\Gabriele Ponti\Send To Toys\RecentFolders'
            '\Software\Game Maker 4\Preferences\Recent0'
            '\Software\gBurner\Reopen1'
            '\Software\GetFLV\DownloadDir'
            '\Software\GOFF Concepts\FileSearchEX\Sys_LookinHistory'
            '\Software\GRAHL\PDFAnnotator\4.0\Files\MRUItems'
            '\Software\grepWin\History'
            '\Software\GridinSoft\Notepad3\Search\ReplaceTextHistory'
            '\Software\grigsoft.com\Synchronize It!\Synchronize It!\Combos'
            '\Software\Headlight\GetRight\ResumeServers'
            '\Software\HHD Software\Hex Editor 6.sm\Structure Editor\Recent'
            '\Software\HighCriteria\TotalRecorder\Recent File list\File2'
            '\Software\Honeyview\BMPath1'
            '\Software\Honeyview\RecentFolder1'
            '\Software\Hyperionics\HyperSnap 8\Recent File List'
            '\Software\ImageDupeless\ImageDupeless\Recent File List'
            '\Software\ImgBurn\ISOREAD_RecentFolders_Destination'
            
              '\Software\ImTOO\Video Converter Ultimate\Settings\last_output_di' +
              'r'
            '\Software\Ingit\MapGPS\MapGPS\RARU0205 Recent Files'
            
              '\Software\Innovative Solutions\Advanced Uninstaller PRO\10\compr' +
              'ess\listHistoryText'
            '\Software\InstallShield\17.0\Professional\Recent File List'
            '\Software\IrekZielinskiSoft\TimeAdjuster\LDIR2'
            '\Software\JASC\Animation Shop\Cache'
            '\Software\JBSoftware\MemoMaster5\FileMRU2'
            '\Software\Josip Medved\VHD Attach\RecentFiles'
            '\Software\kishDesign\CopyTo\settings3\scutFolder01'
            '\Software\L0pht Holdings LLC\L0phtCrack 6\Settings\Last LC File'
            '\Software\Lavasoft\Reghance\LastBkmfile'
            '\Software\LDAPSearch_Nag\CertPath'
            '\Software\LibreCAD\/LibreCAD\Paths\Save'
            '\Software\LimePro\GUI.LastSearch'
            
              '\Software\Local AppWizard-Generated Applications\ExpertGHID\Rece' +
              'nt File List'
            '\Software\MacheteSoft\Machete\Recent File List'
            '\Software\Macromedia\Shockwave 9\movies'
            
              '\Software\MAGIX AG\Videodeluxe19_pro\ExportConfigurator\DialogIt' +
              'ems\LastPreset'
            '\Software\ManiacTools\mp3Tag Pro\fmImageSave'
            '\Software\ManiacTools\MusicDuplicate\DuplicatesFolders'
            '\Software\Mediachance\UtraSnapPRO\Recent File List'
            '\Software\MediaScience\Sonique\URL_History'
            '\Software\metapad\mru_2'
            '\Software\Microsoft\Edge Dev\BrowserExitCodes'
            '\Software\Microsoft\HTML Help Workshop\Html Titles'
            '\Software\Microsoft\IntelliType Pro\AppSpecific'
            '\Software\Microsoft\Internet Explorer\LowRegistry\DOMStorage'
            '\Software\Microsoft\MediaPlayer\Preferences\CDRecordPath'
            '\Software\Microsoft\Microsoft DVD Wizard Settings\Browse 5'
            '\Software\Microsoft\Microsoft Help Workshop\Forage Files'
            
              '\Software\Microsoft\Microsoft SQL Server\80\Tools\Shell\ProjectM' +
              'RUList'
            '\Software\Microsoft\MM20\ImportDirAudio'
            '\Software\Microsoft\MPEG2Demultiplexer\WriteCapturePath'
            '\Software\Microsoft\Notepad\searchString'
            '\Software\Microsoft\Office\11.0\Excel\FontInfoCache'
            '\Software\Microsoft\Office\11.0\Outlook\Office Finder\MRU 2'
            '\Software\Microsoft\Office\11.0\Outlook\Preferences\LocationMRU'
            '\Software\Microsoft\Office\12.0\Excel\Recent Templates'
            '\Software\Microsoft\Office\14.0\MS Project\Recent Templates'
            '\Software\Microsoft\UserData\UninstallTimes'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 0'
            '\Software\Microsoft\VBExpress\10.0\ProjectMRUList'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 0'
            '\Software\Microsoft\VCExpress\10.0\ProjectMRUList'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 0'
            '\Software\Microsoft\VCSExpress\10.0\ProjectMRUList'
            '\Software\Microsoft\Visual Studio\10.0\FileMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 1'
            
              '\Software\Microsoft\Windows Live\Movie Maker\browseforpicturesdi' +
              'rectory'
            
              '\Software\Microsoft\Windows Live\Photo Aquisition\Camera\RootDir' +
              'ectory'
            
              '\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Com' +
              'patibility Assistant\Store'
            
              '\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManage' +
              'r\SuggestedApps'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage' +
              '\AppLaunch'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage2\P' +
              'rogramsCache'
            
              '\Software\Microsoft\Windows\CurrentVersion\Photo Aquisition\Came' +
              'ra\FilenameTemplate'
            
              '\Software\Microsoft\Windows\CurrentVersion\RunOnce\APR_DEACTIVAT' +
              'ED'
            '\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps'
            
              '\Software\Microsoft\Windows\CurrentVersion\Security and Maintena' +
              'nce\Providers\EventLog'
            '\Software\Microsoft\Windows\Shell\MUICache'
            '\Software\MindGems\Audio Dedupe\MRU2'
            '\Software\MindGems\Easy Web Gallery Builder\2.2\MRU2'
            '\Software\MindGems\Fast Duplicate File Finder\MRU2'
            '\Software\MindGems\Visual Similarity Duplicate Image Finder\MRU2'
            '\Software\MiTeC\DFM Editor\6.x\wnd_dfm_Main\Twnd_dfm_Main.MRUMan'
            '\Software\MiTeC\HexEditor\4.x\wnd_hex_Main\sd_InitialDir'
            
              '\Software\MiTeC\Icon Explorer\4.x\wnd_icoexp_Main\ShellTree_Star' +
              'tInFolder'
            '\Software\MiTeC\SSViewer\3.x\wnd_re_Main\MRUHistory'
            '\Software\MiTeC\WRR\1.x\dlg_wrr_Find\eFind_Items'
            '\Software\MKowalski\ExifPro\1.0\HTMLAlbumGen\RecentDestPaths'
            '\Software\Monkey'#39's Audio\Settings\Add Folder MRU List'
            
              '\Software\Moon Valley Software\ROM With a View - Director'#39's Cut\' +
              'Recent File List'
            '\Software\MPEG Audio Collection\LastNameText2'
            '\Software\MySoftware\IEToy\FRAGS_popup'
            '\Software\Mythicsoft\FileLocatorPro\RecentFileName'
            '\Software\N64 Emulation\Project64 Version 1.6\RecentFile2'
            '\Software\NCH Software\PicoPDF\General\lastimagefolder'
            '\Software\NCH Software\Pixillion\Options\Input folder'
            '\Software\Neuber GbR\Security Task Manager\Options\HostKnown'
            '\Software\NextUpTech\TextAloud3\DocFileOpenDirectory'
            '\Software\NirSoft\RegScanner\ExcludeList'
            '\Software\Nitro PDF\Reader\2.0\Recent File List'
            '\Software\NoVirusThanks\DriverRadarPro\edSaveLogsTo'
            '\Software\O&O\O&O SafeErase\7\LastAnalysisDateTime'
            '\Software\OmniNet\OmniTracker\SearchTextHistory'
            '\Software\OneSafe PC Cleaner\InstallerName'
            '\Software\Outertech\GetDiz\Recent Files_2'
            
              '\Software\Parallel Password Recovery\PPR GUI manager\1.0\Last pa' +
              'ssword definition file path'
            '\Software\PDFExplorer\Options\ScanGridStartupFolder'
            '\Software\Pelle Orinius\PellesC\Recent Project List'
            
              '\Software\PepiMK Software\Analysis tools\RegAlyzer\RemoteListHis' +
              'tory'
            '\Software\photoflare.io\PhotoFlare\RecentFiles'
            
              '\Software\PictureTrail Photo Editor\PictureTrail Photo Editor\Re' +
              'cent File List'
            '\Software\Pintosoft\FocusOn Renamer\BRReplaceFrom'
            '\Software\Piriform\Kamo\epochAtLastIPM'
            '\Software\Poikosoft\Easy CD-DA Extractor 8\k80'
            '\Software\PowerISO\SCDEmu\ImageName1'
            '\Software\PrestoSoft\ExamDiff Pro\Recent Center Merged Files'
            '\Software\Prineas\FileViewer\PathC'
            '\Software\Prismatic Software\PhotoBatch\Dialogs\LastBatchFolder'
            '\Software\qbfc\RecentFiles'
            '\Software\QtProject\OrganizationDefaults\FileDialog\lastVisited'
            '\Software\Quizo\QTTabBar\Cache'
            '\Software\RasterVect Software\Free Image Editor\Recent File List'
            '\Software\ReGet Software\ReGetDx\History'
            
              '\Software\Resplendence Sp\Registrar Registry Manager\Settings\Ex' +
              'portForm.saveDialogExportInitialDir'
            '\Software\Roadkil\Target_Unstp'
            '\Software\Rosegardenmusic\Rosegarden\recent-1'
            '\Software\RouterPasswordKracker\ServerAddress'
            '\Software\Roxio\EMC14\Label Creator\Recent File List'
            '\Software\Sanderson Forensics\LinkAlyzer\LastSaveFolder'
            '\Software\SecurityXploded\DirectoryScanner\StartHostAddress'
            '\Software\SecurityXploded\HashKracker\Hash'
            '\Software\SecurityXploded\LDAPPasswordKracker\Port'
            '\Software\SecurityXploded\MysqlPasswordAuditor\Port'
            '\Software\SecurityXploded\NetDatabaseScanner\EndHostAddress'
            '\Software\SecurityXploded\SaltedHashKracker\Hash'
            '\Software\SecurityXploded\SSLCertScanner\ServerAddress'
            '\Software\SecurityXploded\WiFiNetworkMonitor\StartHostAddress'
            '\Software\SecurityXploded\WindowsPasswordKracker\Hash'
            '\Software\Siber Systems\RoboForm\Query-MRU'
            '\Software\Silicon Valley Software\Anim8or\File2'
            '\Software\SketchUp\SketchUp 2014\Recent File List'
            '\Software\Smart PC Solutions\Document Trace Remover\LastFolder'
            '\Software\Smart PC Solutions\Metadata Analyzer\LastFolder'
            '\Software\Smartque\Smart Explorer\Recent Pages'
            '\Software\SnapShot\RecentFile1'
            '\Software\Softany\WinCHM\RecentFile2'
            '\Software\Softpointer\Tag&Rename\Config\FHistoryList'
            '\Software\SolidWorks\SolidWorks 2013\Recent File List'
            '\Software\SolwaySoftware\Control3\LeftDefDir'
            '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-1'
            '\Software\Soulseek2\config\search'
            '\Software\SQLite Expert\Professional\3.x\DB'
            '\Software\sqlitebrowser\sqlitebrowser\General\recentFileList'
            
              '\Software\STOIK Smart Resizer 2.0\STOIK Smart Resizer\Recent Fil' +
              'e List'
            '\Software\StudioLine\StudioLine Photo Basic\WindowPositions'
            '\Software\Sysinternals\Process Monitor\SourcePath'
            '\Software\TeamViewer\Version5.1\Last_Machine_Connections'
            
              '\Software\TechSmith\Camtasia Studio\9.0\Camtasia Studio\9.0\Expo' +
              'rtAsZipMru'
            '\Software\TechSmith\DubIt\Recent Video Files'
            '\Software\TechSmith\Snagit\10\StampCustomFolder'
            '\Software\Teorex\Inpaint\RecentFileList'
            '\Software\Teorex\MultiViewInpaint\RecentFileList'
            '\Software\Teorex\PhotoScissors\RecentFileList'
            
              '\Software\TGRMN Software\Bulk Rename Utility\Settings\last_path_' +
              'selected'
            '\Software\Thingamahoochie\WinMerge\Files\Left'
            
              '\Software\Tipard Studio\Tipard Total Media Converter\Edit\LastVi' +
              'deoFilePath'
            
              '\Software\Tipard Studio\Tipard Video Converter\Edit\LastVideoFil' +
              'ePath'
            '\Software\ToolsCenter\TeXnicCenter\Recent Project List'
            '\Software\TopoGrafix\EasyGPS\Recent File List'
            '\Software\Tracker Software\PDFViewer\Documents\LatestView\Bars'
            '\Software\Trident Software\PowerZip\Recent File List'
            '\Software\Two Pilots\Form Pilot\Settings\InitialDir'
            '\Software\Ulead Systems\Corel VideoStudio Pro\16.0\HerRFL'
            '\Software\Unigraphics Solutions\Solid Edge\Version 110\MRUex'
            '\Software\Update\Locate32\Dialogs\Name/LookIn'
            
              '\Software\VB and VBA Program Settings\MP3GainAnalysis\StartUp\Ad' +
              'dFolderPath'
            
              '\Software\VB and VBA Program Settings\PDFStreamDumper\Settings\l' +
              'astFind'
            
              '\Software\VB and VBA Program Settings\RL Vision\Exif Tag Remover' +
              '\sLastDir'
            
              '\Software\VB and VBA Program Settings\Sobolsoft\Remove Metadata ' +
              'In Multiple Files Software\Snapshot'
            '\Software\VB and VBA Program Settings\Wake-On-Lan\MAC Address'
            '\Software\VicMan Software\Web Photo Album\RecentFile1'
            '\Software\VirtualDub.org\VirtualDub\Saved filespecs'
            '\Software\Vitaliy Levchenko\Renamus\Settings\LastFolder'
            '\Software\VSO\Blu-ray Converter Ultimate\2\ISOInputFolders'
            
              '\Software\Win Sniffer\Etherscan Password Sniffer\Recent Item Lis' +
              't'
            
              '\Software\Windows Grep\Windows Grep\Current Version\Search Dialo' +
              'g\Filespecs'
            '\Software\WinImage\File2'
            '\Software\WinRAR\DialogEditHistory'
            '\Software\WinThruster\LastScanDate'
            '\Software\Xara\Xtreme_SE\6.1\Options\Recent File List'
            '\Software\xlsconverter\LASTEXPORT'
            '\Software\XnView\Start\DirName_1'
            '\Software\Ying3\DLExpert\http'
            
              '\Software\ZabaraKatranemia Plc\xplorer2\MainFrame Settings\Recen' +
              't Document List'
            '\Software\ABBYY\FineReader\9.00\Shell\Dialogs\SaveImagePath'
            '\Software\ACD Systems\ACDSee Standard\210\OnlineHistPaths'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\Browse Image Proje' +
              'ct\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Atlantis Word Processor\OpenDoc_Files'
            '\Software\Attribute Changer\Folder Settings\!DTTimeMin'
            '\Software\Axialis\IconWorkshop\rss\News16'
            '\Software\BreakPoint\Hex Workshop v6.7\Find\Value1'
            '\Software\CyberLink\Power2Go10\10.0\ImagePath'
            
              '\Software\CyberLink\PowerDVD20\CoarseSnapshot\MediaObj\MediaCach' +
              'e5\ProgramInfo'
            '\Software\DownloadManager\20'
            '\Software\Far18\SavedViewHistory'
            '\Software\Foxit Software\Foxit PhantomPDF 9.0\plugins\JSPlugins'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 19'
            '\Software\Game Maker\Version 6\Preferences\Recent4'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\Fill\Hist' +
              'ory'
            '\Software\Honeyview\BMPath19'
            '\Software\kishDesign\CopyTo\settings3\scutname09'
            '\Software\Microsoft\Office\Common\FontBmpCache'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 18'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 18'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 18'
            '\Software\Microsoft\VisualStudio\14.0\ProjectMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 19'
            '\Software\Nero\Nero 11\Nero Express\General\OFDLastVideoDVDKey'
            '\Software\PowerISO\SCDEmu\ImageName19'
            '\Software\SnapShot\RecentHashFile9'
            
              '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-1' +
              '9'
            '\Software\TechSmith\Snagit\18\CaptureCount'
            '\Software\VSO\VSO Video Converter\1\input_MRUfiles_bluray'
            '\Software\XnView\Start\FileName_9'
            '\Software\ABBYY\FineReader\9.00\Shell\Dialogs\SaveToPath'
            '\Software\ACD Systems\ACDSee Standard\210\OpenFolder'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\Burn Image Project' +
              '\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Atlantis Word Processor\RecentDocs'
            '\Software\Attribute Changer\Folder Settings\AccessedValue'
            '\Software\Axialis\IconWorkshop\rss\News17'
            '\Software\BreakPoint\Hex Workshop v6.7\LastPaths'
            '\Software\CyberLink\Power2Go10\10.0\LastBrowsePath'
            
              '\Software\CyberLink\PowerDVD21\CLMPSvc\MediaObj\MediaCache5\Data' +
              '5'
            '\Software\DownloadManager\21'
            '\Software\Far18\Viewer\LastPositions'
            
              '\Software\Foxit Software\Foxit PhantomPDF 9.0\Preferences\Histor' +
              'y'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 20'
            '\Software\Game Maker\Version 6\Preferences\Recent5'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\Fill\Patt' +
              'erns'
            '\Software\Honeyview\BMPath20'
            '\Software\kishDesign\CopyTo\settings3\Source00'
            '\Software\Microsoft\OfficeCustomizeWizard\12.0\RecentFileList'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 19'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 19'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 19'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 0'
            '\Software\Nero\Nero 11\Nero Express\Recent File List'
            '\Software\PowerISO\SCDEmu\ImageName20'
            '\Software\SnapShot\RecentVirtualDrive'
            '\Software\TechSmith\Snagit\18\CaptureOpenCount'
            '\Software\VSO\VSO Video Converter\1\input_MRUfiles_dvd'
            '\Software\XnView\XnViewMP\Start\customPath'
            '\Software\ABBYY\FineReader\9.00\Shell\Options\LastBatchPath'
            '\Software\ACD Systems\ACDSee Standard\220\HistMCFDestFolder'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\Burn Image Project' +
              '\SelectImage\ImagePath'
            '\Software\Atlantis Word Processor\SaveDocAs_Files'
            '\Software\Attribute Changer\Folder Settings\CreatedValue'
            '\Software\Axialis\IconWorkshop\rss\News18'
            '\Software\BreakPoint\Hex Workshop v6.7\Replace\FindString'
            '\Software\CyberLink\Power2Go10\10.0\LastSaveProjPath'
            
              '\Software\CyberLink\PowerDVD21\CLMPSvc\MediaObj\MediaCache5\Prog' +
              'ramInfo'
            '\Software\DownloadManager\22'
            '\Software\Foxit Software\Foxit PhantomPDF 9.0\Recent File List'
            '\Software\Game Maker\Version 6\Preferences\Recent6'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\Find\Hist' +
              'ory'
            '\Software\Honeyview\BMPath21'
            '\Software\kishDesign\CopyTo\settings3\Source01'
            '\Software\Microsoft\OfficeCustomizeWizard\14.0\RecentFileList'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 1'
            '\Software\MPC-BE\RecentFiles'
            '\Software\Nero\Nero 11\Nero Express\Settings\BootImageDir'
            '\Software\PowerISO\SCDEmu\ImageName21'
            '\Software\TechSmith\Snagit\18\OutputDirLastUsed'
            '\Software\VSO\VSO Video Converter\1\input_MRUfiles_iso'
            '\Software\XnView\XnViewMP\Start\History'
            '\Software\ABBYY\FineReader\9.00\Shell\Options\LastTAScenario'
            '\Software\ACD Systems\ACDSee Standard\220\HistPaths'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\Data Disc Project\' +
              'DumpImage\ImagePath'
            '\Software\Attribute Changer\Folder Settings\LimitDateMax'
            '\Software\Axialis\IconWorkshop\rss\News19'
            '\Software\BreakPoint\Hex Workshop v6.7\Replace\ReplaceString'
            '\Software\CyberLink\Power2Go10\10.0\MonitorPaths'
            
              '\Software\CyberLink\PowerDVD21\CLMPSvc\MediaObj\MediaCache5\Thum' +
              'bnail5'
            '\Software\DownloadManager\23'
            '\Software\Game Maker\Version 6\Preferences\Recent7'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\Find\Patt' +
              'erns'
            '\Software\Honeyview\BMPath22'
            '\Software\kishDesign\CopyTo\settings3\Source02'
            '\Software\Microsoft\OfficeCustomizeWizard\15.0\RecentFileList'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 0'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 0'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 0'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 2'
            '\Software\MPC-BE\Settings\DVDPath'
            '\Software\Nero\Nero 11\Nero Express\Settings\BrowserDir'
            '\Software\PowerISO\SCDEmu\ImageName22'
            '\Software\TechSmith\Snagit\18\VidOutputDirLastUsed'
            '\Software\VSO\VSO Video Converter\1\input_MRUfiles_subtitle'
            '\Software\XnView\XnViewMP\Start\PathBrowser'
            '\Software\ABBYY\FineReader\11.00\Shell\Dialogs\SaveToPath'
            '\Software\ACD Systems\ACDSee Standard\220\LastOptionPageName'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\Data Disc Project\' +
              'SaveDialog_AddFilesAndDirs\InitialDirectory'
            '\Software\Attribute Changer\Folder Settings\LimitDateMin'
            '\Software\Axialis\IconWorkshop\rss\News20'
            '\Software\BreakPoint\Hex Workshop v6.7\SectorGoto\goto_MRU_count'
            '\Software\CyberLink\Power2Go10\10.0\OpenPrjFilePath'
            
              '\Software\CyberLink\PowerDVD21\CoarseSnapshot\MediaObj\MediaCach' +
              'e5\Data5'
            '\Software\DownloadManager\24'
            '\Software\Game Maker\Version 7\Preferences\GameDir'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\Goto\Rece' +
              'nt'
            '\Software\Honeyview\BMPath23'
            '\Software\kishDesign\CopyTo\settings3\Source03'
            '\Software\Microsoft\OfficeCustomizeWizard\16.0\RecentFileList'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 1'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 1'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 1'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 3'
            '\Software\MPC-BE\Settings\LastOpenDir'
            '\Software\Nero\Nero 11\Nero Express\Settings\ImageDir'
            '\Software\TechSmith\Snagit\18\Recent Captures'
            '\Software\VSO\VSO Video Converter\1\input_MRUfiles_video'
            '\Software\XnView\XnViewMP\Start\RecentFiles'
            '\Software\ABBYY\FineReader\11.00\Shell\Options\LastTAScenario'
            '\Software\ACD Systems\ACDSee Standard\220\OnlineHistPaths'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\DVD-Video Disc Pro' +
              'ject\MoviesPage\Path'
            '\Software\Attribute Changer\Folder Settings\LimitTimeMax'
            '\Software\Axialis\IconWorkshop\rss\UnreadNews'
            '\Software\BreakPoint\Hex Workshop v6.7\SectorGoto\lastStr'
            '\Software\CyberLink\Power2Go10\10.0\SelectedFolderPath'
            
              '\Software\CyberLink\PowerDVD21\CoarseSnapshot\MediaObj\MediaCach' +
              'e5\ProgramInfo'
            '\Software\DownloadManager\25'
            '\Software\Game Maker\Version 7\Preferences\Recent0'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\Insert\Hi' +
              'story'
            '\Software\Honeyview\BMPath24'
            '\Software\kishDesign\CopyTo\settings3\Source04'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 2'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 2'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 2'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 4'
            '\Software\MPC-BE\Settings\LastOpenFilterDir'
            '\Software\Nero\Nero 11\Nero Express\Settings\NeroCompilation'
            '\Software\TechSmith\Snagit\18\SnagitEditor\Recent File List'
            '\Software\XnView\XnViewMP\Strip\list_folder'
            
              '\Software\ABBYY\FineReader\11.00\Shell\Options\LastWebFoldersNam' +
              'es'
            '\Software\ACD Systems\ACDSee Standard\220\OpenFolder'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\DVD-Video Disc Pro' +
              'ject\SaveDialog_authed.CMoviesPage.Movies\InitialDirectory'
            '\Software\Attribute Changer\Folder Settings\LimitTimeMin'
            '\Software\BreakPoint\Hex Workshop v6.7\SelectBlock\last'
            '\Software\CyberLink\Power2Go10\10.0\MediaObj\MediaCache5\Data5'
            '\Software\DownloadManager\26'
            '\Software\Game Maker\Version 7\Preferences\Recent1'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\Insert\Pa' +
              'tterns'
            '\Software\Honeyview\BMPath25'
            '\Software\kishDesign\CopyTo\settings3\Source05'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 3'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 3'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 3'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 5'
            '\Software\MPC-BE\Settings\LastSavedPlaylistDir'
            '\Software\Nero\Nero 11\Nero Express\Settings\TrackSaveDir'
            '\Software\TechSmith\Snagit\18\SnagItEditor\Tray\Thumbnailsize'
            '\Software\XnView\XnViewMP\Viewer\saveFolder'
            '\Software\ABBYY\FineReader\12.00\Shell\Dialogs\BatchDialogsMRU'
            '\Software\ACD Systems\ACDSee Ultimate\110\HistMCFDestFolder'
            '\Software\Ashampoo\Ashampoo Burning Studio 16\Logs'
            '\Software\Attribute Changer\Folder Settings\ModifiedValue'
            
              '\Software\BreakPoint\Hex Workshop v6.8\Compare\recent_MRU_0sourc' +
              'eFile'
            
              '\Software\CyberLink\Power2Go10\10.0\MediaObj\MediaCache5\Thumbna' +
              'il5'
            '\Software\DownloadManager\27'
            '\Software\Game Maker\Version 7\Preferences\Recent2'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\Insert\Re' +
              'cent'
            '\Software\Honeyview\BMPath26'
            '\Software\kishDesign\CopyTo\settings3\Source06'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 4'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 4'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 4'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 6'
            '\Software\MPC-BE\Settings\SnapShotPath'
            '\Software\Nero\Nero 11\Nero Express\Settings\WorkingDir'
            '\Software\TechSmith\Snagit\19\CaptureCount'
            '\Software\ABBYY\FineReader\12.00\Shell\Dialogs\LoadImagePath'
            '\Software\ACD Systems\ACDSee Ultimate\110\HistPaths'
            '\Software\Ashampoo\Ashampoo Burning Studio 16\tempFiles'
            '\Software\Attribute Changer\Folder Settings\RandomDateMax'
            
              '\Software\BreakPoint\Hex Workshop v6.8\Compare\recent_MRU_0sourc' +
              'eLength'
            '\Software\CyberLink\Power2Go11\11.0\CDRippingPath'
            '\Software\DownloadManager\28'
            '\Software\Game Maker\Version 7\Preferences\Recent3'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\ReplaceFi' +
              'nd\History'
            '\Software\Honeyview\BMPath27'
            '\Software\kishDesign\CopyTo\settings3\Source07'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 5'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 5'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 5'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 7'
            '\Software\MPC-HC\MPC-HC\Settings\SnapshotPath'
            '\Software\Nero\Nero 11\Nero Toolkit\DiscSpeed\Capture\Folder'
            '\Software\TechSmith\Snagit\19\CaptureOpenCount'
            '\Software\ABBYY\FineReader\12.00\Shell\Dialogs\SaveImagePath'
            '\Software\ACD Systems\ACDSee Ultimate\110\LastOptionPageName'
            '\Software\Ashampoo\Ashampoo Burning Studio 16\Unknown Project'
            '\Software\Attribute Changer\Folder Settings\RandomDateMin'
            
              '\Software\BreakPoint\Hex Workshop v6.8\Compare\recent_MRU_0sourc' +
              'eOffset'
            '\Software\CyberLink\Power2Go11\11.0\CUEName'
            '\Software\DownloadManager\29'
            '\Software\Game Maker\Version 7\Preferences\Recent4'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\ReplaceFi' +
              'nd\Patterns'
            '\Software\Honeyview\BMPath28'
            '\Software\kishDesign\CopyTo\settings3\Source08'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 6'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 6'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 6'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 8'
            '\Software\Nero\Nero 11\Nero Toolkit\DiscSpeed\Save\Folder'
            '\Software\TechSmith\Snagit\19\OutputDirLastUsed'
            '\Software\4kdownload.com\4K Video Downloader\FileWatcher'
            '\Software\7-Zip-Zstandard\FM\CopyHistory'
            '\Software\ABBYY\Bonus.ScreenshotReader\9.00\Options\SaveTextPath'
            '\Software\ABBYY\FineReader\7.00\Shell\Dialogs\SaveImagePath'
            '\Software\ABBYY\Lingvo\15.0\X3M\LastActivity'
            '\Software\ABBYY\PDFTransformer\12.00\Shell\Statistics'
            '\Software\Ability 6.0\Ability PhotoPaint\Recent File List'
            '\Software\Abyssmedia\ScriptCryptor\Settings\mruitem1'
            '\Software\AC74\View64\MRU3'
            '\Software\ACD Systems\ACDSee Pro\90\LastOptionPageName'
            
              '\Software\Acon Digital\Acoustica Premium Edition 6\Recent File L' +
              'ist'
            '\Software\Adobe\Acrobat Reader\11.0\AVGeneral\cDockables'
            '\Software\Adobe\Acrobat Reader\2017\AVGeneral\cRecentFiles'
            '\Software\Adobe\Acrobat Reader\DC\AVConversionToPDF'
            '\Software\Adobe\Adobe Acrobat\2017\AVGeneral\cRecentFiles'
            '\Software\Adobe\Adobe Acrobat\DC\AVConversionToPDF\cSettings'
            '\Software\Adobe\Adobe Customization Wizard X\Recent File List'
            '\Software\Adobe\Elements Organizer\14.0\CurrentMediaFilePath'
            
              '\Software\Adobe\Photoshop Elements\11.0\VisitedDirs\STARTUPIMAGE' +
              'DIRECTORY'
            '\Software\Adobe\Premiere Elements\14.0\MRUDocuments'
            '\Software\ahead\NeroVision\2.0\RecentFiles'
            '\Software\AKi-Software\Kool-PlayaX64\VideoHistory'
            
              '\Software\Alcohol Soft\Alcohol 52%\Options\Image Making Wizard\I' +
              'mageName'
            '\Software\AloneWolf\TextReplacer\String2'
            '\Software\Amazon\Kindle\User Settings\LastSyncDate0'
            '\Software\AMP Soft\Font Viewer\Not installed tab path'
            
              '\Software\Antibody Software\Bulk Image Downloader\frmBIM\SaveDia' +
              'log1.InitialDir'
            '\Software\A-PDF\PDFContentSplitter\Setting\LastRulename'
            '\Software\A-PDF\Watermark\Setting\hloadpdfpath'
            '\Software\Artifex Software\gsview 6.0\Files'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 5\Data Disc Project\D' +
              'umpImage'
            '\Software\Atlantis Word Processor\ClipLib\RecentClip'
            '\Software\Attribute Changer\File Settings\!DTTimeMax'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\DiskCleaner.AppLogic' +
              '.ErrorsRemoved'
            
              '\Software\Auslogics\Registry Cleaner\2.x\Settings\RegCleaner.App' +
              'Logic.ErrorsRemoved'
            '\Software\Autodesk\AutoCAD\R18.0\ACAD-8001:411\Recent File List'
            '\Software\Autodesk\Inventor\RegistryVersion21.0\Recent File List'
            '\Software\AutoIt v3\Aut2Exe\LastIconDir'
            '\Software\Axialis\IconWorkshop\folders\CurrentOpenDirectory'
            '\Software\Bomers\Restorator\Restorator\GrabDialog'
            '\Software\Borland\BDS\4.0\Session'
            '\Software\Borland\C++Builder\5.0\Session'
            '\Software\Borland\Delphi\7.0\Session'
            '\Software\BraveSoftware\Brave-Browser-Dev\BrowserExitCodes'
            '\Software\BreakPoint\Hex Workshop v5\Paths'
            '\Software\BreakPoint\SIP Workbench\file3'
            '\Software\Bugsplat\Pando_win\Pando'
            '\Software\Centarsia\RecentImage2'
            '\Software\CentBrowser\BrowserExitCodes'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.MicrosoftEdge_8wekyb' +
              '3d8bbwe\PersistedPickerData\Microsoft.MicrosoftEdge_8wekyb3d8bbw' +
              'e!MicrosoftEdge\DefaultOpenFileSingle'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.Windows.Photos_8weky' +
              'b3d8bbwe\PersistedStorageItemTable\MostRecentlyUsed'
            
              '\Software\Classes\Wow6432Node\Local Settings\Software\Microsoft\' +
              'Windows\Shell\BagMRU'
            '\Software\CodeGear\BDS\6.0\Session'
            '\Software\CompSoft\PortScan\MRUDNSQuery'
            
              '\Software\Corel\CorelDRAW\17.0\Draw\Application Preferences\Dire' +
              'ctories\DrawDocsDir'
            
              '\Software\Corel\PhotoDownloader\2\PhotoDownloader\DefaultDownloa' +
              'dFolder'
            '\Software\Corel\User Assistant\13\Recent Work\Presentations'
            '\Software\csvconverter\LASTSRC'
            '\Software\CyberLink\AudioDirector5\MediaObj\MediaCache5\Data5'
            '\Software\CyberLink\ColorDirector4\MediaObj\MediaCache5\Data5'
            '\Software\CyberLink\MediaCache\Thumbnail4'
            '\Software\CyberLink\Power2Go9\9.0\CUEName'
            
              '\Software\CyberLink\PowerDirector10\MediaObj\MediaCache5\Thumbna' +
              'il5'
            
              '\Software\CyberLink\PowerDVD15\CLMPSvc\MediaObj\MediaCache5\Thum' +
              'bnail5'
            '\Software\DivX\Settings\Player\PlayerState\LastOpenFileLocation'
            '\Software\DownloadManager\3'
            
              '\Software\Dragon Software\Dragon UnPACKer 5\Options\LastFilterIn' +
              'dex_Hash'
            '\Software\Duplicate Photo Finder\lastR1'
            '\Software\Echo Software\PN2\MRU'
            '\Software\Eclipsit\Microangelo\Toolset 6\Studio\MRU List'
            
              '\Software\ElcomSoft\Advanced Office Password Recovery\Recent fil' +
              'e 1'
            '\Software\EmSoft\EmEditor v3\Recent Font List'
            '\Software\ESRI\Desktop10.1\ArcMap\Recent File List'
            '\Software\EvolutionComputing\CC3View\3'
            '\Software\ExactFile\FormMain_Properties\EditCDFolderPath.Text'
            '\Software\famatech\advanced_ip_scanner\State\LastRangeUsed'
            '\Software\famatech\advanced_port_scanner\State\details_save_path'
            '\Software\Far\SavedDialogHistory\PersPath'
            '\Software\FastStone\APP.FSRecorder\Global\_GrbId'
            '\Software\Foxit Software\Foxit PDF Editor 11.0\MRU\Place MRU'
            '\Software\Foxit Software\Foxit PhantomPDF 6.0\RecentFiles'
            '\Software\Frhed\Settings\0\MRU_File3'
            '\Software\FTP Password Kracker\ServerAddress'
            '\Software\FutureFog\Phorest\Layout\SelectionTop'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 2'
            '\Software\Gabest\vsfilter\DefTextPathes\Path2'
            '\Software\Game Maker 4\Preferences\Recent1'
            '\Software\gBurner\Reopen2'
            '\Software\GetFLV\FLVTitle'
            '\Software\GOFF Concepts\FileSearchEX\Sys_SearchHistory'
            '\Software\GridinSoft\Notepad3\Search\TextHistory'
            '\Software\Headlight\GetRight\Stats'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\Diff\DiffFirstSel' +
              'ectedDoc'
            '\Software\HighCriteria\TotalRecorder\Recent File list\File3'
            '\Software\Honeyview\BMPath2'
            '\Software\Honeyview\RecentFolder2'
            
              '\Software\ImTOO\Video Converter Ultimate\Settings\last_profile_g' +
              'roup'
            '\Software\InstallShield\18.0\Professional\Recent File List'
            '\Software\IrekZielinskiSoft\TimeAdjuster\LDIR3'
            '\Software\JBSoftware\MemoMaster5\FileMRU3'
            '\Software\kishDesign\CopyTo\settings3\scutFolder02'
            
              '\Software\L0pht Holdings LLC\L0phtCrack 6\Settings\Last Remote M' +
              'achine'
            '\Software\Lavasoft\Reghance\Recentkeys'
            '\Software\LDAPSearch_Nag\IPAddress'
            '\Software\LibreCAD\/LibreCAD\RecentFiles'
            '\Software\ManiacTools\mp3Tag Pro\fmTextOpen'
            '\Software\ManiacTools\MusicDuplicate\MoveFilesFolder'
            '\Software\metapad\mru_3'
            '\Software\Microsoft\Edge SxS\BrowserExitCodes'
            '\Software\Microsoft\HTML Help Workshop\Project Files'
            '\Software\Microsoft\Internet Explorer\Recovery\PendingDelete'
            
              '\Software\Microsoft\MediaPlayer\Preferences\MostRecentFileAddOrR' +
              'emove'
            '\Software\Microsoft\Microsoft DVD Wizard Settings\Browse 7'
            '\Software\Microsoft\Microsoft Help Workshop\Hlp Files'
            
              '\Software\Microsoft\Microsoft SQL Server\90\Tools\Shell\FileMRUL' +
              'ist'
            '\Software\Microsoft\MM20\ImportDirStills'
            '\Software\Microsoft\Multimedia\ActiveMovie\Filter Cache'
            '\Software\Microsoft\Office\11.0\MSE\LastLoadedSolution'
            '\Software\Microsoft\Office\11.0\Outlook\Office Finder\MRU 3'
            '\Software\Microsoft\Office\12.0\Outlook\Preferences\LocationMRU'
            '\Software\Microsoft\Office\12.0\PowerPoint\Recent Templates'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 1'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 1'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 1'
            '\Software\Microsoft\Visual Studio\10.0\ProjectMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 2'
            
              '\Software\Microsoft\Windows Live\Movie Maker\browseforprojectsdi' +
              'rectory'
            
              '\Software\Microsoft\Windows Live\Photo Gallery\galleryscopedfold' +
              'ers'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage' +
              '\AppSwitched'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage2\P' +
              'rogramsCacheSMP'
            
              '\Software\Microsoft\Windows\CurrentVersion\Photo Aquisition\Came' +
              'ra\RootDirectory'
            '\Software\Microsoft\Windows\ShellNoRoam\MUICache'
            '\Software\MindGems\Audio Dedupe\MRU3'
            '\Software\MindGems\Easy Web Gallery Builder\2.2\MRU3'
            '\Software\MindGems\Fast Duplicate File Finder\MRU3'
            '\Software\MindGems\Visual Similarity Duplicate Image Finder\MRU3'
            '\Software\MiTeC\SSViewer\4.x\MRU'
            '\Software\MiTeC\WRR\1.x\Main\MRUHistory'
            '\Software\MKowalski\ExifPro\1.0\RecentPaths'
            '\Software\Monkey'#39's Audio\Settings\Output Location Directory'
            '\Software\MPEG Audio Collection\LastNameText3'
            '\Software\Mythicsoft\FileLocatorPro\RecentFolders'
            '\Software\N64 Emulation\Project64 Version 1.6\RecentFile3'
            '\Software\NCH Software\PicoPDF\RecentFileList'
            '\Software\NCH Software\Pixillion\Options\Output folder'
            '\Software\NirSoft\RegScanner\Find'
            '\Software\O&O\O&O SafeErase\7\LastAnalysisReportPath'
            '\Software\OneSafe PC Cleaner\LastScanDate'
            '\Software\Outertech\GetDiz\Recent Files_3'
            
              '\Software\Parallel Password Recovery\PPR GUI manager\1.0\Last te' +
              'st path'
            '\Software\Pelle Orinius\PellesC\Recent Search List'
            '\Software\PepiMK Software\Analysis tools\RegAlyzer\SearchTerm'
            '\Software\photoflare.io\PhotoFlare\SaveFolder'
            '\Software\Pintosoft\FocusOn Renamer\BRReplaceWith'
            '\Software\Piriform\Kamo\epochForNextIPM'
            '\Software\Poikosoft\Easy CD-DA Extractor 8\k81'
            '\Software\PowerISO\SCDEmu\ImageName2'
            '\Software\PrestoSoft\ExamDiff Pro\Recent Left Merged Files'
            '\Software\Prineas\FileViewer\QathH'
            '\Software\Prismatic Software\PhotoBatch\Dups\LastBatFile'
            '\Software\Quizo\QTTabBar\RecentlyClosed'
            '\Software\ReGet Software\ReGetDx\Search\HistFind'
            
              '\Software\Resplendence Sp\Registrar Registry Manager\Settings\La' +
              'stOpenedKey'
            '\Software\Rosegardenmusic\Rosegarden\recent-2'
            '\Software\RouterPasswordKracker\Username'
            '\Software\Roxio\EMC14\MusicDiscCreator\Directories'
            '\Software\SecurityXploded\HashKracker\Type'
            '\Software\SecurityXploded\LDAPPasswordKracker\ServerAddress'
            '\Software\SecurityXploded\MysqlPasswordAuditor\ServerAddress'
            '\Software\SecurityXploded\NetDatabaseScanner\StartHostAddress'
            '\Software\SecurityXploded\SaltedHashKracker\Salt'
            '\Software\Silicon Valley Software\Anim8or\File3'
            '\Software\SketchUp\SketchUp 2015\Recent File List'
            '\Software\SnapShot\RecentFile2'
            '\Software\Softany\WinCHM\RecentFile3'
            '\Software\Softpointer\Tag&Rename2\Config\FCurrentFolder'
            '\Software\Solidworks\SolidWorks 2014\Recent File List'
            '\Software\SolwaySoftware\Control3\MiddleDefDir'
            '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-2'
            '\Software\sqlitebrowser\sqlitebrowser\MainWindow'
            '\Software\SSLCertScanner\Port'
            
              '\Software\STOIK Smart Resizer 3.0\STOIK Smart Resizer\Recent Fil' +
              'e List'
            '\Software\TeamViewer\Version6\Last_Machine_Connections'
            
              '\Software\TechSmith\Camtasia Studio\9.0\Camtasia Studio\9.0\File' +
              'SaveAsMru'
            '\Software\TechSmith\Snagit\11\CaptureCount'
            '\Software\Teorex\Inpaint\Settings\Folder'
            '\Software\Thingamahoochie\WinMerge\Files\Option'
            '\Software\ToolsCenter\TeXnicCenter\Session'
            '\Software\Tracker Software\PDFViewer\Documents\LatestView\Panes'
            '\Software\Trolltech\OrganizationDefaults'
            '\Software\Ulead Systems\Corel VideoStudio Pro\17.0\HerRFL'
            '\Software\Update\Locate32\Dialogs\Name/Name'
            
              '\Software\VB and VBA Program Settings\MP3GainAnalysis\StartUp\Ch' +
              'angeLog'
            
              '\Software\VB and VBA Program Settings\PDFStreamDumper\Settings\l' +
              'astReplace'
            '\Software\VicMan Software\Web Photo Album\RecentFile2'
            '\Software\VSO\Blu-ray Converter Ultimate\2\MediaLabel'
            '\Software\WiFi Network Monitor\EndHostAddress'
            
              '\Software\Windows Grep\Windows Grep\Current Version\Search Dialo' +
              'g\Folders'
            '\Software\WinImage\File3'
            '\Software\WinRAR\General\Info\CommentFile'
            '\Software\WinThruster\SizeToClean'
            '\Software\Xara\Xtreme_SE\6.1\Workspace'
            '\Software\xlsconverter\LASTSRC'
            '\Software\XnView\Start\DirName_2'
            '\Software\Ying3\DLExpert\MAIN\ALLFILE'
            
              '\Software\ZabaraKatranemia Plc\xplorer2_UC\MainFrame Settings\Fo' +
              'lder History'
            '\Software\ABBYY\FineReader\12.00\Shell\MainFrame\RecentFileList'
            '\Software\ACD Systems\ACDSee Ultimate\110\OnlineHistPaths'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\VCD Project\SaveDi' +
              'alog_OnAddMovies\InitialDirectory'
            '\Software\Attribute Changer\Folder Settings\RandomTimeMax'
            
              '\Software\BreakPoint\Hex Workshop v6.8\Compare\recent_MRU_0targe' +
              'tFile'
            '\Software\CyberLink\Power2Go11\11.0\CUEPath'
            '\Software\DownloadManager\30'
            '\Software\Game Maker\Version 7\Preferences\Recent5'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\ReplaceRe' +
              'place\History'
            '\Software\Honeyview\BMPath29'
            '\Software\kishDesign\CopyTo\settings3\Source09'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 7'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 7'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 7'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 9'
            '\Software\Nero\Nero 11\Nero Vision\Application\AudioDir'
            '\Software\TechSmith\Snagit\19\VidOutputDirLastUsed'
            
              '\Software\ABBYY\FineReader\14.00\Bonus.ScreenshotReader\LaunchCo' +
              'unt'
            '\Software\ACD Systems\ACDSee Ultimate\110\OpenFolder'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\VIDEO_TS Disc Proj' +
              'ect\DumpImage\ImagePath'
            '\Software\Attribute Changer\Folder Settings\RandomTimeMin'
            
              '\Software\BreakPoint\Hex Workshop v6.8\Compare\recent_MRU_0targe' +
              'tLength'
            '\Software\CyberLink\Power2Go11\11.0\DestFolder'
            '\Software\DownloadManager\31'
            '\Software\Game Maker\Version 7\Preferences\Recent6'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\ReplaceRe' +
              'place\Patterns'
            '\Software\kishDesign\CopyTo\settings3\target00'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 8'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 8'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 8'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 10'
            '\Software\Nero\Nero 11\Nero Vision\Application\CaptureDir'
            '\Software\TechSmith\Snagit\19\Recent Captures'
            
              '\Software\ABBYY\FineReader\14.00\Bonus.ScreenshotReader\Options\' +
              'LanguagesMRU'
            '\Software\ACD Systems\ACDSee Ultimate\120\HistMCFDestFolder'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 16\VIDEO_TS Disc Proj' +
              'ect\SelectVideoTSFolder\VideoTSPath'
            '\Software\Attribute Changer\Global Settings\OtherExport'
            
              '\Software\BreakPoint\Hex Workshop v6.8\Compare\recent_MRU_0targe' +
              'tOffset'
            '\Software\CyberLink\Power2Go11\11.0\DVDFolderPath'
            '\Software\DownloadManager\32'
            '\Software\Game Maker\Version 7\Preferences\Recent7'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\HexView\SetSize\R' +
              'ecent'
            '\Software\kishDesign\CopyTo\settings3\target01'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 9'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 9'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 9'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 11'
            '\Software\Nero\Nero 11\Nero Vision\Application\DocDir'
            '\Software\TechSmith\Snagit\19\SnagitEditor\Recent File List'
            
              '\Software\ABBYY\FineReader\14.00\Bonus.ScreenshotReader\Options\' +
              'LastSaveImagePath'
            '\Software\ACD Systems\ACDSee Ultimate\120\HistPaths'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\Audio Disc Project' +
              '\SaveDialog_CPlaylistDlgEx\InitialDirectory'
            '\Software\BreakPoint\Hex Workshop v6.8\Compare\recent_MRU_count'
            '\Software\CyberLink\Power2Go11\11.0\ImagePath'
            '\Software\DownloadManager\33'
            '\Software\Game Maker\Version 8\Preferences\GameDir'
            '\Software\HHD Software\Hex Editor 6.sm\Windows\OpenDevice\Recent'
            '\Software\kishDesign\CopyTo\settings3\target02'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 10'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 10'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 10'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 12'
            '\Software\Nero\Nero 11\Nero Vision\Application\ExportAudioDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\Acce' +
              'ssedDT'
            '\Software\TechSmith\Snagit\19\SnagItEditor\Tray\Thumbnailsize'
            
              '\Software\ABBYY\FineReader\14.00\Bonus.ScreenshotReader\Options\' +
              'LastUseTime'
            '\Software\ACD Systems\ACDSee Ultimate\120\LastOptionPageName'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\Backup Project\Bac' +
              'kupOptions\CustomLocation'
            '\Software\BreakPoint\Hex Workshop v6.8\Compare\Source File'
            '\Software\CyberLink\Power2Go11\11.0\LastBrowsePath'
            '\Software\DownloadManager\34'
            '\Software\Game Maker\Version 8\Preferences\Recent0'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\PSH\Pattern\Histo' +
              'ry'
            '\Software\kishDesign\CopyTo\settings3\target03'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 11'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 11'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 11'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 13'
            '\Software\Nero\Nero 11\Nero Vision\Application\ExportVideoDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\Crea' +
              'tedDT'
            '\Software\TechSmith\Snagit\20\CaptureCount'
            
              '\Software\ABBYY\FineReader\14.00\Bonus.ScreenshotReader\Options\' +
              'SaveTablePath'
            '\Software\ACD Systems\ACDSee Ultimate\120\OnlineHistPaths'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\BDMV Disc Project\' +
              'SelectBDMVFolder\BdmvPath'
            '\Software\BreakPoint\Hex Workshop v6.8\Compare\Target File'
            '\Software\CyberLink\Power2Go11\11.0\LastSaveProjPath'
            '\Software\DownloadManager\35'
            '\Software\Game Maker\Version 8\Preferences\Recent1'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\PSH\Pattern\Patte' +
              'rns'
            '\Software\kishDesign\CopyTo\settings3\target04'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 12'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 12'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 12'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 14'
            '\Software\Nero\Nero 11\Nero Vision\Application\ImportVideoDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\FltM' +
              'axDate'
            '\Software\TechSmith\Snagit\20\CaptureOpenCount'
            
              '\Software\ABBYY\FineReader\14.00\Bonus.ScreenshotReader\Options\' +
              'SaveTextPath'
            '\Software\ACD Systems\ACDSee Ultimate\120\OpenFolder'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\Browse Image Proje' +
              'ct\BrowseImageFile\ImagePath'
            
              '\Software\BreakPoint\Hex Workshop v6.8\Expression Calc\LastExpre' +
              'ssion'
            '\Software\CyberLink\Power2Go11\11.0\MonitorPaths'
            '\Software\DownloadManager\36'
            '\Software\Game Maker\Version 8\Preferences\Recent2'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\PSH\RuleEdit\Hist' +
              'ory'
            '\Software\kishDesign\CopyTo\settings3\target05'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 13'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 13'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 13'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 15'
            '\Software\Nero\Nero 11\Nero Vision\Application\MediaDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\FltM' +
              'axTime'
            '\Software\TechSmith\Snagit\20\OutputDirLastUsed'
            '\Software\ABBYY\FineReader\14.00\Comparator\RateUs\RunCount'
            '\Software\ACD Systems\ACDSee\60\HistMCFDestFolder'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\Browse Image Proje' +
              'ct\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\BreakPoint\Hex Workshop v6.8\FileGoto\goto_MRU_0'
            '\Software\CyberLink\Power2Go11\11.0\OpenPrjFilePath'
            '\Software\DownloadManager\37'
            '\Software\Game Maker\Version 8\Preferences\Recent3'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\PSH\RuleEdit\Patt' +
              'erns'
            '\Software\kishDesign\CopyTo\settings3\target06'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 14'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 14'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 14'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 16'
            '\Software\Nero\Nero 11\Nero Vision\Application\PicDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\FltM' +
              'inDate'
            '\Software\TechSmith\Snagit\20\VidOutputDirLastUsed'
            '\Software\ABBYY\FineReader\14.00\FineReaderShell\LaunchCount'
            '\Software\ACD Systems\ACDSee\60\HistPaths'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\Burn Image Project' +
              '\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\BreakPoint\Hex Workshop v6.8\FileGoto\goto_MRU_count'
            '\Software\CyberLink\Power2Go11\11.0\SelectedFolderPath'
            '\Software\DownloadManager\38'
            '\Software\Game Maker\Version 8\Preferences\Recent4'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\Streams\Locate\Ex' +
              'clude'
            '\Software\kishDesign\CopyTo\settings3\target07'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 15'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 15'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 15'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 17'
            '\Software\Nero\Nero 11\Nero Vision\Application\PicSaveDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\FltM' +
              'inTime'
            '\Software\TechSmith\Snagit\20\Recent Captures'
            
              '\Software\ABBYY\FineReader\14.00\FineReaderShell\Shell\Dialogs\E' +
              'xportTAPath'
            '\Software\ACD Systems\ACDSee\60\LastOptionPageName'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\Burn Image Project' +
              '\SelectImage\ImagePath'
            '\Software\BreakPoint\Hex Workshop v6.8\FileGoto\lastStr'
            '\Software\CyberLink\Power2Go11\11.0\MediaObj\MediaCache5\Data5'
            '\Software\DownloadManager\39'
            '\Software\Game Maker\Version 8\Preferences\Recent5'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\Streams\Locate\Ma' +
              'sks'
            '\Software\kishDesign\CopyTo\settings3\target08'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 16'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 16'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 16'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 18'
            '\Software\Nero\Nero 11\Nero Vision\Application\TmpDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\Modi' +
              'fiedDT'
            '\Software\TechSmith\Snagit\20\SnagitEditor\Recent File List'
            '\Software\4kdownload.com\4K Video Downloader\Gamification'
            '\Software\7-Zip-Zstandard\FM\FolderHistory'
            '\Software\ABBYY\FineReader\7.00\Shell\Dialogs\SaveToPath'
            '\Software\ABBYY\Retail.ScreenshotReader\9.00\Advertising'
            '\Software\Ability 6.0\Ability Spreadsheet\Recent File List'
            '\Software\Abyssmedia\ScriptCryptor\Settings\mruitem2'
            '\Software\AC74\View64\MRU4'
            '\Software\ACD Systems\ACDSee Pro\90\OpenFolder'
            '\Software\Adobe\Acrobat Reader\11.0\AVGeneral\cRecentFolders'
            '\Software\Adobe\Acrobat Reader\2017\AVGeneral\cRecentFolders'
            '\Software\Adobe\Acrobat Reader\DC\AVGeneral\iNumOfAVDocsOpened'
            '\Software\Adobe\Adobe Acrobat\2017\AVGeneral\cRecentFolders'
            '\Software\Adobe\Adobe Acrobat\DC\AVGeneral\iNumAcrobatLaunches'
            '\Software\Adobe\Adobe Customization Wizard XI\Recent File List'
            '\Software\Adobe\Elements Organizer\15.0\CurrentMediaFilePath'
            
              '\Software\Adobe\Photoshop Elements\13.0\common\settings\Elements' +
              ' MRU'
            '\Software\Adobe\Premiere Elements\15.0\MRUDocuments'
            '\Software\AKi-Software\Kool-PlayaX64\Videos'
            '\Software\Amazon\Kindle\User Settings\LastSyncDate1'
            '\Software\A-PDF\Watermark\Setting\hSaveallpdfpath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 5\Unknown Project\Add' +
              'Dialog'
            '\Software\Atlantis Word Processor\InsertDoc_Files'
            '\Software\Attribute Changer\File Settings\!DTTimeMin'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\DiskCleaner.AppLogic' +
              '.LastScan'
            
              '\Software\Auslogics\Registry Cleaner\2.x\Settings\RegCleaner.App' +
              'Logic.LastScan'
            '\Software\Autodesk\AutoCAD\R18.1\ACAD-9000:409\Recent File List'
            '\Software\Autodesk\Inventor\RegistryVersion22.0\Recent File List'
            '\Software\AutoIt v3\Aut2Exe\LastScriptDir'
            '\Software\Axialis\IconWorkshop\rss\MostRecentNewsId'
            '\Software\Bomers\Restorator\Restorator\LastFoundFiles'
            '\Software\BraveSoftware\Brave-Browser-Nightly\BrowserExitCodes'
            '\Software\BreakPoint\Hex Workshop v5\SectorGoto\lastStr'
            '\Software\BreakPoint\SIP Workbench\file4'
            '\Software\Bugsplat\Relic\CoH'
            '\Software\Centarsia\RecentImage3'
            '\Software\Chromium\BrowserExitCodes'
            
              '\Software\Classes\Local Settings\Software\Microsoft\Windows\Curr' +
              'entVersion\AppModel\SystemAppData\Microsoft.MicrosoftEdge_8wekyb' +
              '3d8bbwe\PersistedPickerData\Microsoft.MicrosoftEdge_8wekyb3d8bbw' +
              'e!MicrosoftEdge\DefaultSaveFileSingle'
            
              '\Software\Classes\Wow6432Node\Local Settings\Software\Microsoft\' +
              'Windows\Shell\Bags'
            '\Software\CompSoft\PortScan\MRUDNSServer'
            
              '\Software\Corel\CorelDRAW\17.0\Draw\Application Preferences\Fram' +
              'ework\RecentFiles'
            '\Software\Corel\PhotoDownloader\2\PhotoDownloader\DownloadFolder'
            '\Software\Corel\User Assistant\14\Recent Work\Presentations'
            '\Software\csvconverter\SRCPATH'
            
              '\Software\CyberLink\AudioDirector5\MediaObj\MediaCache5\Thumbnai' +
              'l5'
            
              '\Software\CyberLink\ColorDirector4\MediaObj\MediaCache5\Thumbnai' +
              'l5'
            '\Software\CyberLink\MediaCache5\Data5'
            '\Software\CyberLink\Power2Go9\9.0\CUEPath'
            '\Software\CyberLink\PowerDirector11\MediaObj\MediaCache5\Data5'
            
              '\Software\CyberLink\PowerDVD16\CLMPSvc\MediaObj\MediaCache5\Data' +
              '5'
            '\Software\DivX\Settings\TransferWizard\LastBrwosedDir'
            '\Software\DownloadManager\4'
            '\Software\Dragon Software\Dragon UnPACKer 5\Options\Recent_0'
            '\Software\Echo Software\PN2\MRUProjects'
            
              '\Software\ElcomSoft\Advanced Office Password Recovery\Recent fil' +
              'e 2'
            '\Software\EvolutionComputing\CC3View\4'
            '\Software\ExactFile\FormMain_Properties\LabeledEditsfcFile.Text'
            '\Software\famatech\advanced_ip_scanner\State\SearchMruList'
            '\Software\famatech\advanced_port_scanner\State\IpRangesMruList'
            '\Software\Far\SavedFolderHistory'
            '\Software\FastStone\APP.FSRecorder\Global\_LastClipPlayed'
            '\Software\Foxit Software\Foxit PDF Editor 11.0\plugins\JSPlugins'
            '\Software\Foxit Software\Foxit PhantomPDF 7.0\MRU\File MRU'
            '\Software\Frhed\Settings\0\MRU_File4'
            '\Software\FTP Password Kracker\Username'
            '\Software\FutureFog\Phorest\Layout\SelectionWidth'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 3'
            '\Software\Game Maker 4\Preferences\Recent2'
            '\Software\gBurner\Reopen3'
            '\Software\GetFLV\FLVURL'
            '\Software\Headlight\GetRight\UserAgent'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\Diff\DiffSecondSe' +
              'lectedDoc'
            '\Software\HighCriteria\TotalRecorder\Recent File list\File4'
            '\Software\Honeyview\BMPath3'
            '\Software\Honeyview\RecentFolder3'
            '\Software\Impact\Microangelo\Animator\MRU List'
            
              '\Software\ImTOO\Video Converter Ultimate\Settings\last_profile_u' +
              'rl'
            '\Software\InstallShield\19.0\Professional\Recent File List'
            '\Software\IrekZielinskiSoft\TimeAdjuster\LDIR4'
            '\Software\JBSoftware\MemoMaster5\FileMRU4'
            '\Software\kishDesign\CopyTo\settings3\scutFolder03'
            '\Software\L0pht Holdings LLC\L0phtCrack 6\Settings\Last SAM File'
            '\Software\Lavasoft\Reghance\Repltext'
            '\Software\LDAPSearch_Nag\LoginDN'
            '\Software\LibreCAD\LibreCAD\Paths\Open'
            '\Software\ManiacTools\mp3Tag Pro\fmTextSave'
            '\Software\ManiacTools\MusicDuplicate\NotDuplicatesFolders'
            '\Software\metapad\mru_4'
            '\Software\Microsoft\Edge\BrowserExitCodes'
            '\Software\Microsoft\HTML Help Workshop\Recent File List'
            
              '\Software\Microsoft\MediaPlayer\Preferences\ObfuscatedSyncPlayli' +
              'stsPath'
            '\Software\Microsoft\Microsoft DVD Wizard Settings\Browse 128'
            '\Software\Microsoft\Microsoft Help Workshop\Hpj Files'
            
              '\Software\Microsoft\Microsoft SQL Server\90\Tools\Shell\ProjectM' +
              'RUList'
            '\Software\Microsoft\MM20\ImportDirVideo'
            '\Software\Microsoft\Multimedia\ActiveMovie\Filter Cache64'
            '\Software\Microsoft\Office\11.0\MSE\FileMRUList'
            '\Software\Microsoft\Office\12.0\Word\Recent Templates'
            '\Software\Microsoft\Office\14.0\Outlook\Preferences\LocationMRU'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 2'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 2'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 2'
            '\Software\Microsoft\VisualStudio\8.0\FileMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 3'
            
              '\Software\Microsoft\Windows Live\Movie Maker\rendertofiledirecto' +
              'ry'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage' +
              '\ShowJumpView'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage2\P' +
              'rogramsCacheTBP'
            '\Software\Microsoft\Windows\CurrentVersion\Ext\Stats'
            
              '\Software\Microsoft\Windows\CurrentVersion\Photo Aquisition\Dest' +
              'inationMru'
            '\Software\MindGems\Audio Dedupe\MRU4'
            '\Software\MindGems\Easy Web Gallery Builder\2.2\MRU4'
            '\Software\MindGems\Fast Duplicate File Finder\MRU4'
            '\Software\MindGems\Visual Similarity Duplicate Image Finder\MRU4'
            '\Software\MiTeC\WRR\1.x\wnd_wrr_Main\Twnd_wrr_Main.MRUMan'
            '\Software\MKowalski\ExifPro\1.0\ResizeDlg\RecentDestPaths'
            '\Software\MPEG Audio Collection\LastNameText4'
            '\Software\N64 Emulation\Project64 Version 1.6\RecentFile4'
            '\Software\NCH Software\Pixillion\Options\Output format'
            
              '\Software\Nero\Nero 11\Nero Burning ROM\Compilation\VolumeLabelA' +
              'utoTemplate'
            '\Software\NirSoft\RegScanner\RemoteComputer'
            '\Software\O&O\O&O SafeErase\7\LastAnalysisResultString'
            '\Software\OneSafe PC Cleaner\LastUpdCheck'
            '\Software\Outertech\GetDiz\Recent Files_4'
            
              '\Software\Parallel Password Recovery\PPR GUI manager\1.0\Path to' +
              ' password definition file'
            '\Software\photoflare.io\PhotoFlare\SaveFormat'
            '\Software\Piriform\Kamo\epochSinceUILastUsed'
            '\Software\Poikosoft\Easy CD-DA Extractor 8\k91'
            '\Software\PowerISO\SCDEmu\ImageName3'
            '\Software\PrestoSoft\ExamDiff Pro\Recent Sessions'
            '\Software\Prineas\FileViewer\VCurrentPath'
            '\Software\Prismatic Software\PhotoBatch\Dups\LastFold'
            '\Software\Rosegardenmusic\Rosegarden\recent-3'
            '\Software\Roxio\EMC14\MusicDiscCreator\MediaSelector'
            '\Software\Safer Networking Limited\RegAlyzer\LastKey'
            '\Software\SecurityXploded\LDAPPasswordKracker\Username'
            '\Software\SecurityXploded\MysqlPasswordAuditor\Username'
            '\Software\SecurityXploded\RouterPasswordDecryptor\File'
            '\Software\SecurityXploded\SaltedHashKracker\Type'
            '\Software\Silicon Valley Software\Anim8or\File4'
            '\Software\SketchUp\SketchUp 2016\Recent File List'
            '\Software\SnapShot\RecentFile3'
            '\Software\Softany\WinCHM\RecentFile4'
            '\Software\Softpointer\Tag&Rename2\Config\FHistoryList'
            '\Software\SolidWorks\Solidworks 2015\Recent File List'
            '\Software\SolwaySoftware\Control3\RightDefDir'
            '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-3'
            '\Software\SSLCertScanner\ServerAddress'
            '\Software\TeamViewer\Version7\Last_Machine_Connections'
            
              '\Software\TechSmith\Camtasia Studio\9.0\Camtasia Studio\9.0\MRUI' +
              'mportFolder'
            '\Software\TechSmith\Snagit\11\CaptureOpenCount'
            '\Software\Thingamahoochie\WinMerge\Files\Right'
            
              '\Software\ToolsCenter\TeXnicCenter\Settings\Options\LastOpenedFo' +
              'lder'
            '\Software\Update\Locate32\Dialogs\Name/Type'
            
              '\Software\VB and VBA Program Settings\MP3GainAnalysis\StartUp\Er' +
              'rLog'
            '\Software\VicMan Software\Web Photo Album\RecentFile3'
            '\Software\VSO\Blu-ray Converter Ultimate\3\input_MRUfiles_audio'
            '\Software\WiFi Network Monitor\StartHostAddress'
            
              '\Software\Windows Grep\Windows Grep\Current Version\Search Dialo' +
              'g\Strings'
            '\Software\WinImage\File4'
            '\Software\xlsconverter\OPT'
            '\Software\XnView\Start\DirName_3'
            '\Software\Ying3\DLExpert\MAIN\GOOD'
            
              '\Software\ZabaraKatranemia Plc\xplorer2_UC\MainFrame Settings\Re' +
              'cent Document List'
            
              '\Software\ABBYY\FineReader\14.00\FineReaderShell\Shell\Dialogs\I' +
              'mportTAPath'
            '\Software\ACD Systems\ACDSee\60\OpenFolder'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\Data Disc Project\' +
              'DumpImage\ImagePath'
            '\Software\BreakPoint\Hex Workshop v6.8\Find\Value0'
            
              '\Software\CyberLink\Power2Go11\11.0\MediaObj\MediaCache5\Thumbna' +
              'il5'
            '\Software\DownloadManager\40'
            '\Software\Game Maker\Version 8\Preferences\Recent6'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\Streams\Locate\Pa' +
              'ths'
            '\Software\kishDesign\CopyTo\settings3\target09'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 17'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 17'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 17'
            '\Software\Microsoft\VisualStudio\9.0\Find\Replace 19'
            '\Software\Nero\Nero 11\Nero Vision\Application\VideoDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\Pict' +
              'ureDT'
            '\Software\TechSmith\Snagit\20\SnagItEditor\Tray\Thumbnailsize'
            
              '\Software\ABBYY\FineReader\14.00\FineReaderShell\Shell\Dialogs\S' +
              'aveToWebFolderPath'
            
              '\Software\ACD Systems\ACDSee\60\PrintOptions\OutputContactSheet\' +
              'ContactSheetFN'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\Data Disc Project\' +
              'SaveDialog_AddFilesAndDirs\InitialDirectory'
            '\Software\BreakPoint\Hex Workshop v6.8\Find\Value1'
            '\Software\CyberLink\Power2Go12\12.0\CDRippingPath'
            '\Software\DownloadManager\41'
            '\Software\Game Maker\Version 8\Preferences\Recent7'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 18'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 18'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 18'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 0'
            '\Software\Nero\Nero 11\Nero WaveEditor\Directories\Last'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\Rand' +
              'omMaxDate'
            '\Software\TechSmith\Snagit\21\CaptureCount'
            
              '\Software\ABBYY\FineReader\14.00\FineReaderShell\Shell\Options\L' +
              'astWebFoldersNames'
            
              '\Software\ACD Systems\ACDSee\60\PrintOptions\OutputContactSheet\' +
              'ImageMapFN'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\DVD-Video Disc Pro' +
              'ject\MoviesPage\Path'
            '\Software\BreakPoint\Hex Workshop v6.8\LastPaths'
            '\Software\CyberLink\Power2Go12\12.0\CUEName'
            '\Software\DownloadManager\42'
            '\Software\Microsoft\VBExpress\10.0\Find\Replace 19'
            '\Software\Microsoft\VCExpress\10.0\Find\Replace 19'
            '\Software\Microsoft\VCSExpress\10.0\Find\Replace 19'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 1'
            '\Software\Nero\Nero 11\Nero WaveEditor\Recent File List'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\Rand' +
              'omMaxTime'
            '\Software\TechSmith\Snagit\21\CaptureOpenCount'
            
              '\Software\ABBYY\FineReader\14.00\FineUI\Dialogs\FROpenFileDialog' +
              '\LastFolder'
            '\Software\ACD Systems\EditLib\Presets\Photo Repair 2\Last Used'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\DVD-Video Disc Pro' +
              'ject\SaveDialog_authed.CMoviesPage.Movies\InitialDirectory'
            '\Software\BreakPoint\Hex Workshop v6.8\Replace\FindString'
            '\Software\CyberLink\Power2Go12\12.0\CUEPath'
            '\Software\DownloadManager\43'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 2'
            
              '\Software\Nero\Nero 12\Nero Burning ROM\Compilation\VolumeLabelA' +
              'utoTemplate'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\Rand' +
              'omMinDate'
            '\Software\TechSmith\Snagit\21\OutputDirLastUsed'
            '\Software\ABBYY\FineReader\14.00\FineUpdate\LaunchCount'
            '\Software\Ashampoo\Ashampoo Burning Studio 18\Logs'
            '\Software\BreakPoint\Hex Workshop v6.8\Replace\ReplaceString'
            '\Software\CyberLink\Power2Go12\12.0\DestFolder'
            '\Software\DownloadManager\44'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 3'
            
              '\Software\Nero\Nero 12\Nero Burning ROM\Compilation\VolumeLabelI' +
              'SOTemplate'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\Rand' +
              'omMinTime'
            '\Software\TechSmith\Snagit\21\VidOutputDirLastUsed'
            '\Software\ABBYY\FineReader\14.00\PDFTransformer\LaunchCount'
            '\Software\Ashampoo\Ashampoo Burning Studio 18\tempFiles'
            '\Software\BreakPoint\Hex Workshop v6.8\SectorGoto\goto_MRU_count'
            '\Software\CyberLink\Power2Go12\12.0\DVDFolderPath'
            '\Software\DownloadManager\45'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 4'
            
              '\Software\Nero\Nero 12\Nero Burning ROM\Compilation\VolumelabelJ' +
              'olietTemplate'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\RLow' +
              'erDT'
            '\Software\TechSmith\Snagit\21\Recent Captures'
            
              '\Software\ABBYY\FineReader\14.00\PDFTransformer\PDFEngine\EraseE' +
              'xtraData\LastDeleteNeedlessExtraData'
            '\Software\Ashampoo\Ashampoo Burning Studio 18\Unknown Project'
            '\Software\BreakPoint\Hex Workshop v6.8\SectorGoto\lastStr'
            '\Software\CyberLink\Power2Go12\12.0\ImagePath'
            '\Software\DownloadManager\46'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 5'
            
              '\Software\Nero\Nero 12\Nero Burning ROM\Compilation\VolumeLabelU' +
              'DFTemplate'
            
              '\Software\Romain'#39's Software\Attribute Changer\File Settings\RUpp' +
              'erDT'
            '\Software\TechSmith\Snagit\21\SnagitEditor\Recent File List'
            
              '\Software\ABBYY\FineReader\14.00\PDFTransformer\Shell\Frame\Impo' +
              'rtDataFolder'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\VCD Project\SaveDi' +
              'alog_OnAddMovies\InitialDirectory'
            '\Software\BreakPoint\Hex Workshop v6.8\SelectBlock\last'
            '\Software\CyberLink\Power2Go12\12.0\LastBrowsePath'
            '\Software\DownloadManager\47'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 6'
            '\Software\Nero\Nero 12\Nero Burning ROM\Settings\EncodingLastDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\Ac' +
              'cessedDT'
            '\Software\TechSmith\Snagit\21\SnagItEditor\Tray\Thumbnailsize'
            
              '\Software\ABBYY\FineReader\14.00\PDFTransformer\Shell\Statistics' +
              '\LastUsedBuyMessages'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\VIDEO_TS Disc Proj' +
              'ect\DumpImage\ImagePath'
            '\Software\CyberLink\Power2Go12\12.0\LastSaveProjPath'
            '\Software\DownloadManager\48'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 7'
            '\Software\Nero\Nero 12\Nero Burning ROM\Settings\TrackSaveDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\Cr' +
              'eatedDT'
            '\Software\TechSmith\Snagit\22\CaptureCount'
            '\Software\ABBYY\FineReader\14.00\Shell\RecentBatchList'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 18\VIDEO_TS Disc Proj' +
              'ect\SelectVideoTSFolder\VideoTSPath'
            '\Software\CyberLink\Power2Go12\12.0\MonitorPaths'
            '\Software\DownloadManager\49'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 8'
            '\Software\Nero\Nero 12\Nero Burning ROM\Settings\WorkingDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\Fl' +
              'tMaxDate'
            '\Software\TechSmith\Snagit\22\CaptureOpenCount'
            '\Software\4kdownload.com\4K Video Downloader\Settings\outputPath'
            '\Software\7-Zip-Zstandard\FM\PanelPath0'
            
              '\Software\ABBYY\FineReader\7.00\Shell\Dialogs\StandardBatchOptio' +
              'nsPath'
            
              '\Software\ABBYY\Retail.ScreenshotReader\9.00\Options\LastSaveIma' +
              'gePath'
            '\Software\Ability 6.0\Ability Write\Files'
            '\Software\Abyssmedia\ScriptCryptor\Settings\mruitem3'
            '\Software\AC74\View64\MRU5'
            
              '\Software\ACD Systems\ACDSee Pro\90\PrintOptions\OutputContactSh' +
              'eet\ContactSheetFN'
            '\Software\Adobe\Acrobat Reader\11.0\AVGeneral\cToolbars'
            '\Software\Adobe\Acrobat Reader\2020\AVGeneral\cRecentFiles'
            '\Software\Adobe\Acrobat Reader\DC\AVGeneral\iNumReaderLaunches'
            '\Software\Adobe\Adobe Acrobat\2020\AVGeneral\cRecentFiles'
            '\Software\Adobe\Adobe Acrobat\DC\AVGeneral\iNumOfAVDocsOpened'
            '\Software\Adobe\Elements Organizer\16.0\CurrentMediaFilePath'
            '\Software\Adobe\Photoshop Elements\13.0\CurrentMediaFilePath'
            '\Software\Adobe\Premiere Elements\16.0\MRUDocuments'
            '\Software\Amazon\Kindle\User Settings\LastSyncDate2'
            '\Software\A-PDF\Watermark\Setting\ptlastprinter'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 6\Burn Image Project\' +
              'SelectImage'
            '\Software\Atlantis Word Processor\InsertPicture_Files'
            '\Software\Attribute Changer\File Settings\AccessedValue'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\RegCleaner.AppLogic.' +
              'ErrorsFailed'
            '\Software\Autodesk\AutoCAD\R19.0\ACAD-B000:409\Recent File List'
            '\Software\Autodesk\Inventor\RegistryVersion23.0\Recent File List'
            '\Software\Axialis\IconWorkshop\rss\News1'
            '\Software\Bomers\Restorator\Restorator\MRUList'
            '\Software\BreakPoint\Hex Workshop v5\SelectBlock\last'
            '\Software\BreakPoint\SIP Workbench\file5'
            '\Software\Bugsplat\Relic\RelicDownloader'
            '\Software\Centarsia\RecentImage4'
            '\Software\CocCoc\Browser\BrowserExitCodes'
            '\Software\CompSoft\PortScan\MRUPing'
            
              '\Software\Corel\CorelDRAW\17.0\Draw\Application Preferences\HTML' +
              ' Export\DestPath'
            '\Software\Corel\User Assistant\X3\Recent Work\Presentations'
            '\Software\CyberLink\AudioDirector6\MediaObj\MediaCache5\Data5'
            '\Software\CyberLink\ColorDirector5\MediaObj\MediaCache5\Data5'
            '\Software\CyberLink\MediaCache5\Thumbnail5'
            '\Software\CyberLink\Power2Go9\9.0\DestFolder'
            
              '\Software\CyberLink\PowerDirector11\MediaObj\MediaCache5\Thumbna' +
              'il5'
            
              '\Software\CyberLink\PowerDVD16\CLMPSvc\MediaObj\MediaCache5\Prog' +
              'ramInfo'
            '\Software\DivX\Settings\WebPlayer\cacheEntry1'
            '\Software\DownloadManager\5'
            '\Software\Dragon Software\Dragon UnPACKer 5\Options\Recent_1'
            
              '\Software\ElcomSoft\Advanced Office Password Recovery\Recent fil' +
              'e 3'
            '\Software\EvolutionComputing\CC3View\WorkingDrawing'
            
              '\Software\ExactFile\FormMain_Properties\LabeledEditTDBaseFolder.' +
              'Text'
            '\Software\famatech\advanced_port_scanner\State\LastPortsUsed'
            '\Software\Far\SavedHistory'
            '\Software\FastStone\APP.FSRecorder\Global\_LastRecordingFileName'
            
              '\Software\Foxit Software\Foxit PDF Editor 11.0\Preferences\Histo' +
              'ry'
            '\Software\Foxit Software\Foxit PhantomPDF 7.0\MRU\Place MRU'
            '\Software\Frhed\Settings\0\MRU_File5'
            '\Software\FutureFog\Phorest\Options\LastUsedFolder'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 4'
            '\Software\Game Maker 4\Preferences\Recent3'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\Disasm\Disasm\Sel' +
              'ectedFiles'
            '\Software\HighCriteria\TotalRecorder\Recent File list\File5'
            '\Software\Honeyview\BMPath4'
            '\Software\Honeyview\RecentFolder4'
            '\Software\Impact\Microangelo\Librarian\MRU List'
            
              '\Software\ImTOO\Video Converter Ultimate\Settings\recent_profile' +
              's'
            '\Software\InstallShield\20.0\Professional\Recent File List'
            '\Software\JBSoftware\MemoMaster5\FileMRU5'
            '\Software\kishDesign\CopyTo\settings3\scutFolder04'
            
              '\Software\L0pht Holdings LLC\L0phtCrack 6\Settings\Last SYSTEM F' +
              'ile'
            '\Software\LDAPSearch_Nag\Port'
            '\Software\LibreCAD\LibreCAD\Paths\Save'
            '\Software\ManiacTools\mp3Tag Pro\StartDir'
            '\Software\ManiacTools\MusicDuplicate\SavedFoldersList'
            '\Software\metapad\mru_5'
            '\Software\Microsoft\HTML Help Workshop\Settings\LastProject'
            '\Software\Microsoft\MediaPlayer\Services\Bing\CachedIconPath'
            '\Software\Microsoft\Microsoft DVD Wizard Settings\MRU0'
            '\Software\Microsoft\Microsoft Help Workshop\Map Files'
            
              '\Software\Microsoft\Microsoft SQL Server\100\Tools\Shell\FileMRU' +
              'List'
            '\Software\Microsoft\MM20\OpenProjectDir'
            '\Software\Microsoft\Office\11.0\MSE\ProjectMRUList'
            '\Software\Microsoft\Office\14.0\Common\OfficeStart\Web\Templates'
            '\Software\Microsoft\Office\15.0\Outlook\Preferences\LocationMRU'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 3'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 3'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 3'
            '\Software\Microsoft\VisualStudio\8.0\ProjectMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 4'
            
              '\Software\Microsoft\Windows Live\Movie Maker\snapshotfiledirecto' +
              'ry'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage' +
              '\TrayButtonClicked'
            
              '\Software\Microsoft\Windows\CurrentVersion\Photo Aquisition\Opti' +
              'calMedia\FilenameTemplate'
            '\Software\Microsoft\Windows\Shell\BagMRU'
            '\Software\MindGems\Audio Dedupe\MRU5'
            '\Software\MindGems\Easy Web Gallery Builder\2.2\MRU5'
            '\Software\MindGems\Fast Duplicate File Finder\MRU5'
            '\Software\MindGems\Visual Similarity Duplicate Image Finder\MRU5'
            '\Software\MiTeC\WRR\3.x\MRU'
            '\Software\MPEG Audio Collection\LastNameText5'
            '\Software\N64 Emulation\Project64 Version 1.6\RecentFile5'
            
              '\Software\Nero\Nero 11\Nero Burning ROM\Compilation\VolumeLabelI' +
              'SOTemplate'
            '\Software\NirSoft\RegScanner\TimeFrom'
            '\Software\Outertech\GetDiz\Recent Files_5'
            
              '\Software\Parallel Password Recovery\PPR GUI manager\1.0\Path to' +
              ' test file'
            '\Software\Poikosoft\Easy CD-DA Extractor 8\k92'
            '\Software\PowerISO\SCDEmu\ImageName4'
            '\Software\Prineas\FileViewer\VCurrentPath1'
            '\Software\Prismatic Software\PhotoBatch\Dups\LastSecFold'
            '\Software\Rosegardenmusic\Rosegarden\recent-4'
            '\Software\Roxio\EMC14\PhotoSuite\RoxioPhotoSuite\MRUFiles'
            '\Software\Safer Networking Limited\RegAlyzer\RemoteListHistory'
            '\Software\SecurityXploded\RouterPasswordDecryptor\ServerAddress'
            '\Software\SnapShot\RecentFile4'
            '\Software\Softany\WinCHM\RecentFile5'
            '\Software\Softpointer\Tag&Rename3\Config\FCurrentFolder'
            '\Software\SolidWorks\Solidworks 2016\Recent File List'
            '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-4'
            '\Software\TeamViewer\Version8\Last_Machine_Connections'
            
              '\Software\TechSmith\Camtasia Studio\9.0\Camtasia Studio\9.0\MRUO' +
              'penProjectFolder'
            '\Software\TechSmith\Snagit\11\OutputDirLastUsed'
            '\Software\ToolsCenter\TeXnicCenterNT\Recent File List'
            '\Software\Update\Locate32\Recent Strings'
            '\Software\VicMan Software\Web Photo Album\RecentFile4'
            '\Software\VSO\Blu-ray Converter Ultimate\3\input_MRUfiles_bluray'
            '\Software\WinImage\File5'
            '\Software\xlsconverter\RECENTS'
            '\Software\XnView\Start\DirName_4'
            '\Software\Ying3\DLExpert\MAIN\GOODURL'
            '\Software\ABBYY\FineReader\14.00\Shell\RecentCompareList'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\Audio Disc Project' +
              '\SaveDialog_CPlaylistDlgEx\InitialDirectory'
            '\Software\CyberLink\Power2Go12\12.0\OpenPrjFilePath'
            '\Software\DownloadManager\50'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 9'
            
              '\Software\Nero\Nero 12\Nero Express\Compilation\VolumeLabelAutoT' +
              'emplate'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\Fl' +
              'tMaxTime'
            '\Software\TechSmith\Snagit\22\OutputDirLastUsed'
            '\Software\ABBYY\FineReader\14.00\Shell\RecentPdfList'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\Backup Project\Bac' +
              'kupOptions\CustomLocation'
            '\Software\CyberLink\Power2Go12\12.0\SelectedFolderPath'
            '\Software\DownloadManager\51'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 10'
            
              '\Software\Nero\Nero 12\Nero Express\Compilation\VolumeLabelISOTe' +
              'mplate'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\Fl' +
              'tMinDate'
            '\Software\TechSmith\Snagit\22\VidOutputDirLastUsed'
            
              '\Software\ABBYY\FineReader\14.00\StatisticSender\LastSendStatist' +
              'icsEvent'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\BDMV Disc Project\' +
              'SelectBDMVFolder\BdmvPath'
            '\Software\CyberLink\Power2Go12\12.0\MediaObj\MediaCache5\Data5'
            '\Software\DownloadManager\52'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 11'
            
              '\Software\Nero\Nero 12\Nero Express\Compilation\VolumelabelJolie' +
              'tTemplate'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\Fl' +
              'tMinTime'
            '\Software\TechSmith\Snagit\22\Recent Captures'
            '\Software\ABBYY\FineReader\14.00\StatisticSender\LaunchCount'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\Browse Image Proje' +
              'ct\BrowseImageFile\ImagePath'
            
              '\Software\CyberLink\Power2Go12\12.0\MediaObj\MediaCache5\Thumbna' +
              'il5'
            '\Software\DownloadManager\53'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 12'
            
              '\Software\Nero\Nero 12\Nero Express\Compilation\VolumeLabelUDFTe' +
              'mplate'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\Mo' +
              'difiedDT'
            '\Software\TechSmith\Snagit\22\SnagitEditor\Recent File List'
            '\Software\ABBYY\FineReader\15\Bonus.ScreenshotReader\LaunchCount'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\Browse Image Proje' +
              'ct\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\CyberLink\WaveEditor\2.0\ImportDir'
            '\Software\DownloadManager\54'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 13'
            '\Software\Nero\Nero 12\Nero Express\Settings\BootImageDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\Ra' +
              'ndomMaxDate'
            '\Software\TechSmith\Snagit\22\SnagItEditor\Tray\Thumbnailsize'
            
              '\Software\ABBYY\FineReader\15\Bonus.ScreenshotReader\Options\Lan' +
              'guagesMRU'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\Burn Image Project' +
              '\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\CyberLink\WaveEditor\2.0\TempFileDir'
            '\Software\DownloadManager\55'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 14'
            '\Software\Nero\Nero 12\Nero Express\Settings\ImageDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\Ra' +
              'ndomMaxTime'
            
              '\Software\ABBYY\FineReader\15\Bonus.ScreenshotReader\Options\Las' +
              'tRecognitionLanguage'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\Burn Image Project' +
              '\SelectImage\ImagePath'
            '\Software\CyberLink\WaveEditor\2.0\WorkDir'
            '\Software\DownloadManager\56'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 15'
            '\Software\Nero\Nero 12\Nero Express\Settings\NeroCompilation'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\Ra' +
              'ndomMinDate'
            
              '\Software\ABBYY\FineReader\15\Bonus.ScreenshotReader\Options\Las' +
              'tSaveImagePath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\Data Disc Project\' +
              'DumpImage\ImagePath'
            '\Software\DownloadManager\57'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 16'
            '\Software\Nero\Nero 12\Nero Express\Settings\TrackSaveDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\Ra' +
              'ndomMinTime'
            
              '\Software\ABBYY\FineReader\15\Bonus.ScreenshotReader\Options\Sav' +
              'eTablePath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\Data Disc Project\' +
              'SaveDialog_AddFilesAndDirs\InitialDirectory'
            '\Software\DownloadManager\58'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 17'
            '\Software\Nero\Nero 12\Nero Toolkit\DiscSpeed\Capture\Folder'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\RL' +
              'owerDT'
            
              '\Software\ABBYY\FineReader\15\Bonus.ScreenshotReader\Options\Sav' +
              'eTextPath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\DVD-Video Disc Pro' +
              'ject\MoviesPage\Path'
            '\Software\DownloadManager\59'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 18'
            '\Software\Nero\Nero 12\Nero Toolkit\DiscSpeed\Save\Folder'
            
              '\Software\Romain'#39's Software\Attribute Changer\Folder Settings\RU' +
              'pperDT'
            '\Software\7-Zip-Zstandard\FM\PanelPath1'
            '\Software\ABBYY\FineReader\7.00\Shell\Options\LastBatchPath'
            
              '\Software\ABBYY\Retail.ScreenshotReader\9.00\Options\SaveTablePa' +
              'th'
            '\Software\Abyssmedia\ScriptCryptor\Settings\mruitem4'
            '\Software\AC74\View64\MRU6'
            
              '\Software\ACD Systems\ACDSee Pro\90\PrintOptions\OutputContactSh' +
              'eet\ImageMapFN'
            
              '\Software\Adobe\Acrobat Reader\11.0\RememberedViews\cNoCategoryF' +
              'iles'
            '\Software\Adobe\Acrobat Reader\2020\AVGeneral\cRecentFolders'
            '\Software\Adobe\Acrobat Reader\DC\AVGeneral\cDockables'
            '\Software\Adobe\Adobe Acrobat\2020\AVGeneral\cRecentFolders'
            
              '\Software\Adobe\Adobe Acrobat\DC\AVGeneral\uLastAppLaunchTimeSta' +
              'mp'
            '\Software\Adobe\Elements Organizer\17.0\CurrentMediaFilePath'
            
              '\Software\Adobe\Photoshop Elements\13.0\VisitedDirs\STARTUPIMAGE' +
              'DIRECTORY'
            '\Software\Adobe\Premiere Elements\17.0\MRUDocuments'
            '\Software\Amazon\Kindle\User Settings\LastSyncDate3'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 6\Data Disc Project\A' +
              'ddDialog'
            '\Software\Atlantis Word Processor\InsertPicture_Folders'
            '\Software\Attribute Changer\File Settings\CreatedValue'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\RegCleaner.AppLogic.' +
              'ErrorsFound'
            '\Software\Autodesk\AutoCAD\R19.0\ACAD-B001:409\Recent File List'
            '\Software\Autodesk\Inventor\RegistryVersion24.0\Recent File List'
            '\Software\Axialis\IconWorkshop\rss\News2'
            
              '\Software\BreakPoint\Hex Workshop v6.7\Compare\recent_MRU_0sourc' +
              'eFile'
            '\Software\BreakPoint\SIP Workbench\file6'
            '\Software\Centarsia\RecentImage5'
            '\Software\Comodo\Dragon\BrowserExitCodes'
            '\Software\CompSoft\PortScan\MRUTraceroute'
            
              '\Software\Corel\CorelDRAW\17.0\Draw\Application Preferences\NewF' +
              'romTemplate\BrowseTemplateDir'
            '\Software\Corel\User Assistant\X4\Recent Work\Presentations'
            
              '\Software\CyberLink\AudioDirector6\MediaObj\MediaCache5\Thumbnai' +
              'l5'
            
              '\Software\CyberLink\ColorDirector5\MediaObj\MediaCache5\Thumbnai' +
              'l5'
            '\Software\CyberLink\Power2Go9\9.0\DVDFolderPath'
            '\Software\CyberLink\PowerDirector12\MediaObj\MediaCache5\Data5'
            
              '\Software\CyberLink\PowerDVD16\CLMPSvc\MediaObj\MediaCache5\Thum' +
              'bnail5'
            '\Software\DivX\Settings\WebPlayer\cacheEntry2'
            '\Software\DownloadManager\6'
            '\Software\Dragon Software\Dragon UnPACKer 5\Options\Recent_2'
            
              '\Software\ElcomSoft\Advanced Office Password Recovery\Recent fil' +
              'e 4'
            
              '\Software\ExactFile\FormMain_Properties\LabeledEditTestDigestFil' +
              'e.Text'
            '\Software\famatech\advanced_port_scanner\State\LastRangeUsed'
            '\Software\Far\SavedViewHistory'
            '\Software\Foxit Software\Foxit PhantomPDF 7.0\plugins\JSPlugins'
            '\Software\Frhed\Settings\0\MRU_File6'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 5'
            '\Software\Game Maker\Version 5\Preferences\GameDir'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\Disasm\Find\Histo' +
              'ry'
            '\Software\HighCriteria\TotalRecorder\Recent File list\File6'
            '\Software\Honeyview\BMPath5'
            '\Software\Honeyview\RecentFolder5'
            '\Software\Impact\Microangelo\Studio\MRU List'
            '\Software\ImTOO\Video Converter Ultimate\Settings\output'
            '\Software\InstallShield\21.0\Professional\Recent File List'
            '\Software\JBSoftware\MemoMaster5\FileMRU6'
            '\Software\kishDesign\CopyTo\settings3\scutFolder05'
            '\Software\LibreCAD\LibreCAD\RecentFiles'
            '\Software\ManiacTools\mp3Tag Pro\StartFile'
            '\Software\metapad\mru_6'
            
              '\Software\Microsoft\MediaPlayer\Services\Bing\CachedLargeLogoPat' +
              'h'
            '\Software\Microsoft\Microsoft DVD Wizard Settings\MRU1'
            '\Software\Microsoft\Microsoft Help Workshop\Recent File List'
            '\Software\Microsoft\Microsoft HTML Help Image Editor\Folders'
            
              '\Software\Microsoft\Microsoft SQL Server\100\Tools\Shell\Project' +
              'MRUList'
            '\Software\Microsoft\MM20\Publish Wizard\MRU List'
            '\Software\Microsoft\Office\11.0\MSE\SolutionMRUList'
            '\Software\Microsoft\Office\14.0\Excel\Recent Templates'
            '\Software\Microsoft\Office\16.0\Outlook\Preferences\LocationMRU'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 4'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 4'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 4'
            '\Software\Microsoft\VisualStudio\9.0\FileMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 5'
            '\Software\Microsoft\Windows Live\Movie Maker\recent'
            
              '\Software\Microsoft\Windows\CurrentVersion\Photo Aquisition\Opti' +
              'calMedia\RootDirectory'
            '\Software\Microsoft\Windows\Shell\Bags'
            '\Software\MindGems\Audio Dedupe\Settings\ExcludeExt'
            
              '\Software\MindGems\Fast Duplicate File Finder\Settings\ExcludeEx' +
              't'
            
              '\Software\MindGems\Visual Similarity Duplicate Image Finder\Sett' +
              'ings\ExcludeExt'
            '\Software\MPEG Audio Collection\LastNameText6'
            '\Software\N64 Emulation\Project64 Version 1.6\RecentFile6'
            
              '\Software\Nero\Nero 11\Nero Burning ROM\Compilation\VolumelabelJ' +
              'olietTemplate'
            '\Software\NirSoft\RegScanner\TimeTo'
            '\Software\Outertech\GetDiz\Recent Files_6'
            '\Software\PowerISO\SCDEmu\ImageName5'
            '\Software\Prismatic Software\PhotoBatch\Dups\LastSingleFold'
            '\Software\Rosegardenmusic\Rosegarden\recent-5'
            '\Software\Roxio\EMC14\SoundEdit\Directories'
            '\Software\Safer Networking Limited\RegAlyzer\SearchTerm'
            '\Software\SecurityXploded\RouterPasswordDecryptor\Username'
            '\Software\SnapShot\RecentFile5'
            '\Software\Softany\WinCHM\RecentFile6'
            '\Software\Softpointer\Tag&Rename3\Config\FHistoryList'
            '\Software\SolidWorks\SOLIDWORKS 2017\Recent File List'
            '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-5'
            '\Software\TeamViewer\Version9\Last_Machine_Connections'
            
              '\Software\TechSmith\Camtasia Studio\9.0\Camtasia Studio\9.0\Rece' +
              'ntRecordingsMru'
            '\Software\TechSmith\Snagit\11\VidOutputDirLastUsed'
            '\Software\ToolsCenter\TeXnicCenterNT\Recent Project List'
            '\Software\VSO\Blu-ray Converter Ultimate\3\input_MRUfiles_dvd'
            '\Software\WinImage\File6'
            '\Software\xlsconverter\SRCPATH'
            '\Software\XnView\Start\DirName_5'
            '\Software\Ying3\DLExpert\Recent File List'
            '\Software\ABBYY\FineReader\15\Comparator\RateUs\RunCount'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\DVD-Video Disc Pro' +
              'ject\SaveDialog_authed.CMoviesPage.Movies\InitialDirectory'
            '\Software\DownloadManager\60'
            '\Software\Microsoft\VisualStudio\10.0\Find\Find 19'
            '\Software\Nero\Nero 12\Nero Vision\Application\AudioDir'
            
              '\Software\Romain'#39's Software\Attribute Changer\Global Settings\PF' +
              'olderFilter'
            
              '\Software\ABBYY\FineReader\15\Comparator\Shell\Options\MRURecogn' +
              'itionLanguages'
            '\Software\Ashampoo\Ashampoo Burning Studio 19\Logs'
            '\Software\DownloadManager\61'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 0'
            '\Software\Nero\Nero 12\Nero Vision\Application\CaptureDir'
            
              '\Software\ABBYY\FineReader\15\FineReaderShell\Shell\Dialogs\Expo' +
              'rtTAPath'
            '\Software\Ashampoo\Ashampoo Burning Studio 19\tempFiles'
            '\Software\DownloadManager\62'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 1'
            '\Software\Nero\Nero 12\Nero Vision\Application\DocDir'
            
              '\Software\ABBYY\FineReader\15\FineReaderShell\Shell\Dialogs\Impo' +
              'rtTAPath'
            '\Software\Ashampoo\Ashampoo Burning Studio 19\Unknown Project'
            '\Software\DownloadManager\63'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 2'
            '\Software\Nero\Nero 12\Nero Vision\Application\ExportAudioDir'
            
              '\Software\ABBYY\FineReader\15\FineReaderShell\Shell\Dialogs\Save' +
              'ToWebFolderPath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\VCD Project\SaveDi' +
              'alog_OnAddMovies\InitialDirectory'
            '\Software\DownloadManager\64'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 3'
            '\Software\Nero\Nero 12\Nero Vision\Application\ExportVideoDir'
            
              '\Software\ABBYY\FineReader\15\FineReaderShell\Shell\Dialogs\WebF' +
              'olderPath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\VIDEO_TS Disc Proj' +
              'ect\DumpImage\ImagePath'
            '\Software\DownloadManager\65'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 4'
            '\Software\Nero\Nero 12\Nero Vision\Application\ImportVideoDir'
            
              '\Software\ABBYY\FineReader\15\FineReaderShell\Shell\Options\Last' +
              'TAScenario'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 19\VIDEO_TS Disc Proj' +
              'ect\SelectVideoTSFolder\VideoTSPath'
            '\Software\DownloadManager\66'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 5'
            '\Software\Nero\Nero 12\Nero Vision\Application\MediaDir'
            
              '\Software\ABBYY\FineReader\15\FineReaderShell\Shell\Options\Last' +
              'WebFoldersNames'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\Audio Disc Project' +
              '\SaveDialog_CPlaylistDlgEx\InitialDirectory'
            '\Software\DownloadManager\67'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 6'
            '\Software\Nero\Nero 12\Nero Vision\Application\PicDir'
            
              '\Software\ABBYY\FineReader\15\FineReaderShell\Tips\LastGetSocial' +
              'Tips'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\Backup Project\Bac' +
              'kupOptions\CustomLocation'
            '\Software\DownloadManager\68'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 7'
            '\Software\Nero\Nero 12\Nero Vision\Application\PicSaveDir'
            
              '\Software\ABBYY\FineReader\15\FineUI\Dialogs\FROpenFileDialog\La' +
              'stFolder'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\BDMV Disc Project\' +
              'SelectBDMVFolder\BdmvPath'
            '\Software\DownloadManager\69'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 8'
            '\Software\Nero\Nero 12\Nero Vision\Application\TmpDir'
            '\Software\ABBYY\FineReader\7.00\Shell\Options\LastFormatsPage'
            
              '\Software\ABBYY\Retail.ScreenshotReader\9.00\Options\SaveTextPat' +
              'h'
            '\Software\Abyssmedia\ScriptCryptor\Settings\savedir'
            '\Software\AC74\View64\MRU7'
            '\Software\ACD Systems\ACDSee Professional\110\HistMCFDestFolder'
            '\Software\Adobe\Acrobat Reader\DC\AVGeneral\cRecentToolsList'
            '\Software\Adobe\Adobe Acrobat\DC\AVGeneral\cDockables'
            '\Software\Adobe\Adobe Synchronizer\11.0'
            
              '\Software\Adobe\Photoshop Elements\14.0\common\settings\Elements' +
              ' MRU'
            '\Software\Amazon\Kindle\User Settings\LastSyncDate4'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 6\Unknown Project\Add' +
              'Dialog'
            
              '\Software\Atlantis Word Processor\Internal\ImportStyles_LastUsed' +
              'File'
            '\Software\Attribute Changer\File Settings\LimitDateMax'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\RegCleaner.AppLogic.' +
              'ErrorsRemoved'
            '\Software\Autodesk\AutoCAD\R19.0\ACAD-B004:409\Recent File List'
            '\Software\Axialis\IconWorkshop\rss\News3'
            
              '\Software\BreakPoint\Hex Workshop v6.7\Compare\recent_MRU_0sourc' +
              'eLength'
            '\Software\BreakPoint\SIP Workbench\file7'
            '\Software\Centarsia\RecentImage6'
            '\Software\CompSoft\PortScan\MRUWhoIs'
            
              '\Software\Corel\CorelDRAW\17.0\PHOTO-PAINT\Application Preferenc' +
              'es\Framework\RecentFiles'
            '\Software\CyberLink\AudioDirector7\MediaObj\MediaCache5\Data5'
            '\Software\CyberLink\ColorDirector6\MediaObj\MediaCache5\Data5'
            '\Software\CyberLink\Power2Go9\9.0\ImagePath'
            
              '\Software\CyberLink\PowerDirector12\MediaObj\MediaCache5\Thumbna' +
              'il5'
            
              '\Software\CyberLink\PowerDVD17\CLMPSvc\MediaObj\MediaCache5\Data' +
              '5'
            '\Software\DivX\Settings\WebPlayer\cacheEntry3'
            '\Software\DownloadManager\7'
            '\Software\Dragon Software\Dragon UnPACKer 5\Options\Recent_3'
            
              '\Software\ElcomSoft\Advanced Office Password Recovery\Recent fil' +
              'e 5'
            '\Software\Epic Privacy Browser\BrowserExitCodes'
            '\Software\ExactFile\FormMain_Properties\LabeledEditTFPath.Text'
            '\Software\famatech\advanced_port_scanner\State\PortsMruList'
            '\Software\Far\Viewer\LastPositions'
            
              '\Software\Foxit Software\Foxit PhantomPDF 7.0\Preferences\Histor' +
              'y'
            '\Software\Frhed\Settings\0\MRU_File7'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 6'
            '\Software\Game Maker\Version 5\Preferences\Recent0'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\Disasm\Find\Patte' +
              'rns'
            '\Software\HighCriteria\TotalRecorder\Recent File list\File7'
            '\Software\Honeyview\BMPath6'
            '\Software\Honeyview\RecentFolder6'
            
              '\Software\InstallShield\InstallShield Cabinet and Log File Viewe' +
              'r\Recent File List'
            '\Software\JBSoftware\MemoMaster5\FileMRU7'
            '\Software\kishDesign\CopyTo\settings3\scutFolder06'
            '\Software\metapad\mru_7'
            '\Software\Microsoft\MediaPlayer\Setup\FileMoveCache\Source'
            '\Software\Microsoft\Microsoft DVD Wizard Settings\MRU2'
            
              '\Software\Microsoft\Microsoft HTML Help Image Editor\Recent File' +
              ' List'
            
              '\Software\Microsoft\Microsoft SQL Server\110\Tools\Shell\FileMRU' +
              'List'
            '\Software\Microsoft\MM20\Recent Document List'
            '\Software\Microsoft\Office\11.0\Word\FontInfoCache'
            '\Software\Microsoft\Office\14.0\PowerPoint\Recent Templates'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 5'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 5'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 5'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 6'
            '\Software\Microsoft\VisualStudio\9.0\LastLoadedSolution'
            
              '\Software\Microsoft\Windows\CurrentVersion\Photo Aquisition\Scan' +
              'ner\FilenameTemplate'
            '\Software\Microsoft\Windows\ShellNoRoam\BagMRU'
            '\Software\MindGems\Audio Dedupe\Settings\ExcludeFileNameWords'
            
              '\Software\MindGems\Fast Duplicate File Finder\Settings\ExcludeFi' +
              'leNameWords'
            
              '\Software\MindGems\Visual Similarity Duplicate Image Finder\Sett' +
              'ings\ExcludeFileNameWords'
            '\Software\N64 Emulation\Project64 Version 1.6\RecentFile7'
            
              '\Software\Nero\Nero 11\Nero Burning ROM\Compilation\VolumeLabelU' +
              'DFTemplate'
            '\Software\Outertech\GetDiz\Recent Files_7'
            '\Software\PowerISO\SCDEmu\ImageName6'
            '\Software\Prismatic Software\PhotoBatch\MRU'
            '\Software\Rosegardenmusic\Rosegarden\recent-6'
            '\Software\Roxio\EMC14\SoundEdit\MediaSelector'
            '\Software\SnapShot\RecentFile6'
            '\Software\Softpointer\Tag&Rename3\Config\FileListHeader'
            '\Software\Solidworks\SOLIDWORKS 2018\Recent File List'
            '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-6'
            
              '\Software\TechSmith\Camtasia Studio\18.0\Camtasia Recorder\18.0\' +
              'General\lstLastSaveDir'
            '\Software\TechSmith\Snagit\11\SnagItEditor\Tray\Thumbnailsize'
            '\Software\ToolsCenter\TeXnicCenterNT\Session'
            '\Software\VSO\Blu-ray Converter Ultimate\3\input_MRUfiles_iso'
            '\Software\WinImage\File7'
            '\Software\XnView\Start\DirName_6'
            '\Software\ABBYY\FineReader\15\PDFTransformer\LaunchCount'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\Browse Image Proje' +
              'ct\BrowseImageFile\ImagePath'
            '\Software\DownloadManager\70'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 9'
            '\Software\Nero\Nero 12\Nero Vision\Application\VideoDir'
            
              '\Software\ABBYY\FineReader\15\PDFTransformer\PDFEngine\EraseExtr' +
              'aData\LastDeleteNeedlessExtraData'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\Browse Image Proje' +
              'ct\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\DownloadManager\71'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 10'
            '\Software\Nero\Nero 12\Nero WaveEditor\Directories\Last'
            
              '\Software\ABBYY\FineReader\15\PDFTransformer\Shell\Frame\ImportD' +
              'ataFolder'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\Burn Image Project' +
              '\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\DownloadManager\72'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 11'
            '\Software\Nero\Nero Blu-ray Player\Settings\DefFolder'
            
              '\Software\ABBYY\FineReader\15\PDFTransformer\Shell\Frame\Last si' +
              'gnature'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\Burn Image Project' +
              '\SelectImage\ImagePath'
            '\Software\DownloadManager\73'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 12'
            '\Software\Nero\Nero8\Cover Designer\Recent File List'
            
              '\Software\ABBYY\FineReader\15\PDFTransformer\Shell\Signature\Sig' +
              'natureCertificateLocation'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\Data Disc Project\' +
              'DumpImage\ImagePath'
            '\Software\DownloadManager\74'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 13'
            '\Software\Nero\Nero8\Nero - Burning Rom\Recent File List'
            
              '\Software\ABBYY\FineReader\15\PDFTransformer\Shell\Signature\Sig' +
              'natureImagePath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\Data Disc Project\' +
              'SaveDialog_AddFilesAndDirs\InitialDirectory'
            '\Software\DownloadManager\75'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 14'
            
              '\Software\ABBYY\FineReader\15\PDFTransformer\Shell\Statistics\La' +
              'stUsedBuyMessages'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\DVD-Video Disc Pro' +
              'ject\MoviesPage\Path'
            '\Software\DownloadManager\maxID'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 15'
            
              '\Software\ABBYY\FineReader\15\PDFTransformer\Tips\LastGetSocialT' +
              'ips'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\DVD-Video Disc Pro' +
              'ject\SaveDialog_authed.CMoviesPage.Movies\InitialDirectory'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 16'
            '\Software\ABBYY\FineReader\15\Shell\RecentBatchList'
            '\Software\Ashampoo\Ashampoo Burning Studio 20\Logs'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 17'
            '\Software\ABBYY\FineReader\15\Shell\RecentCompareList'
            '\Software\Ashampoo\Ashampoo Burning Studio 20\tempFiles'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 18'
            '\Software\ABBYY\FineReader\7.00\Shell\Options\LastOptionsPage'
            '\Software\ABBYY\ScreenshotReader\9.00\Options\LastSaveImagePath'
            '\Software\AC74\View64\MRU8'
            '\Software\ACD Systems\ACDSee Professional\110\HistPaths'
            '\Software\Adobe\Acrobat Reader\DC\AVGeneral\cToolbars'
            '\Software\Adobe\Adobe Acrobat\DC\AVGeneral\cRecentFiles'
            '\Software\Adobe\Photoshop Elements\14.0\CurrentMediaFilePath'
            '\Software\Amazon\Kindle\User Settings\LastSyncDate5'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 7\Burn Image Project\' +
              'SelectImage'
            '\Software\Atlantis Word Processor\Internal\InitDir'
            '\Software\Attribute Changer\File Settings\LimitDateMin'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\RegCleaner.AppLogic.' +
              'LastScan'
            '\Software\Autodesk\AutoCAD\R20.0\ACAD-8001:409\Recent File List'
            '\Software\Axialis\IconWorkshop\rss\News4'
            
              '\Software\BreakPoint\Hex Workshop v6.7\Compare\recent_MRU_0sourc' +
              'eOffset'
            '\Software\BreakPoint\SIP Workbench\file8'
            
              '\Software\CyberLink\AudioDirector7\MediaObj\MediaCache5\Thumbnai' +
              'l5'
            
              '\Software\CyberLink\ColorDirector6\MediaObj\MediaCache5\Thumbnai' +
              'l5'
            '\Software\CyberLink\Power2Go9\9.0\LastBrowsePath'
            '\Software\CyberLink\PowerDirector13\MediaObj\MediaCache5\Data5'
            
              '\Software\CyberLink\PowerDVD17\CLMPSvc\MediaObj\MediaCache5\Prog' +
              'ramInfo'
            '\Software\DivXNetworks\DivX Player\CustomOpenFileFolder'
            '\Software\DownloadManager\8'
            '\Software\Dragon Software\Dragon UnPACKer 5\Options\Recent_4'
            
              '\Software\ElcomSoft\Advanced Office Password Recovery\Recent fil' +
              'e 6'
            '\Software\famatech\advanced_port_scanner\State\SearchMruList'
            '\Software\Far2\Editor\LastPositions'
            '\Software\Foxit Software\Foxit PhantomPDF 7.0\Recent File List'
            '\Software\Frhed\Settings\0\MRU_File8'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 7'
            '\Software\Game Maker\Version 5\Preferences\Recent1'
            '\Software\Google\Chrome Beta\BrowserExitCodes'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\ExtEditor\Find\Re' +
              'cent'
            '\Software\HighCriteria\TotalRecorder\Recent File list\File8'
            '\Software\Honeyview\BMPath7'
            '\Software\Honeyview\RecentFolder7'
            
              '\Software\InstallShield\InstallShield Professional\6.0\IsCabVu\M' +
              'RU1'
            '\Software\JBSoftware\MemoMaster5\FileMRU8'
            '\Software\kishDesign\CopyTo\settings3\scutFolder07'
            '\Software\metapad\mru_8'
            '\Software\Microsoft\Microsoft DVD Wizard Settings\MRU3'
            
              '\Software\Microsoft\Microsoft SQL Server\110\Tools\Shell\Project' +
              'MRUList'
            
              '\Software\Microsoft\Office\12.0\Common\Internet\UseRWHlinkNaviga' +
              'tion'
            '\Software\Microsoft\Office\14.0\Word\Recent Templates'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 6'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 6'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 6'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 7'
            '\Software\Microsoft\VisualStudio\9.0\ProjectMRUList'
            
              '\Software\Microsoft\Windows\CurrentVersion\Photo Aquisition\Scan' +
              'ner\RootDirectory'
            '\Software\Microsoft\Windows\ShellNoRoam\Bags'
            '\Software\MindGems\Audio Dedupe\Settings\FiltExcludeExt'
            
              '\Software\MindGems\Fast Duplicate File Finder\Settings\FiltExclu' +
              'deExt'
            
              '\Software\MindGems\Visual Similarity Duplicate Image Finder\Sett' +
              'ings\FiltExcludeExt'
            '\Software\N64 Emulation\Project64 Version 1.6\RecentFile8'
            '\Software\Nero\Nero 11\Nero Burning ROM\Recent File List'
            '\Software\Outertech\GetDiz\Recent Files_8'
            '\Software\PowerISO\SCDEmu\ImageName7'
            '\Software\Rosegardenmusic\Rosegarden\recent-7'
            '\Software\Roxio\EMC14\SoundEdit\WaveCache'
            '\Software\SnapShot\RecentFile7'
            '\Software\Solidworks\SOLIDWORKS 2018\Recent Folder List'
            '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-7'
            
              '\Software\TechSmith\Camtasia Studio\18.0\Camtasia Studio\18.0\Ex' +
              'portAsZipMru'
            '\Software\TechSmith\Snagit\12\CaptureCount'
            
              '\Software\ToolsCenter\TeXnicCenterNT\Settings\Options\LastOpened' +
              'Folder'
            
              '\Software\VSO\Blu-ray Converter Ultimate\3\input_MRUfiles_subtit' +
              'le'
            '\Software\WinImage\File8'
            '\Software\XnView\Start\DirName_7'
            '\Software\ABBYY\FineReader\15\Shell\RecentPdfList'
            '\Software\Ashampoo\Ashampoo Burning Studio 20\Unknown Project'
            '\Software\Microsoft\VisualStudio\10.0\Find\Replace 19'
            '\Software\ABBYY\Sprint\5.00\Options\ExportToFilePath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\VCD Project\SaveDi' +
              'alog_OnAddMovies\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 0'
            '\Software\ABBYY\Sprint\5.00\Options\OpenImagePath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\VIDEO_TS Disc Proj' +
              'ect\DumpImage\ImagePath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 1'
            '\Software\ABBYY\Sprint\5.00\Options\SaveImagePath'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 20\VIDEO_TS Disc Proj' +
              'ect\SelectVideoTSFolder\VideoTSPath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 2'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\Audio Disc Project' +
              '\SaveDialog_CPlaylistDlgEx\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 3'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\Backup Project\Bac' +
              'kupOptions\CustomLocation'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 4'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\BDMV Disc Project\' +
              'SelectBDMVFolder\BdmvPath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 5'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\Browse Image Proje' +
              'ct\BrowseImageFile\ImagePath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 6'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\Browse Image Proje' +
              'ct\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 7'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\Burn Image Project' +
              '\SaveDialog_SelectImageBrowse\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 8'
            '\Software\ABBYY\FineReader\8.00\Shell\Dialogs\ExportTAPath'
            '\Software\ABBYY\ScreenshotReader\9.00\Options\SaveTablePath'
            '\Software\ACD Systems\ACDSee Professional\110\LastOptionPageName'
            
              '\Software\Adobe\Acrobat Reader\DC\RememberedViews\cNoCategoryFil' +
              'es'
            '\Software\Adobe\Adobe Acrobat\DC\AVGeneral\cRecentFolders'
            
              '\Software\Adobe\Photoshop Elements\14.0\VisitedDirs\STARTUPIMAGE' +
              'DIRECTORY'
            '\Software\Amazon\Kindle\User Settings\LastSyncDate6'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 7\Data Disc Project\A' +
              'ddDialog'
            '\Software\Atlantis Word Processor\Internal\LastBulPic'
            '\Software\Attribute Changer\File Settings\LimitTimeMax'
            
              '\Software\Auslogics\BoostSpeed\5.x\Settings\TrackEraser.LastScan' +
              '.DateTimeHi'
            '\Software\Autodesk\AutoCAD\R23.0\ACAD-A001:409\Recent File List'
            '\Software\Axialis\IconWorkshop\rss\News5'
            
              '\Software\BreakPoint\Hex Workshop v6.7\Compare\recent_MRU_0targe' +
              'tFile'
            '\Software\BreakPoint\SIP Workbench\file9'
            '\Software\CyberLink\AudioDirector8\MediaObj\MediaCache5\Data5'
            '\Software\CyberLink\ColorDirector7\MediaObj\MediaCache5\Data5'
            '\Software\CyberLink\Power2Go9\9.0\LastSaveProjPath'
            
              '\Software\CyberLink\PowerDirector13\MediaObj\MediaCache5\Thumbna' +
              'il5'
            
              '\Software\CyberLink\PowerDVD17\CLMPSvc\MediaObj\MediaCache5\Thum' +
              'bnail5'
            '\Software\DivXNetworks\DivX Player\file'
            '\Software\DownloadManager\9'
            '\Software\Dragon Software\Dragon UnPACKer 5\Options\Recent_5'
            
              '\Software\ElcomSoft\Advanced Office Password Recovery\Recent fil' +
              'e 7'
            '\Software\Far2\SavedDialogHistory'
            
              '\Software\Foxit Software\Foxit PhantomPDF 8.0\CommentPanel\Filte' +
              'r'
            '\Software\Frhed\Settings\0\MRU_File9'
            '\Software\Gabest\Media Player Classic\Settings\DVD Position 8'
            '\Software\Game Maker\Version 5\Preferences\Recent2'
            '\Software\Google\Chrome Dev\BrowserExitCodes'
            
              '\Software\HHD Software\Hex Editor 6.sm\Windows\ExtEditor\Replace' +
              '\Recent'
            '\Software\HighCriteria\TotalRecorder\Recent File list\File9'
            '\Software\Honeyview\BMPath8'
            '\Software\Honeyview\RecentFolder8'
            
              '\Software\InstallShield\InstallShield Professional\6.0\IsCabVu\M' +
              'RU2'
            '\Software\JBSoftware\MemoMaster5\FileMRU9'
            '\Software\kishDesign\CopyTo\settings3\scutFolder08'
            '\Software\metapad\mru_9'
            '\Software\Microsoft\Office\12.0\Word\Reading Locations'
            '\Software\Microsoft\Office\15.0\Common\OfficeStart\Web\Templates'
            '\Software\Microsoft\VBExpress\10.0\Find\Find 7'
            '\Software\Microsoft\VCExpress\10.0\Find\Find 7'
            '\Software\Microsoft\VCSExpress\10.0\Find\Find 7'
            '\Software\Microsoft\VisualStudio\10.0\FileMRUList'
            '\Software\Microsoft\VisualStudio\9.0\Find\Find 8'
            
              '\Software\MindGems\Audio Dedupe\Settings\FiltExcludeFileNameWord' +
              's'
            
              '\Software\MindGems\Fast Duplicate File Finder\Settings\FiltExclu' +
              'deFileNameWords'
            
              '\Software\MindGems\Visual Similarity Duplicate Image Finder\Sett' +
              'ings\FiltExcludeFileNameWords'
            '\Software\N64 Emulation\Project64 Version 1.6\RecentFile9'
            '\Software\Nero\Nero 11\Nero Burning ROM\Settings\EncodingLastDir'
            '\Software\Outertech\GetDiz\Recent Files_9'
            '\Software\PowerISO\SCDEmu\ImageName8'
            '\Software\Rosegardenmusic\Rosegarden\recent-8'
            '\Software\Roxio\EMC14\VideoConvert\Directories'
            '\Software\SnapShot\RecentFile8'
            '\Software\Solidworks\SOLIDWORKS 2019\Recent File List'
            '\Software\sonic-visualiser\Sonic Visualiser\RecentFiles\recent-8'
            
              '\Software\TechSmith\Camtasia Studio\18.0\Camtasia Studio\18.0\Fi' +
              'leSaveAsMru'
            '\Software\TechSmith\Snagit\12\CaptureOpenCount'
            '\Software\VSO\Blu-ray Converter Ultimate\3\input_MRUfiles_video'
            '\Software\WinImage\File9'
            '\Software\XnView\Start\DirName_8'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\Burn Image Project' +
              '\SelectImage\ImagePath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 9'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\Data Disc Project\' +
              'DumpImage\ImagePath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 10'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\Data Disc Project\' +
              'SaveDialog_AddFilesAndDirs\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 11'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\DVD-Video Disc Pro' +
              'ject\MoviesPage\Path'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 12'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\DVD-Video Disc Pro' +
              'ject\SaveDialog_authed.CMoviesPage.Movies\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 13'
            '\Software\Ashampoo\Ashampoo Burning Studio 22\Logs'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 14'
            '\Software\Ashampoo\Ashampoo Burning Studio 22\tempFiles'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 15'
            '\Software\Ashampoo\Ashampoo Burning Studio 22\Unknown Project'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 16'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\VCD Project\SaveDi' +
              'alog_OnAddMovies\InitialDirectory'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 17'
            
              '\Software\Ashampoo\Ashampoo Burning Studio 22\VIDEO_TS Disc Proj' +
              'ect\DumpImage\ImagePath'
            '\Software\Microsoft\VisualStudio\11.0\Find\Find 18')
          TabOrder = 1
          Visible = False
          WordWrap = False
        end
        object MemoFilters: TMemo
          Left = 20
          Top = 190
          Width = 128
          Height = 57
          Lines.Strings = (
            '[Filters]'
            'Count=79'
            'F0=*.---'
            'CH0=1'
            'F1=*.$$$'
            'CH1=1'
            'F2=*.$db'
            'CH2=1'
            'F3=*.?$?'
            'CH3=1'
            'F4=*.??$'
            'CH4=1'
            'F5=*.??~'
            'CH5=1'
            'F6=*.?~?'
            'CH6=1'
            'F7=*.@@@'
            'CH7=1'
            'F8=*.^'
            'CH8=1'
            'F9=*._detmp'
            'CH9=1'
            'F10=*._mp'
            'CH10=1'
            'F11=*.~*'
            'CH11=1'
            'F12=*.~mp'
            'CH12=1'
            'F13=*.~res'
            'CH13=1'
            'F14=*.aps'
            'CH14=1'
            'F15=*.bak'
            'CH15=1'
            'F16=*.bk?'
            'CH16=1'
            'F17=*.chk'
            'CH17=1'
            'F18=*.cpy'
            'CH18=1'
            'F19=*.db$'
            'CH19=1'
            'F20=*.diz'
            'CH20=1'
            'F21=*.dmp'
            'CH21=1'
            'F22=*.err'
            'CH22=1'
            'F23=*.exe.bak'
            'CH23=1'
            'F24=*.fic'
            'CH24=1'
            'F25=*.fnd'
            'CH25=1'
            'F26=*.ftg'
            'CH26=1'
            'F27=*.FTS'
            'CH27=1'
            'F28=*.gid'
            'CH28=1'
            'F29=*.ilk'
            'CH29=1'
            'F30=*.log'
            'CH30=1'
            'F31=*.log?'
            'CH31=1'
            'F32=*.ms'
            'CH32=1'
            'F33=*.ncb'
            'CH33=1'
            'F34=*.nu3'
            'CH34=1'
            'F35=*.nu4'
            'CH35=1'
            'F36=*.nu4'
            'CH36=1'
            'F37=*.old'
            'CH37=1'
            'F38=*.pch'
            'CH38=1'
            'F39=*.pf'
            'CH39=1'
            'F40=*.prv'
            'CH40=1'
            'F41=*.sdi'
            'CH41=1'
            'F42=*.sik'
            'CH42=1'
            'F43=*.spc'
            'CH43=1'
            'F44=*.syd'
            'CH44=1'
            'F45=*.temp'
            'CH45=1'
            'F46=*.tmp'
            'CH46=1'
            'F47=*.txt.bak'
            'CH47=1'
            'F48=*.wbk'
            'CH48=1'
            'F49=*.xlk'
            'CH49=1'
            'F50=*~*'
            'CH50=1'
            'F51=*bak'
            'CH51=1'
            'F52=*log'
            'CH52=1'
            'F53=*log.txt'
            'CH53=1'
            'F54=*old'
            'CH54=1'
            'F55=*Thumbs.db'
            'CH55=1'
            'F56=.?$?'
            'CH56=1'
            'F57=.??$'
            'CH57=1'
            'F58=.@@@'
            'CH58=1'
            'F59=.~flb'
            'CH59=1'
            'F60=.~res'
            'CH60=1'
            'F61=.ftg'
            'CH61=1'
            'F62=.fts'
            'CH62=1'
            'F63=.prv'
            'CH63=1'
            'F64=~*.*'
            'CH64=1'
            'F65=0*.nch'
            'CH65=1'
            'F66=anti-vir.dat'
            'CH66=1'
            'F67=chklist.*'
            'CH67=1'
            'F68=CHKLIST.MS'
            'CH68=1'
            'F69=IconCache.db'
            'CH69=1'
            'F70=iebak.dat'
            'CH70=1'
            'F71=iebak.dat'
            'CH71=1'
            'F72=log*.txt'
            'CH72=1'
            'F73=modemdet.txt'
            'CH73=1'
            'F74=mscreate.dir'
            'CH74=1'
            'F75=pspbrwse.jbf'
            'CH75=1'
            'F76=suhdlog.dat'
            'CH76=1'
            'F77=system.1st'
            'CH77=1'
            'F78=twain???.mtx'
            'CH78=1'
            ''
            '[Exclusion]'
            'Count=67'
            'E0=$RECYCLE.BIN'
            'CH0=1'
            'E1=*INST*.LOG'
            'CH1=1'
            'E2=*setup*.log'
            'CH2=1'
            'E3=*UNST*.LOG'
            'CH3=1'
            'E4=.sys'
            'CH4=1'
            'E5=~$Normal.dot'
            'CH5=1'
            'E6=assembly'
            'CH6=1'
            'E7=BCD.LOG'
            'CH7=1'
            'E8=Boot.BAK'
            'CH8=1'
            'E9=BOOTSECT.BAK'
            'CH9=1'
            'E10=common files'
            'CH10=1'
            'E11=config'
            'CH11=1'
            'E12=Creative\Speaker\'
            'CH12=1'
            'E13=data.bak'
            'CH13=1'
            'E14=default.pif'
            'CH14=1'
            'E15=Directx.log'
            'CH15=1'
            'E16=edb.log'
            'CH16=1'
            'E17=ftp.log'
            'CH17=1'
            'E18=h323log.txt'
            'CH18=1'
            'E19=http.log'
            'CH19=1'
            'E20=index.dat'
            'CH20=1'
            'E21=insider.bak'
            'CH21=1'
            'E22=install.log'
            'CH22=1'
            'E23=Java'
            'CH23=1'
            'E24=Kaspersky Lab'
            'CH24=1'
            'E25=modem.log'
            'CH25=1'
            'E26=modemdet.txt'
            'CH26=1'
            'E27=ntuser.dat.bak'
            'CH27=1'
            'E28=ntuser.dat.log'
            'CH28=1'
            'E29=OPA10.BAK'
            'CH29=1'
            'E30=OPA11.BAK'
            'CH30=1'
            'E31=OPA12.BAK'
            'CH31=1'
            'E32=OPA13.BAK'
            'CH32=1'
            'E33=OPA14.BAK'
            'CH33=1'
            'E34=Opera'
            'CH34=1'
            'E35=PASSWD.LOG'
            'CH35=1'
            'E36=password.log'
            'CH36=1'
            'E37=RECYCLED'
            'CH37=1'
            'E38=RECYCLER'
            'CH38=1'
            'E39=Registration'
            'CH39=1'
            'E40=sam.log'
            'CH40=1'
            'E41=SCANDISK.LOG'
            'CH41=1'
            'E42=Script.bak'
            'CH42=1'
            'E43=security'
            'CH43=1'
            'E44=servicing'
            'CH44=1'
            'E45=setup.log'
            'CH45=1'
            'E46=Sti_Trace.log'
            'CH46=1'
            'E47=System Volume Information'
            'CH47=1'
            'E48=System.bak'
            'CH48=1'
            'E49=system.old'
            'CH49=1'
            'E50=system32'
            'CH50=1'
            'E51=SystemApps'
            'CH51=1'
            'E52=SysWOW64'
            'CH52=1'
            'E53=user.old'
            'CH53=1'
            'E54=UsrClass.dat.bak'
            'CH54=1'
            'E55=VDK10.SYD'
            'CH55=1'
            'E56=wiadebug.log'
            'CH56=1'
            'E57=wiaservc.log'
            'CH57=1'
            'E58=win.bak'
            'CH58=1'
            'E59=win.old'
            'CH59=1'
            'E60=WindowsApps'
            'CH60=1'
            'E61=WindowsUpdate.log'
            'CH61=1'
            'E62=WININIT.LOG'
            'CH62=1'
            'E63=winnt'
            'CH63=1'
            'E64=winsxs'
            'CH64=1'
            'E65=wnccdctl.log'
            'CH65=1'
            'E66=wz.pif'
            'CH66=1'
            ''
            '[ExclusionReg]'
            'Count=6'
            
              'Reg0=\Software\Classes\Local Settings\Software\Microsoft\Windows' +
              '\Shell\BagMRU'
            'CH0=1'
            
              'Reg1=\Software\Classes\Local Settings\Software\Microsoft\Windows' +
              '\Shell\Bags'
            'CH1=1'
            'Reg2=\Software\Microsoft\Windows\ShellNoRoam\Bags'
            'CH2=1'
            'Reg3=\Software\Microsoft\Windows\ShellNoRoam\BagMRU'
            'CH3=1'
            'Reg4=\Software\Microsoft\Windows\Shell\BagMRU'
            'CH4=1'
            'Reg5=\Software\Microsoft\Windows\Shell\Bags'
            'CH5=1')
          TabOrder = 2
          Visible = False
          WordWrap = False
        end
        object MemoHKLM: TMemo
          Left = 20
          Top = 253
          Width = 130
          Height = 51
          Lines.Strings = (
            
              '\Software\{9F5FBC24-EFE2-4f90-B498-EC0FB7D47D15}\lxbt\Product\Cd' +
              'Root'
            '\Software\4Developers\RCrawler\History'
            '\Software\AdwCleaner\DeleteCount'
            '\Software\Apple Computer, Inc.\QuickTime\Favorite Movies'
            '\Software\Auslogics\Google Analytics Package'
            '\Software\AVIcodec\szInitDir'
            '\Software\BK\BK ReplaceEm\destPath'
            '\Software\BlueLife\RegToBat\LastRegFile'
            '\Software\Chronos\LastCorrectionTime'
            '\Software\Citrix\ICA Client\Default'
            '\Software\Classes\.mpf'
            '\Software\Elaborate Bytes\VirtualCloneDrive\0'
            '\Software\FullCircle\TalkBack'
            '\Software\Google\Update\LastCodeRedCheck'
            '\Software\iSkysoft\iSkysoft Helper Compact'
            '\Software\Juniper Networks\Default'
            '\Software\Microsoft\ESENT\Process'
            '\Software\Microsoft\Games\Age of Empires\1.00\Zone'
            
              '\Software\Microsoft\Windows NT\CurrentVersion\SecEdit\LastUsedDa' +
              'tabase'
            
              '\Software\Microsoft\Windows\CurrentVersion\App Management\ARPCac' +
              'he'
            
              '\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches' +
              '\Active Setup Temp Folders\Folder'
            
              '\Software\Microsoft\Windows\CurrentVersion\InstallService\State\' +
              'CategoryCache'
            
              '\Software\Microsoft\Windows\CurrentVersion\Run\EKAIO2StatusMonit' +
              'or'
            
              '\Software\Microsoft\Windows\Windows Error Reporting\FullLiveKern' +
              'elReports\LastFullLiveReport'
            '\Software\NodeSoft\FileVer\LatestApplicationRunFile'
            '\Software\NSIS\MRU'
            '\Software\Piriform\CCleaner\(Cfg)ABTestingNames'
            '\Software\privacyroot.com\wipe\SETUP-EXE'
            '\Software\Puran Software\Delete Empty Folders\Drives'
            '\Software\Puran Software\Fix Shortcuts\Drives'
            
              '\Software\Silicon Joy Software\Applet Password Wizard\1\mainWind' +
              'ow\MRUList'
            '\Software\Skype\Installer\DonwloadLastModified'
            '\Software\SolwaySoftware\DiskInvestigator\Drive'
            '\Software\Technology Pathways\ProDiscover\Recent File List'
            
              '\System\CurrentControlSet\Control\Session Manager\AppCompatCache' +
              '\AppCompatCache'
            
              '\Software\Auslogics\Registry Cleaner\4.x\Settings\RegCleaner.App' +
              'Logic.ErrorsFailed'
            
              '\Software\Microsoft\Microsoft SQL Server\80\Tools\Shell\ProjectM' +
              'RUList'
            '\Software\Piriform\CCleaner\PPC'
            
              '\Software\Wow6432Node\Parallel Password Recovery\Parallel recove' +
              'ry server\1.0\Last stored job'
            
              '\Software\Auslogics\Registry Cleaner\4.x\Settings\RegCleaner.App' +
              'Logic.ErrorsFound'
            
              '\Software\Microsoft\Microsoft SQL Server\90\Tools\Shell\FileMRUL' +
              'ist'
            '\Software\Piriform\CCleaner\StateSig'
            
              '\Software\Wow6432Node\Parallel Password Recovery\PPR GUI manager' +
              '\1.0\Last password definition file path'
            
              '\Software\Auslogics\Registry Cleaner\4.x\Settings\RegCleaner.App' +
              'Logic.ErrorsRemoved'
            
              '\Software\Microsoft\Microsoft SQL Server\90\Tools\Shell\ProjectM' +
              'RUList'
            '\Software\Piriform\CCleaner\STS'
            
              '\Software\Wow6432Node\Parallel Password Recovery\PPR GUI manager' +
              '\1.0\Last test path'
            
              '\Software\Auslogics\Registry Cleaner\4.x\Settings\RegCleaner.App' +
              'Logic.ErrorsRemovedTotal'
            
              '\Software\Microsoft\Microsoft SQL Server\100\Tools\Shell\FileMRU' +
              'List'
            '\Software\Piriform\CCleaner\UpdateKey'
            
              '\Software\Wow6432Node\Parallel Password Recovery\PPR GUI manager' +
              '\1.0\Path to password definition file'
            
              '\Software\Auslogics\BoostSpeed\7.x\Settings\DiskDefrag.DisksList' +
              '.SelectedDrives'
            
              '\Software\Auslogics\Registry Cleaner\4.x\Settings\RegCleaner.App' +
              'Logic.LastScan'
            
              '\Software\Microsoft\Microsoft SQL Server\100\Tools\Shell\Project' +
              'MRUList'
            
              '\Software\Wow6432Node\Parallel Password Recovery\PPR GUI manager' +
              '\1.0\Path to test file'
            
              '\Software\Auslogics\BoostSpeed\7.x\Settings\DiskDefrag.LastDefra' +
              'gment.DateTime'
            
              '\Software\Auslogics\Registry Cleaner\5.X\Settings\RegCleaner.App' +
              'Logic.ErrorsFailed'
            
              '\Software\Microsoft\Microsoft SQL Server\110\Tools\Shell\FileMRU' +
              'List'
            '\Software\Roxio\EMC13\Common SDK\Users'
            
              '\Software\Auslogics\BoostSpeed\7.x\Settings\DiskDefrag.LastDefra' +
              'gment.DisksList'
            
              '\Software\Auslogics\Registry Cleaner\5.X\Settings\RegCleaner.App' +
              'Logic.ErrorsFound'
            
              '\Software\Microsoft\Microsoft SQL Server\110\Tools\Shell\Project' +
              'MRUList'
            '\Software\Roxio\EMC14\Common SDK\Users'
            
              '\Software\Auslogics\BoostSpeed\7.x\Settings\DiskDefrag.LastDefra' +
              'gment.FilesCount'
            
              '\Software\Auslogics\Registry Cleaner\5.X\Settings\RegCleaner.App' +
              'Logic.ErrorsRemoved'
            '\Software\Wow6432Node\Roxio\EMC13\Common SDK\Users'
            
              '\Software\Auslogics\BoostSpeed\7.x\Settings\RegCleaner.AppLogic.' +
              'ErrorsFailed'
            
              '\Software\Auslogics\Registry Cleaner\5.X\Settings\RegCleaner.App' +
              'Logic.ErrorsRemovedTotal'
            '\Software\Wow6432Node\Roxio\EMC14\Common SDK\Users'
            
              '\Software\Auslogics\BoostSpeed\7.x\Settings\RegCleaner.AppLogic.' +
              'ErrorsFound'
            
              '\Software\Auslogics\Registry Cleaner\5.X\Settings\RegCleaner.App' +
              'Logic.LastScan'
            '\Software\4Developers\RCrawler\Settings\LastSearch'
            '\Software\AdwCleaner\SearchCount'
            '\Software\Apple Computer, Inc.\QuickTime\Recent Movies'
            '\Software\AVAST Software\Tuneup\FixProblems'
            '\Software\AVG\Antivirus\PUB-Removed'
            '\Software\BK\BK ReplaceEm\sourceExcludeFilter'
            '\Software\CBSTEST\CBSTestWDSLogFile'
            '\Software\Chronos\LastCorrectionValue'
            '\Software\Classes\CLSID\{3F2BBC05-40DF-11D2-9455-00104BC936FF}'
            '\Software\eMingSoftware\NetPeeker\ConsoleName'
            '\Software\Google\Update\LastStartedAU'
            '\Software\Microsoft\Direct3D\MostRecentApplication'
            '\Software\Microsoft\Microsoft Games\Age of Empires\Zone'
            '\Software\Microsoft\Tracing'
            '\Software\Microsoft\Windows\CurrentVersion\Run\EKStatusMonitor'
            '\Software\Microsoft\Windows\CurrentVersion\UFH\ARP'
            
              '\Software\Microsoft\Windows\Windows Error Reporting\FullLiveKern' +
              'elReports\win32k.sys'
            '\Software\NodeSoft\FileVer\LatestApplicationRunPath'
            
              '\Software\ODBC\Temporary (volatile) Jet DSN for process 0x5ac Th' +
              'read 0x3d8 DBC 0x2bd1e84 Xbase\DefaultDir'
            '\Software\Piriform\CCleaner\(Cfg)DTNP'
            
              '\Software\Wow6432Node\Auslogics\Duplicate File Finder\7.x\Settin' +
              'gs\DuplicateFileFinder.CheckDrives'
            '\Software\Wow6432Node\iSkysoft\iSkysoft Helper Compact'
            
              '\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\' +
              'VolumeCaches\Active Setup Temp Folders\Folder'
            '\Software\Wow6432Node\Puran Software\Delete Empty Folders\Drives'
            '\Software\Wow6432Node\Puran Software\Fix Shortcuts\Drives'
            
              '\System\CurrentControlSet\Control\Session Manager\AppCompatCache' +
              '\CacheMainSdb'
            
              '\Software\Auslogics\BoostSpeed\7.x\Settings\RegCleaner.AppLogic.' +
              'ErrorsRemoved'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\3.x\Settings\Re' +
              'gCleaner.AppLogic.ErrorsFailed'
            
              '\Software\Auslogics\BoostSpeed\7.x\Settings\RegCleaner.AppLogic.' +
              'ErrorsRemovedTotal'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\3.x\Settings\Re' +
              'gCleaner.AppLogic.ErrorsFound'
            
              '\Software\Auslogics\BoostSpeed\7.x\Settings\RegCleaner.AppLogic.' +
              'LastScan'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\3.x\Settings\Re' +
              'gCleaner.AppLogic.ErrorsRemoved'
            '\Software\Auslogics\Google Analytics Package'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\3.x\Settings\Re' +
              'gCleaner.AppLogic.ErrorsRemovedTotal'
            
              '\Software\Wow6432Node\Auslogics\BoostSpeed\7.x\Settings\DiskDefr' +
              'ag.DisksList.SelectedDrives'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\3.x\Settings\Re' +
              'gCleaner.AppLogic.LastScan'
            
              '\Software\Wow6432Node\Auslogics\BoostSpeed\7.x\Settings\DiskDefr' +
              'ag.LastDefragment.DateTime'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\4.x\Settings\Re' +
              'gCleaner.AppLogic.ErrorsFailed'
            
              '\Software\Wow6432Node\Auslogics\BoostSpeed\7.x\Settings\DiskDefr' +
              'ag.LastDefragment.DisksList'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\4.x\Settings\Re' +
              'gCleaner.AppLogic.ErrorsFound'
            
              '\Software\Wow6432Node\Auslogics\BoostSpeed\7.x\Settings\DiskDefr' +
              'ag.LastDefragment.FilesCount'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\4.x\Settings\Re' +
              'gCleaner.AppLogic.ErrorsRemoved'
            
              '\Software\Wow6432Node\Auslogics\BoostSpeed\7.x\Settings\RegClean' +
              'er.AppLogic.ErrorsFailed'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\4.x\Settings\Re' +
              'gCleaner.AppLogic.ErrorsRemovedTotal'
            
              '\Software\Wow6432Node\Auslogics\BoostSpeed\7.x\Settings\RegClean' +
              'er.AppLogic.ErrorsFound'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\4.x\Settings\Re' +
              'gCleaner.AppLogic.LastScan'
            '\Software\BK\BK ReplaceEm\sourcePath'
            '\Software\CBSTEST\CBSTestWTTLogFile'
            '\Software\Classes\MPR.DocHostUIHandler'
            '\Software\Microsoft\DirectDraw\MostRecentApplication'
            
              '\Software\Microsoft\Microsoft Games\Age of Empires Expansion\1.0' +
              '\Zone'
            '\Software\Microsoft\Windows\CurrentVersion\Run\APR_DEACTIVATED'
            
              '\Software\Microsoft\Windows\Windows Error Reporting\LiveKernelRe' +
              'ports\win32k.sys'
            '\Software\NodeSoft\FileVer\LatestApplicationRunTime'
            
              '\Software\ODBC\Temporary (volatile) Jet DSN for process 0x858 Th' +
              'read 0xfb0 DBC 0x2ca3a74 Paradox\DefaultDir'
            '\Software\Piriform\CCleaner\(Cfg)DUNP'
            '\Software\Wow6432Node\AdwCleaner\DeleteCount'
            
              '\Software\Wow6432Node\Apple Computer, Inc.\QuickTime\Favorite Mo' +
              'vies'
            
              '\System\CurrentControlSet\Control\Session Manager\AppCompatCache' +
              '\SdbTime'
            
              '\Software\Wow6432Node\Auslogics\BoostSpeed\7.x\Settings\RegClean' +
              'er.AppLogic.ErrorsRemoved'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\5.X\Settings\Re' +
              'gCleaner.AppLogic.ErrorsFailed'
            
              '\Software\Wow6432Node\Auslogics\BoostSpeed\7.x\Settings\RegClean' +
              'er.AppLogic.ErrorsRemovedTotal'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\5.X\Settings\Re' +
              'gCleaner.AppLogic.ErrorsFound'
            
              '\Software\Wow6432Node\Auslogics\BoostSpeed\7.x\Settings\RegClean' +
              'er.AppLogic.LastScan'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\5.X\Settings\Re' +
              'gCleaner.AppLogic.ErrorsRemoved'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\5.X\Settings\Re' +
              'gCleaner.AppLogic.ErrorsRemovedTotal'
            
              '\Software\Wow6432Node\Auslogics\Registry Cleaner\5.X\Settings\Re' +
              'gCleaner.AppLogic.LastScan'
            
              '\Software\Microsoft\Microsoft Games\Age of Empires II: The Conqu' +
              'erors Expansion\1.0\Zone'
            
              '\Software\Microsoft\Windows\CurrentVersion\RunOnce\APR_DEACTIVAT' +
              'ED'
            
              '\Software\Microsoft\Windows\CurrentVersion\Setup\Installation So' +
              'urces'
            '\Software\Microsoft\Windows\Windows Error Reporting\LocalDumps'
            '\Software\NCH Software\PicoPDF\Settings\InstallerName'
            '\Software\Piriform\CCleaner\(Cfg)LastUpdate'
            '\Software\Wow6432Node\AdwCleaner\SearchCount'
            
              '\Software\Wow6432Node\Apple Computer, Inc.\QuickTime\Recent Movi' +
              'es'
            '\Software\Wow6432Node\AVG\Antivirus\PUB-Removed'
            '\Software\Wow6432Node\Microsoft\Tracing'
            '\System\CurrentControlSet\enum\root\legacy_block_reader'
            
              '\Software\Auslogics\Registry Cleaner\3.x\Settings\RegCleaner.App' +
              'Logic.ErrorsFailed'
            '\Software\famatech\advanced_ip_scanner\locale_timestamp'
            '\Software\Microsoft\Microsoft Games\Age of Empires\2.0\Zone'
            '\Software\NCH Software\PicoPDF\Software\Installer'
            '\Software\Piriform\CCleaner\BCD'
            '\Software\Wow6432Node\Microsoft\Direct3D\MostRecentApplication'
            '\System\CurrentControlSet\Services\block_reader'
            
              '\Software\Auslogics\Registry Cleaner\3.x\Settings\RegCleaner.App' +
              'Logic.ErrorsFound'
            
              '\Software\Parallel Password Recovery\Parallel recovery server\1.' +
              '0\Last stored job'
            '\Software\Piriform\CCleaner\FTU'
            '\Software\Wow6432Node\Microsoft\DirectDraw\MostRecentApplication'
            
              '\Software\Auslogics\Registry Cleaner\3.x\Settings\RegCleaner.App' +
              'Logic.ErrorsRemoved'
            
              '\Software\Parallel Password Recovery\PPR GUI manager\1.0\Last te' +
              'st path'
            '\Software\Piriform\CCleaner\GD'
            
              '\Software\Auslogics\Registry Cleaner\3.x\Settings\RegCleaner.App' +
              'Logic.ErrorsRemovedTotal'
            
              '\Software\Parallel Password Recovery\PPR GUI manager\1.0\Path to' +
              ' password definition file'
            '\Software\Piriform\CCleaner\LatestICS'
            
              '\Software\Auslogics\Registry Cleaner\3.x\Settings\RegCleaner.App' +
              'Logic.LastScan'
            '\Software\famatech\advanced_port_scanner\locale_timestamp'
            
              '\Software\Microsoft\Microsoft SQL Server\80\Tools\Shell\FileMRUL' +
              'ist'
            
              '\Software\Parallel Password Recovery\PPR GUI manager\1.0\Path to' +
              ' test file'
            '\Software\Piriform\CCleaner\LLSR')
          TabOrder = 4
          Visible = False
          WordWrap = False
        end
        object HeaderControl2: THeaderControl
          Left = 4
          Top = 6
          Width = 157
          Height = 24
          Enabled = False
          Sections = <
            item
              Alignment = taCenter
              ImageIndex = -1
              Text = #1054#1087#1094#1080#1080' '#1086#1095#1080#1089#1090#1082#1080
              Width = 165
            end>
        end
      end
      object TabControl8: TTabControl
        Left = 0
        Top = 386
        Width = 562
        Height = 40
        Align = alBottom
        TabOrder = 2
        object ButtonSaveOption: TButton
          Left = 443
          Top = 6
          Width = 115
          Height = 30
          Cursor = crHandPoint
          Align = alRight
          Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
          TabOrder = 1
          OnClick = ButtonSaveOptionClick
        end
        object ButtonDefaultDiskCleaner: TButton
          Left = 4
          Top = 6
          Width = 115
          Height = 30
          Cursor = crHandPoint
          Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1090#1072#1085#1076#1072#1088#1090#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
          Align = alLeft
          Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = ButtonDefaultDiskCleanerClick
        end
      end
      object TabControl10: TTabControl
        Left = 165
        Top = 0
        Width = 397
        Height = 386
        Align = alClient
        TabOrder = 1
        object ListViewExclusionReg: TListView
          Left = 4
          Top = 6
          Width = 389
          Height = 376
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              AutoSize = True
              Caption = #1050#1083#1102#1095' '#1088#1077#1077#1089#1090#1088#1072
              MinWidth = 390
            end>
          ColumnClick = False
          RowSelect = True
          PopupMenu = PopupMenuExclusionReg
          TabOrder = 2
          ViewStyle = vsReport
          OnChange = ListViewExclusionRegChange
          OnEditing = ListViewExclusionRegEditing
        end
        object ListViewExclusion: TListView
          Left = 4
          Top = 6
          Width = 389
          Height = 376
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              AutoSize = True
              Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1080#1077
              MinWidth = 390
            end>
          ColumnClick = False
          DoubleBuffered = True
          ReadOnly = True
          RowSelect = True
          ParentDoubleBuffered = False
          PopupMenu = PopupMenuExclusion
          SortType = stText
          TabOrder = 1
          ViewStyle = vsReport
          OnChange = ListViewExclusionChange
          OnEditing = ListViewExclusionEditing
        end
        object ListViewFilter: TListView
          Left = 4
          Top = 6
          Width = 389
          Height = 376
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              AutoSize = True
              Caption = #1060#1080#1083#1100#1090#1088
              MinWidth = 390
            end>
          ColumnClick = False
          DoubleBuffered = True
          ReadOnly = True
          RowSelect = True
          ParentDoubleBuffered = False
          PopupMenu = PopupMenuFilter
          SortType = stText
          TabOrder = 0
          ViewStyle = vsReport
          OnChange = ListViewFilterChange
          OnEditing = ListViewFilterEditing
        end
      end
    end
  end
  object TabControl2: TTabControl
    Left = 0
    Top = 32
    Width = 108
    Height = 479
    Align = alLeft
    TabOrder = 1
    object ButtonCleanDisk: TButton
      Left = 4
      Top = 6
      Width = 100
      Height = 100
      Cursor = crHandPoint
      Align = alTop
      Caption = #1054#1095#1080#1089#1090#1082#1072' '#1076#1080#1089#1082#1086#1074
      DoubleBuffered = True
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageAlignment = iaTop
      ImageIndex = 2
      ImageMargins.Top = 20
      Images = ImageList3
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonCleanDiskClick
    end
    object ButtonCleanFast: TButton
      Left = 4
      Top = 106
      Width = 100
      Height = 100
      Cursor = crHandPoint
      Align = alTop
      Caption = #1041#1099#1089#1090#1088#1072#1103' '#1086#1095#1080#1089#1090#1082#1072
      DoubleBuffered = True
      ImageAlignment = iaTop
      ImageIndex = 0
      ImageMargins.Top = 20
      Images = ImageList3
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = ButtonCleanFastClick
    end
    object ButtonCleanOption: TButton
      Left = 4
      Top = 206
      Width = 100
      Height = 100
      Cursor = crHandPoint
      Align = alTop
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      DoubleBuffered = True
      ImageAlignment = iaTop
      ImageIndex = 1
      ImageMargins.Top = 20
      Images = ImageList3
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = ButtonCleanOptionClick
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
  object PopupMenuFilter: TPopupMenu
    Left = 600
    Top = 280
    object AddFilter: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 47
      ImageName = '-1'
      ShortCut = 16462
      OnClick = AddFilterClick
    end
    object ChangeFilter: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ShortCut = 113
      OnClick = ChangeFilterClick
    end
    object N56: TMenuItem
      Caption = '-'
    end
    object SelectAllFilter: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      ShortCut = 16449
      OnClick = SelectAllFilterClick
    end
    object ExcludeAllFilter: TMenuItem
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077
      ShortCut = 16453
      OnClick = ExcludeAllFilterClick
    end
    object N57: TMenuItem
      Caption = '-'
    end
    object SaveFilter: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16467
      OnClick = SaveFilterClick
    end
    object DeleteFilter: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
      OnClick = DeleteFilterClick
    end
  end
  object PopupMenuExclusion: TPopupMenu
    Left = 320
    Top = 288
    object AddExclusion: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16462
      OnClick = AddExclusionClick
    end
    object ChangeExclusion: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ShortCut = 113
      OnClick = ChangeExclusionClick
    end
    object N53: TMenuItem
      Caption = '-'
    end
    object SelectAllExclusion: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      ShortCut = 16449
      OnClick = SelectAllExclusionClick
    end
    object ExcludeAllExclusion: TMenuItem
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077
      ShortCut = 16453
      OnClick = ExcludeAllExclusionClick
    end
    object N54: TMenuItem
      Caption = '-'
    end
    object SaveExclusion: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16467
      OnClick = SaveExclusionClick
    end
    object DeleteExclusion: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
      OnClick = DeleteExclusionClick
    end
  end
  object PopupMenuSearch: TPopupMenu
    MenuAnimation = [maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop, maNone]
    Left = 336
    Top = 184
    object OpenFolderSearch: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091
      ShortCut = 16463
      OnClick = OpenFolderSearchClick
    end
    object N34: TMenuItem
      Caption = '-'
    end
    object AddExceptionsSearch: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1103
      ShortCut = 45
      OnClick = AddExceptionsSearchClick
    end
    object N36: TMenuItem
      Caption = '-'
    end
    object SelectAllSearch: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      ShortCut = 16449
      OnClick = SelectAllSearchClick
    end
    object ExcludeAllSearch: TMenuItem
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077
      ShortCut = 16453
      OnClick = ExcludeAllSearchClick
    end
    object N35: TMenuItem
      Caption = '-'
    end
    object ClearListSearch: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      OnClick = ClearListSearchClick
    end
    object DeleteSelectFileSearch: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
      ShortCut = 46
      OnClick = DeleteSelectFileSearchClick
    end
    object N61: TMenuItem
      Caption = '-'
    end
    object PropertiesSearch: TMenuItem
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ShortCut = 32781
      OnClick = PropertiesSearchClick
    end
  end
  object PopupMenuQuicSearch: TPopupMenu
    Left = 472
    Top = 176
    object OpenFolderQuicSearch: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091
      ShortCut = 16463
      OnClick = OpenFolderQuicSearchClick
    end
    object N41: TMenuItem
      Caption = '-'
    end
    object SelectAllQuicSearch: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      ShortCut = 16449
      OnClick = SelectAllQuicSearchClick
    end
    object ExcludeAllQuicSearch: TMenuItem
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077
      ShortCut = 16453
      OnClick = ExcludeAllQuicSearchClick
    end
    object N63: TMenuItem
      Caption = '-'
    end
    object DeleteFolderQuicSearch: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1087#1082#1091
      OnClick = DeleteFolderQuicSearchClick
    end
    object DeleteFileQuicSearch: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1072#1081#1083
      OnClick = DeleteFileQuicSearchClick
    end
    object ClearListQuicSearch: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      OnClick = ClearListQuicSearchClick
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object PropertiesQuicSearch: TMenuItem
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ShortCut = 32781
      OnClick = PropertiesQuicSearchClick
    end
    object N37: TMenuItem
      Caption = '-'
    end
    object AddExceptionsDiskCleanerMenu: TMenuItem
      Caption = '&'#1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1103
      ImageIndex = 64
      OnClick = AddExceptionsDiskCleanerMenuClick
    end
    object DelRegKeyDiskCleanerMenu: TMenuItem
      Caption = '&'#1059#1076#1072#1083#1080#1090#1100' '#1082#1083#1102#1095' '#1088#1077#1077#1089#1090#1088#1072
      ImageIndex = 46
      OnClick = DelRegKeyDiskCleanerMenuClick
    end
  end
  object PopupMenuQuickClean: TPopupMenu
    Left = 344
    Top = 112
    object SelectAllQuickClean: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      ShortCut = 16449
      OnClick = SelectAllQuickCleanClick
    end
    object ExcludeAllQuickClean: TMenuItem
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077
      ShortCut = 16453
      OnClick = ExcludeAllQuickCleanClick
    end
    object N60: TMenuItem
      Caption = '-'
    end
    object SaveQuickClean: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16467
      OnClick = SaveQuickCleanClick
    end
  end
  object PopupMenuExclusionReg: TPopupMenu
    Left = 472
    Top = 288
    object AddExclusionReg: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16462
      OnClick = AddExclusionRegClick
    end
    object ChangeExclusionReg: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ShortCut = 113
      OnClick = ChangeExclusionRegClick
    end
    object N51: TMenuItem
      Caption = '-'
    end
    object SelectAllExclusionReg: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      ShortCut = 16449
      OnClick = SelectAllExclusionRegClick
    end
    object ExcludeAllExclusionReg: TMenuItem
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077
      ShortCut = 16453
      OnClick = ExcludeAllExclusionRegClick
    end
    object N52: TMenuItem
      Caption = '-'
    end
    object CaveExclusionReg: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16467
      OnClick = CaveExclusionRegClick
    end
    object DeleteExclusionReg: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
      OnClick = DeleteExclusionRegClick
    end
  end
  object ImageList3: TImageList
    ColorDepth = cd32Bit
    Height = 48
    Width = 48
    Left = 231
    Top = 295
    Bitmap = {
      494C010103000800040030003000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000C00000003000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000001000000040000000D000000160000001E0000
      0023000000280000002E000000300000003000000030000000300000002E0000
      0028000000230000001E000000160000000D0000000400000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000002000000070000
      000D00000010000000100000000B000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001000000010000000100000002000000020000000200000002000000010000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000100000007000000150000002600000037000000490000005D0000006B0000
      0076000000800000008B0000008F0000008F0000008F0000008F0000008B0000
      0080000000760000006B0000005D000000490000003700000026000000150000
      0007000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000100000006000000170000002E0000
      003D000000440000004600000034000000140000000200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000001000000020000000400000006000000080000000A0000
      000C0000000D0000000E0000000F0000001000000010000000100000000F0000
      000E0000000D0000000B0000000A000000080000000600000003000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000080000
      001C000000380000005A07020181240C07AB561F11CE732A17DD94351DEAA43B
      20F1D64D2AFFD64D2AFFD64D2AFFD64D2AFFD64D2AFFD64D2AFFA53B21F39536
      1EED762B17E2592012D6270E08BC080301A20000008F000000790000005A0000
      00380000001C0000000800000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000040000001000000029020412730607289E0809
      35B0090D43BD06082AAB0000006C000000370000000D00000000000000000000
      0000000000000000000100000001000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020000
      0005000000090000000B0000000F000000120000001400000017000000190000
      001A0000001D0000001E0000001E0000001F000000200000001E0000001D0000
      001D0000001C0000001A000000180000001600000014000000110000000E0000
      000B000000070000000400000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000200000011000000350502
      016E45190EBEA23A20EED64D2AFFDD633FFFE7835DFFEB956FFFF3B18BFFF6BE
      98FFFDDDB6FFFDE3BCFFFEE8C1FFFEEDC6FFFEF2CAFFFFF7CFFFF7DAB4FFF5D2
      ABFFEDAD87FFE8936DFFDD6945FFD64D2AFFA53B21F34E1C0FD5080301AA0000
      008B000000630000003400000010000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000020000000B000000200000034D0A0D44B31438AFF3116BD0FC0F7E
      DBFE0E87DFFF144EC0F904051EA80000005F0000002200000004000000000000
      000100000007000000140000001D000000170000000900000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000100000004000000080000000C0000
      001000000014000000170000001B0000001E0000002100000023000000260000
      00280000002800000025000000280000002B0000002E0000002E0000002C0000
      002A00000029000000270000002400000023000000200000001D000000190000
      0016000000130000000F0000000B000000060000000200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000001000000110401004F5D2212C7D64D
      2AFFE16B47FFED8E69FFF9B38EFFFCC09BFFFCC6A0FFFCCCA6FFFDD2ACFFFDD8
      B1FFFDDDB6FFFDE3BCFFFEE8C1FFFEEDC6FFFEF2CAFFFFF7CFFFFFFBD3FFFFFE
      D6FFFFF6CFFFFEECC5FFFDE2BBFFFBCFA8FFEE9E78FFE2724EFFD64D2AFF6926
      15E1080302AC0000007C00000040000000100000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000030000000D0000
      0018000000220000003905082896152298EA1B23C3FF0D84E1FF00F4FFFF00F3
      FFFF00FCFFFF03CFF5FF13248CE8000001800000004400000011000000040000
      00110000002B000004570000005E000000510000003200000016000000050000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000003000000080000000D00000011000000160000
      001A0000001E0000002200000026000000290000002D00000030000000330000
      00320001013B00040550000203480000003C0000003300000030000000340000
      00380000003800000035000000320000002F0000002C00000028000000240000
      00200000001C0000001800000014000000100000000B00000006000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000070D050259C24727F7E16744FFF69D
      77FFFBAE89FFFBB48FFFFBBA95FFFCC09BFFFCC6A0FFFCCCA6FFFDD2ACFFFDD8
      B1FFFDDDB6FFFCE2BBFFFCEAC3FFFDF1C9FFFEF4CDFFFFF7CFFFFFFBD3FFFFFE
      D6FFFFF6CFFFFEECC5FFFDE2BBFFFDD7B1FFFCCDA7FFFCC39DFFF6AB86FFE26C
      48FFB54124F71D0B05BE0000007B000000310000000700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000001000000090000001D0000003D0000
      005603041484101B7AD91930C8FF1835CBFF182CC9FF0B87E4FF00EEFFFF00E8
      FFFF00EAFFFF00F7FFFF0E87E0FF080835BB0000006A00000035000000270001
      04530A0F4BB91236A3ED0E1763D30303129A000000700000004A000000220000
      0008000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000100000005000000090000000F00000014000000190000001E0000
      0022000000270000002B0000003000000034000000380000003D0000003E0000
      003F003E4EB50A8EAAF0077B94E300647DD5004150B5001F288E00080A620000
      00460000003B0000003E000000400000003C00000037000000330000002E0000
      002A00000025000000200000001C00000017000000120000000E000000080000
      0003000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000001000020C04526F4EC7E5AFFFAA17CFFFAA8
      83FFFBAE89FFF9B590FFF7C7A1FFF9DBB4FFFCD4AEFFFCCCA6FFFDD2ACFFFDD8
      B1FFF8D6AFFFF7DDB6FFFAE9C2FFFCF3CBFFFEFAD2FFFFFAD2FFFFFBD3FFFFFE
      D6FFFFF6CFFFFCE9C2FFFCEBC3FFFDEAC3FFFCD2ACFFFCC39DFFFBB893FFFBAE
      89FFEA7E5AFFB54124F7080301A3000000510000001100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000100000006000000160000003204061E88122183DE1020
      7EDF1922ACF61637CDFF153CD0FF153DD1FF1535CFFF0A8AE7FF00E9FFFF00E4
      FFFF00E7FFFF00EDFFFF01DFFBFF1437AAF20101068F0000006C070A31A31520
      A0EE1062DBFF01ECFBFF06C8EFFF1451BFF90A0D49C700000383000000540000
      001E000000030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000050000000A0000000F000000150000001A0000001F000000250000
      00290000002C00000032000000370000003C00000041000000470000003F002A
      36A11AAFCDFF84DCE9FF64C8DCFF4FC4DAFF59C9DDFF3CB9D3FF088CABF10057
      6DCD00212993000304590000003F0000003D000000400000003C000000360000
      00320000002C00000027000000220000001D00000018000000120000000E0000
      0008000000020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002D10097DE16440FFFA9B76FFFAA17CFFFAA8
      83FFF5A984FFEDB38DFFF3CCA5FFF8E2BBFFFDF4CCFFFDD9B2FFFDD2ACFFFBD4
      AEFFF3CAA4FFF6D9B2FFF9E5BEFFFBEFC8FFFDF8D0FFFFFDD5FFFFFBD4FFFFFE
      D6FFFCECC5FFF7DEB7FFFAE9C2FFFCF2CBFFFEF7CFFFFCCDA7FFFBB893FFFBAE
      89FFFAA47EFFDF613DFF4B1C0ECD0000005E0000001700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000010000000B0000002501020C670E1565CD183ACCFF05A9F1FF05AE
      F2FF1355D5FF143BD2FF1340D4FF1245D5FF1339D3FF0A7DE6FF00E4FFFF00E2
      FFFF00E3FFFF00E6FFFF00F2FFFF09A4E9FF111677E0111780E21535D1FF0C60
      E2FF00E2FCFF00FFFFFF00FFFFFF00F7FDFF0B9FE5FF112181E30000057B0000
      002F000000060000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0002000000080000000D00000012000000180000001D00000022000000280000
      002D00000033000000380000003D00000043000000490000004400171E8509A1
      C0FD79D6E3FC50BED2FC13AAC7FD45CCDCFC82DDE7FC64C9DAFC10A7C7FF4DC6
      DCFF3BB9D3FF0A829CE9003A48B000080B650000003C0000003A0000003D0000
      0037000000310000002B00000026000000210000001C00000016000000110000
      000B000000060000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE8714EFFFA9B76FFFAA17CFFF9A5
      80FFE89771FFEDB18BFFF3CAA3FFF8E0B9FFFCF2CBFFFDE5BEFFFDD2ACFFFAD0
      A9FFF2C59EFFF5D3ADFFF8E0B9FFFBECC4FFFDF5CDFFFEFCD4FFFFFCD4FFFFFE
      D6FFF9E4BDFFF6D8B1FFF9E3BCFFFBEDC6FFFDF6CFFFFEF5CDFFFBB893FFFBAE
      89FFFAA47EFFE87450FF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00010000000B00000238090E41AD172AB3F61440D2FF04A2F3FF00D4FFFF00D4
      FFFF00CFFEFF0796EEFF0F53DCFF1045D9FF0D61E1FF05A7F2FF00E0FFFF00DF
      FFFF00E1FFFF00E3FFFF00E6FFFF00E8FFFF05C1F2FF07A3EDFF0786EDFF02CA
      F9FF00FBFFFF00F4FFFF00F7FFFF00FDFFFF00FFFFFF126DD7FF030316900000
      002F000000050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00040000000A0000000F000000140000001A0000001F000000240000002A0000
      002F000000350000003A0000003F00000045000000470003045900728DE25CD0
      E2FF6CD0DFFC00A1C3FF00B7D0FE45D0E1FE40C6DAFE009EC0FE01B1CCFD61D4
      E1FC97E0E9FC61CDDFFF07A3C6FF098FAFF4003948AE0007095D000000330000
      0037000000360000002E00000029000000230000001D00000018000000120000
      000D000000070000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE8714EFFFA9B76FFFAA17CFFF197
      71FFE6926CFFECAE88FFF2C7A1FFF7DEB7FFFCF1C9FFFDE5BDFFFDD2ACFFF9CE
      A8FFF0BF99FFF4CEA8FFF7DCB5FFFAE8C1FFFCF2CAFFFEFAD2FFFFFCD4FFFFFE
      D6FFF9E0B9FFF4D1ABFFF7DDB6FFFAE8C1FFFCF2CAFFFEF9D2FFFCCDA7FFFBAE
      89FFFAA47EFFE87450FF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000700010540111D83DA153DD0FF1243D7FF0A72E6FF00CDFFFF00C8FFFF00CA
      FFFF00CEFFFF00D7FFFF01BCFAFF04A4F3FF00D0FEFF00DDFFFF00DAFFFF00DC
      FFFF00DEFFFF00E0FFFF00E2FFFF00E5FFFF00EEFFFF00F1FFFF00F1FFFF00F1
      FFFF00EFFFFF00F1FFFF00F4FFFF00F8FFFF00FEFFFF1164C5F902020E860000
      002B000000040000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0002000000080000000D00000013000000180000001E00000023000000280000
      002D00000033000000380000003D000000430000003E002F3BA528B6D2FF7CDB
      E5FC1EB0CCFE00A9C8FE1FC7DAFE53D2E3FF10A7C7FF00ADCBFF14C5DAFE4AD0
      E2FF52D1E1FE18A9C5FD2EB3CBFB89DFEAFF43BFD7FF0488A6EF002833950001
      0138000000260000002D00000027000000210000001C00000016000000110000
      000B000000050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE77652FFFA9D78FFFAA17CFFED90
      6AFFE5906AFFECAB86FFF2C59FFFF7DCB5FFFCEFC8FFFDE4BDFFFDD2ACFFF9CD
      A6FFEFB993FFF3C9A2FFF6D7B0FFF9E4BDFFFBEEC7FFFDF7CFFFFFFBD4FFFFFE
      D6FFF8DDB6FFF3CAA4FFF6D7B0FFF8E2BBFFFBEDC5FFFDF6CEFFFDD8B2FFFBAE
      89FFF79F7AFFE67551FF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      0123121E84D91244D6FF0E51DFFF0E4FDDFF0D56E0FF02ABF8FF00C9FFFF00C7
      FFFF00C9FFFF00CBFFFF00D1FFFF00D6FFFF00D5FFFF00D5FFFF00D7FFFF00D9
      FFFF00DBFFFF00DDFFFF00DFFFFF00E1FFFF00E4FFFF00E6FFFF00E8FFFF00EA
      FFFF00ECFFFF00EFFFFF00F1FFFF00F5FFFF00FBFFFF105FBEF6010209800000
      002F000000050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000050000000A0000000F000000140000001A0000001E000000240000
      00290000002F00000033000000390000003600060757058CABF164D2E2FE4FCA
      DCFD00A5C5FE00B8D0FD3ED0E2FF2FB7D0FE00A2C4FE03C1D9FE36CDE1FF5BD7
      E5FE2EB9D3FE009EC0FE2FC7DBFE72DAE6FD6FD0DEFC13A7C8FF0FA6C7FF0061
      79D2001014610000001B000000200000001F00000018000000120000000D0000
      0008000000020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE57D59FFFBB58FFFFAA17CFFED8E
      69FFE58D67FFEBA983FFF1C29CFFF6DAB3FFFBEDC6FFFDE3BCFFFDD2ACFFF8CB
      A5FFEDB38DFFF1C39DFFF5D2ABFFF8DFB8FFFAEBC4FFFDF4CDFFFFFAD3FFFFFE
      D6FFF7D9B2FFF1C39DFFF4D0A9FFF7DCB5FFFAE7C0FFFCF1C9FFFCD6B0FFFBAE
      89FFE67D58FFE37651FF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000060B12
      52AB1246D7FF0C57E3FF0C57E3FF0C58E3FF0C55E3FF0872EBFF00C2FEFF00C5
      FFFF00C6FFFF00C8FFFF00CAFFFF00CDFFFF00D0FFFF00D2FFFF00D4FFFF00D6
      FFFF00D9FFFF00DBFFFF00DDFFFF00DFFFFF00E1FFFF00E3FFFF00E5FFFF00E7
      FFFF00EAFFFF00ECFFFF00EEFFFF00F2FFFF00F4FFFF1254BDF70101078A0000
      004A000000170000000400000002000000040000000500000003000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000001000000060000000A0000000F00000014000000190000001E0000
      0022000000270000002B0000003200010127002833952FB8D3FF68D6E1FB26B8
      D1FE00ABC9FE0CC3D9FE46CBDEFE08A4C5FF05BED8FF13CAE0FF51D4E5FE50D1
      E2FF05A2C3FF08B8D2FF4FD3E3FE3EC8DCFE009EC0FE14B0CBFD61D2E0FC42C4
      DAFF079ABBFB0027328D0000001900000011000101150000000D000000080000
      0003000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE57C58FFFCC69FFFFAA17CFFEC8D
      67FFE48A64FFEAA680FFF0C09AFFF6D7B1FFFBECC4FFFDE3BCFFFDD2ACFFF8C9
      A3FFECAC86FFF0BD97FFF3CDA6FFF7DBB4FFF9E7C0FFFCF1C9FFFFFAD2FFFFFE
      D6FFF6D5AEFFF0BC96FFF3C9A3FFF5D6AFFFF8E1BAFFFBECC4FFFCD4AEFFF39B
      75FFE37752FFE27450FF592012D3000000600000001800000000000000000000
      00000000000000000000000000000000000000000000000000000000000C1324
      93DC0B58E3FF095EE8FF0A5EE8FF095FE9FF0961EAFF095DE9FF0297F6FF00C6
      FFFF00C3FFFF00C5FFFF00C8FFFF00CAFFFF00CCFFFF00CFFFFF00D1FFFF00D3
      FFFF00D5FFFF00D7FFFF00D9FFFF00DBFFFF00DEFFFF00E0FFFF00E2FFFF00E4
      FFFF00E6FFFF00E9FFFF00EBFFFF00EFFFFF00F1FEFF1269D1FD070831B90000
      00750000004700000029000000260000002C0000002E0000001F0000000A0000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000003000000080000000D00000011000000160000
      001A0000001E00000022000000220001023302728BDC54CBDEFE4ACCDCFC0DAF
      CBFE00B6D1FE24CEE2FF2BBAD4FF00ADCDFF0FCCE4FF2ACFE4FF62DDECFF24B3
      CFFF00A6C6FE30CBDEFE4FD2E2FF0BA4C4FE00A7C7FE00BED5FE1DC4D9FE87DA
      E4FB80D6E4FD28B1CDFF00495BB6000303270000000000000009000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE57B56FFFCC59EFFFAA17CFFEC8B
      66FFE38761FFEAA37DFFF0BE97FFF5D5AEFFFAEAC2FFFDE2BBFFFDD2ACFFF8C7
      A1FFEAA680FFEEB791FFF2C7A1FFF6D6AFFFF8E3BBFFFBEDC6FFFEF9D2FFFFFE
      D6FFF5D1ABFFEEB48FFFF1C29CFFF4CFA8FFF7DBB4FFF9E6BFFFFBD2ABFFF39A
      74FFE37450FFE2734FFF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000305
      185C1343D5FF0767EEFF0766EDFF0767EEFF0669EFFF0668EFFF056FF1FF00B4
      FDFF00C2FFFF00C2FFFF00C5FFFF00C7FFFF00CAFFFF00CCFFFF00CDFFFF00CE
      FFFF00D3FFFF00D9FEFF00DDFDFF00DDFDFF00DDFEFF00DEFFFF00E0FFFF00E2
      FFFF00E3FFFF00E6FFFF00E9FFFF00EBFFFF00F1FFFF01E6FBFF135CCCFC0707
      2FB7000000800000047501010A7D0203148C0001077C00000056000000250000
      0006000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000004000000080000000C0000
      001000000014000000190000000F001014611CACCAFF5CD3E2FD28C1D7FE02AF
      CCFE04C2DAFE2DCBE1FE11ADCCFF0FC4DEFF15D0E7FF47DAECFF4DCEE2FF00A1
      C3FF10C2DAFF4FD5E5FF1DAFCBFE00A4C5FF00C0D8FF01BDD4FE35C9DCFE53D1
      E2FE78DCE7FD5AC3D5FB02A0C2FF006A85D70004052800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE47A55FFFBC39DFFFAA17CFFEC8A
      64FFE2845EFFE9A17AFFEFBB95FFF5D3ACFFFAE8C1FFFCE1BAFFFDD2ACFFF7C6
      A0FFE99F79FFEDB18BFFF1C19BFFF4D1AAFFF7DEB7FFFAEAC2FFFEF8D1FFFFFE
      D6FFF4CDA7FFECAD87FFEFBB95FFF2C8A2FFF5D5AEFFF8E0B9FFFACFA9FFF39A
      74FFE2724EFFE2714DFF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00010D145EB30B5CE5FF0371F5FF046FF3FF0470F3FF0371F5FF0276F6FF00B2
      FEFF00C0FFFF00C0FFFF00C2FFFF00C4FFFF00C7FFFF00C7FFFF00CDFFFF00DE
      FDFF01E9FAFF01E9F9FF02E6F8FF02E2F6FF03DDF6FF03D9F5FF02D7F8FF00DC
      FDFF00E2FFFF00E4FFFF00E5FFFF00E8FFFF00EAFFFF00F3FFFF01E6FCFF1263
      CFFD1434A1EF1247B1F3115BC0F7126BCFFC12278CE7000103860000004D0000
      0017000000020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020000
      0005000000080000000C000000030036449D3FBFD6FF41CDDCFC0AB6D0FE06B7
      D1FD13CDE4FF20C3DCFF0BB3D1FF1DD4EBFF20D4EBFF55DEEEFF18ACCCFF00B2
      D1FF3BD6E7FF36C0D7FF00A0C2FF00BDD5FF00BDD5FE2CC9DCFF59D6E6FF46CD
      DFFE11AAC8FE009FC1FE55C4D5FA61CADDFF0C758EDC0004052B000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE47854FFFBC29BFFFAA17CFFEB88
      63FFE2815CFFE99E78FFEFB993FFF4D1AAFFF9E6BFFFFCE1B9FFFDD2ACFFF7C4
      9EFFE79872FFEBAA85FFEFBC96FFF3CBA5FFF6D9B2FFF9E6BEFFFEF7D0FFFFFE
      D6FFF3C9A3FFEAA57EFFEDB38DFFF1C19BFFF4CEA7FFF7DAB3FFFACCA6FFF299
      74FFE1704CFFE1704CFF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000030000
      000E0000043C152FB0F1046CF3FF0174F9FF0175F9FF0073FAFF008EFCFF00BB
      FFFF00BBFFFF00BDFFFF00BFFFFF00C1FFFF00C2FFFF00CCFEFF00E6FBFF02ED
      F8FF02E8F8FF02E3F7FF03DEF6FF03DBF5FF04D6F3FF05D0F1FF06CBF0FF06C6
      EFFF04CDF5FF00DFFEFF00E4FFFF00E5FFFF00E7FFFF00E9FFFF00F0FFFF00ED
      FFFF01E4FBFF00EEFEFF00F8FFFF00FFFFFF0BA4E7FF0B0E51CC000000730000
      00350000000A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000011006F87D657CBDDFE21C4D8FD00B4D0FE10C3
      DCFE1BD0E7FE0EB8D5FF16C4DFFF23D9F0FF35DDF2FF38C6DEFF00A4C6FF1FCF
      E6FF45CFE2FF06A4C5FF00B5D1FF00BFD7FF1EC5DAFF57D4E4FE3DC9DDFF04A1
      C2FE06A5C5FE39CADDFF79DBE7FDA7E0E6F93FBCD4FF007B9AE60001021B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE37753FFFAC09AFFFAA17CFFEB86
      61FFE17D59FFE89B75FFEEB690FFF4CFA8FFF9E4BDFFFCE0B9FFFDD2ACFFF6C2
      9CFFE5916BFFEAA47DFFEEB690FFF2C69FFFF5D4AEFFF8E1BAFFFEF6CFFFFFFE
      D6FFF2C59FFFE89D77FFECAB86FFEFBA93FFF2C7A1FFF5D4ADFFF9C9A3FFF299
      73FFE06E49FFE16F4BFF592012D3000000600000001800000000000000000000
      000000000000000000000000000000000000000000010000000A0000001E0000
      0247080B3AAA1436BBF70481F2FF0096FFFF0095FEFF0098FFFF00A9FFFF00B7
      FFFF00B8FFFF00BAFFFF00BDFFFF00BFFFFF00B2F0FA005664B5014A4E980151
      579C028A98CB04CAE2F604D6F4FF05D2F2FF05CDF0FF06C7EFFF07C2EEFF08BB
      ECFF09B4E9FF07B7EDFF01D6FBFF00E5FFFF00E4FFFF00E7FFFF00E8FFFF00ED
      FFFF00F1FFFF00F2FFFF00F3FFFF00F7FFFF00F8FEFF145AC8FB030317A10000
      00580000001A0000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000001000000000003042A129CB9F65ED3E2FE0FC0D6FD07BAD7FE1ACE
      E5FE1FD1E9FF0FB7D6FF26D5EDFF2BDEF5FF34D9EFFF0BA6C8FF0DC0DBFF3ED9
      EBFF19B1CEFF00AECCFF00C0D7FF11C0D6FE52D4E4FF36C4D9FF009FC1FE10B0
      CCFE4CD1E1FE84DAE4FB89DBE8FF35B7D1FF026B83D200121758000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE37651FFFABF98FFFAA17CFFEB85
      60FFE07A56FFE79872FFEEB38EFFF3CCA6FFF8E2BBFFFCDFB8FFFDD2ACFFF6C0
      9AFFE48964FFE89D77FFEDAF89FFF0C09AFFF4CFA9FFF7DDB6FFFDF5CEFFFFFE
      D6FFF1C19BFFE6946EFFEAA47DFFEDB28CFFF0C09AFFF3CDA6FFF8C6A0FFF299
      73FFE06B47FFE06D49FF592012D3000000600000001800000000000000000000
      000000000000000000000000000000000000000000080000002604061F891224
      94E60B5AE5FF0085FDFF00ABFFFF00ADFFFF00B0FFFF00B2FFFF00B2FFFF00B2
      FFFF00B5FFFF00B7FFFF00B9FFFF00BBFFFF005473C600000037000000090000
      000000000003000505290138428805AACAEC07C3EEFF07BEEDFF08B8EBFF09B2
      EAFF0AABE8FF0BA2E5FF0AA4E6FF02D0F9FF00E6FFFF00E3FFFF00E6FFFF00E8
      FFFF00EAFFFF00EDFFFF00EFFFFF00F1FFFF00FCFFFF05C9F2FF0F1E74DC0000
      0166000000220000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000002000000000010155629B2CEFF54D1E0FC09C1DAFE14C3DCFD24D8
      EFFF1ECCE6FF1AC2DFFF32E0F7FF34E3FAFF16BCD9FF05AECEFF2DDAEFFF2BC1
      DAFF00ADCCFF00BFD7FF07BED5FE48D1E2FF30BDD4FE00A1C2FE0EB6D0FE5CD6
      E4FE92DCE4FA6CCDDFFF128DA9EC00232C7D0000000E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE37450FFF9BD96FFFAA17CFFEA83
      5EFFE07753FFE7956FFFEDB18BFFF3CAA3FFF8E0B9FFFCDEB7FFFDD2ACFFF6BE
      98FFE2815CFFE79670FFEBA983FFEFBA94FFF3CAA3FFF6D8B1FFFDF4CDFFFFFE
      D6FFF0BC96FFE48C66FFE89B75FFEBAA84FFEFB892FFF2C69FFFF7C39CFFF298
      72FFDF6945FFE06C48FF592012D3000000600000001800000000000000000000
      000000000000000000000000000000000000000105340E186AC61050DCFF027B
      F8FF008BFFFF008DFFFF00A3FFFF00A7FFFF00A9FFFF00ABFFFF00ADFFFF00B0
      FFFF00B2FFFF00B4FFFF00B6FFFF00B3F6FC0011178400000025000000020000
      000000000000000000000000000000030423034D63A709B2EAFF09ADE8FF0AA7
      E6FF0BA0E5FF0C9AE3FF0E8FDFFF0C94E2FF01D3FBFF00E4FFFF00E3FFFF00E5
      FFFF00E7FFFF00E9FFFF00ECFFFF00EEFFFF00F4FFFF00F7FFFF164DC9FD0101
      0658000000140000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000100000000002933853CBBD3FE49D0E0FB0CC7E0FF1FCEE7FE2BDB
      F1FE1EC8E4FF29D1EBFF3DE7FEFF2DD7F0FF07ACCDFF22D2EBFF30D2E8FF0BB1
      D0FF05C1DAFF02BFD6FE39CDDFFF28BAD3FE00A4C5FE0BBAD3FE65D7E4FD98DD
      E7FC4BBED5FF006179CB0004052C000000000000000000000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE2734FFFF9BB95FFFAA17CFFEA82
      5DFFDF7450FFE6926DFFECAE88FFF2C8A1FFF7DEB7FFFBDDB6FFFDD2ACFFF5BC
      96FFE07955FFE58F69FFE9A27BFFEEB48EFFF1C49EFFF5D3ACFFFDF3CCFFFFFE
      D6FFEFB892FFE2835EFFE6936DFFEAA27CFFEDB18BFFF0BF98FFF7BF99FFF298
      72FFDE6743FFE06B47FF592012D3000000600000001800000000000000000000
      000000000000000000000000000000000000070C388E0A65E8FF0090FFFF008D
      FFFF008BFFFF008FFFFF00A1FFFF00A4FFFF00A6FFFF00A8FFFF00AAFFFF00AD
      FFFF00AFFFFF00B1FFFF00B3FFFF0090C9EE000101620000001D000000000000
      00000000000000000000000000000000000000000000022330760BA0E3FE0C9B
      E3FF0D95E2FF0E8DE0FF0F86DEFF1178D9FF0C91E3FF00DEFEFF00E1FFFF00E2
      FFFF00E4FFFF00E6FFFF00E9FFFF00EFFFFF00F2FFFF0F7DDDFF080C3CA30000
      001E000000050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000003D4BA14EC5DAFE40D1E4FC15CCE4FE2AD8EFFE30DE
      F5FF24CAE4FF3CDEF5FF43E6FCFF19BCD9FF1CC5E1FF30DEF4FF15BCD8FF0CC0
      DBFF06C5DBFE2AC9DDFF24B9D2FE00A7C7FE0ABFD6FF70D8E3FC93DCE8FE34B3
      CFFF0035439A0000000E00000000000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE2714DFFF8B993FFFAA17CFFEA80
      5BFFDE714DFFE5906AFFECAB86FFF2C59FFFF7DCB5FFFBDCB5FFFDD2ACFFF5BA
      94FFDE714DFFE38762FFE89B75FFECAD88FFF0BE98FFF4CEA7FFFDF2CBFFFFFE
      D6FFEEB38EFFE07955FFE48B65FFE89A74FFEBA983FFEEB791FFF6BB96FFF298
      72FFDE6541FFDF6946FF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000A114BA30577F3FF0093FFFF008F
      FFFF0090FFFF0092FFFF009CFFFF00A1FFFF00A3FFFF00A5FFFF00A8FFFF00AA
      FFFF00ACFFFF00AEFFFF00B0FFFF0071A0DF0000005E0000001C000000000000
      0000000000000000000000000000000000000000000000000000011722650D8F
      E0FF0E88DEFF0F81DCFF1079DAFF1270D8FF1462D3FF07AAEDFF00E4FFFF00DF
      FFFF00E1FFFF00E4FFFF00E7FFFF00E6FDFF0F79D9FE090A3FAE000000250000
      0005000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000005D72C45AD0E2FF3BD5E8FD21D7EEFF34DEF4FD34DA
      F2FF31CFE9FF4DE8FDFF36D3ECFF19BCDAFF35E2F9FF20CCE6FF11BFDBFF10CA
      E1FE22CADEFF1FB9D2FE00ACCAFE06BCD4FE74D8E2FB87D9E6FF1CA4C1FA0019
      1F69000000000000000000000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE1704CFFF7B791FFFAA17CFFE97E
      5AFFDE6E4AFFE58D67FFEBA983FFF1C39CFFF6DAB3FFFBDBB4FFFDD2ACFFF4B8
      93FFDC6945FFE17E5AFFE6946EFFEBA781FFEFB892FFF2C8A2FFFCF1C9FFFFFE
      D6FFEDAF89FFDE704CFFE2825CFFE6926CFFE9A17BFFEDAF8AFFF5B892FFF297
      72FFDD633FFFDF6844FF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000B1251A80679F1FF0097FFFF0094
      FFFF0095FFFF0096FFFF0097FFFF009CFFFF00A0FFFF00A3FFFF00A5FFFF00A7
      FFFF00A9FFFF00ABFFFF00AEFFFF006A9BDE0000006400000020000000010000
      0000000000000000000000000000000000000000000000000000000000000424
      3C86107ADBFF1173D8FF126BD6FF1463D4FF1556D0FF1363D5FF00D2FCFF00DF
      FFFF00DFFFFF00E1FFFF00ECFFFF08A8ECFF0E1063D40000005F0000001D0000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000100000005026980CF64D4E5FE3AD6EAFC2ADBF3FE3DE2F8FE39D6
      EEFF47DDF2FF52E5F9FF27C3DEFF36D8F0FF32DEF5FF18C4DFFF18CDE5FE1FCD
      E4FF1ABAD4FE00AFCCFE04BCD4FE71D7E2FB7BD4E3FF0D98B5F5000F14540000
      0000000000010000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE16E4BFFF7B58FFFFAA17CFFE97C
      58FFDD6B47FFE48A64FFEBA681FFF0C09AFFF6D8B1FFFBDAB3FFFDD2ACFFF4B6
      90FFDB613DFFE07652FFE58D67FFE9A07AFFEDB28CFFF1C39CFFFCEFC8FFFFFE
      D6FFECAA85FFDC6744FFE07854FFE48963FFE79872FFEBA882FFF4B48EFFF297
      71FFDC613DFFDE6743FF592012D3000000600000001800000000000000000000
      000000000000000000000000000000000000090F43990581F3FF009FFFFF0099
      FFFF009AFFFF009BFFFF009BFFFF009BFFFF009DFFFF009FFFFF00A2FFFF00A4
      FFFF00A6FFFF00A8FFFF00ABFFFF007CB7E9000000710000002B000000040000
      0000000000000000000000000000000000000000000000000000000000000000
      00030A3C78C01365D5FF145DD2FF1555CFFF164DCDFF183CC9FF089FEBFF00E1
      FFFF00DCFFFF00DEFFFF00E6FFFF04C1F5FF0F1E77DD00000073000000380000
      0010000000030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000046F83CF6BDAEAFF3DDAEFFD34DEF6FD45E2F8FF45D9
      EFFF5CE7FAFF43D3EAFF37D0E8FF44E5FBFF27D0EBFF1FD0E9FF1DD1E9FF15BF
      D8FE00B4CFFE06BDD5FE6DD6E1FB6CCEDFFF0586A3EA000B0E46000000000000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE06D49FFF6B38CFFFAA17CFFE87B
      57FFDC6844FFE38761FFEAA37DFFF0BE98FFF5D6AFFFFBD9B3FFFDD2ACFFF3B5
      8FFFD95835FFDE6F4BFFE38560FFE79973FFECAC86FFF0BD97FFFCEEC7FFFFFE
      D6FFEBA580FFDA5E3BFFDE6F4BFFE2805BFFE5906AFFE9A079FFF3B08AFFF297
      71FFDC5F3CFFDE6642FF592012D3000000600000001800000000000000000000
      000000000000000000000000000000000000050825710F5ADDFF0197FBFF00A4
      FFFF00A0FFFF009FFFFF00A0FFFF00A1FFFF00A1FFFF00A2FFFF00A1FFFF00A1
      FFFF00A3FFFF00A5FFFF00A8FFFF009BE7F8000609870000003F0000000D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000409361453C6F9164FCEFF1747CBFF183EC9FF1B2CC4FF1262D7FF00DC
      FFFF00D9FFFF00DBFFFF00DEFFFF00E2FFFF1445B7F601020B96000000680000
      003F0000001F0000000A00000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0011000D289500022197036389E272E5F1FE49E6F9FD3ADEF7FE4CDDF2FE5AE3
      F6FF5AE0F3FF43D2E9FF4FE4F9FF3ADBF2FE27D2EBFE23D6EEFF14C4DEFE00BB
      D5FE0BC0D6FE6AD2DEFA5EC8DCFF01738EDB0005073300000000000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CE06B48FFF5B08AFFFAA17CFFE87A
      56FFDB6541FFE3845FFFE9A17AFFEFBB95FFF5D3ACFFFBD0AAFFFDD2ACFFFDD8
      B1FFDC6340FFDC6743FFE17C58FFE6926CFFEAA580FFF1C29CFFFFFBD3FFFFFE
      D6FFF5CDA6FFD85532FFDC6642FFE07752FFE38862FFE79771FFF2AC87FFF297
      71FFDB5D3AFFDD6441FF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000A0406206A122D9EE20A72
      E7FF00A2FDFF00A9FFFF00A4FFFF00A5FFFF00A6FFFF00A7FFFF00A5FFFF009E
      FFFF00A0FFFF00A2FFFF00A5FFFF00A7FEFF002133AE000000590000001C0000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000A205AAB1840CAFF1937C7FF1A2FC5FF1C27C3FF1740CCFF00CE
      FDFF00D8FFFF00D8FFFF00DBFFFF00E3FFFF099DE9FF132792EA060729B20000
      007A0000005A0000003500000015000000040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      269F000083FF000092FF00056CFE3A6B9FFE6DD8EDFE5EF4FBFD59E6F8FF66E4
      F6FF59DCEFFF59E3F6FF4FE3F7FE35DAF2FF2CDBF3FF1DCEE7FE09C3DDFE1BC7
      DCFE66D0DDFA4AC1D7FF00637CCD0001021D0000000000000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CDF6A46FFF5AE88FFFAA17CFFED85
      60FFDB623EFFE2815CFFE99E78FFEFB993FFF6CCA6FFFCCCA6FFFDD2ACFFFDD8
      B1FFF6C39DFFE3825CFFDF7450FFE48B65FFEEB38DFFFEF2CAFFFFFBD3FFFFFE
      D6FFFFF6CFFFE07753FFDA5D39FFDE6E4AFFE17E5AFFE58F69FFF5AE88FFF297
      71FFDB5C38FFDD633FFF592012D3000000600000001800000000000000000000
      000000000000000000000000000000000000000000000000000000000116070A
      3284133CB6F0068AF0FF00ADFFFF00AAFFFF00ABFFFF00ACFFFF00ACFFFF009F
      FFFF009EFFFF00A0FFFF00A2FFFF00A5FFFF005C8FDA00000075000000360000
      000A000000000000000000000000000000000000000000000000000000000000
      0000000000000205124F1A31C6FF1B2CC5FF1B2CC5FF1B29C4FF1A35C9FF03B8
      F6FF00D8FFFF00D6FFFF00D8FFFF00DAFFFF00E3FFFF02C8F7FF1071DBFF101A
      75DE030518A20000006D0000003A0000000E0000000000000000000000000000
      0000000000000000000000000000000000000000000100000000000003320000
      71FE0000B9FB0000C2FB0000AEFD000081FD161E76FF5A90B9FE86ECFBFF7BF4
      FFFF66E3F4FE5EE5F8FE49E4F9FF36DEF5FE26D8EFFE14CCE5FE32CEE2FD67D2
      DFFB33B7D1FF005369BD00010115000000000000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CDF6844FFF4AC86FFFAA17CFFF8A2
      7CFFE16F4BFFE17D59FFE89B75FFF2B893FFFBC6A0FFFCCCA6FFFDD2ACFFFDD8
      B1FFFDDDB6FFFDE3BCFFFEE8C1FFFEEDC6FFFEF2CAFFFFF7CFFFFFFBD3FFFFFE
      D6FFFFF6CFFFFCE2BBFFE4835DFFDC6441FFDF7551FFE9956FFFFBB893FFF297
      71FFDA5A36FFDD623EFF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010106311336ABEA00ADFEFF00AFFFFF00AFFFFF00B1FFFF00ADFFFF009B
      FFFF009BFFFF009DFFFF009FFFFF00A2FFFF009BF2FB00121B9F0000005B0000
      0020000000040000000000000000000000000000000000000000000000000000
      0000000000000000000F1724A4EA1B2CC5FF1B2CC5FF1B29C4FF1A32C8FF04B2
      F5FF00D5FFFF00D3FFFF00D5FFFF00D7FFFF00D9FFFF00E1FFFF00E6FFFF05B9
      F2FF1358CCFC080C38B800000055000000170000000000000000000000000000
      0000000000000000000000000000000000000000000100000002000001240000
      56EA00009FFE0000C1FD0001CAFF0E0ECDFE110EB3FE05007CFF2A3683FF76B1
      D0FF81F6FFFF58EDFFFF3FE1F8FE2BDCF4FE25D6ECFE51D6E6FB6BD4E3FD22B0
      CCFF003E4CA40000000900000000000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CDE6743FFF3A882FFFAA17CFFFAA8
      83FFFBAE89FFF6AA85FFF8B48FFFF7B28DFFF3A883FFF1A883FFEEA07AFFEEA4
      7EFFEDA37CFFE99872FFEA9B75FFEA9D77FFEAA079FFEEB28CFFEFBA94FFEFBC
      96FFF3C7A0FFF4C49EFFF8CFA9FFFACCA6FFF6BB95FFFCC39DFFFBB893FFF49D
      77FFD95835FFDC613DFF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000020C175FB5049BF5FF00B7FFFF00B5FFFF00B1FFFF0099FFFF0095
      FFFF0098FFFF009AFFFF009DFFFF009FFFFF00A1FFFF006097DE0000007E0000
      0048000000160000000300000000000000000000000000000000000000000000
      000000000000000000000F186CC01B2CC5FF1B2CC5FF1C29C4FF1936C9FF02B8
      F8FF00D1FFFF00CFFFFF00D2FFFF00D4FFFF00D6FFFF00D8FFFF00DBFFFF00E9
      FFFF02C9F7FF0F1C6FD80000005C0000001B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000101200040
      6BD5052178FE000079FD0200B4FF191AD6FD2A2BE5FF3637E3FE2220B4FF0C0A
      77FE385592FE62C7E2FE58F1FDFE58E6F6FD71DDEBFB59CDE0FF12A0BEFA0024
      2D7E000000000000000000000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CDE6541FFF39F79FFFAA17CFFF79F
      79FFF0936DFFEC8A65FFE8845FFFE98762FFE47A56FFE27450FFE06E4AFFE06F
      4BFFDC6340FFDB603CFFDB603DFFDB613DFFDB613EFFDC6744FFE07854FFE079
      55FFE3825DFFE58963FFE99872FFE9926DFFED9973FFF1A27BFFF7AE89FFFBAE
      89FFDE623EFFDC603CFF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000200000010070931930B78E5FF00BFFFFF00B2FFFF0094FFFF008FFFFF0093
      FFFF0095FFFF0097FFFF009AFFFF009CFFFF009FFFFF00A1FFFF00314EBF0000
      0074000000400000001400000003000000000000000000000000000000000000
      000000000000000000000A114CA41B2CC5FF1B2CC5FF1C26C3FF1647CFFF00C8
      FEFF00CBFFFF00CDFFFF00CFFFFF00D1FFFF00D3FFFF00D5FFFF00D8FFFF00DF
      FFFF03C4F6FF10217DDF0000005C0000001B0000000000000000000000000000
      00000000000000000000000000000000000000000000001A2068008CABE921C0
      D6FF3AC0D5FC1869A0FE020B6FFE060091FE2928D8FF4445F6FF5656FFFF4747
      E8FF120D96FD0E1171FF4A78ABFD61D1E5FF2CB5D2FF006F85D100070A3C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B150B8CDE6541FFF28E69FFEB7E5AFFE777
      53FFE16B47FFDD603DFFD85430FFD64D2AFFDD603CFFE26E4AFFE98560FFE988
      63FFF0A27CFFF3AE89FFF3B38EFFF3B993FFF4BE98FFF2B993FFEAA07AFFEBA4
      7EFFE3845FFFDE6C48FFD64D2AFFD85532FFDD6541FFE2714DFFE77E5AFFED8A
      64FFEB815CFFDC5E3BFF592012D3000000600000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      000B020310611236A8ED04A6F6FF00C0FFFF00AEFFFF008AFFFF008DFFFF0090
      FFFF0092FFFF0094FFFF0096FFFF0099FFFF009CFFFF009EFFFF0097F1FB001E
      31B0000000710000004100000019000000050000000100000000000000000000
      000000000000000000010A114BA31B2CC5FF1B2CC5FF1D22C1FF0D74E0FF00CC
      FFFF00C7FFFF00CAFFFF00CCFFFF00CEFFFF00D0FFFF00D2FFFF00D5FFFF00DC
      FFFF03C2F6FF101F7CDD00000053000000170000000000000000000000000000
      000000000000000000000000000000000002004050A607A5C6FF31C4D9FF38CB
      DCFC24CEE2FE3BE3F1FE48BFDCFE235395FF050575FF2620B4FE5253F7FF4E4F
      F8FE3D3DE9FE1A18BBFE000077FD00276CEC001C1E660000000B000000000000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000013B150C8EDE5F3CFFE56E4BFFDD5C39FFD64D
      2AFFDD5C39FFEA7D59FFF1916CFFFAAD88FFFBB18CFFFBB791FFFBBC97FFFCC2
      9CFFFCC8A2FFFCCEA8FFFDD5AFFFFDDCB6FFFEE3BCFFFEEBC3FFFEF2CBFFFFFA
      D2FFFFFCD4FFFEF2CBFFFEE9C2FFF3BB95FFEC9A75FFDD6541FFD64D2AFFDD5F
      3BFFE6724EFFDE603DFF592012D5000000680000001D00000001000000000000
      0000000000000000000000000000000000000000000000000000000000010101
      08421532AEF003AAF6FF00C6FFFF00BFFFFF00C2FFFF009AFFFF0087FFFF008D
      FFFF008FFFFF0091FFFF0093FFFF0096FFFF0099FFFF009BFFFF009DFFFF0092
      EBF9002034B2000000760000004C000000270000001000000004000000010000
      000000000000000000040E1766BE1B2CC5FF1C26C3FF1938CAFF02B0F8FF00C6
      FFFF00C5FFFF00C7FFFF00C9FFFF00CBFFFF00CDFFFF00D0FFFF00D3FFFF00E1
      FFFF03BCF6FF0E1A67CB000000360000000D0000000000000000000000000000
      000000000000000000000000000000000001002832830590AEF123B8D2FF43D1
      E3FF48D4E6FD4CDBEEFE60ECFBFE6DF1FDFE4FAACFFF173283FF0D0882FE2B29
      BFFD3030DBFE2222D1FA0B0BABFD00003DCC0000000000000000000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000841180D9BD8512EFFD8522FFFE56E4AFFF593
      6DFFFAA07AFFFAA47EFFFAA883FFFAAD88FFFBB18CFFFBB791FFFBBC97FFFCC2
      9CFFFCC8A2FFFCCEA8FFFDD5AFFFFDDCB6FFFEE3BCFFFEEBC3FFFEF2CBFFFFFA
      D2FFFFFCD4FFFEF2CBFFFEE9C2FFFDDFB9FFFDD6AFFFFCCCA6FFF7B48FFFE67C
      58FFD85330FFD8522FFF5B2111DA000000820000003600000008000000000000
      00000000000000000000000000000000000000000000000000000000000A1122
      83D104A6F4FF00C9FFFF00C3FFFF00C4FFFF00C6FFFF00BCFFFF008AFFFF0087
      FFFF0089FFFF008BFFFF008DFFFF0091FFFF0096FFFF0098FFFF009AFFFF009D
      FFFF0099F5FC003C5CC600020386000000650000004300000026000000160000
      000E0000000A000001201624A0EA1C26C2FF1B2CC5FF0790EDFF00C4FFFF00BF
      FFFF00C2FFFF00C4FFFF00C6FFFF00C8FFFF00D4FFFF00E1FFFF00E2FFFF07AC
      EFFF1245B8F304061D7600000013000000030000000000000000000000000000
      000000000000000000000000000000000000000000000004052A004150A4109E
      B9F448C9DCFC7CE7F4FE7BEDFCFF69E4F7FD75F3FDFE77E9F9FE468BB8FF101C
      74FD0D058CFF1113B3FF010081FF0000157B0000000200000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000100002799381EE1DF5F3BFFF58D68FFF99974FFFA9C
      77FFFAA07AFFFAA47EFFFAA883FFFAAD88FFFBB18CFFFBB791FFFBBC97FFFCC2
      9CFFFCC8A2FFFCCEA8FFFDD5AFFFFDDCB6FFFEE3BCFFFEEBC3FFFEF2CBFFFFFA
      D2FFFFFCD4FFFEF2CBFFFEE9C2FFFDDFB9FFFDD6AFFFFCCCA6FFFCC39DFFFBB9
      94FFF6A47EFFDF6440FFA53B21F3080301AA0000006000000019000000000000
      0000000000000000000000000000000000000000000000000000000000060E1B
      6EBF03ACF5FF00CCFFFF00C7FFFF00C8FFFF00C9FFFF00CDFFFF00AEFFFF0091
      FFFF009BFFFF00A2FFFF00AAFFFF009EFFFF008FFFFF0095FFFF0097FFFF009A
      FFFF009CFFFF00A0FFFF036AB8EB021F3EB90002048300000067000000520000
      00420000003A04061E801D23C1FF173ECDFF0790EEFF00C0FFFF00BBFFFF00BD
      FFFF00BFFFFF00C1FFFF00C2FFFF00CAFFFF00E7FFFF03C6F5FF116AD9FF0D13
      5CBB010107410000000900000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000000000000000043
      61CB008CB5FF27B4CEFD71DEEEFE8DEDFAFE81EBFBFF76EAF9FD8AFDFDFE7AD3
      E6FE013F7CF2000041D400032BA4000000090000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004B1B0FA1E1633FFFF9946FFFF99671FFF99974FFFA9C
      77FFFAA07AFFFAA47EFFFAA883FFFAAD88FFFBB18CFFFBB791FFFBBC97FFFCC2
      9CFFFCC8A2FFFCCEA8FFFDD5AFFFFDDCB6FFFEE3BCFFFEEBC3FFFEF2CBFFFFFA
      D2FFFFFCD4FFFEF2CBFFFEE9C2FFFDDFB9FFFDD6AFFFFCCCA6FFFCC39DFFFBB9
      94FFFBB08BFFFAA782FFE16643FF692615E00000008200000029000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      0A3C1258CFFB00CFFFFF00CCFFFF00CCFFFF00CCFFFF00CEFFFF00D0FFFF00CD
      FFFF00CFFFFF00D2FFFF00D5FFFF00CBFFFF009BFFFF008DFFFF0095FFFF0096
      FFFF0099FFFF009BFFFF00A0FFFF009FFFFF0077BFEC00456DCC00283EB20015
      1F9A0018259C0B4AA7E90A7AE8FF00ABFCFF00BAFFFF00B6FFFF00B8FFFF00BA
      FFFF00BCFFFF00BEFFFF00C2FFFF01C1FAFF0E80D8FD112385E0030418780000
      0014000000020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000200000000000E186E0657
      8FFD10689EFB0077A7FE0197BDFF3DC1D9FE85E4F1FD90E8F4FB8DEAF7FC73DE
      EDFF00586BBD0000000400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BE4525F2F58A65FFF9946FFFF99671FFF99974FFFA9C
      77FFFAA07AFFFAA47EFFFAA883FFFAAD88FFFCBC97FFFCC29CFFFCCAA4FFFDCB
      A5FFFCCDA7FFFCCEA8FFFCCDA7FFFCCCA7FFFCCCA6FFFDD3ADFFFDD8B2FFFDDA
      B4FFFEE6BFFFFDE2BCFFFEE9C2FFFDDFB9FFFDD6AFFFFCCCA6FFFCC39DFFFBB9
      94FFFBB08BFFFAA782FFF5946EFFC64727FB0000008E0000002F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000A0D44990896EBFF00DEFFFF00DAFFFF00DCFFFF00DBFFFF00D9FFFF00D5
      FFFF00D4FFFF00D4FFFF00D4FFFF00D8FFFF00CFFFFF00A0FFFF008FFFFF0093
      FFFF0096FFFF0098FFFF009AFFFF009DFFFF009FFFFF00A1FFFF00A3FFFF00A2
      FCFE00A7FFFF00ADFFFF00B3FFFF00B0FFFF00B0FFFF00B3FFFF00B5FFFF00B7
      FFFF00B9FFFF00BBFFFF00C1FFFF01B3FAFF1733B7F902020E97000000550000
      001C000000020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000020430015081F31F76
      AAFE116CA5FC0863A0FF066AA1FE007AA9FD0B9FC2FF51CDE2FF96E8F2FB67D2
      E4FD004454AB0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D64D2AFFF9936EFFF9946FFFF99671FFF99974FFFA9C
      77FFFBB792FFFCCAA3FFFDD9B2FFFDE1BBFFFDDEB7FFFDD5AFFFFDD1AAFFFCCB
      A5FFFCC59FFFFCC39DFFFCC09AFFFCBD97FFFBBA94FFFBB691FFFBB690FFFBB5
      90FFFBB38EFFFBB48FFFFBB18CFFFBB792FFFBBD98FFFBC19BFFFCC39DFFFBB9
      94FFFBB08BFFFAA782FFFA9D78FFD64D2AFF0000008F00000030000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000012132E98DE0A90E8FF0B88E4FF0E79DFFF1163D0FA0E79DFFF00D8
      FFFF00DBFFFF00D7FFFF00D8FFFF00D9FFFF00DFFFFF00C0FFFF008CFFFF0090
      FFFF0093FFFF0095FFFF0097FFFF0099FFFF009CFFFF009EFFFF00A0FFFF00A2
      FFFF00A4FFFF00A7FFFF00A8FFFF00ABFFFF00AEFFFF00B0FFFF00B2FFFF00B4
      FFFF00B6FFFF00B9FFFF00BAFFFF00C4FFFF088EECFF0E1363D5000000790000
      003E0000000F0000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000010000000A003255CB2376ACFF2179
      B1FB076BA8FE086AA6FE156DA5FC095D95FF001E2F9100303E9821AFCDFF2CB6
      D3FF003542970000000000000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D64D2AFFF9936EFFF9946FFFFAA27CFFFCD0AAFFFEE9
      C1FFFEE8C1FFFDDBB4FFFDD0AAFFFCC7A1FFFCC29CFFFCC39DFFFCC39DFFFCC2
      9DFFFCC19BFFFCBF99FFFBBD97FFFBBA94FFFBB691FFFBB28DFFFBAE89FFFAAA
      85FFFAA580FFFAA07AFFFA9F7AFFFAA17BFFFAA37EFFFAA681FFFAA681FFFAAA
      85FFFBAE88FFFAA782FFFA9D78FFD64D2AFF0000008F00000030000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000107320506226D03041A62020311510101093D0809398E0E7A
      DFFF00DFFFFF00DEFFFF00DBFFFF00DDFFFF00E2FFFF00B8FFFF0088FFFF008E
      FFFF0090FFFF0092FFFF0094FFFF0097FFFF0099FFFF009BFFFF009DFFFF009F
      FFFF00A1FFFF00A3FFFF00A6FFFF00A8FFFF00ABFFFF00ADFFFF00AFFFFF00B0
      FFFF00B4FFFF00B6FFFF00B8FFFF00BBFFFF00C2FFFF125ED8FF050624AD0000
      005F0000001F0000000200000000000000000000000000000000000000000000
      0000000000000000000000000002000000000017278B1B6EA3FF358ABEFB0B72
      B4FF076DACFE1070ADFD1D76ABFE014A79EB0000001100000000000A0D45005D
      75C800151A5F0000000000000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D64D2AFFF99974FFFCCCA6FFFEF5CDFFFDE4BDFFFCCE
      A7FFFCC29CFFFCC59FFFFCC8A2FFFCCBA5FFFCCDA7FFFCCEA8FFFCCEA8FFFCCD
      A7FFFCCCA5FFFCC9A3FFFCC6A0FFFCC39DFFFCBF99FFFBBB95FFFBB691FFFBB1
      8CFFFAAC87FFFAA682FFFAA17BFFFA9B76FFF99670FFF9926DFFF99973FFFA9D
      78FFFA9E79FFFAA07BFFFA9D78FFD64D2AFF0000008F00000030000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000709
      3384106DD4FB00E0FEFF00E1FFFF00E0FFFF00E6FFFF00B8FFFF0084FFFF008B
      FFFF008DFFFF008FFFFF0092FFFF0092FFFF0093FFFF0097FFFF009AFFFF009D
      FFFF009FFFFF00A0FFFF00A3FFFF00A5FFFF00A8FFFF00A8FFFF00A9FFFF00AF
      FFFF00AEFFFF00B2FFFF00B5FFFF00B7FFFF00BDFFFF02AFFAFF1430A2EF0000
      04690000001F0000000200000000000000000000000000000000000000000000
      000000000000000000010000000002080C4B0D5E94FD4594C3FB187EBDFE0771
      B4FE0871B4FF237EB6FB186DA4FF001B2E970000000000000001000000000000
      0000000000020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D64D2AFFFEE7C0FFFFF0C8FFFCCAA4FFFCC09BFFFCC5
      9FFFFCCAA4FFFCCEA8FFFDD2ACFFFDD5AFFFFDD8B1FFFDD9B2FFFDD9B2FFFDD8
      B1FFFDD6B0FFFDD3ADFFFCD0A9FFFCCCA6FFFCC7A1FFFCC29CFFFBBD97FFF6AA
      85FFF49F79FFFAAC87FFFAA682FFFAA07BFFF99A75FFF9946FFFF9926DFFF992
      6DFFF99570FFF99974FFF99873FFD64D2AFF0000008F00000030000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000111349DE200DBFDFF00E6FFFF00E4FFFF00EAFFFF00B6FFFF007EFFFF0088
      FFFF008AFFFF008DFFFF008CFFFF0096FFFF00A4FFFF0096FFFF0093FFFF0098
      FFFF009CFFFF009EFFFF00A0FFFF00A2FFFF00A4FFFF00ADFFFF00C8FFFF00E2
      FFFF00CBFFFF00AFFFFF00AFFFFF00B4FFFF00BBFFFF02ACF9FF1432A8EF0000
      03480000000E0000000100000000000000000000000000000000000000000000
      0000000000000000000000000118003F69E04A94C2FF318CC5FC0776BCFF0976
      BAFE1379BAFD3589BFFE075688F50002042E0000000000000001000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D64D2AFFFEEEC7FFFBBF99FFFCC09BFFFCC6A0FFFCCC
      A6FFFCD1ABFFFDD6B0FFFDDBB4FFFDDFB8FFFDE2BBFFFEE4BDFFFEE4BDFFFDE3
      BCFFFDE0B9FFFDDCB6FFFDD8B1FFFDD3ADFFF6B994FFF1A680FFEB8F6AFFE06A
      46FFD74E2BFFDD5F3CFFF1936DFFFAA47EFFFA9E78FFF99872FFF9926DFFF992
      6DFFF9926DFFF9926DFFF99671FFD64D2AFF0000008F00000030000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000210409FE100E3FEFF00E9FFFF00E7FFFF00ECFFFF00C6FFFF0082FFFF007E
      FFFF0087FFFF0087FFFF008BFFFF00D1FFFF00EEFFFF00DCFFFF00C9FFFF009B
      FFFF0098FFFF009BFFFF009DFFFF009FFFFF00A2FFFF00DBFFFF00F7FFFF00F5
      FFFF00F5FFFF00E3FFFF00BDFFFF00B5FFFF00B1FDFF144BCCFC030416740000
      0016000000020000000000000000000000000000000000000000000000000000
      00000000000000000001001F35A33D86B3FF4F9BCBFB0A78BBFE0B78BCFE0777
      BDFF2D8AC3FB2E81B4FF00263FAE000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D64D2AFFFCC9A3FFFBBE98FFFCC49EFFFCCAA4FFFCD1
      AAFFFDD7B0FFFDDDB6FFFDE2BBFFFEE7C0FFFEECC4FFFEEFC7FFFEEFC8FFFEED
      C5FFFEE9C2FFF7CCA6FFF1B18BFFEA9872FFE9906AFFE98D68FFE88661FFE368
      44FFDE5D3AFFD95330FFF1956FFFFAA782FFFAA07BFFF99A75FFF9946FFFF992
      6DFFF9926DFFF9926DFFF9936EFFD64D2AFF000000890000002D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000D1143A7E700E6FEFF00ECFFFF00EAFFFF00EBFFFF00EEFFFF00D4FFFF009A
      FFFF007EFFFF0083FFFF00C3FFFF00F4FFFF00F0FFFF00F3FFFF00F8FFFF00C1
      FFFF0090FFFF0098FFFF009BFFFF009CFFFF009EFFFF00DCFFFF00F8FFFF00F5
      FFFF00F5FFFF00FCFFFF00FFFFFF03BDF7FF134CCDFC05072483000000160000
      0004000000000000000000000000000000000000000000000000000000000000
      000100000000000B14641E6DA0FF61A4CDFA1A82C1FD0978BCFE0A78BBFE117C
      BEFE499ACBFD13679AFE00050A49000000000000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D64D2AFFF9B792FFFCC09AFFFCC6A0FFFCCDA7FFFDD3
      ADFFFDDAB3FFFDE0B9FFFEE6BFFFFEEDC5FFFEF3CBFFFFF8D0FFF8DEB7FFF2C0
      9AFFEBA37DFFEA9B75FFE99872FFE8906BFFE6825DFFEB845EFFF28864FFF993
      6EFFF58965FFE56F4BFFFBAE89FFFAA883FFFAA17CFFFA9B76FFF9946FFFF992
      6DFFF9926DFFF9926DFFF78E69FFD64D2AFF0000006F00000020000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      021D134DBAF100EFFFFF00F0FFFF00EDFFFF00EEFFFF00EEFFFF00F4FFFF00F7
      FFFF00C3FFFF01B1FCFF00F9FFFF00F2FFFF00F2FFFF00F2FFFF00F5FFFF00EE
      FFFF00A1FFFF0092FFFF0097FFFF0099FFFF0099FFFF00E2FFFF00FFFFFF00F8
      FFFF00FFFFFF00F1FCFF0C9CE4FF122A8CDC030414620000000E000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000401385BCE589EC7FF2E88BFFB0064AAFF0973B6FD0777BEFF308B
      C3FB4891BEFE003457CA00000005000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AC583DE1E98863FFFCC09AFFFCC6A0FFFCCCA6FFFDD3
      ADFFFDD9B3FFFDE0B9FFFEE6BFFFF8D4ADFFF2BF99FFEBA882FFEAA37CFFEAA1
      7AFFE99973FFE78C66FFEC926CFFF49A75FFFAA681FFFAA17BFFF38D68FFF192
      6CFFF29B75FFF9AE89FFFBAE89FFFAA883FFFAA17CFFFA9B76FFF9946FFFF992
      6DFFF9926DFFF9926DFFE8704CFF8F3620E0000000400000000D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000F122A91DA07B7EEFF00FBFFFF00F6FFFF00F1FFFF00F7FFFF00FCFFFF05CA
      F2FF125EC2F71434A1E707B9EDFF00FEFFFF00F5FFFF00F5FFFF00F6FFFF00FC
      FFFF00D1FFFF008DFFFF0092FFFF0094FFFF0094FFFF0899ECFF02E7F8FF00FF
      FFFF07BAEDFF1344B0EF07082E8B0000001E0000000500000001000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      000000000013195B86EA579DC9FE0E629AFD30739CFE086197FE0874B7FE5AA1
      CEFB2573A5FF000B136600000000000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000007020132D95835FFEC956FFFFCC49EFFFCCAA4FFFCD0
      AAFFFDD6B0FFFDDCB5FFFDE1BAFFF4C09AFFD7522FFFDF704CFFE7936DFFEDA4
      7EFFF5B691FFFCC6A0FFFBBF99FFF6AA85FFF2A17BFFF2A782FFFABE99FFFCC0
      9AFFFBB994FFFBB38EFFFAAD88FFFAA682FFFAA07BFFF99A74FFF9936EFFF992
      6DFFF9926DFFEA7551FFC24727F70F0503660000001400000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000004270D145EB2107CDCFF02DFF8FF00FFFFFF02E2F9FF0F81DDFF0F19
      6EC901010A490000042B143EADEB00F0FCFF00FBFFFF00F8FFFF00F8FFFF00FA
      FFFF00F9FFFF00B0FFFF0098FFFF00ACFFFF00ACFEFF163FD1FF163FB5F31264
      CEFB0B104EAA0000043400000008000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      00000000001524648DEB408AB8FE32739EFDF7F8F8FD3275A0FF1B76B0FD5EA3
      CBFD034570E20000001200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000E070542BF4E2FF0E0704CFFF3AE88FFFCCB
      A5FFFCD0AAFFFDD5AFFFFDDAB3FFFDDEB7FFE78D67FFEDAE88FFFEF0C9FFFEE7
      C0FFF8CCA5FFF3B38DFFF3B18CFFF8C19BFFFCCDA7FFFCC7A1FFFCC29CFFFBBC
      96FFFBB691FFFBB08BFFFAAA85FFFAA47EFFFA9D78FFF99772FFF9926DFFF083
      5EFFDF603CFFAC3E22EB0D050259000000100000000200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000003031658102A83CF107BDBFF113092DC04041D700000
      00100000000400000000050626730C98E3FF00FFFFFF00FAFFFF00FAFFFF00FB
      FFFF00FDFFFF00FEFFFF00F9FFFF05C6F1FF1353C2F7080D3C9B000105350101
      0735000000050000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000080A466BD95195BFFC256E9DFA3E79A3FD1D6A9BFC5C9EC7F92776
      A8FF001322820000000000000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000100001136130B83C04E30F1DB5C
      39FFEC9872FFF5B892FFFCD1AAFFFDD4ADFFFDD6AFFFF8C6A0FFF4BA95FFF4B9
      93FFF8C39DFFFDD2ACFFFCCEA8FFFCCAA5FFFCC6A0FFFCC19BFFFBBC96FFFBB7
      91FFFBB18CFFFAAB86FFFAA581FFFAA07AFFF38E69FFEA7754FFDA5734FFC24A
      2AF440170D9A0201012700000007000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000901010B3F00000116000000040000
      000100000000000000000000000A112584D102E3F8FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF03E5F7FF107EDBFF0E1766C201010A490000000A000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001000000000013217F1E6FA4FF4C95C2FF3B87B6FF549AC5FF327EAEFF002D
      4CBF000000110000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000001000011200F
      0A646A2C1BB5D95733FFD85633FFE06D49FFE98F69FFEEA07AFFF3AE88FFF5B6
      90FFFCCCA6FFFCC8A2FFFCC59FFFFCC29CFFFBBE98FFFBBB96FFF4A37DFFF298
      73FFED8B65FFE87B57FFDF623FFFD85330FFD85330FF6F2C1ABF250F0A750201
      0121000000060000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000203114F126CD7FF09B7EBFF09B6EBFF0AAF
      E9FF0E90E0FF112A8ADB03041A6E000000110000000300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000090016258705446BDA1A5E88EC0B466DD9001425880000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F0A07422D1811765B2B1DA77E341FC6AB4C30E4DD66
      43FFD64D2AFFD64D2AFFD64D2AFFD64D2AFFD64D2AFFD64D2AFFDD623EFF953A
      23D87F331EC94B1E129E31170F801109074F0000000B00000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000006090E43970F1E70C20F1D72C40C15
      5BB20709358D0101063700000008000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000080000011A00000009000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000C0000000300000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object Taskbar1: TTaskbar
    TaskBarButtons = <>
    ProgressState = Normal
    TabProperties = []
    Left = 155
    Top = 293
  end
  object PopupMenuGeneral: TPopupMenu
    Alignment = paRight
    AutoPopup = False
    Left = 608
    Top = 96
  end
  object PopupMenuLanguage: TPopupMenu
    Left = 460
    Top = 93
    object LangSearch: TMenuItem
      Caption = #1055#1086#1080#1089#1082
    end
    object LangCancel: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1072
    end
    object LangReady: TMenuItem
      Caption = #1043#1086#1090#1086#1074#1086'!'
    end
    object LangDelFilter: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
    end
    object LangDelExclusion: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1077
    end
    object LangAttention: TMenuItem
      Caption = #1042#1085#1080#1084#1072#1085#1080#1077'!'
    end
    object LangOnlyWindows: TMenuItem
      Caption = #1069#1090#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1089#1086#1074#1084#1077#1089#1090#1080#1084#1072' '#1090#1086#1083#1100#1082#1086' '#1089' Windows 10 '#1080' Windows 11.'
    end
    object LangError: TMenuItem
      Caption = #1054#1096#1080#1073#1082#1072
    end
    object LangTotalFilters: TMenuItem
      Caption = #1042#1089#1077#1075#1086' '#1092#1080#1083#1100#1090#1088#1086#1074':'
    end
    object LangRegKey: TMenuItem
      Caption = #1050#1083#1102#1095#1080' '#1088#1077#1077#1089#1090#1088#1072':'
    end
  end
end
