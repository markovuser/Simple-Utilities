Unit Unit_Base;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Registry, FileCtrl, shellapi, Menus, ImgList,
  ActiveX, CommCtrl, IniFiles, SHFolder, pngimage, System.ImageList,
  System.Character, Vcl.Buttons, WindowsDarkMode, Translation, DateUtils,
  StrUtils, FileInfoUtils;

Type
  TWmMoving = Record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  End;

Type
  TListView = Class(ComCtrls.TListView)
  Protected
    Procedure WMVScroll(Var Message: TWMVScroll); Message WM_VSCROLL;
  End;

Type
  TForm1 = Class(TForm)
    PopupMenuUninstall: TPopupMenu;
    SaveDialogUninstall: TSaveDialog;
    UninstallUninstallMenu: TMenuItem;
    DeleteKeyUninstallMenu: TMenuItem;
    OpenFolderUninstallMenu: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    WebSiteUninstallMenu: TMenuItem;
    ListviewDubUninstall: TListView;
    N5: TMenuItem;
    RegistryKeyOpenUninstallMenu: TMenuItem;
    TabControl: TTabControl;
    PopupMenuGeneral: TPopupMenu;
    RefreshListMenu: TMenuItem;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    LogCreateMenu: TMenuItem;
    ViewLogMenu: TMenuItem;
    ViewMenu: TMenuItem;
    IconSmallMenu: TMenuItem;
    IconBigMenu: TMenuItem;
    SpeedButton_GeneralMenu: TSpeedButton;
    PopupMenuLanguage: TPopupMenu;
    LangAttention: TMenuItem;
    LangTotal: TMenuItem;
    LangLoadingData: TMenuItem;
    LangDelete: TMenuItem;
    ImageList3: TImageList;
    PopupMenuBackups: TPopupMenu;
    BackupsUpdateMenu: TMenuItem;
    SeparatorBack1: TMenuItem;
    BackupsRestoreMenu: TMenuItem;
    SeparatorBack2: TMenuItem;
    BackupsDelAllMenu: TMenuItem;
    BackupsDelMenu: TMenuItem;
    TabApp: TTabControl;
    TabControlPanel: TTabControl;
    ButtonUninstall: TButton;
    ButtonBackupsUninstall: TButton;
    PageControl: TPageControl;
    TabUninstall: TTabSheet;
    StatusBarUninstall: TStatusBar;
    ListViewUninstall: TListView;
    MemoLogUninstall: TMemo;
    EditSearchUninstall: TEdit;
    TabBackups: TTabSheet;
    ListViewBackupsUninstall: TListView;
    LangOnlyWindows: TMenuItem;
    LangError: TMenuItem;
    LangSize: TMenuItem;
    LangElements: TMenuItem;

    Procedure LoadNastr;
    Procedure SaveNastr;
    Procedure LoadFromReg;
    Procedure RemoveKey;
    Procedure UnDel;
    Procedure ExportRegistry;
    Procedure key;
    Procedure ListViewUninstallColumnClick(Sender: TObject; Column: TListColumn);
    Procedure DeleteKeyUninstallMenuClick(Sender: TObject);
    Procedure OpenFolderUninstallMenuClick(Sender: TObject);
    Procedure ListViewUninstallSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    Procedure FormCreate(Sender: TObject);
    Procedure WebSiteUninstallMenuClick(Sender: TObject);
    Procedure EditSearchUninstallChange(Sender: TObject);
    Function EraseParam(Path: String): String;
    Function RunPath(Path: String): String;
    Function ErasePath(Path: String): String;
    Function DelPath(Path: String): String;
    Procedure addListViewDub;
    Procedure TrimWorkingSet;
    Procedure deleteDublikateTrack;
    Procedure CleanTranslationsLikeGlobload;
    Procedure globLoad;
    Procedure LoadIconsForItems;
    Procedure LoadIconsDLL;
    Procedure LoadProductIcons;
    Procedure ConfigureListViewColors;
    Function FindFileCopy(Dir: String): Boolean;
    Procedure globLoadUninstall;
    Procedure UninstallUninstallMenuClick(Sender: TObject);
    Procedure RegistryKeyOpenUninstallMenuClick(Sender: TObject);
    Procedure SpeedButton3Click(Sender: TObject);
    Procedure ListViewUninstallClick(Sender: TObject);
    Procedure FormDestroy(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure IconBigMenuClick(Sender: TObject);
    Procedure IconSmallMenuClick(Sender: TObject);
    Procedure FormActivate(Sender: TObject);
    Procedure LogCreateMenuClick(Sender: TObject);
    Procedure RefreshListMenuClick(Sender: TObject);
    Procedure ViewLogMenuClick(Sender: TObject);
    Procedure SpeedButton_GeneralMenuClick(Sender: TObject);
    Procedure ButtonUninstallClick(Sender: TObject);
    Procedure ButtonBackupsUninstallClick(Sender: TObject);
    Procedure BackupsUpdateMenuClick(Sender: TObject);
    Procedure BackupsRestoreMenuClick(Sender: TObject);
    Procedure BackupsDelAllMenuClick(Sender: TObject);
    Procedure BackupsDelMenuClick(Sender: TObject);
    Procedure ListViewUninstallCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Var DefaultDraw: Boolean);
    Function IsWindows10Or11: Boolean;
    Function PortablePath: String;
    Procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  Private
    { Private declarations }
    Procedure WMMouseMove(Var Message: TWMMouseMove); Message WM_MOUSEMOVE;
    Procedure WMSettingChange(Var Message: TWMSettingChange); Message WM_SETTINGCHANGE;
  Public
    SC: THandle;
    itenNumb: Integer;
    EditPath: pchar;
    Windir: String;
    WindirP: pchar;
    Res: Cardinal;
    FTimeZoneInfo: TTimeZoneInformation;
  End;

Type
  MyThreadMedia = Class(TThread) // Поток установки медиа данных

  Private
    { Private declarations }
  Protected
    Procedure Execute; Override;
  End;

Var
  Form1: TForm1 = Nil;
  sort: Integer = 1;
  Msg: Integer;
  reg: tregistry;
  lName, lNameNoSymbol: TStringList;
  Param, sUnist, param1, ShellPath, ShellParams: String;
  StrList: TStringList;
  trr3: MyThreadMedia;
  Temp: Array Of String;
  Portable: Boolean;

Const
  s64Key: String = '\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall';
  s32Key: String = '\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall';
  HKEYNames: Array[0..6] Of String = ('HKEY_CLASSES_ROOT', 'HKEY_CURRENT_USER', 'HKEY_LOCAL_MACHINE', 'HKEY_USERS', 'HKEY_PERFORMANCE_DATA', 'HKEY_CURRENT_CONFIG', 'HKEY_DYN_DATA');

Implementation

{$R *.dfm}

Function TForm1.IsWindows10Or11: Boolean;
Begin
  Result := (TOSVersion.Major = 10) And (TOSVersion.Build >= 10240);
End;

Procedure TForm1.WMSettingChange(Var Message: TWMSettingChange);
Var
  Ini: TMemIniFile;
  ThemeAuto: Boolean;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);

  ThemeAuto := Ini.ReadBool('Option', 'ThemeAuto', False);
  If ThemeAuto = true Then
  Begin
    If DarkModeIsEnabled = true Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
      ConfigureListViewColors;
      ListViewUninstall.Invalidate;
      Application.ProcessMessages;
    End;

    If DarkModeIsEnabled = False Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      ConfigureListViewColors;
      ListViewUninstall.Invalidate;
      Application.ProcessMessages;
    End;
  End;
  Ini.Free;
End;

Function FileTimeToDateTime(FileTime: TFileTime): TDateTime;
Var
  ModifiedTime: TFileTime;
  SystemTime: TSystemTime;
Begin
  Result := 0;
  If (FileTime.dwLowDateTime = 0) And (FileTime.dwHighDateTime = 0) Then
    Exit;
  Try
    FileTimeToLocalFileTime(FileTime, ModifiedTime);
    FileTimeToSystemTime(ModifiedTime, SystemTime);
    Result := SystemTimeToDateTime(SystemTime);
  Except
    Result := Now; // Something to return in case of error
  End;
End;

Function StrToHKEY(Const key: String): HKEY;
Var
  i: byte;
Begin
  Result := $0;
  For i := Low(HKEYNames) To High(HKEYNames) Do
  Begin
    If SameText(HKEYNames[i], key) Then
      Result := HKEY_CLASSES_ROOT + i;
  End;
End;

Procedure TListView.WMVScroll(Var Message: TWMVScroll);
Begin
  TWinControl(self).DefaultHandler(Message);
End;

Function ListViewConfHTML(Listview: TListView; output: String; center: Boolean): Boolean;
Var
  i, f: Integer;
  tfile: TextFile;
Begin
  Try
    SysUtils.ForceDirectories(ExtractFilePath(output));
    AssignFile(tfile, output);
    ReWrite(tfile);
    WriteLn(tfile, '<html>');
    WriteLn(tfile, '<head>');
    WriteLn(tfile, '<title>HTML-Ansicht: ' + Listview.Name + '</title>');
    WriteLn(tfile, '</head>');
    WriteLn(tfile, '<table border="1" bordercolor="#000000">');
    WriteLn(tfile, '<tr>');
    For i := 0 To Listview.Columns.Count - 1 Do
    Begin
      If center Then
        WriteLn(tfile, '<td><b><center>' + Listview.Columns[i].Caption + '</center></b></td>')
      Else
        WriteLn(tfile, '<td><b>' + Listview.Columns[i].Caption + '</b></td>');
    End;
    WriteLn(tfile, '</tr>');
    WriteLn(tfile, '<tr>');
    For i := 0 To Listview.Items.Count - 1 Do
    Begin
      WriteLn(tfile, '<td>' + Listview.Items.Item[i].Caption + '</td>');
      For f := 0 To Listview.Columns.Count - 2 Do
      Begin
        If Listview.Items.Item[i].SubItems[f] = '' Then
          Write(tfile, '<td>-</td>')
        Else
          Write(tfile, '<td>' + Listview.Items.Item[i].SubItems[f] + '</td>');
      End;
      Write(tfile, '</tr>');
    End;
    WriteLn(tfile, '</table>');
    WriteLn(tfile, '</html>');
    CloseFile(tfile);
    Result := true;
  Except
    Result := False;
  End;
End;

Function GetSpecialFolderPath(folder: Integer): String;
Const
  SHGFP_TYPE_CURRENT = 0;
Var
  Path: Array[0..MAX_PATH] Of char;
Begin
  If SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @Path[0])) Then
    Result := Path
  Else
    Result := '';
End;

Function SortCaptionAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  If AnsiUpperCase(Item1.Caption) > AnsiUpperCase(Item2.Caption) Then
    Result := ParamSort
  Else If AnsiUpperCase(Item1.Caption) < AnsiUpperCase(Item2.Caption) Then
    Result := -ParamSort;
End;

Function SortFirstSubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  If AnsiUpperCase(Item1.SubItems[0]) > AnsiUpperCase(Item2.SubItems[0]) Then
    Result := ParamSort
  Else If AnsiUpperCase(Item1.SubItems[0]) < AnsiUpperCase(Item2.SubItems[0]) Then
    Result := -ParamSort;
End;

// Сортируем по третьей колонке
// SubItem2 - числовое поле

Function Sort1SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  If AnsiUpperCase(Item1.SubItems[1]) > AnsiUpperCase(Item2.SubItems[1]) Then
    Result := ParamSort
  Else If AnsiUpperCase(Item1.SubItems[1]) < AnsiUpperCase(Item2.SubItems[1]) Then
    Result := -ParamSort;
End;

Function Sort2SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  If AnsiUpperCase(Item1.SubItems[2]) > AnsiUpperCase(Item2.SubItems[2]) Then
    Result := ParamSort
  Else If AnsiUpperCase(Item1.SubItems[2]) < AnsiUpperCase(Item2.SubItems[2]) Then
    Result := -ParamSort;
End;

Function Sort3SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  If AnsiUpperCase(Item1.SubItems[3]) > AnsiUpperCase(Item2.SubItems[3]) Then
    Result := ParamSort
  Else If AnsiUpperCase(Item1.SubItems[3]) < AnsiUpperCase(Item2.SubItems[3]) Then
    Result := -ParamSort;
End;

Function OpenRegEditAndJumpToKey(Const KeyName: String): Boolean;
Var
  Keylnfo: TRegKeyInfo;
  reg: tregistry;
Begin
  reg := tregistry.Create(KEY_READ Or KEY_WOW64_64KEY Or KEY_WOW64_32KEY);
  If Form1.ListViewUninstall.Selected.SubItems[5] = 'HKEY_CURRENT_USER' Then
  Begin
    reg.RootKey := HKEY_CURRENT_USER;
    reg.Access := KEY_WOW64_32KEY Or KEY_ALL_ACCESS;
  End;
  If Form1.ListViewUninstall.Selected.SubItems[5] = 'HKEY_LOCAL_MACHINE' Then
  Begin
    reg.RootKey := HKEY_LOCAL_MACHINE;
    { reg.Access := KEY_WOW64_32KEY or KEY_ALL_ACCESS;
      reg.Access := KEY_WOW64_64KEY or KEY_ALL_ACCESS; }
    reg.OpenKey(Form1.ListViewUninstall.Selected.SubItems[6], False);
    reg.GetKeyInfo(Keylnfo);
    reg.CloseKey;
    If Keylnfo.NumValues = 0 Then
    Begin
      reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    End;
    If Keylnfo.NumValues <> 0 Then
    Begin
      reg.Access := KEY_WOW64_32KEY Or KEY_ALL_ACCESS;
    End;
  End;
  Result := reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Applets\Regedit', False);
  If Result Then
  Try
    Try
      reg.WriteString('LastKey', KeyName);
    Except
      Result := False;
      Exit;
    End;
  Except
    reg.CloseKey;
  End;
  reg.Free;
  Result := ShellExecute(0, 'open', 'regedit.exe', Nil, Nil, SW_SHOWNORMAL) > HINSTANCE_ERROR;
End;

Procedure TForm1.ConfigureListViewColors;
Begin
  If DarkModeIsEnabled = true Then
  Begin
    ListViewUninstall.Color := $00212121;
    ListViewUninstall.Font.Color := clWhite;
  End
  Else
  Begin
    ListViewUninstall.Color := clWindow;
    ListViewUninstall.Font.Color := clWindowText;
  End;
End;

// Загрузка настроек

Procedure TForm1.LoadNastr;
Var
  Ini: TMemIniFile;
  WindowCenter: Boolean;
  ThemeAuto, ThemeLight, ThemeDark: Boolean;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);

  ThemeAuto := Ini.ReadBool('Option', 'ThemeAuto', False);
  If ThemeAuto = true Then
  Begin
    If DarkModeIsEnabled = true Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
      ConfigureListViewColors;
      ListViewUninstall.Invalidate;
      Application.ProcessMessages;
    End;

    If DarkModeIsEnabled = False Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      ConfigureListViewColors;
      ListViewUninstall.Invalidate;
      Application.ProcessMessages;
    End;
  End;

  ThemeLight := Ini.ReadBool('Option', 'ThemeLight', False);
  If ThemeLight = true Then
  Begin
    SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
    ListViewUninstall.Color := clWindow;
    ListViewUninstall.Font.Color := clWindowText;
    ListViewUninstall.Invalidate;
    Application.ProcessMessages;
  End;

  ThemeDark := Ini.ReadBool('Option', 'ThemeDark', False);
  If ThemeDark = true Then
  Begin
    SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
    ListViewUninstall.Color := $00212121;
    ListViewUninstall.Font.Color := clWhite;
    ListViewUninstall.Invalidate;
    Application.ProcessMessages;
  End;

  ViewLogMenu.Checked := Ini.ReadBool(Application.Title, ViewLogMenu.Name, False);
  ViewLogMenuClick(self);

  IconSmallMenu.Checked := Ini.ReadBool(Application.Title, IconSmallMenu.Name, False);
  If IconSmallMenu.Checked Then
  Begin
    IconSmallMenuClick(self);
  End;

  IconBigMenu.Checked := Ini.ReadBool(Application.Title, IconBigMenu.Name, False);
  If IconBigMenu.Checked Then
  Begin
    IconBigMenuClick(self);
  End;
  WindowCenter := Ini.ReadBool('Position', 'WindowCenter', False);
  If WindowCenter = true Then
  Begin
    Form1.Position := poDesktopCenter;
  End;
  If WindowCenter = False Then
  Begin
    Form1.Position := poDesigned;
  End;
  If Ini.readString(Application.Title, 'Window', '') = 'wsMaximized' Then
  Begin
    Form1.WindowState := wsMaximized;
  End;

  If Ini.readString(Application.Title, 'Window', '') <> 'wsMaximized' Then
  Begin
    Form1.top := Ini.ReadInteger(Application.Title, 'Top', Form1.top);
    Form1.left := Ini.ReadInteger(Application.Title, 'Left', Form1.left);
    Form1.Height := Ini.ReadInteger(Application.Title, 'Height', Form1.Height);
    Form1.Width := Ini.ReadInteger(Application.Title, 'Width', Form1.Width);
  End;

  Ini.Free;
End;

Procedure TForm1.LogCreateMenuClick(Sender: TObject);
Begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
  If Form1.SaveDialogUninstall.Execute Then
  Begin
    ListViewConfHTML(Form1.ListViewUninstall, SaveDialogUninstall.FileName, true);
  End;
End;

Procedure TForm1.BackupsDelAllMenuClick(Sender: TObject);
Begin
  TabControlPanel.Enabled := False;
  Try
    While ListViewBackupsUninstall.Items.Count > 0 Do
    Begin
      If ListViewBackupsUninstall.Items[0].Checked = true Then
      Begin
        ListViewBackupsUninstall.Items.Item[0].MakeVisible(true);
        DeleteFile(ListViewBackupsUninstall.Items[0].SubItems.Strings[2]);
        ListViewBackupsUninstall.Items[0].Delete;
        Application.ProcessMessages;
      End;
    End;
  Except
  End;
  TabControlPanel.Enabled := true;
End;

Procedure TForm1.BackupsDelMenuClick(Sender: TObject);
Begin
  TabControlPanel.Enabled := False;
  If (ListViewBackupsUninstall.Selected <> Nil) And (ListViewBackupsUninstall.Selected.Caption <> '') Then
  Begin
    DeleteFile(ListViewBackupsUninstall.Selected.SubItems.Strings[2]);
    Application.ProcessMessages;
    FindFileCopy(ExtractFilePath(ParamStr(0)) + 'backup\');
    Application.ProcessMessages;
  End;
  TabControlPanel.Enabled := true;
End;

Procedure TForm1.BackupsRestoreMenuClick(Sender: TObject);
Begin
  TabControlPanel.Enabled := False;
  If (ListViewBackupsUninstall.Selected <> Nil) And (ListViewBackupsUninstall.Selected.Caption <> '') Then
  Begin
    ShellExecute(0, Nil, 'regedit.exe', pchar('/s "' + ListViewBackupsUninstall.Selected.SubItems.Strings[2] + '"'), Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;
  TabControlPanel.Enabled := true;
End;

Procedure TForm1.BackupsUpdateMenuClick(Sender: TObject);
Begin
  Try
    TabControlPanel.Enabled := False;
    FindFileCopy(ExtractFilePath(ParamStr(0)) + 'backup\');
    TabControlPanel.Enabled := true;
  Except
  End;
End;

Function GetAppDataRoamingPath: String;
Var
  Path: Array[0..MAX_PATH] Of char;
Begin
  If SUCCEEDED(SHGetFolderPath(0, CSIDL_APPDATA, 0, 0, @Path[0])) Then
    Result := IncludeTrailingPathDelimiter(Path)
  Else
    Result := '';
End;

Function TForm1.PortablePath: String;
Begin
  If Portable Then
    Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini'
  Else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(ParamStr(0))) + '\Simple Utilities\Config\Option.ini';
    //Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini';
  // Создаем папку для конфига
  SysUtils.ForceDirectories(ExtractFilePath(Result));
End;

Procedure TForm1.SaveNastr; // Сохранение настроек
Var
  Ini: TMemIniFile;
Begin

  Ini := TMemIniFile.Create(Form1.PortablePath);

  Ini.WriteBool(Application.Title, ViewLogMenu.Name, ViewLogMenu.Checked);

  Ini.WriteBool(Application.Title, IconSmallMenu.Name, IconSmallMenu.Checked);
  Ini.WriteBool(Application.Title, IconBigMenu.Name, IconBigMenu.Checked);

  If Form1.WindowState = wsMaximized Then
  Begin
    Ini.WriteString(Application.Title, 'Window', 'wsMaximized');
  End;
  If Form1.WindowState <> wsMaximized Then
  Begin
    Ini.WriteString(Application.Title, 'Window', 'wsNormal');
    Ini.WriteInteger(Application.Title, 'Top', Form1.top);
    Ini.WriteInteger(Application.Title, 'Left', Form1.left);
    Ini.WriteInteger(Application.Title, 'Height', Form1.Height);
    Ini.WriteInteger(Application.Title, 'Width', Form1.Width);
  End;
  Ini.UpdateFile;
  Ini.Free;
End;

Procedure TForm1.SpeedButton3Click(Sender: TObject);
Begin
  If ListViewUninstall.ItemIndex = -1 Then
    Exit;
  Msg := messagebox(Application.MainForm.Handle, pchar(LangDelete.Caption + ' [ ' + ListViewUninstall.Selected.Caption + ' ] ?'), pchar(LangAttention.Caption), mb_iconquestion Or mb_yesno);
  If Msg = idyes Then
  Begin
    CreateDir(ExtractFilePath(ParamStr(0)) + 'backup');
    ExportRegistry;
    RemoveKey;
  End
  Else
    Exit;
  trr3 := MyThreadMedia.Create(False);
  trr3.FreeOnTerminate := true;
  trr3.Priority := tpNormal;
End;

Procedure TForm1.WMMouseMove(Var Message: TWMMouseMove);
Begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
End;

Procedure TForm1.SpeedButton_GeneralMenuClick(Sender: TObject);
Var
  ButtonRight: TPoint;
Begin
  If (SpeedButton_GeneralMenu.AllowAllUp) Then
  Begin
    SpeedButton_GeneralMenu.AllowAllUp := False;
    SpeedButton_GeneralMenu.Down := true;
    Application.ProcessMessages;
    If Sender Is TControl Then
    Begin
      ButtonRight.X := SpeedButton_GeneralMenu.left;
      ButtonRight.Y := SpeedButton_GeneralMenu.top;
      ButtonRight := ClientToScreen(ButtonRight);
      PopupMenuGeneral.Popup(ButtonRight.X + SpeedButton_GeneralMenu.Width, ButtonRight.Y + SpeedButton_GeneralMenu.Height);
    End;
  End
  Else
  Begin
    SpeedButton_GeneralMenu.AllowAllUp := true;
    SpeedButton_GeneralMenu.Down := False;
    PopupMenuGeneral.CloseMenu;
    Application.ProcessMessages;
  End;
End;

Function GetFileSize(namefile: String): Int64;
Var
  InfoFile: TSearchRec;
  AttrFile: Integer;
  ErrorReturn: Integer;
Begin
  AttrFile := $0000003F; // Любой файл
  ErrorReturn := FindFirst(namefile, AttrFile, InfoFile);
  If ErrorReturn <> 0 Then
    Result := -1 // если файл не найден
  Else
  Begin
    Result := InfoFile.Size; // Просто используем Size
  End;
  FindClose(InfoFile);
End;

Function GetDirFullSize(aPath: String): Int64;
Var
  sr: TSearchRec;
  tPath: String;
  sum: Int64;
Begin
  sum := 0;
  Result := 0;
  tPath := IncludeTrailingPathDelimiter(aPath);

  If FindFirst(tPath + '*.*', faAnyFile, sr) = 0 Then
  Begin
    Try
      Repeat
        If (sr.Name = '.') Or (sr.Name = '..') Then
          Continue;

        If (sr.Attr And faDirectory) <> 0 Then
        Begin
          sum := sum + GetDirFullSize(tPath + sr.Name);
          Application.ProcessMessages;
          Continue;
        End;

        // Просто используем свойство Size - оно кроссплатформенно
        sum := sum + sr.Size;
        Application.ProcessMessages;
      Until FindNext(sr) <> 0;
    Finally
      Result := sum;
      FindClose(sr);
      Application.ProcessMessages;
    End;
  End;
End;

Function GetNormalSize(Size: Int64): String;
Const
  UNITS: Array[0..3] Of String = (' b', ' kb', ' Mb', ' Gb');
Var
  Value: Real;
  UnitIndex: Integer;
Begin
  Value := Size;
  UnitIndex := 0;

  While (Value >= 700) And (UnitIndex < High(UNITS)) Do
  Begin
    Value := Value / 1024;
    Inc(UnitIndex);
  End;

  // Округляем до целых чисел
  If UnitIndex > 0 Then
    Result := FloatToStr(Round(Value)) + UNITS[UnitIndex]
  Else
    Result := FloatToStr(Value) + UNITS[UnitIndex];
End;

Procedure TForm1.ListViewUninstallClick(Sender: TObject);
Var
  putSize: String;
Begin
  If ListViewUninstall.ItemIndex = -1 Then
    Exit;
  Form1.MemoLogUninstall.Clear;
  StatusBarUninstall.Panels[1].Text := '';
  putSize := Form1.ListViewUninstall.Selected.SubItems.Strings[3];
  key;
  Application.ProcessMessages;
  If (putSize = GetSpecialFolderPath(CSIDL_SYSTEM)) Or (putSize = GetSpecialFolderPath(CSIDL_WINDOWS)) Or (putSize = GetSpecialFolderPath(CSIDL_SYSTEM) + '\') Or (putSize = GetSpecialFolderPath(CSIDL_WINDOWS) + '\') Or (putSize = '') Then
    Exit;
  If (putSize = lowercase(GetSpecialFolderPath(CSIDL_SYSTEM))) Or (putSize = lowercase(GetSpecialFolderPath(CSIDL_WINDOWS))) Or (putSize = lowercase(GetSpecialFolderPath(CSIDL_SYSTEM) + '\')) Or (putSize = lowercase(GetSpecialFolderPath(CSIDL_WINDOWS) + '\')) Or (putSize = '') Then
    Exit;
  If (putSize <> GetSpecialFolderPath(CSIDL_SYSTEM)) Or (putSize <> GetSpecialFolderPath(CSIDL_WINDOWS)) Or (putSize <> GetSpecialFolderPath(CSIDL_SYSTEM) + '\') Or (putSize <> GetSpecialFolderPath(CSIDL_WINDOWS) + '\') Or (putSize <> '') Then
  Begin
    StatusBarUninstall.Panels[1].Text := LangSize.Caption + ' ' + GetNormalSize(GetDirFullSize(stringreplace(lowercase(putSize), lowercase('%ProgramFiles%'), lowercase(GetSpecialFolderPath(CSIDL_PROGRAM_FILES)), [rfReplaceAll])));
    Application.ProcessMessages();
  End;
 { If (Form1.ListViewUninstall.Selected <> Nil) Or (Form1.ListViewUninstall.Selected.SubItems.Strings[3] <> '') Then
  Begin
    OpenFolderUninstallMenu.Visible := true;
  End; }
  {If (Form1.ListViewUninstall.Selected.SubItems.Strings[3] = '') Or ((Form1.ListViewUninstall.Selected.SubItems.Strings[3] <> '') And (pos(UpperCase('MsiExec.exe'), UpperCase(Form1.ListViewUninstall.Selected.SubItems.Strings[4])) = 1)) Then
  Begin
    OpenFolderUninstallMenu.Visible := False;
  End;  }

  If (Form1.ListViewUninstall.Selected <> Nil) Or (Form1.ListViewUninstall.Selected.SubItems.Strings[7] <> '') Then
  Begin
    WebSiteUninstallMenu.Visible := true;
  End;
  If Form1.ListViewUninstall.Selected.SubItems.Strings[7] = '' Then
  Begin
    WebSiteUninstallMenu.Visible := False;
  End;

End;

Procedure TForm1.ListViewUninstallSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
Var
  putSize: String;
Begin
  If ListViewUninstall.ItemIndex = -1 Then
    Exit;
  Form1.MemoLogUninstall.Clear;
  StatusBarUninstall.Panels[1].Text := '';
  putSize := Form1.ListViewUninstall.Selected.SubItems.Strings[3];
  key;
  Application.ProcessMessages;
  If (putSize = GetSpecialFolderPath(CSIDL_SYSTEM)) Or (putSize = GetSpecialFolderPath(CSIDL_WINDOWS)) Or (putSize = GetSpecialFolderPath(CSIDL_SYSTEM) + '\') Or (putSize = GetSpecialFolderPath(CSIDL_WINDOWS) + '\') Or (putSize = '') Then
    Exit;
  If (putSize = lowercase(GetSpecialFolderPath(CSIDL_SYSTEM))) Or (putSize = lowercase(GetSpecialFolderPath(CSIDL_WINDOWS))) Or (putSize = lowercase(GetSpecialFolderPath(CSIDL_SYSTEM) + '\')) Or (putSize = lowercase(GetSpecialFolderPath(CSIDL_WINDOWS) + '\')) Or (putSize = '') Then
    Exit;
  If (putSize <> GetSpecialFolderPath(CSIDL_SYSTEM)) Or (putSize <> GetSpecialFolderPath(CSIDL_WINDOWS)) Or (putSize <> GetSpecialFolderPath(CSIDL_SYSTEM) + '\') Or (putSize <> GetSpecialFolderPath(CSIDL_WINDOWS) + '\') Or (putSize <> '') Then
  Begin
    StatusBarUninstall.Panels[1].Text := LangSize.Caption + ' ' + GetNormalSize(GetDirFullSize(stringreplace(lowercase(putSize), lowercase('%ProgramFiles%'), lowercase(GetSpecialFolderPath(CSIDL_PROGRAM_FILES)), [rfReplaceAll])));
    Application.ProcessMessages();
  End;
 { If (Form1.ListViewUninstall.Selected <> Nil) Or (Form1.ListViewUninstall.Selected.SubItems.Strings[3] <> '') Then
  Begin
    OpenFolderUninstallMenu.Visible := true;
  End; }
  {If (Form1.ListViewUninstall.Selected.SubItems.Strings[3] = '') Or ((Form1.ListViewUninstall.Selected.SubItems.Strings[3] <> '') And (pos(UpperCase('MsiExec.exe'), UpperCase(Form1.ListViewUninstall.Selected.SubItems.Strings[4])) = 1)) Then
  Begin
    OpenFolderUninstallMenu.Visible := False;
  End;  }

  If (Form1.ListViewUninstall.Selected <> Nil) Or (Form1.ListViewUninstall.Selected.SubItems.Strings[7] <> '') Then
  Begin
    WebSiteUninstallMenu.Visible := true;
  End;
  If Form1.ListViewUninstall.Selected.SubItems.Strings[7] = '' Then
  Begin
    WebSiteUninstallMenu.Visible := False;
  End;
End;

Procedure TForm1.ListViewUninstallColumnClick(Sender: TObject; Column: TListColumn);
Begin
  sort := -sort;
  If Column = ListViewUninstall.Columns[0] Then
    ListViewUninstall.CustomSort(@SortCaptionAsString, sort)
  Else If Column = ListViewUninstall.Columns[1] Then
    ListViewUninstall.CustomSort(@SortFirstSubItemAsString, sort)
  Else If Column = ListViewUninstall.Columns[2] Then
    ListViewUninstall.CustomSort(@Sort1SubItemAsString, sort)
  Else If Column = ListViewUninstall.Columns[3] Then
    ListViewUninstall.CustomSort(@Sort2SubItemAsString, sort)
  Else If Column = ListViewUninstall.Columns[4] Then
    ListViewUninstall.CustomSort(@Sort3SubItemAsString, sort);
End;

Procedure TForm1.ListViewUninstallCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Var DefaultDraw: Boolean);
Var
  ItemDate, CurrentDate: TDateTime;
  DaysDiff: Integer;
Begin
  If (Item.SubItems.Count > 0) Then
  Begin
    ItemDate := StrtoDate(Item.SubItems[2]);

    CurrentDate := Now;
    DaysDiff := Trunc(CurrentDate - ItemDate);
    If (DaysDiff <= 3) And (DaysDiff >= 0) Then
    // if (DaysDiff = 3) or (DaysDiff =2) or (DaysDiff =1)or (DaysDiff =0)then
    Begin
      Sender.Canvas.Font.Color := clGreen;
      Sender.Canvas.Font.Style := [fsBold];
    End
    Else
    Begin
      Sender.Canvas.Font.Style := [];
    End;
  End;
End;

Function TForm1.DelPath(Path: String): String;
Var
  i: Integer;
Begin
  Result := Path;
  For i := 0 To length(Path) Do
  Begin
    If (copy(Path, i, 2) = ' /') Or (copy(Path, i, 2) = ' *') Or (copy(Path, i, 2) = ' *') Or (copy(Path, i, 2) = ' -') Then
    Begin
      Result := trim(copy(Path, 1, i - 1));
      break;
    End;
  End;
End;

Function ExtractFileExt1(Const FileName: String): String;
Var
  i: Integer;
Begin
  i := LastDelimiter('.' + PathDelim + DriveDelim, FileName);
  If (i > 0) And (FileName[i] = '.') Then
    Result := copy(FileName, i + 4, MaxInt)
  Else
    Result := '';
End;

Function TForm1.RunPath(Path: String): String;
Var
  tempPath, fileName, fileExt, normalizedPath: String;
  systemPath, windowsPath, appDataPath: String;
  launchSetupPos: Integer;
Begin
  // Нормализация пути
  tempPath := LowerCase(Trim(Path));
  tempPath := StringReplace(tempPath, '\\', '\', [rfReplaceAll]);
  tempPath := StringReplace(tempPath, '"', '', [rfReplaceAll]);

  // Замена косых черт на обратные (нормализация разделителей)
  tempPath := StringReplace(tempPath, '/', '\', [rfReplaceAll]);

  // Замена переменных окружения
  tempPath := StringReplace(tempPath, '%programfiles%', LowerCase(GetSpecialFolderPath(CSIDL_PROGRAM_FILES)), [rfReplaceAll]);
  tempPath := StringReplace(tempPath, '%appdata%', LowerCase(GetSpecialFolderPath(CSIDL_APPDATA)), [rfReplaceAll]);
  tempPath := StringReplace(tempPath, '%APPDATA%', LowerCase(GetSpecialFolderPath(CSIDL_APPDATA)), [rfReplaceAll]);
  tempPath := StringReplace(tempPath, '%AppData%', LowerCase(GetSpecialFolderPath(CSIDL_APPDATA)), [rfReplaceAll]);

  // Удаление rundll32
  tempPath := StringReplace(tempPath, 'rundll32.exe ', '', [rfReplaceAll]);
  tempPath := StringReplace(tempPath, 'rundll32 ', '', [rfReplaceAll]);

  // Обработка launchsetup ДО извлечения имени файла
  launchSetupPos := Pos('launchsetup', tempPath);
  If launchSetupPos > 0 Then
  Begin
    // Удаляем "launchsetup" из пути
    tempPath := Copy(tempPath, 1, launchSetupPos - 1) + Copy(tempPath, launchSetupPos + 11, MaxInt);
  End;

  // Обработка расширений файлов
  fileExt := ExtractFileExt1(tempPath);
  fileName := Copy(tempPath, 1, Length(tempPath) - Length(fileExt));

  // Специальная обработка для разных типов файлов
  If (Pos('.dll', fileName) > 0) And (Pos('launchsetup', fileName) = 0) Then
  Begin
    fileName := Copy(fileName, 1, Pos('.dll', fileName) - 1) + '.dll';
  End
  Else If Pos('.exe', fileName) > 0 Then
  Begin
    fileName := Copy(fileName, 1, Pos('.exe', fileName) - 1) + '.exe';
  End;

  // Замена msiexec
  If fileName = 'msiexec' Then
    fileName := 'msiexec.exe';

  // Нормализация разделителей в имени файла
  fileName := StringReplace(fileName, '/', '\', [rfReplaceAll]);

  // Поиск файла в системных директориях
  systemPath := GetSpecialFolderPath(CSIDL_SYSTEM) + '\' + fileName;
  windowsPath := GetSpecialFolderPath(CSIDL_WINDOWS) + '\' + fileName;
  appDataPath := GetSpecialFolderPath(CSIDL_APPDATA) + '\' + fileName;

  // Дополнительная проверка: если fileName уже содержит полный путь, используем его
  If (Pos(':\', fileName) > 0) Or (Pos('\\', fileName) = 1) Then
  Begin
    normalizedPath := fileName;
    // Убедимся, что путь нормализован
    normalizedPath := StringReplace(normalizedPath, '/', '\', [rfReplaceAll]);
    normalizedPath := StringReplace(normalizedPath, '\\', '\', [rfReplaceAll]);

    If FileExists(normalizedPath) Then
      Result := normalizedPath
    Else
      Result := fileName; // Возвращаем оригинальный путь, если файл не найден
  End
  Else
  Begin
    // Нормализация путей для поиска
    systemPath := StringReplace(systemPath, '\\', '\', [rfReplaceAll]);
    windowsPath := StringReplace(windowsPath, '\\', '\', [rfReplaceAll]);
    appDataPath := StringReplace(appDataPath, '\\', '\', [rfReplaceAll]);

    If FileExists(systemPath) Then
      Result := systemPath
    Else If FileExists(windowsPath) Then
      Result := windowsPath
    Else If FileExists(appDataPath) Then
      Result := appDataPath
    Else
    Begin
      // Возвращаем нормализованный путь
      Result := StringReplace(fileName, '\\', '\', [rfReplaceAll]);
    End;
  End;

  // Финальная нормализация результата
  Result := StringReplace(Result, '\\', '\', [rfReplaceAll]);
  Result := StringReplace(Result, '/', '\', [rfReplaceAll]);
End;

Function GetIcon(sPath: String): HICON;
Var
  SFI: TSHFileInfo;
Begin
  SHGetFileInfo(pchar(sPath), 0, SFI, SizeOf(TSHFileInfo), SHGFI_ICON);
  Result := SFI.HICON;
End;

Function PreparePath(Const Path: String): String;
Var
  r: String;
  i: Integer;
Begin
  r := '';
  For i := 1 To length(Path) Do
  Begin
    r := r + Path[i];
    If Path[i] = '\' Then
      r := r + Path[i];
  End;
  Result := r;
End;

Function Bin2Str(aStr: String): String;
Var
  S: String;
  i, j, k: longint;
  ich: Integer;
Begin
  S := '';
  k := 1;
  For i := 1 To length(aStr) Div 8 Do
  Begin
    ich := 0;
    For j := 0 To 7 Do
    Begin
      ich := ich * 2 + byte(aStr[k]) - byte('0');
      inc(k);
    End;
    S := S + char(ich);
  End;
  Bin2Str := S;
End;

Procedure GetString(r: TRegistry; f: TStrings; Const key: String);
Var
  w: TStrings;
  i, j: Integer;  // Добавили отдельную переменную для вложенного цикла
  Value: String;
  Data: String;
  Typ: TRegDataType;
  KeyInfo: TRegKeyInfo;
  BufSize: Integer;
  Buf: Array Of Byte;
  SubKeys: TStrings;
Begin
  w := TStringList.Create;
  SubKeys := TStringList.Create;
  Try
    r.Access := KEY_READ Or KEY_WOW64_32KEY;
    If Not r.OpenKey(key, false) Then
      Exit;

    If Not r.GetKeyInfo(KeyInfo) Then
    Begin
      r.CloseKey;
      Exit;
    End;

    r.GetValueNames(w);

    If f.Count > 0 Then
      f.Add('');
    f.Add('[' + key + ']');

    // Обрабатываем все значения
    For i := 0 To w.Count - 1 Do
    Begin
      Data := '';
      Value := w[i];

      If Value = '' Then
        Value := '@'
      Else
        Value := '"' + Value + '"';

      Typ := r.GetDataType(w[i]);

      Case Typ Of
        rdBinary, rdExpandString, rdUnknown:
          Begin
            // Используем переменную j для внутреннего цикла
            BufSize := r.GetDataSize(w[i]);
            If BufSize > 0 Then
            Begin
              SetLength(Buf, BufSize);
              BufSize := r.ReadBinaryData(w[i], Buf[0], BufSize);
              If BufSize > 0 Then
              Begin
                Data := 'hex:';
                For j := 0 To BufSize - 1 Do
                Begin
                  If j > 0 Then
                    Data := Data + ',';
                  Data := Data + IntToHex(Buf[j], 2);
                End;
              End
              Else
                Data := 'hex:';
            End
            Else
              Data := 'hex:';
          End;

        rdInteger:
          Begin
            Data := IntToHex(r.ReadInteger(w[i]), 8);
            Data := 'dword:' + Data;
          End;

        rdString:
          Begin
            Data := r.ReadString(w[i]);
            // Если нужно, раскомментируйте:
            Data := PreparePath(Data);
            Data := '"' + Data + '"';
            Data := StringReplace(Data, '""', '"', [rfReplaceAll]);
          End;
      Else
        Data := '"' + r.ReadString(w[i]) + '"';
      End;

      f.Add(Value + '=' + Data);
    End;

    // Получаем имена подразделов
    r.GetKeyNames(SubKeys);
    r.CloseKey;

    // Рекурсивно обрабатываем подразделы
    For i := 0 To SubKeys.Count - 1 Do
    Begin
      GetString(r, f, key + '\' + SubKeys[i]);
    End;

  Finally
    w.Free;
    SubKeys.Free;
  End;
End;

Procedure GetString64(r: tregistry; f: TStrings; key: String);
Var
  w: TStrings;
  i: Integer;
  Value: String;
  Data: String;
  Typ: TRegDataType;
  Keylnfo: TRegKeyInfo;
  Buf: Array[1..256] Of byte;
Begin
  w := TStringList.Create;
  r.Access := KEY_ALL_ACCESS Or KEY_WOW64_64KEY;
  r.OpenKey(key, true);
  r.GetKeyInfo(Keylnfo);
  r.GetValueNames(w);
  f.Add('');
  f.Add('[' + Form1.ListViewUninstall.Selected.SubItems.Strings[5] + Form1.ListViewUninstall.Selected.SubItems.Strings[6] + ']');
  For i := 0 To w.Count - 1 Do
  Begin
    Data := '';
    Value := pchar(w[i]);
    If Value = '' Then
      Value := '@'
    Else
      Value := '"' + Value + '"';
    Value := pchar(stringreplace(Value, '""', '"', [rfReplaceAll]));
    Typ := r.GetDataType(w[i]);
    Case Typ Of
      rdBinary:
        Begin
          // Как обрабатывать бинарные данные???
          Data := IntToStr(r.ReadBinaryData(w[i], Buf, SizeOf(Buf)));
          Data := 'hex:' + Data;
        End;
      rdInteger:
        Begin
          Data := IntToHex(r.ReadInteger(w[i]), 8);
          Data := 'dword:' + Data;
        End;
      rdstring:
        Begin
          Data := r.readString(w[i]);
          Data := PreparePath(Data);
          Data := '"' + Data + '"';
          Data := stringreplace(Data, '""', '"', [rfReplaceAll]);
        End;
    End;
    f.Add(Value + '=' + Data);
  End;
  // w.Clear;
  r.getkeynames(w);
  r.CloseKey;
  For i := 0 To w.Count - 1 Do
  Begin
    GetString(r, f, key + w[i] + '\');
  End;

  w.Free;
End;

Procedure TForm1.key;
Var
  r: tregistry;
  Keylnfo: TRegKeyInfo;
  stringlist: TStrings;
Begin
  Try
    stringlist := TStringList.Create;
    stringlist.Clear;
    Form1.MemoLogUninstall.Clear;

    If Form1.ListViewUninstall.Selected.SubItems.Strings[5] = 'HKEY_CURRENT_USER' Then
    Begin
      r := tregistry.Create;
      r.Access := KEY_ALL_ACCESS;
      r.RootKey := HKEY_CURRENT_USER;
      r.OpenKey(Form1.ListViewUninstall.Selected.SubItems.Strings[6], False);
      r.GetKeyInfo(Keylnfo);
      r.CloseKey;
      stringlist.Add('Windows Registry Editor Version 5.00');
      GetString(r, stringlist, Form1.ListViewUninstall.Selected.SubItems.Strings[6]);
      MemoLogUninstall.Lines.AddStrings(stringlist);
      r.Free;
    End;

    If Form1.ListViewUninstall.Selected.SubItems.Strings[5] = 'HKEY_LOCAL_MACHINE' Then
    Begin
      r := tregistry.Create;
      r.Access := KEY_ALL_ACCESS Or KEY_WOW64_64KEY;
      r.RootKey := HKEY_LOCAL_MACHINE;
      r.OpenKey(Form1.ListViewUninstall.Selected.SubItems.Strings[6], true);
      r.GetKeyInfo(Keylnfo);
      r.CloseKey;

      If Keylnfo.NumValues = 0 Then
      Begin
        r.Access := KEY_ALL_ACCESS Or KEY_WOW64_32KEY;
        stringlist.Add('Windows Registry Editor Version 5.00');
        GetString64(r, stringlist, Form1.ListViewUninstall.Selected.SubItems.Strings[6]);
        MemoLogUninstall.Lines.AddStrings(stringlist);
        Application.ProcessMessages;
      End;

      If Keylnfo.NumValues <> 0 Then
      Begin
        r.Access := KEY_ALL_ACCESS Or KEY_WOW64_64KEY;
        stringlist.Add('Windows Registry Editor Version 5.00');
        GetString64(r, stringlist, Form1.ListViewUninstall.Selected.SubItems.Strings[6]);
        MemoLogUninstall.Lines.AddStrings(stringlist);
        Application.ProcessMessages;
      End;
      r.Free;
    End;
    stringlist.Free;
  Except
  End;
End;

Procedure TForm1.ExportRegistry;
Begin
  CreateDir(ExtractFilePath(ParamStr(0)) + 'backup');
  MemoLogUninstall.Lines.SaveToFile(ExtractFilePath(ParamStr(0)) + 'backup\' + Form1.ListViewUninstall.Selected.Caption + '.reg', TEncoding.Unicode);
End;

Procedure DeleteRegistryKey64(Const RootKey: String; Const KeyPath: String);
Var
  reg: tregistry;
Begin
  reg := tregistry.Create;
  Try
    If RootKey = 'HKEY_CURRENT_USER' Then
      reg.RootKey := HKEY_CURRENT_USER
    Else If RootKey = 'HKEY_LOCAL_MACHINE' Then
      reg.RootKey := HKEY_LOCAL_MACHINE;
    // Reg.RootKey := RootKey;
    reg.Access := KEY_WRITE Or KEY_WOW64_64KEY; // Доступ к 64-битному реестру

    If reg.OpenKey(KeyPath, False) Then
    Begin
      reg.CloseKey;
      reg.DeleteKey(KeyPath);
    End;
  Finally
    reg.Free;
  End;
End;

Procedure DeleteRegistryKey(Const RootKey: String; Const KeyPath: String);
Var
  reg: tregistry;
Begin
  reg := tregistry.Create;
  Try
    If RootKey = 'HKEY_CURRENT_USER' Then
      reg.RootKey := HKEY_CURRENT_USER
    Else If RootKey = 'HKEY_LOCAL_MACHINE' Then
      reg.RootKey := HKEY_LOCAL_MACHINE;
    // Reg.RootKey := RootKey;
    If reg.OpenKey(KeyPath, False) Then
    Begin
      reg.CloseKey; // Закрываем перед удалением
      reg.DeleteKey(KeyPath);
    End;
  Finally
    reg.Free;
  End;
End;

Procedure TForm1.RemoveKey;
Var
  i: Integer;
  Keylnfo: TRegKeyInfo;
Begin
  If ListViewUninstall.ItemIndex = -1 Then
    Exit;
  If ListViewUninstall.Selected.SubItems.Strings[5] = 'HKEY_LOCAL_MACHINE' Then
  Begin
    reg := tregistry.Create(KEY_READ Or KEY_WOW64_64KEY Or KEY_WOW64_32KEY);
    reg.Access := KEY_WOW64_32KEY Or KEY_ALL_ACCESS;
    // reg.Access := KEY_WOW64_64KEY or KEY_ALL_ACCESS;
    lName := TStringList.Create;
    With reg Do
    Begin
      RootKey := HKEY_LOCAL_MACHINE;
      OpenKey(s32Key, False);
      getkeynames(lName);
      CloseKey;
      For i := 0 To lName.Count - 1 Do
      Begin
        Application.ProcessMessages;
        If OpenKey(s32Key + '\' + lName[i], False) Then
        Begin
          reg.GetKeyInfo(Keylnfo);
          If Keylnfo.NumValues = 0 Then
          Begin
            reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
          End;
          If Keylnfo.NumValues <> 0 Then
          Begin
            reg.Access := KEY_WOW64_32KEY Or KEY_ALL_ACCESS;
          End;
          If readString('DisplayName') = ListViewUninstall.Items[ListViewUninstall.ItemIndex].Caption Then
          Begin
            DeleteKey(s32Key + '\' + lName[i]);
          End;
        End
        Else
          Exit;
      End;
    End;
    reg.Free;
  End;

  If ListViewUninstall.Selected.SubItems.Strings[5] = 'HKEY_CURRENT_USER' Then
  Begin
    reg := tregistry.Create;
    reg.Access := KEY_ALL_ACCESS;
    lName := TStringList.Create;
    With reg Do
    Begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey(s32Key, False);
      getkeynames(lName);
      CloseKey;
      For i := 0 To lName.Count - 1 Do
      Begin
        Application.ProcessMessages;
        If OpenKey(s32Key + '\' + lName[i], False) Then
        Begin
          If readString('DisplayName') = ListViewUninstall.Items[ListViewUninstall.ItemIndex].Caption Then
          Begin
            DeleteKey(s32Key + '\' + lName[i]);
          End;
        End;
      End;
    End;
    reg.Free;
  End;
End;

Procedure TForm1.RegistryKeyOpenUninstallMenuClick(Sender: TObject);
Begin
  If ListViewUninstall.ItemIndex = -1 Then
    Exit;
  OpenRegeditToKeyEx(Form1.ListViewUninstall.Selected.SubItems.Strings[5], Form1.ListViewUninstall.Selected.SubItems.Strings[6]);
End;

Procedure TForm1.UnDel;
Var
  MsiExec: String;
  ShellPath1: String;
Begin
  If ListViewUninstall.ItemIndex = -1 Then
    Exit;
  MsiExec := Form1.ListViewUninstall.Selected.SubItems.Strings[4];

  If (pos(UpperCase('RunDll32.EXE'), UpperCase(MsiExec)) > 0) Or (pos(UpperCase('MsiExec.exe'), UpperCase(MsiExec)) > 0) Then
  Begin
    MsiExec := stringreplace(UpperCase(MsiExec), '/I', '/X', [rfReplaceAll]);
    ShellExecute(Handle, Nil, 'cmd.exe', pchar('/C "' + MsiExec + '"'), Nil, SW_HIDE);
  End;

  If pos(UpperCase('MsiExec.exe'), UpperCase(MsiExec)) = 0 Then
  Begin
    If ListViewUninstall.ItemIndex = -1 Then
      Exit;
    ShellPath := RunPath(MsiExec);
    ShellParams := EraseParam(MsiExec);

    ShellPath1 := ShellPath;
    ShellPath1 := stringreplace(ShellPath1, lowercase('Program Files (x86)'), lowercase('Program Files'), [rfReplaceAll]);

    If fileexists(ShellPath1) = true Then
    Begin
      ShellExecuteW(Application.MainForm.Handle, Nil, pchar(ShellPath1), pchar(ShellParams), '', SW_SHOW);
    End
    Else
    Begin
      ShellExecuteW(Application.MainForm.Handle, Nil, pchar(ShellPath), pchar(ShellParams), '', SW_SHOW);
    End;
  End;
End;

Function TForm1.ErasePath(Path: String): String;
Var
  i: Integer;
Begin
  Result := Path;
  For i := 0 To length(Path) Do
  Begin
    If (copy(Path, i, 2) = ' /') Or (copy(Path, i, 4) = '.exe') Or (copy(Path, i, 2) = ' *') Or (copy(Path, i, 2) = ' -') Or (copy(Path, i, 1) = ',') Then
    Begin
      Result := trim(copy(Path, 1, i - 1));
      break;
    End;
  End;
End;

Procedure TForm1.Globload;
Var
  i: Integer;
  Internat: TTranslation;
  Ini: TMemIniFile;
  lang, lang_file: String;
Begin
  For i := 0 To Screen.FormCount - 1 Do
  Begin
    Ini := TMemIniFile.Create(Form1.PortablePath);
    lang := Ini.ReadString('Language', 'Language', '');
    lang_file := ExtractFilePath(ParamStr(0)) + 'Language\' + lang + '.ini';
    Ini.Free;
    Ini := TMemIniFile.Create(lang_file);
    If Ini.SectionExists(Application.Title) Then // Используем конкретную секцию
    Begin
      Internat.Execute(Screen.Forms[i], Application.Title); // Передаем имя секции
      Application.ProcessMessages;
    End;
    Ini.Free;
  End;
End;

Function TForm1.EraseParam(Path: String): String;
Var
  i: Integer;
Begin
  For i := 0 To length(Path) Do
  Begin
    If (copy(Path, i, 2) = ' /') Or (copy(Path, i, 2) = ' *') Or (copy(Path, i, 2) = ' -') Or (copy(Path, i, 1) = ',') Then
    Begin
      Result := trim(copy(Path, i, length(Path)));
      break;
    End;
  End;
End;

{ procedure TForm1.Uninstall;
  var
  i: Integer;
  begin
  try
  if ListViewUninstall.ItemIndex = -1 then
  Exit;
  WindirP := StrAlloc(MAX_PATH);
  Res := GetWindowsDirectory(WindirP, MAX_PATH);
  if Res > 0 then
  Windir := StrPas(WindirP);
  reg := tregistry.Create;
  lName := TStringList.Create;
  with reg do
  begin
  if Form1.ListViewUninstall.Selected.SubItems.Strings[5] = 'HKEY_LOCAL_MACHINE'
  then
  begin
  reg.Access := KEY_WOW64_32KEY or KEY_ALL_ACCESS;
  reg.Access := KEY_WOW64_64KEY or KEY_ALL_ACCESS;
  RootKey := HKEY_LOCAL_MACHINE;
  end;
  if Form1.ListViewUninstall.Selected.SubItems.Strings[5] = 'HKEY_CURRENT_USER'
  then
  begin
  reg.Access := KEY_WOW64_32KEY or KEY_ALL_ACCESS;
  RootKey := HKEY_CURRENT_USER;
  end;
  OpenKey(sKey, FALSE);
  getkeynames(lName);
  CloseKey;
  for i := 0 to lName.Count - 1 do
  begin
  Application.ProcessMessages;
  if OpenKey(sKey + '\' + lName[i], FALSE) then
  begin
  Param := readString('DisplayName');
  sUnist := readString('UninstallString');
  sUnist := stringreplace(sUnist, '"', ' ', [rfReplaceAll]);
  if Param = ListViewUninstall.Items[ListViewUninstall.ItemIndex].Caption then
  begin
  if UpperCase(copy(sUnist, 1, 8)) = 'RUNDLL32' then
  begin
  ShellPath := Windir + '\system32\RUNDLL32.EXE';
  ShellParams := copy(sUnist, 9, length(sUnist));
  end
  else
  begin
  ShellPath := ErasePath(sUnist);
  ShellParams := EraseParam(sUnist);
  if copy(sUnist, 1, 11) = 'MsiExec.exe' then
  begin
  ShellPath := Windir + '\system32\' + ShellPath;
  end
  end;
  ShellExecuteW(Application.MainForm.Handle, nil,
  pchar(ShellPath), pchar(ShellParams), '', SW_SHOW)
  end;
  end;
  end;
  CloseKey;
  Free;
  end;
  except
  end;
  end; }

Procedure TForm1.ViewLogMenuClick(Sender: TObject);
Begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
  If ViewLogMenu.Checked = true Then
  Begin
    MemoLogUninstall.Height := 100;
  End;
  If ViewLogMenu.Checked = False Then
  Begin
    MemoLogUninstall.Height := 0;
  End;
End;

Procedure TForm1.UninstallUninstallMenuClick(Sender: TObject);
Begin
  UnDel;
End;

Procedure TForm1.DeleteKeyUninstallMenuClick(Sender: TObject);
Begin
  If ListViewUninstall.ItemIndex = -1 Then
    Exit;
  Msg := messagebox(Application.MainForm.Handle, pchar(LangDelete.Caption + ' [ ' + ListViewUninstall.Selected.Caption + ' ] ?'), pchar(LangAttention.Caption), mb_iconquestion Or mb_yesno);
  If Msg = idyes Then
  Begin
    CreateDir(ExtractFilePath(ParamStr(0)) + 'backup');
    ExportRegistry;
    // RemoveKey;
    DeleteRegistryKey(Form1.ListViewUninstall.Selected.SubItems.Strings[5], Form1.ListViewUninstall.Selected.SubItems.Strings[6]);
    DeleteRegistryKey64(Form1.ListViewUninstall.Selected.SubItems.Strings[5], Form1.ListViewUninstall.Selected.SubItems.Strings[6]);
  End
  Else
    Exit;
  Form1.globLoadUninstall;
  Application.ProcessMessages;
End;

Procedure TForm1.OpenFolderUninstallMenuClick(Sender: TObject);
Begin
  If ListViewUninstall.ItemIndex = -1 Then
    Exit;
  If (Form1.ListViewUninstall.Selected <> Nil) Or (Form1.ListViewUninstall.Selected.SubItems.Strings[3] <> '') Then
    Form1.ListViewUninstall.Selected.SubItems.Strings[3] := stringreplace(Form1.ListViewUninstall.Selected.SubItems.Strings[3], '"', '', [rfReplaceAll]);
  ShellExecute(Application.MainForm.Handle, Nil, Nil, '', pchar(Form1.ListViewUninstall.Selected.SubItems.Strings[3]), SW_SHOWMAXIMIZED);
  Application.ProcessMessages;
End;

Function EnableDebugPrivilege(Const Value: Boolean): Boolean;
Const
  SE_DEBUG_NAME = 'SeDebugPrivilege';
Var
  hToken: THandle;
  tp: TOKEN_PRIVILEGES;
  d: DWORD;
Begin
  Result := False;
  If OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES, hToken) Then
  Begin
    tp.PrivilegeCount := 1;
    LookupPrivilegeValue(Nil, SE_DEBUG_NAME, tp.Privileges[0].Luid);
    If Value Then
      tp.Privileges[0].Attributes := $00000002
    Else
      tp.Privileges[0].Attributes := $80000000;
    AdjustTokenPrivileges(hToken, False, tp, SizeOf(TOKEN_PRIVILEGES), Nil, d);
    If GetLastError = ERROR_SUCCESS Then
    Begin
      Result := true;
    End;
    CloseHandle(hToken);
  End;
End;

Procedure TForm1.RefreshListMenuClick(Sender: TObject);
Begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
  TabControlPanel.Enabled := False;
  Form1.globLoadUninstall;
  TabControlPanel.Enabled := true;
  Application.ProcessMessages;
End;

Procedure TForm1.TrimWorkingSet;
// Освобождение оперативной памяти
Var
  MainHandle: THandle;
Begin
  If Win32Platform = VER_PLATFORM_WIN32_NT Then
  Begin
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, False, GetCurrentProcessID);
    SetProcessWorkingSetSize(MainHandle, DWORD(-1), DWORD(-1));
    CloseHandle(MainHandle);
  End;
End;

Function Inmas(S: String): Boolean;
Var
  dub: Integer;
Begin
  Result := False;
  For dub := 0 To length(Temp) - 1 Do
  Begin
    If Temp[dub] = S Then
    Begin
      Result := true;
      break;
    End;
  End;
End;

Procedure TForm1.deleteDublikateTrack;
Var
  iDT, Count: Integer;
Begin
  Form1.ListViewUninstall.Items.BeginUpdate;
  Count := Form1.ListViewUninstall.Items.Count - 1;
  Application.ProcessMessages;
  iDT := 0;
  While iDT <= Count Do
  Begin
    If Inmas(Form1.ListViewUninstall.Items[iDT].Caption) Then
    Begin
      Form1.ListViewUninstall.Items[iDT].Delete;
      Application.ProcessMessages;
      Dec(Count);
      Application.ProcessMessages;
      Dec(iDT);
    End
    Else
    Begin
      SetLength(Temp, length(Temp) + 1);
      Application.ProcessMessages;
      Temp[length(Temp) - 1] := Form1.ListViewUninstall.Items[iDT].Caption;
      Application.ProcessMessages;
    End;
    inc(iDT);
    Application.ProcessMessages;
  End;
  SetLength(Temp, 0);
  Application.ProcessMessages;
  Form1.ListViewUninstall.Items.EndUpdate;
End;

Procedure MyThreadMedia.Execute;
Begin
  trr3.FreeOnTerminate := true;
  Form1.globLoadUninstall;
  trr3.Terminate;
  trr3.Free;
  trr3.Destroy;
End;

Procedure ExtractPathFromICO;
Var
  i: Integer;
  PathFromSubItem8: String;
Begin
  For i := 0 To Form1.ListViewUninstall.Items.Count - 1 Do
  Begin
    While Form1.ListViewUninstall.Items[i].SubItems.Count < 9 Do
      Form1.ListViewUninstall.Items[i].SubItems.Add('');
    PathFromSubItem8 := Form1.ListViewUninstall.Items[i].SubItems[8];
    If PathFromSubItem8 <> '' Then
    Begin
      If FileExists(PathFromSubItem8) Or (Pos('.exe', LowerCase(PathFromSubItem8)) > 0) Then
        PathFromSubItem8 := ExtractFilePath(PathFromSubItem8);
      If (PathFromSubItem8 <> '') And (PathFromSubItem8[Length(PathFromSubItem8)] = '\') Then
        PathFromSubItem8 := Copy(PathFromSubItem8, 1, Length(PathFromSubItem8) - 1);
    End;
    If Form1.ListViewUninstall.Items[i].SubItems[3] = '' Then
      Form1.ListViewUninstall.Items[i].SubItems[3] := PathFromSubItem8;
  End;
End;

Procedure TForm1.globLoadUninstall;
Var
  u: Integer;
Begin
  Try
    TabControlPanel.Enabled := False;
    ListViewBackupsUninstall.Enabled := False;
    Form1.LoadFromReg;
    ExtractPathFromICO;
    Form1.deleteDublikateTrack;
    Form1.addListViewDub;
    TabControlPanel.Enabled := true;
    ListViewBackupsUninstall.Enabled := true;
    Form1.StatusBarUninstall.Panels[0].Text := LangElements.Caption + ' ' + IntToStr(Form1.ListViewUninstall.Items.Count);
  Except
  End;
  Try
    Form1.ListViewUninstall.Items[0].MakeVisible(true);
    Form1.ListViewUninstall.Items[0].Selected := true;
    Form1.ListViewUninstall.Items[0].Focused := true;
    Form1.ListViewUninstall.SetFocus;
    Application.ProcessMessages;
  Except
  End;
  Try
    For u := 0 To 1 Do
    Begin
      ListView_SetColumnWidth(Form1.ListViewUninstall.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      Application.ProcessMessages;
    End;
  Except
  End;
End;

Procedure TForm1.IconSmallMenuClick(Sender: TObject);
Begin
  SetListViewSystemIcons(ListViewUninstall, False);  // Маленькие иконки
  LoadIconsDLL;
End;

Procedure TForm1.IconBigMenuClick(Sender: TObject);
Begin
  SetListViewSystemIcons(ListViewUninstall, True);   // Большие иконки
  LoadIconsDLL;
End;

Function EnsureFileExtension(Const FileName, DefaultExtension: String): String;
Var
  Ext: String;
Begin
  Ext := ExtractFileExt(FileName);
  If Ext <> '' Then
    Result := FileName
  Else
  Begin
    // Удаляем точку из DefaultExtension, если она есть
    If (DefaultExtension <> '') And (DefaultExtension[1] = '.') Then
      Result := FileName + DefaultExtension
    Else
      Result := FileName + '.' + DefaultExtension;
  End;
End;

// Вспомогательные процедуры (добавить в класс формы)
Procedure TForm1.LoadProductIcons;
Var
  reg: TRegistry;
  lNameNoSymbol: TStringList;
  i, iProducts: Integer;
  ProductIcon, ProductName: String;
  RootKeys: Array[0..1] Of Record
    RootKey: HKEY;
    Access: LongWord;
    KeyPath: String;
  End;
  j: Integer;
Begin
  RootKeys[0].RootKey := HKEY_LOCAL_MACHINE;
  RootKeys[0].Access := KEY_ALL_ACCESS Or KEY_WOW64_64KEY;
  RootKeys[0].KeyPath := '\SOFTWARE\Classes\Installer\Products\';

  RootKeys[1].RootKey := HKEY_CURRENT_USER;
  RootKeys[1].Access := KEY_ALL_ACCESS;
  RootKeys[1].KeyPath := '\Software\Microsoft\Installer\Products\';

  For j := 0 To High(RootKeys) Do
  Begin
    reg := TRegistry.Create;
    Try
      reg.Access := RootKeys[j].Access;
      reg.RootKey := RootKeys[j].RootKey;

      lNameNoSymbol := TStringList.Create;
      Try
        lNameNoSymbol.Duplicates := dupIgnore;

        If reg.OpenKey(RootKeys[j].KeyPath, False) Then
        Begin
          reg.GetKeyNames(lNameNoSymbol);
          reg.CloseKey;
        End;

        For iProducts := 0 To lNameNoSymbol.Count - 1 Do
        Begin
          If reg.OpenKey(RootKeys[j].KeyPath + lNameNoSymbol[iProducts], False) Then
          Begin
            Try
              If reg.ValueExists('ProductIcon') Then
              Begin
                ProductIcon := reg.ReadString('ProductIcon');
                ProductName := reg.ReadString('ProductName');

                If ProductName <> '' Then
                Begin
                  ProductIcon := EnsureFileExtension(ProductIcon, '.ico');
                  ProductIcon := StringReplace(ProductIcon, '%appdata%', LowerCase(GetSpecialFolderPath(CSIDL_APPDATA)), [rfReplaceAll, rfIgnoreCase]);

                  // Обновляем иконку для соответствующих элементов
                  For i := 0 To ListViewUninstall.Items.Count - 1 Do
                  Begin
                    If ListViewUninstall.Items[i].Caption = ProductName Then
                    Begin
                      ListViewUninstall.Items[i].SubItems.Strings[8] := ProductIcon;
                      // Обновляем путь установки если он пустой
                      If ListViewUninstall.Items[i].SubItems[3] = '' Then
                        ListViewUninstall.Items[i].SubItems[3] := ExtractFilePath(ProductIcon);
                    End;
                  End;
                End;
              End;
            Finally
              reg.CloseKey;
            End;
          End;
        End;
      Finally
        lNameNoSymbol.Free;
      End;
    Finally
      reg.Free;
    End;
  End;
End;

Procedure TForm1.LoadIconsForItems;
Var
  i: Integer;
  ShInfo: TSHFileInfo;
  IconPath: String;
  hIcon: THandle;
  Icon: TIcon;
  IconIndex: Word;
Begin
  // Убедимся, что ImageList создан
  If ListViewUninstall.SmallImages = Nil Then
    Exit;

  For i := 0 To ListViewUninstall.Items.Count - 1 Do
  Begin
    Try
      IconPath := ListViewUninstall.Items[i].SubItems.Strings[8];

      If IconPath = '' Then
        Continue;

      // Для DLL файлов используем ExtractIcon
      If (ExtractFileExt(IconPath) = '.dll') Then
      Begin
        IconIndex := 0;
        hIcon := ExtractIcon(HInstance, pchar(IconPath), IconIndex);

        If hIcon > 32 Then
        Begin
          Icon := TIcon.Create;
          Try
            Icon.Handle := hIcon;
            ListViewUninstall.Items[i].ImageIndex := ListViewUninstall.SmallImages.AddIcon(Icon);
          Finally
            Icon.Free;
            DestroyIcon(hIcon);
          End;
        End
        Else
        Begin
          // Fallback на SHGetFileInfo
          SHGetFileInfo(pchar(IconPath), 0, ShInfo, SizeOf(ShInfo), SHGFI_ICON Or SHGFI_SMALLICON Or SHGFI_LARGEICON);
          ListViewUninstall.Items[i].ImageIndex := ShInfo.iIcon;
        End;
      End
      Else
      Begin
        // Для других файлов используем SHGetFileInfo
        SHGetFileInfo(pchar(IconPath), 0, ShInfo, SizeOf(ShInfo), SHGFI_ICON Or SHGFI_SMALLICON Or SHGFI_LARGEICON);
        ListViewUninstall.Items[i].ImageIndex := ShInfo.iIcon;
      End;

      Application.ProcessMessages;
    Except
      // В случае ошибки используем иконку по умолчанию
      SHGetFileInfo(pchar(ParamStr(0)), 0, ShInfo, SizeOf(ShInfo), SHGFI_ICON Or SHGFI_SMALLICON Or SHGFI_LARGEICON);
      ListViewUninstall.Items[i].ImageIndex := ShInfo.iIcon;
    End;
  End;
End;

Procedure TForm1.LoadIconsDLL;
Var
  i: Integer;
  IconPath: String;
  hIcon: THandle;
  Icon: TIcon;
  IconIndex: Word;
Begin
  // Убедимся, что ImageList создан
  If ListViewUninstall.SmallImages = Nil Then
    Exit;

  For i := 0 To ListViewUninstall.Items.Count - 1 Do
  Begin
    Try
      IconPath := ListViewUninstall.Items[i].SubItems.Strings[8];

      If IconPath = '' Then
        Continue;

      // Для DLL файлов используем ExtractIcon
      If (ExtractFileExt(IconPath) = '.dll') Then
      Begin
        IconIndex := 0;
        hIcon := ExtractIcon(HInstance, pchar(IconPath), IconIndex);

        If hIcon > 32 Then
        Begin
          Icon := TIcon.Create;
          Try
            Icon.Handle := hIcon;
            ListViewUninstall.Items[i].ImageIndex := ListViewUninstall.SmallImages.AddIcon(Icon);
          Finally
            Icon.Free;
            DestroyIcon(hIcon);
          End;
        End
      End;
      Application.ProcessMessages;
    Except
    End;
  End;
End;

Procedure TForm1.LoadFromReg;
Var
  i: Integer;
  str, str1, a, a1, SystemComponent, IsMinorUpgrade: String;
  ShInfo: TSHFileInfo;
  Keylnfo: TRegKeyInfo;
  ListItem: TListItem;
  lName: TStringList;
  reg: TRegistry;
  RootKeys: Array[0..3] Of Record
    RootKey: HKEY;
    Access: LongWord;
    KeyPath: String;
  End;
  j: Integer;
Begin
  Form1.EditSearchUninstall.Text := '';
  EditSearchUninstall.Enabled := False;
  PopupMenuUninstall.AutoPopup := False;
  SpeedButton_GeneralMenu.Enabled := False;
  Form1.ListViewUninstall.Items.Clear;
  StatusBarUninstall.Panels[0].Text := '';
  StatusBarUninstall.Panels[1].Text := '';

  // Определяем корневые ключи для сканирования
  RootKeys[0].RootKey := HKEY_LOCAL_MACHINE;
  RootKeys[0].Access := KEY_ALL_ACCESS Or KEY_WOW64_64KEY;
  RootKeys[0].KeyPath := s32Key;

  RootKeys[1].RootKey := HKEY_LOCAL_MACHINE;
  RootKeys[1].Access := KEY_ALL_ACCESS Or KEY_WOW64_64KEY;
  RootKeys[1].KeyPath := s64Key;

  RootKeys[2].RootKey := HKEY_LOCAL_MACHINE;
  RootKeys[2].Access := KEY_ALL_ACCESS Or KEY_WOW64_32KEY;
  RootKeys[2].KeyPath := s64Key;

  RootKeys[3].RootKey := HKEY_CURRENT_USER;
  RootKeys[3].Access := KEY_ALL_ACCESS;
  RootKeys[3].KeyPath := s64Key;

  // Основной цикл сканирования реестра
  For j := 0 To High(RootKeys) Do
  Begin
    reg := TRegistry.Create;
    Try
      reg.Access := RootKeys[j].Access;
      reg.RootKey := RootKeys[j].RootKey;

      lName := TStringList.Create;
      Try
        lName.Duplicates := dupIgnore;

        If reg.OpenKey(RootKeys[j].KeyPath, False) Then
        Begin
          reg.GetKeyNames(lName);
          reg.CloseKey;
        End;

        For i := 0 To lName.Count - 1 Do
        Begin
          If reg.OpenKey(RootKeys[j].KeyPath + '\' + lName[i], False) Then
          Begin
            Try
              // Проверка системных компонентов и минорных обновлений
              SystemComponent := '';
              IsMinorUpgrade := '';

              If reg.ValueExists('SystemComponent') Then
              Begin
                If reg.GetDataType('SystemComponent') = rdString Then
                  SystemComponent := reg.ReadString('SystemComponent')
                Else
                  SystemComponent := IntToStr(reg.ReadInteger('SystemComponent'));
              End;

              If reg.ValueExists('IsMinorUpgrade') Then
                IsMinorUpgrade := IntToStr(reg.ReadInteger('IsMinorUpgrade'));

              // Пропускаем системные компоненты и минорные обновления
              If ((SystemComponent = '1') Or (IsMinorUpgrade = '1')) Then
                Continue;

              // Проверяем обязательные поля
              If (Not reg.ValueExists('DisplayName')) Or (Not reg.ValueExists('UninstallString')) Or (reg.ReadString('DisplayName') = '') Or (reg.ReadString('UninstallString') = '') Or (reg.ReadString('ReleaseType') <> '') Or (reg.ReadString('ParentDisplayName') <> '') Then
                Continue;

              // Добавляем элемент в список
              ListItem := Form1.ListViewUninstall.Items.Add;
              With ListItem Do
              Begin
                // Устанавливаем иконку по умолчанию
                SHGetFileInfo(pchar(ParamStr(0)), 0, ShInfo, SizeOf(ShInfo), SHGFI_ICON);
                ImageIndex := ShInfo.iIcon;

                Try
                  Caption := reg.ReadString('DisplayName');

                  // Подготавливаем пути
                  a := RunPath(reg.ReadString('UninstallString'));
                  str := StringReplace(a, ' (x86)', '', [rfReplaceAll]);
                  a1 := RunPath(reg.ReadString('DisplayIcon'));
                  str1 := StringReplace(a1, ' (x86)', '', [rfReplaceAll]);

                  // Обновляем статус
                  Form1.StatusBarUninstall.Panels[1].Text := LangLoadingData.Caption + ' ' + reg.ReadString('DisplayName');
                  StatusBarUninstall.Panels[0].Text := LangElements.Caption + ' ' + IntToStr(ListViewUninstall.Items.Count);
                  Application.ProcessMessages;

                  // Добавляем подэлементы
                  SubItems.Add(reg.ReadString('Publisher'));
                  SubItems.Add(reg.ReadString('DisplayVersion'));

                  // Дата установки
                  reg.GetKeyInfo(Keylnfo);
                  SubItems.Add(DateToStr(FileTimeToDateTime(Keylnfo.FileTime)));

                  // Место установки
                  SubItems.Add(reg.ReadString('InstallLocation')); // Будет пусто если нет значения

                  SubItems.Add(reg.ReadString('UninstallString'));

                  // Информация о ключе реестра
                  If RootKeys[j].RootKey = HKEY_LOCAL_MACHINE Then
                    SubItems.Add('HKEY_LOCAL_MACHINE')
                  Else
                    SubItems.Add('HKEY_CURRENT_USER');

                  SubItems.Add(RootKeys[j].KeyPath + '\' + lName[i]);
                  SubItems.Add(reg.ReadString('URLInfoAbout'));

                  // Поиск иконки
                  If reg.ValueExists('DisplayIcon') And FileExists(reg.ReadString('DisplayIcon')) Then
                    SubItems.Add(reg.ReadString('DisplayIcon'))
                  Else If FileExists(a1) Then
                    SubItems.Add(a1)
                  Else If FileExists(str1) Then
                    SubItems.Add(str1)
                  Else If FileExists(reg.ReadString('UninstallString')) Then
                    SubItems.Add(reg.ReadString('UninstallString'))
                  Else If FileExists(a) Then
                    SubItems.Add(a)
                  Else If FileExists(str) Then
                    SubItems.Add(str)
                  Else
                    SubItems.Add(''); // Путь к иконке не найден

                Except
                  // В случае ошибки удаляем некорректный элемент
                  ListViewUninstall.Items.Delete(ListViewUninstall.Items.Count - 1);
                End;
              End;
            Finally
              reg.CloseKey;
            End;
          End;
        End;
      Finally
        lName.Free;
      End;
    Finally
      reg.Free;
    End;
  End;

  // Поиск иконок в Installer\Products
  LoadProductIcons;

  // Загрузка иконок для элементов
  LoadIconsForItems;

  // Завершение
  Form1.StatusBarUninstall.Panels[1].Text := '';
  ListViewUninstall.CustomSort(@SortCaptionAsString, sort);
  EditSearchUninstall.Enabled := True;
  PopupMenuUninstall.AutoPopup := True;
  SpeedButton_GeneralMenu.Enabled := True;
  ListViewUninstall.Invalidate;
End;

Procedure TForm1.FormActivate(Sender: TObject);
Begin
  TabControlPanel.Enabled := False;
  Form1.globLoadUninstall;
  TabControlPanel.Enabled := true;
  Application.ProcessMessages;
End;

Procedure TForm1.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Form1.SaveNastr;
End;

Procedure TForm1.CleanTranslationsLikeGlobload;
Var
  i, j, k, m: Integer;
  Ini: TMemIniFile;
  Sections, Keys: TStringList;
  SearchRec: TSearchRec;
  FindResult: Integer;
  CompPath, FormName, CompName, PropName: String;
  FirstDot, SecondDot: Integer;
  FormExists, CompExists: Boolean;
  CurrentForm: TForm;
  CurrentComponent: TComponent;
  Modified: Boolean;
  IsDuplicate: Boolean;
  n: Integer;
  CompareKey, CompareFormName: String;
  CompareDotPos: Integer;
Begin
  // Создаем все формы проекта (если нужно)
  // CreateAllProjectForms;

  FindResult := FindFirst(ExtractFilePath(ParamStr(0)) + 'Language\*.ini', faAnyFile, SearchRec);
  If FindResult = 0 Then
  Begin
    Repeat
      If (SearchRec.Name <> '.') And (SearchRec.Name <> '..') Then
      Begin
        Ini := TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Language\' + SearchRec.Name);
        Sections := TStringList.Create;
        Keys := TStringList.Create;
        Modified := False;

        Try
          Ini.ReadSections(Sections);

          For i := 0 To Sections.Count - 1 Do
          Begin
            If SameText(Sections[i], Application.Title) Then
            Begin
            // ========== ИСКЛЮЧАЕМ ЭТИ СЕКЦИИ ИЗ ОБРАБОТКИ ==========
              If SameText(Sections[i], 'Language information') Or SameText(Sections[i], 'DestDir') Then
                Continue; // Пропускаем эти секции полностью

              Ini.ReadSection(Sections[i], Keys);

            // Проходим по всем ключам в обратном порядке
              For j := Keys.Count - 1 Downto 0 Do
              Begin
                CompPath := Keys[j];
                FirstDot := Pos('.', CompPath);

                If FirstDot > 0 Then
                Begin
                  FormName := Copy(CompPath, 1, FirstDot - 1);
                  FormExists := False;
                  CompExists := False;

                // ==================== ПРОВЕРКА СУЩЕСТВОВАНИЯ КОМПОНЕНТА ====================
                // Проверяем ВСЕ формы в Screen
                  For k := 0 To Screen.FormCount - 1 Do
                  Begin
                    If SameText(Screen.Forms[k].Name, FormName) Then
                    Begin
                      FormExists := True;
                      CurrentForm := Screen.Forms[k];

                    // Извлекаем остаток пути после имени формы
                      CompName := Copy(CompPath, FirstDot + 1, Length(CompPath));
                      SecondDot := Pos('.', CompName);

                      If SecondDot > 0 Then
                      Begin
                      // Есть вложенный компонент: Form1.TrayIcon1.Hint
                        PropName := Copy(CompName, SecondDot + 1, Length(CompName));
                        CompName := Copy(CompName, 1, SecondDot - 1);

                      // Ищем компонент на форме
                        CurrentComponent := CurrentForm.FindComponent(CompName);

                      // Если не нашли через FindComponent, ищем вручную
                        If CurrentComponent = Nil Then
                        Begin
                          For m := 0 To CurrentForm.ComponentCount - 1 Do
                          Begin
                            If SameText(CurrentForm.Components[m].Name, CompName) Then
                            Begin
                              CurrentComponent := CurrentForm.Components[m];
                              Break;
                            End;
                          End;
                        End;

                        CompExists := (CurrentComponent <> Nil);
                      End
                      Else
                      Begin
                      // Нет второй точки - это свойство формы (Form1.Caption)
                        CompExists := True;
                      End;

                      Break; // Форма найдена, выходим из цикла
                    End;
                  End;

                // ==================== ПРОВЕРКА ДУБЛИКАТОВ ====================
                  IsDuplicate := False;
                // Проверяем предыдущие ключи на дубликаты (только внутри той же формы)
                  For n := 0 To j - 1 Do
                  Begin
                    CompareKey := Keys[n];
                    CompareDotPos := Pos('.', CompareKey);

                    If CompareDotPos > 0 Then
                    Begin
                      CompareFormName := Copy(CompareKey, 1, CompareDotPos - 1);

                    // Дубликатом считаем только если:
                    // 1. Имя формы совпадает
                    // 2. Полный путь совпадает (регистронезависимо)
                      If (SameText(FormName, CompareFormName)) And (SameText(CompPath, CompareKey)) Then
                      Begin
                        IsDuplicate := True;
                        Break;
                      End;
                    End;
                  End;

                // ==================== УДАЛЕНИЕ КЛЮЧА ====================
                // Удаляем если:
                // 1. Форма или компонент не существуют ИЛИ
                // 2. Найден дубликат в той же форме
                  If (Not (FormExists And CompExists)) Or IsDuplicate Then
                  Begin
                    Ini.DeleteKey(Sections[i], Keys[j]);
                    Modified := True;
                  End;
                End
                Else
                Begin
                // Некорректный формат - удаляем
                  Ini.DeleteKey(Sections[i], Keys[j]);
                  Modified := True;
                End;
              End;

            // Проверяем, не пустая ли секция после удаления
            // (кроме исключенных секций)
              If Not (SameText(Sections[i], 'Language information') Or SameText(Sections[i], 'DestDir')) Then
              Begin
                Ini.ReadSection(Sections[i], Keys);
                If Keys.Count = 0 Then
                Begin
                  Ini.EraseSection(Sections[i]);
                  Modified := True;
                End;
              End;
            End;

            If Modified Then
              Ini.UpdateFile;
          End;

        Finally
          Keys.Free;
          Sections.Free;
          Ini.Free;
        End;
      End;
    Until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  End;
End;

Function GetApplicationBitness: String;
Begin
  {$IFDEF WIN64}
  Result := '(64-bit)';
  {$ELSE}
  Result := '(32-bit)';
  {$ENDIF}
End;

Procedure TForm1.FormCreate(Sender: TObject);
Begin
  portable := fileExists(ExtractFilePath(ParamStr(0)) + 'portable.ini');
  If portable = True Then
    Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness + ' Portable'
  Else
    Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness;
  SendMessage(ListViewUninstall.Handle, WM_UPDATEUISTATE, MakeLong(UIS_SET, UISF_HIDEFOCUS), 0);
  createicon(ListViewUninstall);
  createicon(ListviewDubUninstall);
  createicon(ListViewBackupsUninstall);
  CreateDir(ExtractFilePath(ParamStr(0)) + 'backup');

  Application.ProcessMessages;
  TabUninstall.TabVisible := False;
  TabBackups.TabVisible := False;
  Form1.PageControl.ActivePage := TabUninstall;
End;

Procedure TForm1.FormDestroy(Sender: TObject);
Begin
  Form1.ListViewUninstall.LargeImages.Free;
  Form1.ListViewUninstall.SmallImages.Free;
End;

Procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
Begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
End;

Procedure TForm1.WebSiteUninstallMenuClick(Sender: TObject);
Begin
  If ListViewUninstall.ItemIndex = -1 Then
    Exit;
  If ListViewUninstall.Selected.SubItems.Strings[7] = '' Then
    Exit;
  ShellExecute(Handle, 'open', pchar(ListViewUninstall.Selected.SubItems.Strings[7]), Nil, Nil, 5);
End;

Procedure TForm1.addListViewDub;
// Дублирование плейлиста для поиска файлов
Var
  IndexDub: Integer;
  ListItem: TListItem;
Begin
  Form1.ListviewDubUninstall.Clear;
  For IndexDub := 0 To ListViewUninstall.Items.Count - 1 Do
  Begin
    ListItem := Form1.ListviewDubUninstall.Items.Add;
    ListItem.ImageIndex := ListViewUninstall.Items[IndexDub].ImageIndex;
    ListItem.Caption := ListViewUninstall.Items[IndexDub].Caption;
    ListItem.SubItems.Add(ListViewUninstall.Items[IndexDub].SubItems[0]);
    ListItem.SubItems.Add(ListViewUninstall.Items[IndexDub].SubItems[1]);
    ListItem.SubItems.Add(ListViewUninstall.Items[IndexDub].SubItems[2]);
    ListItem.SubItems.Add(ListViewUninstall.Items[IndexDub].SubItems[3]);
    ListItem.SubItems.Add(ListViewUninstall.Items[IndexDub].SubItems[4]);
    ListItem.SubItems.Add(ListViewUninstall.Items[IndexDub].SubItems[5]);
    ListItem.SubItems.Add(ListViewUninstall.Items[IndexDub].SubItems[6]);
    ListItem.SubItems.Add(ListViewUninstall.Items[IndexDub].SubItems[7]);
    ListItem.SubItems.Add(ListViewUninstall.Items[IndexDub].SubItems[8]);
    Application.ProcessMessages;
  End;
End;

Function GetFileDateTime(Const FileName: String): TDateTime;
Var
  FileDateTime: TDateTime;
Begin
  Result := 0;
  Try
    If FileExists(FileName) Then
    Begin
      If FileAge(FileName, FileDateTime) Then
        Result := FileDateTime
      Else
        Result := 0;
    End;
  Except
    Result := 0;
  End;
End;

Function TForm1.FindFileCopy(Dir: String): Boolean;
Var
  sr: TSearchRec;
  FindRes: Integer;
  ShInfo: TSHFileInfo;
  ListItem: TListItem;
  i: Integer;
  PUTI: String;
  FilesFound: Boolean;
Begin
  FilesFound := False; // Флаг для отслеживания найденных файлов
  Try
    ListViewBackupsUninstall.Clear;
    Application.ProcessMessages;
    FindRes := FindFirst(Dir + '*.reg', faAnyFile, sr);
    While FindRes = 0 Do
    Begin
      If ((sr.Attr And faDirectory) = faDirectory) And ((sr.Name = '.') Or (sr.Name = '..')) Then
      Begin
        FindRes := FindNext(sr);
        Continue;
      End;

      If ((sr.Attr And faDirectory) = faDirectory) Then
      Begin
        // Рекурсивный поиск в поддиректориях
        If FindFileCopy(Dir + sr.Name + '\') Then
          FilesFound := True;
        FindRes := FindNext(sr);
        Continue;
      End;

      // Если найден файл (не директория)
      FilesFound := True;
      ListItem := ListViewBackupsUninstall.Items.Add;
      PUTI := Dir + sr.Name;
      SHGetFileInfo(pchar(PUTI), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
      With ListItem Do
      Begin
        Application.ProcessMessages;
        ListItem.MakeVisible(true);
        ImageIndex := ShInfo.iIcon;
        Caption := sr.Name;
        SubItems.Add(GetNormalSize(GetFileSize(pchar(PUTI))));
        SubItems.Add(FormatDateTime('dd.mm.yy hh:mm', GetFileDateTime(PUTI)));
        SubItems.Add(Dir + sr.Name);
        // Checked := true;
      End;

      FindRes := FindNext(sr);
    End;
    FindClose(sr);

    For i := 0 To ListViewBackupsUninstall.Columns.Count - 1 Do
    Begin
      ListView_SetColumnWidth(ListViewBackupsUninstall.Handle, i, LVSCW_AUTOSIZE_USEHEADER);
    End;

  Except
    // В случае ошибки возвращаем False
    Result := False;
    Exit;
  End;

  Result := FilesFound; // Возвращаем true, если найдены файлы
End;

Procedure TForm1.ButtonBackupsUninstallClick(Sender: TObject);
Begin
  Form1.PageControl.ActivePageIndex := 1;
  ButtonUninstall.Font.Style := [];
  ButtonBackupsUninstall.Font.Style := [fsBold];
  Try
    FindFileCopy(ExtractFilePath(ParamStr(0)) + 'backup\');
  Except
  End;
End;

Procedure TForm1.ButtonUninstallClick(Sender: TObject);
Begin
  Form1.PageControl.ActivePageIndex := 0;
  ButtonUninstall.Font.Style := [fsBold];
  ButtonBackupsUninstall.Font.Style := [];
  // FormActivate(self);
  Application.ProcessMessages;
End;

Procedure TForm1.EditSearchUninstallChange(Sender: TObject);
Var
  Index, SubIndex: Integer;
  ListItem: TListItem;
  SearchText, ItemCaption, ItemSubItem: String;
  ShouldAddItem: Boolean;
  SourceItem: TListItem;
Begin
  ListViewUninstall.Clear;
  SearchText := AnsiLowerCase(EditSearchUninstall.Text);

  // Поиск и добавление элементов
  For Index := 0 To ListviewDubUninstall.Items.Count - 1 Do
  Begin
    SourceItem := ListviewDubUninstall.Items.Item[Index];
    ShouldAddItem := (SearchText = '');

    If Not ShouldAddItem Then
    Begin
      ItemCaption := AnsiLowerCase(SourceItem.Caption);
      If SourceItem.SubItems.Count > 0 Then
        ItemSubItem := AnsiLowerCase(SourceItem.SubItems[0])
      Else
        ItemSubItem := '';

      ShouldAddItem := (Pos(SearchText, ItemCaption) > 0) Or (Pos(SearchText, ItemSubItem) > 0);
    End;

    If ShouldAddItem Then
    Begin
      ListItem := ListViewUninstall.Items.Add;
      ListItem.Caption := SourceItem.Caption;
      ListItem.ImageIndex := SourceItem.ImageIndex;

      // Добавляем все подэлементы через цикл
      For SubIndex := 0 To 8 Do
      Begin
        If SubIndex < SourceItem.SubItems.Count Then
          ListItem.SubItems.Add(SourceItem.SubItems.Strings[SubIndex])
        Else
          ListItem.SubItems.Add(''); // Пустая строка если подэлемента нет
      End;
    End;

    Application.ProcessMessages;
  End;

  // Сортировка и обновление интерфейса
  sort := sort;
  ListViewUninstall.CustomSort(@SortCaptionAsString, sort);
  EditSearchUninstall.SetFocus;
  ListViewUninstall.Refresh;
  StatusBarUninstall.Panels[0].Text := LangElements.Caption + ' ' + IntToStr(ListViewUninstall.Items.Count);
  Application.ProcessMessages;
End;

End.

