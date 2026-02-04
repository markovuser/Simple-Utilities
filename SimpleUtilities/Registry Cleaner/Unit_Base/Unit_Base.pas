Unit Unit_Base;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus, IniFiles, registry, CommCtrl,
  ShlObj, SHFolder, shellapi, ImgList, pngimage, System.ImageList, WinInet,
  ClipBrd, Vcl.Buttons, WindowsDarkMode, Vcl.CustomizeDlg,
  System.Win.TaskbarCore, Vcl.Taskbar, Translation,FileInfoUtils;

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
    PopupMenuList: TPopupMenu;
    CopyKeyMenu: TMenuItem;
    N20: TMenuItem;
    SelectAllMenu: TMenuItem;
    ExcludeAllMenu: TMenuItem;
    PopupMenuOption: TPopupMenu;
    OptionSelectAllMenu: TMenuItem;
    OptionExcludeAllMenu: TMenuItem;
    N4: TMenuItem;
    OptionSaveMenu: TMenuItem;
    AddKeyMenu: TMenuItem;
    N9: TMenuItem;
    AddParameterMenu: TMenuItem;
    ClearListMenu: TMenuItem;
    N18: TMenuItem;
    Memo2: TMemo;
    TabControl2: TTabControl;
    Memo1: TMemo;
    Taskbar1: TTaskbar;
    PopupMenuGeneral: TPopupMenu;
    SpeedButton_GeneralMenu: TSpeedButton;
    TabControlPanel: TTabControl;
    ButtonRegClean: TButton;
    ButtonExceptions: TButton;
    ButtonBackups: TButton;
    ImageList3: TImageList;
    PageControl1: TPageControl;
    TabSheetRegistry: TTabSheet;
    TabSheetBackups: TTabSheet;
    TabControlBackups: TTabControl;
    TabSheetExceptions: TTabSheet;
    TabControlExceptions: TTabControl;
    TabControlRegOption: TTabControl;
    TabControlRegistry: TTabControl;
    ListViewRegCleaner: TListView;
    ListViewExceptions: TListView;
    PopupMenuExceptions: TPopupMenu;
    SaveExceptionsMenu: TMenuItem;
    N23: TMenuItem;
    DeleteAllExceptionsMenu: TMenuItem;
    DeletaExceptionsMenu: TMenuItem;
    PopupMenuBackups: TPopupMenu;
    BackupsUpdateMenu: TMenuItem;
    N11: TMenuItem;
    BackupsRestoreMenu: TMenuItem;
    MenuItem2: TMenuItem;
    BackupsDelAllMenu: TMenuItem;
    BackupsDelMenu: TMenuItem;
    ListViewBackups: TListView;
    Label1: TLabel;
    ProgressBarRegCleaner: TProgressBar;
    TabControl4: TTabControl;
    ButtonSearch: TButton;
    ButtonFix: TButton;
    StatusBarRegCleaner: TStatusBar;
    PopupMenuLanguage: TPopupMenu;
    LangSearch: TMenuItem;
    LangStop: TMenuItem;
    LangTotal: TMenuItem;
    LangReady: TMenuItem;
    HeaderControl2: THeaderControl;
    CheckBoxApplicationPaths: TCheckBox;
    CheckBoxSharedDLLs: TCheckBox;
    CheckBoxFonts: TCheckBox;
    CheckBoxHelp: TCheckBox;
    CheckBoxKnownDLLs: TCheckBox;
    CheckBoxCodec: TCheckBox;
    CheckBoxLoadUninstall: TCheckBox;
    CheckBoxInstall: TCheckBox;
    CheckBoxServices: TCheckBox;
    CheckBoxDriver: TCheckBox;
    CheckBoxFileExts: TCheckBox;
    CheckBoxHKLMSOFTWARE: TCheckBox;
    CheckBoxSound: TCheckBox;
    CheckBoxShellExtensions: TCheckBox;
    CheckBoxFirewallPolicy: TCheckBox;
    CheckBoxMUI: TCheckBox;
    CheckBoxClassKom: TCheckBox;
    LangOnlyWindows: TMenuItem;
    LangError: TMenuItem;
    Procedure ButtonFixClick(Sender: TObject);
    Procedure CopyKeyMenuClick(Sender: TObject);
    Procedure SelectAllMenuClick(Sender: TObject);
    Procedure ExcludeAllMenuClick(Sender: TObject);
    Procedure OptionSaveMenuClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure LoadNastr;
    Procedure SaveNastr;
    Procedure Help;
    Procedure font;
    Procedure SharedDLLs;
    Procedure AppPath;
    Procedure LoadUninstall;
    Procedure KnownDLLs;
    Procedure Codec;
    Procedure Install;
    Procedure Services;
    Procedure Driver;
    Procedure FileExts;
    Procedure HKLMSOFTWARE;
    Procedure Sound;
    Procedure ShellExtensions;
    Procedure FirewallPolicy;
    Procedure ClassKom;
    Procedure RegCopy;
    Procedure Search;
    Procedure Repair;
    Procedure StopSearch;
    Procedure SaveExclusionReg;
    Procedure LoadExclusionReg;
    Procedure JumpToKey(Key: String);
    Procedure CheckAll(Checked: boolean);
    Procedure LoadFromMUI;
    Procedure OptionSelectAllMenuClick(Sender: TObject);
    Procedure OptionExcludeAllMenuClick(Sender: TObject);
    Procedure CheckAll1(Checked: boolean);
    Procedure AddExl(Path, Description: String; EChecked: boolean; List: TListView);
    Procedure ListViewOptionEditing(Sender: TObject; Item: TListItem; Var AllowEdit: boolean);
    Procedure ListViewRegCleanerColumnClick(Sender: TObject; Column: TListColumn);
    Procedure ClearListMenuClick(Sender: TObject);
    Procedure AddParameterMenuClick(Sender: TObject);
    Procedure ListViewRegCleanerEditing(Sender: TObject; Item: TListItem; Var AllowEdit: boolean);
    Procedure SaveExceptionsMenuClick(Sender: TObject);
    Procedure AddKeyMenuClick(Sender: TObject);
    Procedure ListViewOptionClick(Sender: TObject);
    Procedure SpeedButton2Click(Sender: TObject);
    Function RunPath(Path: String): String;
    Function GetNormalSize(Size: Int64): String;
    Function GetFileSize(namefile: String): Int64;
    Procedure ButtonSearchClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure SpeedButton_GeneralMenuClick(Sender: TObject);
    Procedure globload;
    Procedure CleanTranslationsLikeGlobload;
    Procedure ButtonRegCleanClick(Sender: TObject);
    Procedure ButtonExceptionsClick(Sender: TObject);
    Procedure ButtonBackupsClick(Sender: TObject);
    Procedure DeleteAllExceptionsMenuClick(Sender: TObject);
    Procedure DeletaExceptionsMenuClick(Sender: TObject);
    Procedure BackupsUpdateMenuClick(Sender: TObject);
    Function FindFileCopy(Dir: String): boolean;
    Procedure DeleteFileSelected;
    Procedure DeleteAll;
    Procedure BackupsRestoreMenuClick(Sender: TObject);
    Procedure BackupsDelAllMenuClick(Sender: TObject);
    Procedure BackupsDelMenuClick(Sender: TObject);
    Procedure TabSheetBackupsShow(Sender: TObject);
    Function IsWindows10Or11: Boolean;
    Function PortablePath: String;
    Function PortablePathExclusionReg: String;
  Private
    Procedure WMMouseMove(Var Message: TWMMouseMove); Message WM_MOUSEMOVE;
    Procedure WMSettingChange(Var Message: TWMSettingChange); Message WM_SETTINGCHANGE;
  Protected
  Public
  End;

Var
  Form1: TForm1;
  Root: Cardinal;
  sort: Integer = 1;
  Msg: Integer;
  reg: tRegistry;
  puti, FileDescription, CompanyName: String;
  Stop: boolean;
  FReg: tRegistry;
  Portable: boolean;

Implementation

{$R *.dfm}

Function TForm1.IsWindows10Or11: Boolean;
Begin
  Result := (TOSVersion.Major = 10) And (TOSVersion.Build >= 10240);
End;


Procedure TForm1.WMSettingChange(Var Message: TWMSettingChange);
Var
  Ini: TMemIniFile;
  ThemeAuto: boolean;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);

  ThemeAuto := Ini.ReadBool('Option', 'ThemeAuto', false);
  If ThemeAuto = true Then
  Begin
    If DarkModeIsEnabled = true Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
      Application.ProcessMessages;
    End;

    If DarkModeIsEnabled = false Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      Application.ProcessMessages;
    End;
  End;
  Ini.Free;
End;

Procedure TListView.WMVScroll(Var Message: TWMVScroll);
Begin
  TWinControl(self).DefaultHandler(Message);
End;

Function TForm1.GetFileSize(namefile: String): Int64;
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

Function FileExists(FileName: String): boolean;
Var
  FindData: TWin32FindData;
Begin
  Result := (FindFirstFile(pchar(FileName), FindData) <> INVALID_HANDLE_VALUE);
End;

// Преобразование размера

Function TForm1.GetNormalSize(Size: Int64): String;
Var
  kb, Mb, Gb: Real;
Begin
  Try
    Result := IntToStr(Size) + ' b';
    kb := Size / 1024;
    kb := Trunc(kb * 10) / 10;
    If kb < 0.7 Then
      Exit;
    Result := FloatToStr(kb) + ' kb';
    Mb := kb / 1024;
    Mb := Trunc(Mb * 10) / 10;
    If Mb < 0.7 Then
      Exit;
    Result := FloatToStr(Mb) + ' Mb';
    Gb := Mb / 1024;
    Gb := Trunc(Gb * 10) / 10;
    If Gb < 0.7 Then
      Exit;
    Result := FloatToStr(Gb) + ' Gb';
  Except
  End;
End;

Function OpenRegEditAndJumpToKey(Const KeyName: String): Boolean;
Var
  reg: TRegistry; // Добавляем объявление переменной
Begin
  Result := False; // Инициализируем результат

  Try
    reg := TRegistry.Create; // Явно создаем объект
    Try
      // Устанавливаем корневой ключ и права доступа
      If Form1.ListViewRegCleaner.Selected.Caption = 'HKEY_CURRENT_USER' Then
      Begin
        reg.RootKey := HKEY_CURRENT_USER;
      End
      Else If Form1.ListViewRegCleaner.Selected.Caption = 'HKEY_LOCAL_MACHINE' Then
      Begin
        reg.RootKey := HKEY_LOCAL_MACHINE;
      End
      Else If Form1.ListViewRegCleaner.Selected.Caption = 'HKEY_CLASSES_ROOT' Then
      Begin
        reg.RootKey := HKEY_CLASSES_ROOT;
      End
      Else
      Begin
        // Если ключ не распознан, выходим
        Exit;
      End;

      // Устанавливаем права доступа (исправляем дублирование)
      reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;

      // Открываем ключ для записи последней позиции в реестре
      If reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Applets\Regedit', False) Then
      Begin
        Try
          Try
            reg.WriteString('LastKey', KeyName);
            Result := True; // Успешно записали ключ
          Except
            Result := False;
            // Не выходим сразу, продолжаем выполнение
          End;
        Finally
          reg.CloseKey;
        End;
      End;

    Finally
      reg.Free; // Гарантированно освобождаем ресурсы
    End;

    // Запускаем regedit независимо от результата записи в реестр
    If Result Then // Только если успешно записали ключ
      Result := ShellExecute(0, 'open', 'regedit.exe', Nil, Nil, SW_SHOWNORMAL) > 32
    Else
      Result := ShellExecute(0, 'open', 'regedit.exe', Nil, Nil, SW_SHOWNORMAL) > 32;

  Except
    Result := False; // В случае исключения возвращаем False
  End;
End;

Procedure TForm1.AddExl(Path, Description: String; EChecked: boolean; List: TListView);
Var
  ListItem: TListItem;
Begin
  ListItem := List.Items.Add;
  With ListItem Do
  Begin
    Caption := Path;
    SubItems.Add(Description);
    Checked := EChecked;
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

Procedure TForm1.LoadExclusionReg;
Var
  Ini: TMemIniFile;
  Count, reg: Integer;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePathExclusionReg);

  Count := Ini.ReadInteger('ExclusionReg', 'Count', 0);
  For reg := 1 To Count Do
  Begin
    Form1.AddExl(Ini.ReadString('ExclusionReg', 'Reg' + IntToStr(reg - 1), ''), Ini.ReadString('ExclusionReg', 'D' + IntToStr(reg - 1), ''), Ini.ReadBool('ExclusionReg', 'CH' + IntToStr(reg - 1), false), Form1.ListViewExceptions);
  End;
  Ini.Free;
End;

Procedure TForm1.LoadNastr;
Var
  Ini: TMemIniFile;
  WindowCenter: boolean;
  ThemeAuto, ThemeLight, ThemeDark: boolean;
  i, ch: Integer;
Begin

  Ini := TMemIniFile.Create(Form1.PortablePath);

  ThemeAuto := Ini.ReadBool('Option', 'ThemeAuto', false);
  If ThemeAuto = true Then
  Begin
    If DarkModeIsEnabled = true Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
      Application.ProcessMessages;
    End;

    If DarkModeIsEnabled = false Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      Application.ProcessMessages;
    End;
  End;

  ThemeLight := Ini.ReadBool('Option', 'ThemeLight', false);
  If ThemeLight = true Then
  Begin
    SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
    Application.ProcessMessages;
  End;

  ThemeDark := Ini.ReadBool('Option', 'ThemeDark', false);
  If ThemeDark = true Then
  Begin
    SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
    Application.ProcessMessages;
  End;

  For ch := 0 To TabControlRegOption.ControlCount - 1 Do
  Begin
    If TabControlRegOption.Controls[ch] Is TCheckBox Then
    Begin
      TCheckBox(TabControlRegOption.Controls[ch]).Checked := Ini.ReadBool(Application.Title, TCheckBox(TabControlRegOption.Controls[ch]).Name, false);
    End;
  End;

  WindowCenter := Ini.ReadBool('Position', 'WindowCenter', false);
  If WindowCenter = true Then
  Begin
    Form1.Position := poDesktopCenter;
  End;
  If WindowCenter = false Then
  Begin
    Form1.Position := poDesigned;
  End;

  If Ini.ReadString(Application.Title, 'Window', '') = 'wsMaximized' Then
  Begin
    Form1.WindowState := wsMaximized;
  End;

  If Ini.ReadString(Application.Title, 'Window', '') <> 'wsMaximized' Then
  Begin
    Form1.top := Ini.ReadInteger(Application.Title, 'Top', Form1.top);
    Form1.left := Ini.ReadInteger(Application.Title, 'Left', Form1.left);
    Form1.Height := Ini.ReadInteger(Application.Title, 'Height', Form1.Height);
    Form1.Width := Ini.ReadInteger(Application.Title, 'Width', Form1.Width);
  End;

  Ini.Free;

  Try
    For i := 0 To ListViewExceptions.Columns.Count - 1 Do
      ListView_SetColumnWidth(Form1.ListViewExceptions.Handle, i, LVSCW_AUTOSIZE_USEHEADER);
  Except
  End;
  Try
    For i := 0 To ListViewBackups.Columns.Count - 1 Do
      ListView_SetColumnWidth(Form1.ListViewBackups.Handle, i, LVSCW_AUTOSIZE_USEHEADER);
  Except
  End;
End;

Procedure TForm1.SaveExclusionReg;
Var
  Ini: TMemIniFile;
  reg: Integer;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePathExclusionReg);

  Ini.WriteInteger('ExclusionReg', 'Count', ListViewExceptions.Items.Count);
  For reg := 0 To ListViewExceptions.Items.Count - 1 Do
  Begin
    Ini.WriteString('ExclusionReg', 'Reg' + IntToStr(reg), ListViewExceptions.Items[reg].Caption);
    Ini.WriteString('ExclusionReg', 'D' + IntToStr(reg), ListViewExceptions.Items[reg].SubItems.Strings[0]);
    Ini.WriteBool('ExclusionReg', 'CH' + IntToStr(reg), ListViewExceptions.Items[reg].Checked);
  End;
  Ini.UpdateFile;
  Ini.Free;
End;

Function GetAppDataRoamingPath: String;
Var
  Path: Array[0..MAX_PATH] Of Char;
Begin
  If SUCCEEDED(SHGetFolderPath(0, CSIDL_APPDATA, 0, 0, @Path[0])) Then
    Result := IncludeTrailingPathDelimiter(Path)
  Else
    Result := '';
End;

Function TForm1.PortablePath: String;
Begin
  If portable Then
    Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini'
  Else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(ParamStr(0))) + '\Simple Utilities\Config\Option.ini';
    //Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini';
  // Создаем папку для конфига
  ForceDirectories(ExtractFilePath(Result));
End;

Function TForm1.PortablePathExclusionReg: String;
Begin
  If portable Then
    Result := ExtractFilePath(ParamStr(0)) + 'Config\ExclusionReg.ini'
  Else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(ParamStr(0))) + '\Simple Utilities\Config\ExclusionReg.ini';
    //Result := ExtractFilePath(ParamStr(0)) + 'Config\ExclusionReg.ini';
  // Создаем папку для конфига
  ForceDirectories(ExtractFilePath(Result));
End;

Procedure TForm1.SaveNastr;
Var
  Ini: TMemIniFile;
  i: Integer;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);

  For i := 0 To TabControlRegOption.ControlCount - 1 Do
  Begin
    If TabControlRegOption.Controls[i] Is TCheckBox Then
    Begin
      Ini.WriteBool(Application.Title, TCheckBox(TabControlRegOption.Controls[i]).Name, TCheckBox(TabControlRegOption.Controls[i]).Checked);
    End;
  End;
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

Function GetSpecialFolderPath(folder: Integer): String;
Const
  SHGFP_TYPE_CURRENT = 0;
Var
  Path: Array[0..MAX_PATH] Of Char;
Begin
  If SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @Path[0])) Then
    Result := Path
  Else
    Result := '';
End;

Function ExtractFileExt1(Const FileName: String): String;
Var
  i: Integer;
Begin
  i := LastDelimiter('.' + PathDelim + DriveDelim, FileName);
  If (i > 0) And (FileName[i] = '.') Then
    Result := Copy(FileName, i + 4, MaxInt)
  Else
    Result := '';
End;

Function DelPath(Path: String): String;
Var
  i: Integer;
Begin
  Result := Path;
  For i := 0 To Length(Path) Do
  Begin
    If (Copy(Path, i, 2) = ' /') Or (Copy(Path, i, 2) = ' *') Then
    Begin
      Result := trim(Copy(Path, 1, i - 1));
      break;
    End;
  End;
End;

Function GetSysCD: String;
Var
  S: Array[0..MAX_PATH] Of Char;
Begin
  GetWindowsDirectory(S, SizeOf(S));
  Result := Copy(S, 0, 1);
End;

Function TForm1.RunPath(Path: String): String;
Var
  l: Integer;
  S, b, c, c1, d, d1, d2, d3, d31, d4, e, e1, e2, a, a0, a1, a2, a4, a5, a11, a111: String;
  m: String;
Begin
  Path := AnsiLowerCase(Path);
  a0 := StringReplace(Path, '\\', '\', [rfReplaceAll]);
  a := StringReplace(a0, '\??\', '', [rfReplaceAll]);
  a111 := StringReplace(a, '\?\', '', [rfReplaceAll]);
  a11 := StringReplace(a111, 'file://', '', [rfReplaceAll]);
  a1 := StringReplace(a11, '"', '', [rfReplaceAll]);
  a2 := StringReplace(a1, AnsiLowerCase('rundll32.exe '), '', [rfReplaceAll]);
  b := StringReplace(a2, AnsiLowerCase('rundll32 '), '', [rfReplaceAll]);
  c := StringReplace(b, AnsiLowerCase('%ProgramFiles%'), GetSysCD + ':\Program Files', [rfReplaceAll]);
  c1 := StringReplace(c, AnsiLowerCase('%ProgramFiles(x86)%'), GetSysCD + ':\Program Files (x86)', [rfReplaceAll]);
  { c := StringReplace(b, AnsiLowerCase('%ProgramFiles%'),
    GetSpecialFolderPath(CSIDL_PROGRAM_FILES), [rfReplaceAll]);
    application.ProcessMessages;
    c1 := StringReplace(c, AnsiLowerCase('%ProgramFiles(x86)%'),
    GetSysCD + ':\Program Files (x86)', [rfReplaceAll]);
    application.ProcessMessages; }
  d := StringReplace(c1, AnsiLowerCase('%SystemRoot%'), GetSpecialFolderPath(CSIDL_WINDOWS), [rfReplaceAll]);
  d1 := StringReplace(d, AnsiLowerCase('\SystemRoot'), GetSpecialFolderPath(CSIDL_WINDOWS), [rfReplaceAll]);
  d2 := StringReplace(d1, AnsiLowerCase('%windir%'), GetSpecialFolderPath(CSIDL_WINDOWS), [rfReplaceAll]);
  d3 := StringReplace(d2, AnsiLowerCase('%CommonProgramFiles(x86)%'), GetSpecialFolderPath(CSIDL_PROGRAM_FILES_COMMONX86), [rfReplaceAll]);
  d31 := StringReplace(d3, AnsiLowerCase('%CommonProgramFiles%'), GetSpecialFolderPath(CSIDL_PROGRAM_FILES_COMMON), [rfReplaceAll]);
  If ExtractFileDrive(d31) = '' Then
  Begin
    d4 := StringReplace(d31, AnsiLowerCase('System32'), GetSpecialFolderPath(CSIDL_SYSTEM), [rfReplaceAll]);
  End;
  If ExtractFileDrive(d31) <> '' Then
  Begin
    d4 := d31;
  End;
  e := StringReplace(d4, '@', '', [rfReplaceAll]);
  e1 := StringReplace(e, 'n;1;', '', [rfReplaceAll]);
  e2 := StringReplace(e1, '\\', '\', [rfReplaceAll]);
  m := DelPath(e2);
  S := ExtractFileExt1(m);
  l := Length(S);
  Delete(m, Length(m) - l + 1, l);
  a4 := m;
  If (pos(AnsiLowerCase('.dll'), a4) > 0) Then
  Begin
    Delete(m, pos(AnsiLowerCase('.dll'), m), Length(m));
    a4 := m + '.dll';
  End;

  If (pos(';', a4) > 0) Then
  Begin
    Delete(m, 1, 4);
    a4 := m;
  End;

  If (pos('/', a4) > 0) Then
  Begin
    Delete(m, pos('/', m), Length(m));
    a4 := m;
  End;

  If (pos(' -', a4) > 0) Then
  Begin
    Delete(m, pos(' -', m), Length(m));
    a4 := m;
  End;

  If (pos(AnsiLowerCase('.exe'), a4) > 0) Then
  Begin
    Delete(m, pos(AnsiLowerCase('.exe'), m), Length(m));
    a4 := m + '.exe';
  End;

  If (pos(AnsiLowerCase('.db'), a4) > 0) Then
  Begin
    Delete(m, pos(AnsiLowerCase('.db'), m), Length(m));
    a4 := m + '.db';
  End;

  If (pos(lowercase('.ax'), a4) > 0) Then
  Begin
    Delete(m, pos(AnsiLowerCase('.ax'), m), Length(m));
    a4 := m + '.ax';
  End;

  If (pos(lowercase('.sys'), a4) > 0) Then
  Begin
    Delete(m, pos(AnsiLowerCase('.sys'), m), Length(m));
    a4 := m + '.sys';
  End;

  { if (pos('^', a4) > 0) then
    begin
    Delete(m, pos('^', m), MaxInt);
    // Delete( e2, Pos('^', e2), Length( e2));
    a4 := m;
    end; }

  If (FileExists(GetSpecialFolderPath(CSIDL_WINDOWS) + '\' + a4) = false) Or (FileExists(GetSpecialFolderPath(CSIDL_SYSTEM) + '\' + a4) = false) Then
    a5 := a4;
  If FileExists(GetSpecialFolderPath(CSIDL_WINDOWS) + '\' + a4) = true Then
    a5 := GetSpecialFolderPath(CSIDL_WINDOWS) + '\' + a4;
  If FileExists(GetSpecialFolderPath(CSIDL_SYSTEM) + '\' + a4) = true Then
    a5 := GetSpecialFolderPath(CSIDL_SYSTEM) + '\' + a4;
  Result := a5;
End;

Function ExlPathReg(Path: String): boolean;
Var
  i: Integer;
Begin
  For i := 0 To Form1.ListViewExceptions.Items.Count - 1 Do
  Begin
    If (Form1.ListViewExceptions.Items[i].Checked = true) And (pos(AnsiLowerCase(Form1.ListViewExceptions.Items[i].Caption), AnsiLowerCase(Path)) > 0) Then
    Begin
      Result := true;
      Exit;
    End;
  End;
  Result := false;
End;

Function DiskExist(DISKpath: Char): boolean;
Var
  OldErrorMode: Integer;
  fp: TextFile;
Begin
  Result := true;
  Try
    OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
    Try
      AssignFile(fp, DISKpath + ':\file.dsc');
      Reset(fp);
      CloseFile(fp);
    Finally
      SetErrorMode(OldErrorMode);
    End;
  Except
    On e: EInOutError Do
      If e.ErrorCode = 21 Then
        Result := false;
  End;
End;

{ Function Str2Char(Str :String) :Char;
  Begin
  Str2Char:=Str[1];
  End; }

Procedure TForm1.Search;
Var
  u: Integer;
Begin
  Stop := false;
  Form1.ProgressBarRegCleaner.Position := 0;
  Form1.Taskbar1.ProgressValue := Form1.ProgressBarRegCleaner.Position;
  ListViewRegCleaner.Clear;
  Form1.PopupMenuList.AutoPopup := false;
  Form1.PopupMenuOption.AutoPopup := false;

  Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);

  If CheckBoxApplicationPaths.Checked = true Then
  Begin
    CheckBoxApplicationPaths.font.Style := [fsBold];
    AppPath;
    CheckBoxApplicationPaths.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxSharedDLLs.Checked = true Then
  Begin
    CheckBoxSharedDLLs.font.Style := [fsBold];
    SharedDLLs;
    CheckBoxSharedDLLs.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxFonts.Checked = true Then
  Begin
    CheckBoxFonts.font.Style := [fsBold];
    font;
    CheckBoxFonts.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxHelp.Checked = true Then
  Begin
    CheckBoxHelp.font.Style := [fsBold];
    Help;
    CheckBoxHelp.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxKnownDLLs.Checked = true Then
  Begin
    CheckBoxKnownDLLs.font.Style := [fsBold];
    KnownDLLs;
    CheckBoxKnownDLLs.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxCodec.Checked = true Then
  Begin
    CheckBoxCodec.font.Style := [fsBold];
    Codec;
    CheckBoxCodec.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxLoadUninstall.Checked = true Then
  Begin
    CheckBoxLoadUninstall.font.Style := [fsBold];
    LoadUninstall;
    CheckBoxLoadUninstall.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxInstall.Checked = true Then
  Begin
    CheckBoxInstall.font.Style := [fsBold];
    Install;
    CheckBoxInstall.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxServices.Checked = true Then
  Begin
    CheckBoxServices.font.Style := [fsBold];
    Services;
    CheckBoxServices.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxDriver.Checked = true Then
  Begin
    CheckBoxDriver.font.Style := [fsBold];
    Driver;
    CheckBoxDriver.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxFileExts.Checked = true Then
  Begin
    CheckBoxFileExts.font.Style := [fsBold];
    FileExts;
    CheckBoxFileExts.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxHKLMSOFTWARE.Checked = true Then
  Begin
    CheckBoxHKLMSOFTWARE.font.Style := [fsBold];
    HKLMSOFTWARE;
    CheckBoxHKLMSOFTWARE.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxSound.Checked = true Then
  Begin
    CheckBoxSound.font.Style := [fsBold];
    Sound;
    CheckBoxSound.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxShellExtensions.Checked = true Then
  Begin
    CheckBoxShellExtensions.font.Style := [fsBold];
    ShellExtensions;
    CheckBoxShellExtensions.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxFirewallPolicy.Checked = true Then
  Begin
    CheckBoxFirewallPolicy.font.Style := [fsBold];
    FirewallPolicy;
    CheckBoxFirewallPolicy.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxMUI.Checked = true Then
  Begin
    CheckBoxMUI.font.Style := [fsBold];
    LoadFromMUI;
    CheckBoxMUI.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  //

  If CheckBoxClassKom.Checked = true Then
  Begin
    CheckBoxClassKom.font.Style := [fsBold];
    ClassKom;
    CheckBoxClassKom.font.Style := [];
    If Form1.ListViewRegCleaner.Items.Count > 0 Then
    Begin
      For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
      Begin
        ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
      End;
    End;
    Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  End;
  Stop := true;

  If Form1.ListViewRegCleaner.Items.Count > 0 Then
    ButtonFix.Enabled := true;

  Application.ProcessMessages;
  Form1.PopupMenuList.AutoPopup := true;
  Form1.PopupMenuOption.AutoPopup := true;

  Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  Form1.StatusBarRegCleaner.Panels[1].Text := '';
  Form1.StatusBarRegCleaner.Panels[0].Text := '';
  Application.ProcessMessages;
  Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
  Form1.Taskbar1.ProgressValue := Form1.ProgressBarRegCleaner.Position;
  If Form1.ListViewRegCleaner.Items.Count > 0 Then
  Begin
    For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
    Begin
      ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
    End;
  End;
  Application.ProcessMessages;
End;

// Поискстоп ошибок
// Пути приложений  (0)

Procedure TForm1.AppPath;
Var
  i: Integer;
  PathValue, AppPathValue: String;
  KeyInfo: TRegKeyInfo;
  APPName: TStringList;
  AppListItem: TListItem;
  Reg: TRegistry;
  BaseKey: String;
Begin
  // Проверка флага остановки в начале процедуры
  If Stop Then
    Exit;

  BaseKey := '\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\';

  Reg := TRegistry.Create;
  Try
    // Проверка перед настройкой реестра
    If Stop Then
    Begin
      Reg.Free;
      Exit;
    End;

    Reg.Access := KEY_WOW64_64KEY Or KEY_READ;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    APPName := TStringList.Create;
    Try
      // Проверка перед открытием ключа
      If Stop Then
        Exit;

      If Not Reg.OpenKey(BaseKey, False) Then
        Exit;

      // Проверка перед получением информации
      If Stop Then
        Exit;
      Reg.GetKeyInfo(KeyInfo);

      If Stop Then
        Exit;
      Reg.GetKeyNames(APPName);
      Reg.CloseKey;

      // Проверка перед обновлением интерфейса
      If Stop Then
        Exit;
      Application.ProcessMessages;
      Form1.ProgressBarRegCleaner.Max := APPName.Count * 2 - 1;
      Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
      Form1.ProgressBarRegCleaner.Position := 0;
      Form1.Taskbar1.ProgressValue := 0;

      // Первый проход - проверка значений по умолчанию ('')
      For i := 0 To APPName.Count - 1 Do
      Begin
        // Основная проверка остановки в цикле
        If Stop Then
          Exit;

        // Проверка перед открытием каждого ключа
        If Stop Then
          Exit;
        If Reg.OpenKey(BaseKey + APPName[i] + '\', False) Then
        Begin
          Try
            // Проверка перед обновлением прогресса
            If Stop Then
              Exit;
            Form1.ProgressBarRegCleaner.Position := ProgressBarRegCleaner.Position + 1;
            Form1.Taskbar1.ProgressValue := Form1.ProgressBarRegCleaner.Position;
            Application.ProcessMessages;

            If Not Reg.ValueExists('') Then
              Continue;

            // Проверка перед чтением значения
            If Stop Then
              Exit;
            PathValue := Reg.ReadString('');
            Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxApplicationPaths.Caption;
            Form1.StatusBarRegCleaner.Panels[1].Text := PathValue;
            Application.ProcessMessages;

            PathValue := StringReplace(RunPath(PathValue), ';', '', [rfReplaceAll]);

            If Pos('%', PathValue) > 0 Then
              Continue;

            If FileExists(RunPath(PathValue)) Or FileExists(StringReplace(RunPath(PathValue), '(x86)', '', [rfReplaceAll])) Then
              Continue;

            If GetDriveType(PChar(ExtractFileDrive(RunPath(PathValue)))) In [DRIVE_CDROM, DRIVE_REMOVABLE] Then
              Continue;

            // Проверка перед добавлением в список
            If Stop Then
              Exit;
            If Not ExlPathReg(LowerCase(BaseKey + APPName[i] + '\')) And Not ExlPathReg(LowerCase(PathValue)) Then
            Begin
              AppListItem := Form1.ListViewRegCleaner.Items.Add;
              With AppListItem Do
              Begin
                MakeVisible(True);
                Caption := 'HKEY_LOCAL_MACHINE';
                SubItems.Add(BaseKey + APPName[i] + '\');
                SubItems.Add('');
                SubItems.Add(PathValue);
                SubItems.Add(CheckBoxApplicationPaths.Caption);
                SubItems.Add('DelKey');
                Checked := True;
                Application.ProcessMessages;
                Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
              End;
            End;
          Finally
            Reg.CloseKey;
          End;
        End;
      End;

      // Проверка перед вторым проходом
      If Stop Then
        Exit;

      // Второй проход - проверка значений 'Path'
      For i := 0 To APPName.Count - 1 Do
      Begin
        // Основная проверка остановки во втором цикле
        If Stop Then
          Exit;

        // Проверка перед открытием каждого ключа
        If Stop Then
          Exit;
        If Reg.OpenKey(BaseKey + APPName[i] + '\', False) Then
        Begin
          Try
            // Проверка перед обновлением прогресса
            If Stop Then
              Exit;
            Form1.ProgressBarRegCleaner.Position := ProgressBarRegCleaner.Position + 1;
            Form1.Taskbar1.ProgressValue := Form1.ProgressBarRegCleaner.Position;
            Application.ProcessMessages;

            If Not Reg.ValueExists('Path') Then
              Continue;

            // Проверка перед чтением значения
            If Stop Then
              Exit;
            AppPathValue := Reg.ReadString('Path');
            Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxApplicationPaths.Caption;
            Form1.StatusBarRegCleaner.Panels[1].Text := AppPathValue;
            Application.ProcessMessages;

            AppPathValue := StringReplace(AppPathValue, ';', '', [rfReplaceAll]);

            If Pos('%', AppPathValue) > 0 Then
              Continue;

            If DirectoryExists(RunPath(AppPathValue)) Or DirectoryExists(StringReplace(RunPath(AppPathValue), '(x86)', '', [rfReplaceAll])) Or FileExists(RunPath(AppPathValue)) Or FileExists(StringReplace(RunPath(AppPathValue), '(x86)', '', [rfReplaceAll])) Then
              Continue;

            If GetDriveType(PChar(ExtractFileDrive(RunPath(AppPathValue)))) In [DRIVE_CDROM, DRIVE_REMOVABLE] Then
              Continue;

            // Проверка перед добавлением в список
            If Stop Then
              Exit;
            If Not ExlPathReg(LowerCase(BaseKey + APPName[i] + '\')) And Not ExlPathReg(LowerCase(AppPathValue)) Then
            Begin
              AppListItem := Form1.ListViewRegCleaner.Items.Add;
              With AppListItem Do
              Begin
                MakeVisible(True);
                Caption := 'HKEY_LOCAL_MACHINE';
                SubItems.Add(BaseKey + APPName[i] + '\');
                SubItems.Add('Path');
                SubItems.Add(AppPathValue);
                SubItems.Add(CheckBoxApplicationPaths.Caption);
                SubItems.Add('DelKey');
                Checked := True;
                Application.ProcessMessages;
                Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
              End;
            End;
          Finally
            Reg.CloseKey;
          End;
        End;
      End;
    Finally
      APPName.Free;
    End;
  Finally
    Reg.Free;
  End;
End;

// Общие библиотеки (1)

Procedure TForm1.SharedDLLs;
Var
  i: Integer;
  lName: TStringList;
  ListItemSharedDLLs: TListItem;
  Keylnfo: TRegKeyInfo;
  sFilePath: String;
  sUpperPath: String;
  bSkipFile: Boolean;
Begin
  // Главная проверка - если Stop, сразу выходим
  If Stop Then
    Exit;

  Stop := False;

  reg := TRegistry.Create;
  Try
    // Создаем список
    lName := TStringList.Create;
    Try
      With reg Do
      Begin
        RootKey := HKEY_LOCAL_MACHINE;
        Access := KEY_WOW64_64KEY Or KEY_READ;

        // Открываем ключ
        If Stop Then
          Exit;
        If Not OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\SharedDLLs\', False) Then
          Exit;

        // Получаем данные
        Try
          If Stop Then
            Exit;
          GetKeyInfo(Keylnfo);

          If Stop Then
            Exit;
          GetValueNames(lName);
        Finally
          CloseKey;
        End;

        // Настройка UI
        If Stop Then
          Exit;
        Form1.ProgressBarRegCleaner.Max := lName.Count;
        Form1.Taskbar1.ProgressMaxValue := lName.Count;
        Form1.ProgressBarRegCleaner.Position := 0;
        Form1.Taskbar1.ProgressValue := 0;

        // Основной цикл
        For i := 0 To lName.Count - 1 Do
        Begin
          // Проверка Stop в каждой точке, где это важно
          If Stop Then
            Break;  // Используем Break для выхода из цикла

          // Обновление UI
          Form1.ProgressBarRegCleaner.Position := i;
          Form1.Taskbar1.ProgressValue := i;
          Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxSharedDLLs.Caption;
          Form1.StatusBarRegCleaner.Panels[1].Text := lName[i];
          Application.ProcessMessages;

          sFilePath := lName[i];
          bSkipFile := False;

          // Быстрые проверки файла
          If Pos('%', sFilePath) > 0 Then
            bSkipFile := True
          Else If FileExists(sFilePath) Then
            bSkipFile := True
          Else If GetDriveType(PChar(ExtractFileDrive(sFilePath))) In [DRIVE_CDROM, DRIVE_REMOVABLE] Then
            bSkipFile := True
          Else
          Begin
            sUpperPath := UpperCase(sFilePath);
            If (Pos('SYSTEMROOT', sUpperPath) > 0) Or (Pos('SYSTEM32', sUpperPath) > 0) Then
              bSkipFile := True;
          End;

          // Если файл не пропущен и не было остановки
          If (Not bSkipFile) And (Not Stop) Then
          Begin
            If Not ExlPathReg(LowerCase(sFilePath)) Then
            Begin
              // Последняя проверка перед добавлением
              If Not Stop Then
              Begin
                ListItemSharedDLLs := Form1.ListViewRegCleaner.Items.Add;
                With ListItemSharedDLLs Do
                Begin
                  Caption := 'HKEY_LOCAL_MACHINE';
                  SubItems.Add('\SOFTWARE\Microsoft\Windows\CurrentVersion\SharedDLLs\');
                  SubItems.Add(sFilePath);
                  SubItems.Add('');
                  SubItems.Add(CheckBoxSharedDLLs.Caption);
                  SubItems.Add('DelVal');
                  Checked := True;
                  MakeVisible(False);
                End;

                Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                Application.ProcessMessages;
              End;
            End;
          End;
        End; // конец цикла

        // Если вышли из цикла по Stop, завершаем процедуру
        If Stop Then
          Exit;
      End;
    Finally
      lName.Free;
    End;
  Finally
    reg.Free;
  End;

  // Финальное обновление
  Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
  Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
End;

// шрифты (2)
Procedure TForm1.font;
Var
  i: Integer;
  lName: TStringList;
  ListItemFONT: TListItem;
  font, fontPath: String;
  fontExists: Boolean;
Begin
  If Stop Then
    Exit;
  Stop := False;

  reg := tRegistry.Create;
  Try
    If Stop Then
    Begin
      reg.Free;
      Exit;
    End;

    reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    lName := TStringList.Create;
    Try
      With reg Do
      Begin
        RootKey := HKEY_LOCAL_MACHINE;

        If Stop Then
          Exit;
        If Not OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts\', false) Then
          Exit;

        // Получаем список шрифтов
        GetValueNames(lName);
        CloseKey;

        // Настройка ProgressBar
        If Stop Then
          Exit;
        Form1.ProgressBarRegCleaner.Max := lName.Count - 1;
        Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
        Form1.ProgressBarRegCleaner.Position := 0;
        Form1.Taskbar1.ProgressValue := 0;
        Application.ProcessMessages;

        For i := 0 To lName.Count - 1 Do
        Begin
          // Проверка в начале каждой итерации
          If Stop Then
            Break;

          // Открываем ключ для каждого шрифта
          If Not OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts\', false) Then
            Continue;

          Try
            // Обновление прогресса
            Form1.ProgressBarRegCleaner.Position := i;
            Form1.Taskbar1.ProgressValue := i;

            // Чтение значения шрифта
            font := ReadString(lName[i]);

            // Обновление статуса
            Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxFonts.Caption;
            Form1.StatusBarRegCleaner.Panels[1].Text := font;
            Application.ProcessMessages;

            // Пропускаем если содержит %
            If (pos('%', font) > 0) Then
              Continue;

            // Проверка существования файла шрифта
            fontPath := GetSpecialFolderPath(CSIDL_FONTS) + '\' + font;
            fontExists := FileExists(fontPath) Or FileExists(font);

            If fontExists Then
              Continue;

            // Пропускаем съемные носители
            If (GetDriveType(pchar(ExtractFileDrive(font))) In [DRIVE_CDROM, DRIVE_REMOVABLE]) Or (GetDriveType(pchar(ExtractFileDrive(fontPath))) In [DRIVE_CDROM, DRIVE_REMOVABLE]) Then
              Continue;

            // Проверка исключений
            If Not ExlPathReg(lowercase(lName[i])) Then
            Begin
              // Финальная проверка перед добавлением
              If Not Stop Then
              Begin
                ListItemFONT := Form1.ListViewRegCleaner.Items.Add;
                With ListItemFONT Do
                Begin
                  MakeVisible(true);
                  Caption := 'HKEY_LOCAL_MACHINE';
                  SubItems.Add('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts');
                  SubItems.Add(lName[i]);
                  SubItems.Add(font);
                  SubItems.Add(CheckBoxFonts.Caption);
                  SubItems.Add('DelVal');
                  Checked := true;
                End;

                Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                Application.ProcessMessages;
              End;
            End;
          Finally
            CloseKey;
          End;
        End; // конец цикла

        // Финальное обновление ProgressBar
        If Not Stop Then
        Begin
          Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
          Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
        End;
      End;
    Finally
      lName.Free;
    End;
  Finally
    reg.Free;
  End;
End;

//Файлы помощи 3
Procedure TForm1.Help;
Var
  i, j: Integer;
  HELPName: TStringList;
  Keylnfo: TRegKeyInfo;
  HelpLitsitem: TListItem;
  Help, HelpTopic, LinkedHelpTopics, CurrentPath, SubKeyPath: String;
  RegistryPaths: Array[0..2] Of String;
  TotalItems, CurrentItem: Integer;
Begin
  // Проверка остановки в начале
  If Stop Then
    Exit;
  Stop := False;

  RegistryPaths[0] := '\SOFTWARE\Microsoft\Windows\Help\';
  RegistryPaths[1] := '\SOFTWARE\Microsoft\Windows\HTML Help\';
  RegistryPaths[2] := '\SOFTWARE\Microsoft\MMC\SnapIns\';

  reg := tRegistry.Create;
  Try
    // Проверка перед настройкой
    If Stop Then
    Begin
      reg.Free;
      Exit;
    End;

    reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    HELPName := TStringList.Create;

    Try
      // Сначала считаем общее количество элементов для ProgressBar
      TotalItems := 0;
      For j := 0 To High(RegistryPaths) Do
      Begin
        If Stop Then
          Exit;

        CurrentPath := RegistryPaths[j];
        If reg.OpenKey(CurrentPath, False) Then
        Begin
          If j < 2 Then
            reg.GetValueNames(HELPName)
          Else
            reg.GetKeyNames(HELPName);
          TotalItems := TotalItems + HELPName.Count;
          reg.CloseKey;
        End;
      End;

      // Настройка ProgressBar с общим количеством
      If Stop Then
        Exit;
      If TotalItems > 0 Then
      Begin
        Form1.ProgressBarRegCleaner.Max := TotalItems - 1;
        Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
      End;
      Form1.ProgressBarRegCleaner.Position := 0;
      Form1.Taskbar1.ProgressValue := 0;
      CurrentItem := 0;
      Application.ProcessMessages;

      For j := 0 To High(RegistryPaths) Do
      Begin
        // Проверка остановки для каждого пути
        If Stop Then
          Break;

        CurrentPath := RegistryPaths[j];

        If reg.OpenKey(CurrentPath, False) Then
        Begin
          // Получаем информацию о ключе
          If Stop Then
          Begin
            reg.CloseKey;
            Break;
          End;

          reg.GetKeyInfo(Keylnfo);

          // Получаем имена значений или ключей
          If j < 2 Then
            reg.GetValueNames(HELPName)
          Else
            reg.GetKeyNames(HELPName);

          reg.CloseKey;

          // Обработка элементов для текущего пути
          For i := 0 To HELPName.Count - 1 Do
          Begin
            // Проверка остановки для каждого элемента
            If Stop Then
              Break;

            // Обновление ProgressBar
            Form1.ProgressBarRegCleaner.Position := CurrentItem;
            Form1.Taskbar1.ProgressValue := CurrentItem;
            Inc(CurrentItem);
            Application.ProcessMessages;

            // Первые два пути - стандартная обработка
            If j < 2 Then
            Begin
              If reg.OpenKey(CurrentPath, False) Then
              Begin
                Try
                  // Чтение значения
                  If Stop Then
                    Break;
                  Help := reg.ReadString(HELPName[i]);

                  // Обновление статуса
                  If Not Stop Then
                  Begin
                    Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxHelp.Caption;
                    Form1.StatusBarRegCleaner.Panels[1].Text := HELPName[i];
                    Application.ProcessMessages;
                  End;

                  // Проверки для пропуска
                  If Pos('%', Help) > 0 Then
                    Continue;

                  If (FileExists(RunPath(Help) + '\' + RunPath(HELPName[i]))) Or (FileExists(RunPath(Help) + RunPath(HELPName[i]))) Then
                    Continue;

                  If (GetDriveType(PChar(ExtractFileDrive(Help + '\' + HELPName[i]))) = DRIVE_CDROM) Or (GetDriveType(PChar(ExtractFileDrive(Help + '\' + HELPName[i]))) = DRIVE_REMOVABLE) Then
                    Continue;

                  // Проверка исключений
                  If Not Stop And Not ExlPathReg(LowerCase(HELPName[i])) Then
                  Begin
                    HelpLitsitem := Form1.ListViewRegCleaner.Items.Add;
                    With HelpLitsitem Do
                    Begin
                      MakeVisible(True);
                      Caption := 'HKEY_LOCAL_MACHINE';
                      SubItems.Add(CurrentPath);
                      SubItems.Add(HELPName[i]);
                      SubItems.Add(Help);
                      SubItems.Add(CheckBoxHelp.Caption);
                      SubItems.Add('DelVal');
                      Checked := True;
                      Application.ProcessMessages;
                      Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                    End;
                  End;
                Finally
                  reg.CloseKey;
                End;
              End;
            End
            Else // Третий путь - MMC SnapIns
            Begin
              SubKeyPath := '\SOFTWARE\Microsoft\Windows\HTML Help\' + HELPName[i] + '\';
              If reg.OpenKey(SubKeyPath, False) Then
              Begin
                Try
                  // Проверка остановки перед обработкой MMC
                  If Stop Then
                    Break;

                  // Обновление статуса
                  If Not Stop Then
                  Begin
                    Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxHelp.Caption;
                    Application.ProcessMessages;
                  End;

                  // Обработка HelpTopic
                  HelpTopic := reg.ReadString('HelpTopic');
                  If Not Stop Then
                  Begin
                    Form1.StatusBarRegCleaner.Panels[1].Text := HelpTopic;
                    Application.ProcessMessages;
                  End;

                  If Pos('%', HelpTopic) = 0 Then
                  Begin
                    If Not FileExists(RunPath(HelpTopic)) Then
                    Begin
                      If Not (GetDriveType(PChar(ExtractFileDrive(HelpTopic))) = DRIVE_CDROM) And Not (GetDriveType(PChar(ExtractFileDrive(HelpTopic))) = DRIVE_REMOVABLE) Then
                      Begin
                        If Not Stop And Not ExlPathReg(LowerCase('\SOFTWARE\Microsoft\Windows\HTML Help\' + HELPName[i])) And Not ExlPathReg(LowerCase(HelpTopic)) Then
                        Begin
                          HelpLitsitem := Form1.ListViewRegCleaner.Items.Add;
                          With HelpLitsitem Do
                          Begin
                            MakeVisible(True);
                            Caption := 'HKEY_LOCAL_MACHINE';
                            SubItems.Add(SubKeyPath);
                            SubItems.Add('HelpTopic');
                            SubItems.Add(HelpTopic);
                            SubItems.Add(CheckBoxHelp.Caption);
                            SubItems.Add('DelVal');
                            Checked := True;
                            Application.ProcessMessages;
                            Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                          End;
                        End;
                      End;
                    End;
                  End;

                  // Проверка остановки перед LinkedHelpTopics
                  If Stop Then
                    Break;

                  // Обработка LinkedHelpTopics
                  LinkedHelpTopics := reg.ReadString('LinkedHelpTopics');
                  If Not Stop Then
                  Begin
                    Form1.StatusBarRegCleaner.Panels[1].Text := LinkedHelpTopics;
                    Application.ProcessMessages;
                  End;

                  If Pos('%', LinkedHelpTopics) = 0 Then
                  Begin
                    If Not FileExists(RunPath(LinkedHelpTopics)) Then
                    Begin
                      If Not (GetDriveType(PChar(ExtractFileDrive(LinkedHelpTopics))) = DRIVE_CDROM) And Not (GetDriveType(PChar(ExtractFileDrive(LinkedHelpTopics))) = DRIVE_REMOVABLE) Then
                      Begin
                        If Not Stop And Not ExlPathReg(LowerCase(HELPName[i])) And Not ExlPathReg(LowerCase(LinkedHelpTopics)) Then
                        Begin
                          HelpLitsitem := Form1.ListViewRegCleaner.Items.Add;
                          With HelpLitsitem Do
                          Begin
                            MakeVisible(True);
                            Caption := 'HKEY_LOCAL_MACHINE';
                            SubItems.Add(SubKeyPath);
                            SubItems.Add('LinkedHelpTopics');
                            SubItems.Add(LinkedHelpTopics);
                            SubItems.Add(CheckBoxHelp.Caption);
                            SubItems.Add('DelVal');
                            Checked := True;
                            Application.ProcessMessages;
                            Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                          End;
                        End;
                      End;
                    End;
                  End;
                Finally
                  reg.CloseKey;
                End;
              End;
            End;
          End; // Конец цикла по элементам

          // Очистка списка для следующего пути
          HELPName.Clear;
        End;
      End; // Конец цикла по путям

      // Финальное обновление ProgressBar если не было остановки
      If Not Stop Then
      Begin
        Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
        Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
      End;
    Finally
      HELPName.Free;
    End;
  Finally
    reg.Free;
  End;
End;

// Известные DLL (4)
Procedure TForm1.KnownDLLs;
Var
  i: Integer;
  KNOWName: TStringList;
  KnowListitem: TListItem;
  KnownDLLs, FullPath, KeyPath: String;
  DriveType: UINT;
Begin
  If Stop Then
    Exit;
  Stop := False;

  reg := tRegistry.Create;
  KNOWName := TStringList.Create;
  Try
    If Stop Then
    Begin
      reg.Free;
      KNOWName.Free;
      Exit;
    End;

    reg.Access := KEY_WOW64_64KEY Or KEY_READ;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    KeyPath := '\SYSTEM\CurrentControlSet\Control\Session Manager\KnownDLLs\';

    // Открываем ключ и получаем значения
    If Stop Then
      Exit;
    If Not reg.OpenKey(KeyPath, False) Then
      Exit;

    Try
      If Stop Then
      Begin
        reg.CloseKey;
        Exit;
      End;
      reg.GetValueNames(KNOWName);
    Finally
      reg.CloseKey;
    End;

    // Настройка UI
    If Stop Then
      Exit;
    If KNOWName.Count > 0 Then
    Begin
      Form1.ProgressBarRegCleaner.Max := KNOWName.Count - 1;
      Form1.Taskbar1.ProgressMaxValue := KNOWName.Count - 1;
    End;
    Form1.ProgressBarRegCleaner.Position := 0;
    Form1.Taskbar1.ProgressValue := 0;
    Application.ProcessMessages;

    // Обработка каждого значения
    For i := 0 To KNOWName.Count - 1 Do
    Begin
      If Stop Then
        Break; // Выход из цикла при остановке

      // Обновление прогресса
      Form1.ProgressBarRegCleaner.Position := i;
      Form1.Taskbar1.ProgressValue := i;
      Application.ProcessMessages;

      // Открываем ключ для каждого значения
      If Not reg.OpenKey(KeyPath, False) Then
        Continue;

      Try
        // Читаем значение
        KnownDLLs := reg.ReadString(KNOWName[i]);

        // Обновляем статус
        If Not Stop Then
        Begin
          Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxKnownDLLs.Caption;
          Form1.StatusBarRegCleaner.Panels[1].Text := KnownDLLs;
          Application.ProcessMessages;
        End;

        // Пропускаем системные переменные и DllDirectory
        If (Pos('%', KnownDLLs) > 0) Or (KNOWName[i] = 'DllDirectory') Then
          Continue;

        // Пропускаем если файл существует
        If FileExists(KnownDLLs) Or FileExists(RunPath(KnownDLLs)) Then
          Continue;

        // Пропускаем съемные носители
        FullPath := RunPath(KnownDLLs);
        DriveType := GetDriveType(PChar(ExtractFileDrive(FullPath)));
        If (DriveType = DRIVE_CDROM) Or (DriveType = DRIVE_REMOVABLE) Then
          Continue;

        // Проверяем исключения и добавляем в список
        If Not Stop And Not ExlPathReg(LowerCase(KNOWName[i])) Then
        Begin
          KnowListitem := Form1.ListViewRegCleaner.Items.Add;
          With KnowListitem Do
          Begin
            Caption := 'HKEY_LOCAL_MACHINE';
            SubItems.Add('\SYSTEM\CurrentControlSet\Control\Session Manager\KnownDLLs');
            SubItems.Add(KNOWName[i]);
            SubItems.Add(KnownDLLs);
            SubItems.Add(CheckBoxKnownDLLs.Caption);
            SubItems.Add('DelVal');
            Checked := True;
            MakeVisible(True);
          End;

          Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
          Application.ProcessMessages;
        End;
      Finally
        reg.CloseKey;
      End;
    End; // Конец цикла

    // Финальное обновление
    If Not Stop Then
    Begin
      Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
      Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
    End;
  Finally
    reg.Free;
    KNOWName.Free;
  End;
End;

// Кодеки (5)
Procedure TForm1.Codec;
Var
  i: Integer;
  CODName: TStringList;
  CodecListitem: TListItem;
  Codec, FullPath: String;
  DriveType: UINT;
Begin
  If Stop Then
    Exit;
  Stop := False;

  reg := tRegistry.Create;
  CODName := TStringList.Create;
  Try
    If Stop Then
    Begin
      reg.Free;
      CODName.Free;
      Exit;
    End;

    With reg Do
    Begin
      Access := KEY_WOW64_64KEY Or KEY_READ;
      RootKey := HKEY_LOCAL_MACHINE;

      If Stop Then
        Exit;
      If Not OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Drivers32\', false) Then
        Exit;

      Try
        If Stop Then
        Begin
          CloseKey;
          Exit;
        End;

        GetValueNames(CODName);

        // Настройка ProgressBar
        If Not Stop Then
        Begin
          If CODName.Count > 0 Then
          Begin
            Form1.ProgressBarRegCleaner.Max := CODName.Count - 1;
            Form1.Taskbar1.ProgressMaxValue := CODName.Count - 1;
          End;
          Form1.ProgressBarRegCleaner.Position := 0;
          Form1.Taskbar1.ProgressValue := 0;
          Application.ProcessMessages;
        End;

        // Обработка кодеков
        For i := 0 To CODName.Count - 1 Do
        Begin
          If Stop Then
            Break; // Выход из цикла при остановке

          // Обновление прогресса
          Form1.ProgressBarRegCleaner.Position := i;
          Form1.Taskbar1.ProgressValue := i;
          Application.ProcessMessages;

          // Пропускаем нестроковые значения
          If GetDataType(CODName[i]) <> rdString Then
            Continue;

          // Читаем значение
          Codec := ReadString(CODName[i]);

          // Обновляем статус
          If Not Stop Then
          Begin
            Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxCodec.Caption;
            Form1.StatusBarRegCleaner.Panels[1].Text := Codec;
            Application.ProcessMessages;
          End;

          // Быстрые проверки для пропуска
          If (pos('%', Codec) > 0) Then
            Continue;

          FullPath := RunPath(Codec);

          // Проверка существования файла
          If FileExists(Codec) Or FileExists(FullPath) Then
            Continue;

          // Проверка типа диска
          DriveType := GetDriveType(pchar(ExtractFileDrive(FullPath)));
          If (DriveType = DRIVE_CDROM) Or (DriveType = DRIVE_REMOVABLE) Then
            Continue;

          // Проверка исключений и добавление
          If Not Stop And Not ExlPathReg(lowercase(CODName[i])) Then
          Begin
            CodecListitem := Form1.ListViewRegCleaner.Items.Add;
            With CodecListitem Do
            Begin
              Caption := 'HKEY_LOCAL_MACHINE';
              SubItems.Add('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Drivers32');
              SubItems.Add(CODName[i]);
              SubItems.Add(Codec);
              SubItems.Add(CheckBoxCodec.Caption);
              SubItems.Add('DelVal');
              Checked := true;
              MakeVisible(true);
            End;

            Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
            Application.ProcessMessages;
          End;
        End;

        // Финальное обновление
        If Not Stop Then
        Begin
          Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
          Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
        End;

      Finally
        CloseKey;
      End;
    End;

  Finally
    reg.Free;
    CODName.Free;
  End;
End;

// Установленные программы (6)
Procedure TForm1.LoadUninstall;
Var
  i, j: Integer;
  UNName, ValueNames: TStringList;
  UNListitem: TListItem;
  CurrentValue: String;
  FullPath: String;
  LocalReg: TRegistry;
  TotalItems, CurrentItem: Integer;
  Sections: Array[0..4] Of Record
    Name: String;
    Root: HKEY;
    BasePath: String;
    ProcessType: Integer; // 1 = ключи, 2 = значения
  End;

  // Вложенная процедура для проверки и добавления записей

  Procedure CheckAndAddEntry(Root: HKEY; Const KeyPath, ValName, ValValue: String; IsDirectory: Boolean);
  Begin
    // Проверка остановки
    If Stop Then
      Exit;

    // Быстрые проверки
    If (ValValue = '') Or (pos('%', ValValue) > 0) Or (pos(AnsiLowerCase('rundll32'), AnsiLowerCase(ValValue)) > 0) Then
      Exit;

    // Проверка остановки перед длительными операциями
    If Stop Then
      Exit;

    // Проверка существования файлов/папок
    If IsDirectory Then
    Begin
      If DirectoryExists(ValValue) Or DirectoryExists(RunPath(ValValue)) Then
        Exit;
    End
    Else
    Begin
      If FileExists(ValValue) Or FileExists(RunPath(ValValue)) Then
        Exit;
    End;

    // Проверка типа диска
    If Stop Then
      Exit;
    If GetDriveType(pchar(ExtractFileDrive(RunPath(ValValue)))) In [DRIVE_CDROM, DRIVE_REMOVABLE] Then
      Exit;

    // Проверка исключений
    If Stop Then
      Exit;
    If ExlPathReg(LowerCase(KeyPath)) Or ExlPathReg(LowerCase(ValValue)) Then
      Exit;

    // Последняя проверка перед добавлением
    If Not Stop Then
    Begin
      UNListitem := Form1.ListViewRegCleaner.Items.Add;
      With UNListitem Do
      Begin
        MakeVisible(True);

        Case Root Of
          HKEY_LOCAL_MACHINE:
            Caption := 'HKEY_LOCAL_MACHINE';
          HKEY_CURRENT_USER:
            Caption := 'HKEY_CURRENT_USER';
          HKEY_CLASSES_ROOT:
            Caption := 'HKEY_CLASSES_ROOT';
        Else
          Caption := 'HKEY_LOCAL_MACHINE';
        End;

        SubItems.Add(KeyPath);
        SubItems.Add(ValName);
        SubItems.Add(ValValue);
        SubItems.Add(CheckBoxLoadUninstall.Caption);
        SubItems.Add('DelVal');
        Checked := True;

        Application.ProcessMessages;
        Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
      End;
    End;
  End;

  // Вложенная процедура для обработки конкретного значения
  Procedure ProcessSpecificValue(RegObj: TRegistry; Const KeyPath, ValueName: String);
  Begin
    If Stop Then
      Exit;

    If Not RegObj.ValueExists(ValueName) Then
      Exit;
    If RegObj.GetDataType(ValueName) <> rdString Then
      Exit;

    // Обновление статуса
    If Not Stop Then
    Begin
      Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxLoadUninstall.Caption;
      Application.ProcessMessages;
    End;

    CurrentValue := RegObj.ReadString(ValueName);

    If Not Stop Then
    Begin
      Form1.StatusBarRegCleaner.Panels[1].Text := CurrentValue;
      Application.ProcessMessages;
    End;

    // Специальная обработка для UninstallString
    If ValueName = 'UninstallString' Then
    Begin
      If pos(LowerCase('{'), CurrentValue) > 0 Then
        Exit;
      CheckAndAddEntry(RegObj.RootKey, KeyPath, ValueName, CurrentValue, False);
    End
    // Директории
    Else If (ValueName = 'InstallSource') Or (ValueName = 'InstallLocation') Or (ValueName = 'BackupPath') Or (ValueName = '1') Then
    Begin
      CheckAndAddEntry(RegObj.RootKey, KeyPath, ValueName, CurrentValue, True);
    End
    // Файлы
    Else If (ValueName = 'DisplayIcon') Or (ValueName = 'Readme') Or (ValueName = 'BackupFileName') Or (ValueName = 'InstallINFFile') Then
    Begin
      CheckAndAddEntry(RegObj.RootKey, KeyPath, ValueName, CurrentValue, False);
    End;
  End;

Begin
  // Проверка остановки в начале
  If Stop Then
    Exit;
  Stop := False;

  // Инициализация секций
  Sections[0].Name := 'Uninstall';
  Sections[0].Root := HKEY_LOCAL_MACHINE;
  Sections[0].BasePath := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall';
  Sections[0].ProcessType := 1;

  Sections[1].Name := 'Installer UserData';
  Sections[1].Root := HKEY_LOCAL_MACHINE;
  Sections[1].BasePath := '\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\';
  Sections[1].ProcessType := 1;

  Sections[2].Name := 'Advanced INF Setup';
  Sections[2].Root := HKEY_LOCAL_MACHINE;
  Sections[2].BasePath := 'SOFTWARE\Microsoft\Advanced INF Setup\';
  Sections[2].ProcessType := 1;

  Sections[3].Name := 'StartPage NewShortcuts';
  Sections[3].Root := HKEY_CURRENT_USER;
  Sections[3].BasePath := '\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\';
  Sections[3].ProcessType := 2;

  Sections[4].Name := 'Installer Patches';
  Sections[4].Root := HKEY_CLASSES_ROOT;
  Sections[4].BasePath := '\Installer\Patches\';
  Sections[4].ProcessType := 1;

  UNName := TStringList.Create;
  ValueNames := TStringList.Create;

  Try
    // Первый проход: подсчет общего количества элементов
    TotalItems := 0;
    LocalReg := TRegistry.Create;
    Try
      LocalReg.Access := KEY_WOW64_64KEY Or KEY_READ;

      For i := 0 To High(Sections) Do
      Begin
        If Stop Then
          Break;

        LocalReg.RootKey := Sections[i].Root;
        If LocalReg.OpenKey(Sections[i].BasePath, False) Then
        Begin
          If Sections[i].ProcessType = 1 Then
            LocalReg.GetKeyNames(UNName)
          Else
            LocalReg.GetValueNames(UNName);

          TotalItems := TotalItems + UNName.Count;
          LocalReg.CloseKey;
        End;
      End;
    Finally
      LocalReg.Free;
    End;

    // Настройка ProgressBar
    If Stop Then
      Exit;

    If TotalItems > 0 Then
    Begin
      Form1.ProgressBarRegCleaner.Max := TotalItems - 1;
      Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
    End;
    Form1.ProgressBarRegCleaner.Position := 0;
    Form1.Taskbar1.ProgressValue := 0;
    CurrentItem := 0;
    Application.ProcessMessages;

    // Второй проход: обработка
    For i := 0 To High(Sections) Do
    Begin
      If Stop Then
        Break;

      LocalReg := TRegistry.Create;
      Try
        LocalReg.Access := KEY_WOW64_64KEY Or KEY_READ;
        LocalReg.RootKey := Sections[i].Root;

        // Открываем базовый ключ
        If Not LocalReg.OpenKey(Sections[i].BasePath, False) Then
          Continue;

        // Получаем список элементов
        If Sections[i].ProcessType = 1 Then
          LocalReg.GetKeyNames(UNName)
        Else
          LocalReg.GetValueNames(UNName);

        LocalReg.CloseKey;

        // Обработка каждого элемента
        For j := 0 To UNName.Count - 1 Do
        Begin
          If Stop Then
            Break;

          // Обновление ProgressBar
          Form1.ProgressBarRegCleaner.Position := CurrentItem;
          Form1.Taskbar1.ProgressValue := CurrentItem;
          Inc(CurrentItem);
          Application.ProcessMessages;

          // Обновление статуса
          If Not Stop Then
          Begin
            Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxLoadUninstall.Caption;
            Form1.StatusBarRegCleaner.Panels[1].Text := UNName[j];
            Application.ProcessMessages;
          End;

          // Обработка в зависимости от типа секции
          Case i Of
            0: // Uninstall
              Begin
                FullPath := Sections[i].BasePath + '\' + UNName[j];
                If LocalReg.OpenKey(FullPath, False) Then
                Begin
                  Try
                    ProcessSpecificValue(LocalReg, FullPath, 'InstallSource');
                    ProcessSpecificValue(LocalReg, FullPath, 'InstallLocation');
                    ProcessSpecificValue(LocalReg, FullPath, 'DisplayIcon');
                    ProcessSpecificValue(LocalReg, FullPath, 'Readme');
                    ProcessSpecificValue(LocalReg, FullPath, 'UninstallString');
                  Finally
                    LocalReg.CloseKey;
                  End;
                End;
              End;

            1: // Installer UserData
              Begin
                FullPath := Sections[i].BasePath + UNName[j] + '\InstallProperties\';
                If LocalReg.OpenKey(FullPath, False) Then
                Begin
                  Try
                    ProcessSpecificValue(LocalReg, FullPath, 'InstallSource');
                  Finally
                    LocalReg.CloseKey;
                  End;
                End;
              End;

            2: // Advanced INF Setup
              Begin
                FullPath := Sections[i].BasePath + UNName[j] + '\';
                If LocalReg.OpenKey(FullPath, False) Then
                Begin
                  Try
                    ProcessSpecificValue(LocalReg, FullPath, 'BackupPath');
                    ProcessSpecificValue(LocalReg, FullPath, 'BackupFileName');
                    ProcessSpecificValue(LocalReg, FullPath, 'InstallINFFile');
                  Finally
                    LocalReg.CloseKey;
                  End;
                End;
              End;

            3: // StartPage NewShortcuts
              Begin
              // Для этой секции обрабатываем значения напрямую
                If LocalReg.OpenKey(Sections[i].BasePath, False) Then
                Begin
                  Try
                    If LocalReg.GetDataType(UNName[j]) = rdString Then
                    Begin
                      CurrentValue := LocalReg.ReadString(UNName[j]);
                      If Not Stop Then
                      Begin
                        Form1.StatusBarRegCleaner.Panels[1].Text := CurrentValue;
                        Application.ProcessMessages;
                      End;
                      CheckAndAddEntry(Sections[i].Root, Sections[i].BasePath, UNName[j], CurrentValue, False);
                    End;
                  Finally
                    LocalReg.CloseKey;
                  End;
                End;
              End;

            4: // Installer Patches
              Begin
                FullPath := Sections[i].BasePath + UNName[j] + '\SourceList\Net\';
                If LocalReg.OpenKey(FullPath, False) Then
                Begin
                  Try
                    ProcessSpecificValue(LocalReg, FullPath, '1');
                  Finally
                    LocalReg.CloseKey;
                  End;
                End;
              End;
          End; // Case
        End; // For j

      Finally
        LocalReg.Free;
      End;

      // Очистка списка для следующей секции
      UNName.Clear;
    End; // For i

    // Финальное обновление ProgressBar
    If Not Stop Then
    Begin
      Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
      Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
    End;

  Finally
    UNName.Free;
    ValueNames.Free;
  End;
End;
// Ошибки инсталляции 7

Procedure TForm1.Install;
Var
  i: Integer;
  InstallName: TStringList;
  InstallListItem: TListItem;
  KeyPath: String;
  CurrentValue: String;
Begin
  If Stop Then
    Exit;
  Stop := False;

  KeyPath := '\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders\';
  reg := TRegistry.Create;
  InstallName := TStringList.Create;

  Try
    If Stop Then
    Begin
      reg.Free;
      InstallName.Free;
      Exit;
    End;

    With reg Do
    Begin
      Access := KEY_WOW64_64KEY Or KEY_READ; // Используем KEY_READ вместо ALL_ACCESS
      RootKey := HKEY_LOCAL_MACHINE;

      // Открываем ключ и получаем значения
      If Stop Then
        Exit;
      If Not OpenKey(KeyPath, False) Then
        Exit;

      Try
        If Stop Then
        Begin
          CloseKey;
          Exit;
        End;
        GetValueNames(InstallName);
      Finally
        CloseKey;
      End;

      // Настройка UI
      If Stop Then
        Exit;
      If InstallName.Count > 0 Then
      Begin
        Form1.ProgressBarRegCleaner.Max := InstallName.Count - 1;
        Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
      End;
      Form1.ProgressBarRegCleaner.Position := 0;
      Form1.Taskbar1.ProgressValue := 0;
      Application.ProcessMessages;

      // Обработка каждого значения
      For i := 0 To InstallName.Count - 1 Do
      Begin
        If Stop Then
          Break; // Выход из цикла при остановке

        CurrentValue := InstallName[i];

        // Обновление прогресса
        Form1.ProgressBarRegCleaner.Position := i;
        Form1.Taskbar1.ProgressValue := i;

        // Обновление статуса
        If Not Stop Then
        Begin
          Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxInstall.Caption;
          Form1.StatusBarRegCleaner.Panels[1].Text := CurrentValue;
          Application.ProcessMessages;
        End;

        // Быстрые проверки для пропуска
        If (Pos('%', CurrentValue) > 0) Then
          Continue;

        // Проверка существования директории
        If DirectoryExists(CurrentValue) Then
          Continue;

        // Проверка типа диска
        If GetDriveType(PChar(ExtractFileDrive(CurrentValue))) In [DRIVE_CDROM, DRIVE_REMOVABLE] Then
          Continue;

        // Проверка исключений и добавление
        If Not Stop And Not ExlPathReg(LowerCase(CurrentValue)) Then
        Begin
          InstallListItem := Form1.ListViewRegCleaner.Items.Add;
          With InstallListItem Do
          Begin
            Caption := 'HKEY_LOCAL_MACHINE';
            SubItems.Add(KeyPath);
            SubItems.Add(CurrentValue);
            SubItems.Add('');
            SubItems.Add(CheckBoxInstall.Caption);
            SubItems.Add('DelVal');
            Checked := True;
            MakeVisible(True);
          End;

          Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
          Application.ProcessMessages;
        End;
      End; // Конец цикла

      // Финальное обновление ProgressBar
      If Not Stop Then
      Begin
        Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
        Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
      End;
    End;

  Finally
    reg.Free;
    InstallName.Free;
  End;
End;

// Службы (8)
Procedure TForm1.Services;
Var
  i: Integer;
  SerName: TStringList;
  ServlistItem: TListItem;
  ImagePath, ServicePath, FileExt, FullImagePath: String;
Begin
  If Stop Then
    Exit;
  Stop := False;

  reg := TRegistry.Create;
  SerName := TStringList.Create;

  Try
    If Stop Then
    Begin
      reg.Free;
      SerName.Free;
      Exit;
    End;

    With reg Do
    Begin
      Access := KEY_WOW64_64KEY Or KEY_READ;
      RootKey := HKEY_LOCAL_MACHINE;

      // Открываем основной ключ служб
      If Stop Then
        Exit;
      If Not OpenKey('\SYSTEM\CurrentControlSet\Services\', False) Then
        Exit;

      Try
        If Stop Then
        Begin
          CloseKey;
          Exit;
        End;
        GetKeyNames(SerName);
      Finally
        CloseKey;
      End;

      // Настройка ProgressBar
      If Stop Then
        Exit;
      If SerName.Count > 0 Then
      Begin
        Form1.ProgressBarRegCleaner.Max := SerName.Count - 1;
        Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
      End;
      Form1.ProgressBarRegCleaner.Position := 0;
      Form1.Taskbar1.ProgressValue := 0;
      Application.ProcessMessages;

      // Обработка каждой службы
      For i := 0 To SerName.Count - 1 Do
      Begin
        If Stop Then
          Break; // Выход из цикла при остановке

        ServicePath := '\SYSTEM\CurrentControlSet\Services\' + SerName[i] + '\';

        // Обновление UI
        Form1.ProgressBarRegCleaner.Position := i;
        Form1.Taskbar1.ProgressValue := i;
        If Not Stop Then
        Begin
          Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxServices.Caption;
          Form1.StatusBarRegCleaner.Panels[1].Text := ServicePath;
          Application.ProcessMessages;
        End;

        // Открываем ключ службы
        If Not OpenKey(ServicePath, False) Then
          Continue;

        Try
          // Проверяем ImagePath
          If ValueExists('ImagePath') And (GetDataType('ImagePath') = rdString) Then
          Begin
            ImagePath := ReadString('ImagePath');

            // Быстрые проверки для пропуска
            If (ImagePath = '') Or (Pos('%', ImagePath) > 0) Then
              Continue;

            FullImagePath := RunPath(ImagePath);
            FileExt := LowerCase(ExtractFileExt(FullImagePath));

            // Пропускаем системные файлы
            If (FileExt = '.sys') Or (FileExt = '') Then
              Continue;

            // Пропускаем системные пути
            If (Pos('systemroot', LowerCase(ImagePath)) > 0) Or (Pos('system32', LowerCase(ImagePath)) > 0) Then
              Continue;

            // Пропускаем съемные носители
            If GetDriveType(PChar(ExtractFileDrive(FullImagePath))) In [DRIVE_CDROM, DRIVE_REMOVABLE] Then
              Continue;

            // Пропускаем существующие файлы
            If FileExists(FullImagePath) Or FileExists(StringReplace(FullImagePath, '(x86)', '', [rfReplaceAll])) Then
              Continue;

            // Проверяем исключения и добавляем в список
            If Not Stop And Not ExlPathReg(LowerCase(ServicePath)) And Not ExlPathReg(LowerCase(ImagePath)) Then
            Begin
              ServlistItem := Form1.ListViewRegCleaner.Items.Add;
              With ServlistItem Do
              Begin
                Caption := 'HKEY_LOCAL_MACHINE';
                SubItems.Add(ServicePath);
                SubItems.Add('ImagePath');
                SubItems.Add(ImagePath);
                SubItems.Add(CheckBoxServices.Caption);
                SubItems.Add('DelKey');
                Checked := True;
                MakeVisible(True);
              End;

              Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
              Application.ProcessMessages;
            End;
          End;
        Finally
          CloseKey;
        End;
      End; // Конец цикла

      // Финальное обновление ProgressBar
      If Not Stop Then
      Begin
        Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
        Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
      End;
    End;

  Finally
    reg.Free;
    SerName.Free;
  End;
End;

// Драйверы (9) - Оптимизированная версия
Procedure TForm1.Driver;
Var
  i, j: Integer;
  DRName: TStringList;
  DRIVEListitem: TListItem;
  ImagePath, ReinstallString, CurrentPath: String;
  RegistryPaths: TStringList;
Begin
  If Stop Then
    Exit;
  Stop := False;

  DRName := TStringList.Create;
  RegistryPaths := TStringList.Create;

  Try
    // Пути для проверки
    RegistryPaths.Add('\SYSTEM\CurrentControlSet\Services\');
    RegistryPaths.Add('\SYSTEM\ControlSet001\Services\');
    RegistryPaths.Add('\SYSTEM\ControlSet002\Services\');

    // 1. Сначала проверяем все сервисы
    For j := 0 To RegistryPaths.Count - 1 Do
    Begin
      If Stop Then
        Break;

      CurrentPath := RegistryPaths[j];
      reg := tRegistry.Create;
      Try
        reg.Access := KEY_WOW64_64KEY Or KEY_READ;
        reg.RootKey := HKEY_LOCAL_MACHINE;

        If Stop Then
          Break;
        If Not reg.OpenKey(CurrentPath, false) Then
          Continue;

        Try
          If Stop Then
          Begin
            reg.CloseKey;
            Break;
          End;

          reg.getkeynames(DRName);

          // Настройка ProgressBar для этого раздела
          If Not Stop Then
          Begin
            Form1.ProgressBarRegCleaner.Max := DRName.Count - 1;
            Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
            Form1.ProgressBarRegCleaner.Position := 0;
            Form1.Taskbar1.ProgressValue := 0;
            Application.ProcessMessages;
          End;

          For i := 0 To DRName.Count - 1 Do
          Begin
            If Stop Then
              Break;

            // Обновление ProgressBar
            Form1.ProgressBarRegCleaner.Position := i;
            Form1.Taskbar1.ProgressValue := i;

            // Обновление статуса
            If Not Stop Then
            Begin
              Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxDriver.Caption;
              Form1.StatusBarRegCleaner.Panels[1].Text := CurrentPath + DRName[i];
              Application.ProcessMessages;
            End;

            // Проверка ImagePath
            If reg.OpenKey(CurrentPath + DRName[i] + '\', false) Then
            Begin
              Try
                If reg.ValueExists('ImagePath') And (reg.GetDataType('ImagePath') = rdString) Then
                Begin
                  ImagePath := reg.ReadString('ImagePath');

                  // Быстрые проверки
                  If (ImagePath = '') Or (pos('%', ImagePath) > 0) Then
                    Continue;

                  // Проверяем что это .sys файл
                  If lowercase(extractfileext(RunPath(ImagePath))) <> '.sys' Then
                    Continue;

                  // Пропускаем существующие файлы
                  If FileExists(RunPath(ImagePath)) Or FileExists(StringReplace(RunPath(ImagePath), '(x86)', '', [rfReplaceAll])) Or FileExists(GetSpecialFolderPath(CSIDL_WINDOWS) + '\' + RunPath(ImagePath)) Then
                    Continue;

                  // Пропускаем съемные носители
                  If GetDriveType(pchar(ExtractFileDrive(RunPath(ImagePath)))) In [DRIVE_CDROM, DRIVE_REMOVABLE] Then
                    Continue;

                  // Пропускаем системные пути
                  If (pos('SYSTEMROOT', ANSIUpperCase(ImagePath)) > 0) Or (pos('SYSTEM32', ANSIUpperCase(ImagePath)) > 0) Then
                    Continue;

                  // Проверяем исключения
                  If Not Stop And Not ExlPathReg(lowercase(CurrentPath + DRName[i] + '\')) And Not ExlPathReg(lowercase(ImagePath)) Then
                  Begin
                    DRIVEListitem := Form1.ListViewRegCleaner.Items.Add;
                    With DRIVEListitem Do
                    Begin
                      MakeVisible(true);
                      Caption := 'HKEY_LOCAL_MACHINE';
                      SubItems.Add(CurrentPath + DRName[i]);
                      SubItems.Add('ImagePath');
                      SubItems.Add(ImagePath);
                      SubItems.Add(CheckBoxDriver.Caption);
                      SubItems.Add('DelKey');
                      Checked := true;
                    End;
                    Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                    Application.ProcessMessages;
                  End;
                End;
              Finally
                reg.CloseKey;
              End;
            End;
          End;

          // Финальное обновление для этого раздела
          If Not Stop Then
          Begin
            Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
            Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
          End;

        Finally
          reg.CloseKey;
        End;
      Finally
        reg.Free;
      End;
    End;

    // 2. Проверяем раздел Reinstall (если не остановлено)
    If Not Stop Then
    Begin
      reg := tRegistry.Create;
      Try
        reg.Access := KEY_WOW64_64KEY Or KEY_READ;
        reg.RootKey := HKEY_LOCAL_MACHINE;

        If Not reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Reinstall\', false) Then
          Exit;

        Try
          reg.getkeynames(DRName);

          // Настройка ProgressBar для Reinstall
          If DRName.Count > 0 Then
          Begin
            Form1.ProgressBarRegCleaner.Max := DRName.Count - 1;
            Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
          End;
          Form1.ProgressBarRegCleaner.Position := 0;
          Form1.Taskbar1.ProgressValue := 0;
          Application.ProcessMessages;

          For i := 0 To DRName.Count - 1 Do
          Begin
            If Stop Then
              Break;

            Form1.ProgressBarRegCleaner.Position := i;
            Form1.Taskbar1.ProgressValue := i;

            If Not Stop Then
            Begin
              Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxDriver.Caption;
              Form1.StatusBarRegCleaner.Panels[1].Text := '\SOFTWARE\Microsoft\Windows\CurrentVersion\Reinstall\' + DRName[i];
              Application.ProcessMessages;
            End;

            If reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Reinstall\' + DRName[i] + '\', false) Then
            Begin
              Try
                If reg.ValueExists('ReinstallString') And (reg.GetDataType('ReinstallString') = rdString) Then
                Begin
                  ReinstallString := reg.ReadString('ReinstallString');

                  // Быстрые проверки
                  If (ReinstallString = '') Or (pos('%', ReinstallString) > 0) Then
                    Continue;

                  // Пропускаем существующие файлы
                  If FileExists(RunPath(ReinstallString)) Or FileExists(StringReplace(RunPath(ReinstallString), '(x86)', '', [rfReplaceAll])) Then
                    Continue;

                  // Пропускаем съемные носители
                  If GetDriveType(pchar(ExtractFileDrive(RunPath(ReinstallString)))) In [DRIVE_CDROM, DRIVE_REMOVABLE] Then
                    Continue;

                  // Проверяем исключения
                  If Not Stop And Not ExlPathReg(lowercase('\SOFTWARE\Microsoft\Windows\CurrentVersion\Reinstall\' + DRName[i] + '\')) And Not ExlPathReg(lowercase(ReinstallString)) Then
                  Begin
                    DRIVEListitem := Form1.ListViewRegCleaner.Items.Add;
                    With DRIVEListitem Do
                    Begin
                      MakeVisible(true);
                      Caption := 'HKEY_LOCAL_MACHINE';
                      SubItems.Add('\SOFTWARE\Microsoft\Windows\CurrentVersion\Reinstall\' + DRName[i]);
                      SubItems.Add('ReinstallString');
                      SubItems.Add(ReinstallString);
                      SubItems.Add(CheckBoxDriver.Caption);
                      SubItems.Add('DelKey');
                      Checked := true;
                    End;
                    Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                    Application.ProcessMessages;
                  End;
                End;
              Finally
                reg.CloseKey;
              End;
            End;
          End;

          // Финальное обновление
          If Not Stop Then
          Begin
            Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
            Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
          End;

        Finally
          reg.CloseKey;
        End;
      Finally
        reg.Free;
      End;
    End;

  Finally
    RegistryPaths.Free;
    DRName.Free;
  End;
End;

// Типы файлов (10) - HKEY_CURRENT_USER + HKEY_LOCAL_MACHINE\SOFTWARE\Classes\
Procedure TForm1.FileExts;
Var
  i, SectionIndex: Integer;
  Publisher, CurrentPath, Command, LowerCmd: String;
  KeyList: TStringList;
  KeyInfo: TRegKeyInfo;
  ListItem: TListItem;
  reg: TRegistry;
  TotalItems, ProcessedItems: Integer;

  // Тип для хранения информации о проверяемых разделах
Type
  TRegistrySection = Record
    Root: HKEY;
    Path: String;
    SubPath: String;
    CheckType: Integer; // 0 - пустой ключ, 1 - команда, 2 - CurVer
    NeedValueCheck: Boolean;
  End;
Const
  Sections: Array[0..10] Of TRegistrySection =(
    // 1. HKCU FileExts OpenWithList (пустые ключи)
    (
    Root: HKEY_CURRENT_USER;
    Path: '\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\';
    SubPath: '\OpenWithList\';
    CheckType: 0;
    NeedValueCheck: False
  ),

    // 2. HKCU FileExts основные ключи (пустые)
    (
    Root: HKEY_CURRENT_USER;
    Path: '\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\';
    SubPath: '\';
    CheckType: 0;
    NeedValueCheck: True
  ),

    // 3. HKLM Software Classes с пустыми значениями
    (
    Root: HKEY_LOCAL_MACHINE;
    Path: '\SOFTWARE\Classes\';
    SubPath: '\';
    CheckType: 0;
    NeedValueCheck: True
  ),

    // 4. HKLM DefaultIcon
    (
    Root: HKEY_LOCAL_MACHINE;
    Path: '\SOFTWARE\Classes\';
    SubPath: '\DefaultIcon\';
    CheckType: 1;
    NeedValueCheck: False
  ),

    // 5. HKLM Applications (пустые)
    (
    Root: HKEY_LOCAL_MACHINE;
    Path: '\SOFTWARE\Classes\Applications\';
    SubPath: '\';
    CheckType: 0;
    NeedValueCheck: False
  ),

    // 6. HKLM Applications open command
    (
    Root: HKEY_LOCAL_MACHINE;
    Path: '\SOFTWARE\Classes\Applications\';
    SubPath: '\shell\open\command\';
    CheckType: 1;
    NeedValueCheck: False
  ),

    // 7. HKLM Applications play command
    (
    Root: HKEY_LOCAL_MACHINE;
    Path: '\SOFTWARE\Classes\Applications\';
    SubPath: '\shell\play\command\';
    CheckType: 1;
    NeedValueCheck: False
  ),

    // 8. HKLM Applications Enqueue command
    (
    Root: HKEY_LOCAL_MACHINE;
    Path: '\SOFTWARE\Classes\Applications\';
    SubPath: '\shell\Enqueue\command\';
    CheckType: 1;
    NeedValueCheck: False
  ),

    // 9. HKLM shell open command
    (
    Root: HKEY_LOCAL_MACHINE;
    Path: '\SOFTWARE\Classes\';
    SubPath: '\shell\open\command\';
    CheckType: 1;
    NeedValueCheck: False
  ),

    // 10. HKLM shell print command
    (
    Root: HKEY_LOCAL_MACHINE;
    Path: '\SOFTWARE\Classes\';
    SubPath: '\shell\print\command\';
    CheckType: 1;
    NeedValueCheck: False
  ),

    // 11. HKLM CurVer
    (
    Root: HKEY_LOCAL_MACHINE;
    Path: '\SOFTWARE\Classes\';
    SubPath: '\CurVer\';
    CheckType: 2;
    NeedValueCheck: False
  ));
Begin
  // Проверка остановки в начале процедуры
  If Stop Then
    Exit;
  Stop := False;

  KeyList := TStringList.Create;

  Try
    // ПЕРВЫЙ ПРОХОД: подсчет общего количества элементов
    TotalItems := 0;

    For SectionIndex := 0 To High(Sections) Do
    Begin
      If Stop Then
        Break;

      reg := TRegistry.Create;
      Try
        reg.Access := KEY_WOW64_64KEY Or KEY_READ;
        reg.RootKey := Sections[SectionIndex].Root;

        If Stop Then
          Break;

        // Открываем базовый путь
        If reg.OpenKey(Sections[SectionIndex].Path, False) Then
        Begin
          Try
            // Проверка остановки перед получением имен
            If Stop Then
            Begin
              reg.CloseKey;
              Break;
            End;

            reg.GetKeyNames(KeyList);
            TotalItems := TotalItems + KeyList.Count;
          Finally
            reg.CloseKey;
          End;
        End;
      Finally
        reg.Free;
      End;
    End;

    // Настройка ProgressBar
    If Stop Then
      Exit;

    If TotalItems > 0 Then
    Begin
      Form1.ProgressBarRegCleaner.Max := TotalItems - 1;
      Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
    End;
    Form1.ProgressBarRegCleaner.Position := 0;
    Form1.Taskbar1.ProgressValue := 0;
    ProcessedItems := 0;
    Application.ProcessMessages;

    // ВТОРОЙ ПРОХОД: обработка всех разделов
    For SectionIndex := 0 To High(Sections) Do
    Begin
      If Stop Then
        Break;

      reg := TRegistry.Create;
      Try
        reg.Access := KEY_WOW64_64KEY Or KEY_READ;
        reg.RootKey := Sections[SectionIndex].Root;

        If Stop Then
          Break;

        // Открываем базовый путь
        If Not reg.OpenKey(Sections[SectionIndex].Path, False) Then
          Continue;

        Try
          // Получаем список ключей
          If Stop Then
          Begin
            reg.CloseKey;
            Break;
          End;

          reg.GetKeyNames(KeyList);
        Finally
          reg.CloseKey;
        End;

        // Обработка каждого ключа в текущем разделе
        For i := 0 To KeyList.Count - 1 Do
        Begin
          If Stop Then
            Break;

          // Обновление ProgressBar
          Form1.ProgressBarRegCleaner.Position := ProcessedItems;
          Form1.Taskbar1.ProgressValue := ProcessedItems;
          Inc(ProcessedItems);

          // Формируем полный путь
          CurrentPath := Sections[SectionIndex].Path + KeyList[i] + Sections[SectionIndex].SubPath;

          // Обновление статуса
          If Not Stop Then
          Begin
            Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxFileExts.Caption;
            Form1.StatusBarRegCleaner.Panels[1].Text := CurrentPath;
            Application.ProcessMessages;
          End;

          // Проверка остановки перед открытием ключа
          If Stop Then
            Break;

          // Открываем ключ для проверки
          If Not reg.OpenKey(CurrentPath, False) Then
            Continue;

          Try
            // Обработка в зависимости от типа проверки
            Case Sections[SectionIndex].CheckType Of
              0: // Проверка пустых ключей
                Begin
                  If Stop Then
                    Break;

                  reg.GetKeyInfo(KeyInfo);

                // Проверка для раздела 2 (HKCU FileExts основные ключи)
                  If (SectionIndex = 1) And Sections[SectionIndex].NeedValueCheck Then
                  Begin
                    If KeyInfo.NumValues = 0 Then
                    Begin
                    // Проверяем OpenWithList
                      reg.RootKey := HKEY_CURRENT_USER;
                      If reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\' + KeyList[i] + '\OpenWithList\', False) Then
                      Begin
                        Try
                          reg.GetKeyInfo(KeyInfo);
                          If (KeyInfo.NumSubKeys = 0) And (KeyInfo.NumValues = 0) And (Not ExlPathReg(LowerCase('\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\' + KeyList[i] + '\OpenWithList\'))) Then
                          Begin
                            If Not Stop Then
                            Begin
                              ListItem := Form1.ListViewRegCleaner.Items.Add;
                              With ListItem Do
                              Begin
                                MakeVisible(True);
                                Caption := 'HKEY_CURRENT_USER';
                                SubItems.Add('\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\' + KeyList[i]);
                                SubItems.Add('');
                                SubItems.Add('');
                                SubItems.Add(CheckBoxFileExts.Caption);
                                SubItems.Add('DelKey');
                                Checked := True;
                                Application.ProcessMessages;
                                Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                              End;
                            End;
                          End;
                        Finally
                          reg.CloseKey;
                        End;
                      End;
                    End;
                  End
                // Проверка для других пустых ключей
                  Else If (KeyInfo.NumSubKeys = 0) And (KeyInfo.NumValues = 0) And (Not ExlPathReg(LowerCase(CurrentPath))) Then
                  Begin
                    If Not Stop Then
                    Begin
                      ListItem := Form1.ListViewRegCleaner.Items.Add;
                      With ListItem Do
                      Begin
                        MakeVisible(True);
                        Case Sections[SectionIndex].Root Of
                          HKEY_CURRENT_USER:
                            Caption := 'HKEY_CURRENT_USER';
                          HKEY_LOCAL_MACHINE:
                            Caption := 'HKEY_LOCAL_MACHINE';
                        End;
                        SubItems.Add(CurrentPath);
                        SubItems.Add('');
                        SubItems.Add('');
                        SubItems.Add(CheckBoxFileExts.Caption);
                        SubItems.Add('DelKey');
                        Checked := True;
                        Application.ProcessMessages;
                        Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                      End;
                    End;
                  End;
                End;

              1: // Проверка команд (DefaultIcon, shell\command и т.д.)
                Begin
                  If Stop Then
                    Break;

                  If reg.GetDataType('') = rdString Then
                  Begin
                    Command := reg.ReadString('');
                    LowerCmd := LowerCase(Command);
                    reg.GetKeyInfo(KeyInfo);

                  // Общие проверки для команд
                    If (Pos('%', Command) = 0) And (Command <> '') Then
                    Begin
                    // Проверки для DefaultIcon (раздел 4)
                      If SectionIndex = 3 Then
                      Begin
                        If (KeyInfo.NumSubKeys = 0) And (Not FileExists(RunPath(Command))) And (Pos(LowerCase('AppX'), LowerCase(KeyList[i])) = 0) And (Pos(LowerCase('%1'), LowerCmd) = 0) And (Pos(LowerCase(',1'), LowerCmd) = 0) And (Not ExlPathReg(LowerCase(CurrentPath))) And (Not ExlPathReg(LowerCase(Command))) Then
                        Begin
                          If Not Stop Then
                          Begin
                            ListItem := Form1.ListViewRegCleaner.Items.Add;
                            With ListItem Do
                            Begin
                              MakeVisible(True);
                              Caption := 'HKEY_LOCAL_MACHINE';
                              SubItems.Add(CurrentPath);
                              SubItems.Add('');
                              SubItems.Add(Command);
                              SubItems.Add(CheckBoxFileExts.Caption);
                              SubItems.Add('DelKey');
                              Checked := True;
                              Application.ProcessMessages;
                              Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                            End;
                          End;
                        End;
                      End
                    // Проверки для Applications\...\command (разделы 6, 7, 8)
                      Else If (SectionIndex >= 5) And (SectionIndex <= 7) Then
                      Begin
                        If (Pos('rundll32.exe', LowerCmd) = 0) And (Not FileExists(RunPath(Command))) And (Not ExlPathReg(LowerCase(CurrentPath))) And (Not ExlPathReg(LowerCase(Command))) Then
                        Begin
                          If Not Stop Then
                          Begin
                            ListItem := Form1.ListViewRegCleaner.Items.Add;
                            With ListItem Do
                            Begin
                              MakeVisible(True);
                              Caption := 'HKEY_LOCAL_MACHINE';
                              SubItems.Add(CurrentPath);
                              SubItems.Add('');
                              SubItems.Add(Command);
                              SubItems.Add(CheckBoxFileExts.Caption);
                              SubItems.Add('DelKey');
                              Checked := True;
                              Application.ProcessMessages;
                              Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                            End;
                          End;
                        End;
                      End
                    // Проверки для shell\...\command (разделы 9, 10)
                      Else If (SectionIndex = 8) Or (SectionIndex = 9) Then
                      Begin
                        If (Not FileExists(RunPath(Command))) And (Pos('rundll32.exe', LowerCmd) = 0) And (Pos('devenv.exe', LowerCmd) = 0) And (Pos('explorer', LowerCmd) = 0) And (Pos('"%1" %*', LowerCmd) = 0) And (Pos('"%1" /s', LowerCmd) = 0) And (Pos('%systemroot%', LowerCmd) = 0) And (Pos('"iexplore.exe" "%1"', LowerCmd) = 0) And (KeyInfo.NumValues <= 1) And (Not ExlPathReg(LowerCase(CurrentPath))) And (Not ExlPathReg(LowerCase(Command))) Then
                        Begin
                          If Not Stop Then
                          Begin
                            ListItem := Form1.ListViewRegCleaner.Items.Add;
                            With ListItem Do
                            Begin
                              MakeVisible(True);
                              Caption := 'HKEY_LOCAL_MACHINE';
                              SubItems.Add(CurrentPath);
                              SubItems.Add('');
                              SubItems.Add(Command);
                              SubItems.Add(CheckBoxFileExts.Caption);
                              SubItems.Add('DelKey');
                              Checked := True;
                              Application.ProcessMessages;
                              Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                            End;
                          End;
                        End;
                      End;
                    End;
                  End;
                End;

              2: // Проверка CurVer (раздел 11)
                Begin
                  If Stop Then
                    Break;

                  If reg.GetDataType('') = rdString Then
                  Begin
                    Publisher := '\SOFTWARE\Classes\' + reg.ReadString('');
                    If Not reg.KeyExists(Publisher) Then
                    Begin
                      If (Not ExlPathReg(LowerCase(CurrentPath))) And (Not ExlPathReg(LowerCase(reg.ReadString('')))) Then
                      Begin
                        If Not Stop Then
                        Begin
                          ListItem := Form1.ListViewRegCleaner.Items.Add;
                          With ListItem Do
                          Begin
                            MakeVisible(True);
                            Caption := 'HKEY_LOCAL_MACHINE';
                            SubItems.Add(CurrentPath);
                            SubItems.Add('');
                            SubItems.Add(reg.ReadString(''));
                            SubItems.Add(CheckBoxFileExts.Caption);
                            SubItems.Add('DelKey');
                            Checked := True;
                            Application.ProcessMessages;
                            Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                          End;
                        End;
                      End;
                    End;
                  End;
                End;
            End;
          Finally
            reg.CloseKey;
          End;
        End; // Конец цикла по ключам

      Finally
        reg.Free;
      End;
    End; // Конец цикла по разделам

    // Финальное обновление ProgressBar если не было остановки
    If Not Stop Then
    Begin
      Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
      Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
    End;

  Finally
    KeyList.Free;
  End;
End;

// Software (11)
Procedure TForm1.HKLMSOFTWARE;
Var
  i, j: Integer;
  FileExtsName: TStringList;
  Keylnfo: TRegKeyInfo;
  ListItem: TListItem;
  RegAccess: Cardinal;
  RootKeys: Array[0..1] Of HKEY;
  RootKeyNames: Array[0..1] Of String;
  TotalItems, ProcessedItems: Integer;
Begin
  // Проверка остановки в начале процедуры
  If Stop Then
    Exit;
  Stop := False;

  // Определяем уровень доступа к реестру
  {$IFDEF WIN64}
  RegAccess := KEY_WOW64_64KEY Or KEY_READ;
  {$ELSE}
  RegAccess := KEY_WOW64_32KEY Or KEY_READ;
  {$ENDIF}

  // Настраиваем корневые ключи для проверки
  RootKeys[0] := HKEY_LOCAL_MACHINE;
  RootKeys[1] := HKEY_CURRENT_USER;
  RootKeyNames[0] := 'HKEY_LOCAL_MACHINE';
  RootKeyNames[1] := 'HKEY_CURRENT_USER';

  FileExtsName := TStringList.Create;

  Try
    // ПЕРВЫЙ ПРОХОД: подсчет общего количества элементов
    TotalItems := 0;
    For j := 0 To Length(RootKeys) - 1 Do
    Begin
      If Stop Then
        Break;

      reg := TRegistry.Create;
      Try
        reg.Access := RegAccess;
        reg.RootKey := RootKeys[j];

        If Stop Then
          Break;
        If reg.OpenKey('\SOFTWARE\', false) Then
        Begin
          Try
            If Stop Then
            Begin
              reg.CloseKey;
              Break;
            End;

            reg.GetKeyNames(FileExtsName);
            TotalItems := TotalItems + FileExtsName.Count;
          Finally
            reg.CloseKey;
          End;
        End;
      Finally
        reg.Free;
      End;
    End;

    // Настройка ProgressBar
    If Stop Then
      Exit;

    If TotalItems > 0 Then
    Begin
      ProgressBarRegCleaner.Max := TotalItems - 1;
      If Assigned(Taskbar1) Then
        Taskbar1.ProgressMaxValue := ProgressBarRegCleaner.Max;
    End;
    ProgressBarRegCleaner.Position := 0;
    If Assigned(Taskbar1) Then
      Taskbar1.ProgressValue := ProgressBarRegCleaner.Position;

    ProcessedItems := 0;
    Application.ProcessMessages;

    // ВТОРОЙ ПРОХОД: обработка элементов
    For j := 0 To Length(RootKeys) - 1 Do
    Begin
      If Stop Then
        Break;

      reg := TRegistry.Create;
      Try
        reg.Access := RegAccess;
        reg.RootKey := RootKeys[j];

        If Stop Then
          Break;
        If Not reg.OpenKey('\SOFTWARE\', false) Then
          Continue;

        Try
          // Получаем список подразделов
          If Stop Then
          Begin
            reg.CloseKey;
            Break;
          End;

          reg.GetKeyNames(FileExtsName);
          reg.CloseKey;

          // Обрабатываем каждый подраздел
          For i := 0 To FileExtsName.Count - 1 Do
          Begin
            If Stop Then
              Break;

            // Обновление ProgressBar
            ProgressBarRegCleaner.Position := ProcessedItems;
            If Assigned(Taskbar1) Then
              Taskbar1.ProgressValue := ProcessedItems;
            Inc(ProcessedItems);

            // Обновление статуса
            If Not Stop Then
            Begin
              If j = 0 Then
                StatusBarRegCleaner.Panels[0].Text := 'HKLM SOFTWARE: '
              Else
                StatusBarRegCleaner.Panels[0].Text := 'HKCU SOFTWARE: ';
              StatusBarRegCleaner.Panels[1].Text := '\SOFTWARE\' + FileExtsName[i] + '\';
              Application.ProcessMessages;
            End;

            If Stop Then
              Break;
            If Not reg.OpenKey('\SOFTWARE\' + FileExtsName[i] + '\', false) Then
              Continue;

            Try
              // Проверяем ключ
              If Stop Then
                Break;
              reg.GetKeyInfo(Keylnfo);

              // Пропускаем ключи с подразделами или значениями
              If (Keylnfo.NumSubKeys <> 0) Or (Keylnfo.NumValues <> 0) Then
                Continue;

              // Проверяем исключения
              If Stop Then
                Break;

              If ExlPathReg(LowerCase('\SOFTWARE\' + FileExtsName[i] + '\')) Then
                Continue;

              // Добавляем в список для удаления (только если не остановлено)
              If Not Stop Then
              Begin
                ListItem := ListViewRegCleaner.Items.Add;
                With ListItem Do
                Begin
                  Caption := RootKeyNames[j];
                  SubItems.Add('\SOFTWARE\' + FileExtsName[i] + '\');
                  SubItems.Add('');
                  SubItems.Add('');
                  SubItems.Add(CheckBoxHKLMSOFTWARE.Caption);
                  SubItems.Add('DelKey');
                  Checked := True;
                  MakeVisible(True);
                End;

                // Обновляем счетчик
                Label1.Caption := LangTotal.Caption + IntToStr(ListViewRegCleaner.Items.Count);
                Application.ProcessMessages;
              End;

            Finally
              reg.CloseKey;
            End;
          End; // Конец цикла по подразделам

        Finally
          reg.CloseKey;
        End;

      Finally
        reg.Free;
      End;

      If Stop Then
        Break;
    End; // Конец цикла по корневым ключам

    // Финальное обновление ProgressBar если не было остановки
    If Not Stop Then
    Begin
      ProgressBarRegCleaner.Position := ProgressBarRegCleaner.Max;
      If Assigned(Taskbar1) Then
        Taskbar1.ProgressValue := ProgressBarRegCleaner.Max;
    End;

  Finally
    FileExtsName.Free;
  End;
End;

// Звуки Windows (12)

Procedure TForm1.Sound;
Var
  i, j: Integer;
  APPName: TStringList;
  soundListitem: TListItem;
  SoundString, CurrentPath: String;
  SoundPaths: Array[0..3] Of Record
    RootPath: String;
    SubKey: String;
  End;
  TotalItems, ProcessedItems: Integer;
Begin
  // Проверка остановки в начале процедуры
  If Stop Then
    Exit;
  Stop := False;

  // Определяем пути для проверки
  SoundPaths[0].RootPath := '\AppEvents\Schemes\Apps\.Default\';
  SoundPaths[0].SubKey := '\.Current\';

  SoundPaths[1].RootPath := '\AppEvents\Schemes\Apps\.Default\';
  SoundPaths[1].SubKey := '\.Default\';

  SoundPaths[2].RootPath := '\AppEvents\Schemes\Apps\Explorer\';
  SoundPaths[2].SubKey := '\.Default\';

  SoundPaths[3].RootPath := '\AppEvents\Schemes\Apps\Explorer\';
  SoundPaths[3].SubKey := '\.Current\';

  APPName := TStringList.Create;

  Try
    // ПЕРВЫЙ ПРОХОД: подсчет общего количества элементов
    TotalItems := 0;
    For j := 0 To 3 Do
    Begin
      If Stop Then
        Break;

      reg := tRegistry.Create;
      Try
        reg.Access := KEY_WOW64_64KEY Or KEY_READ;
        reg.RootKey := HKEY_CURRENT_USER;

        If Stop Then
          Break;
        If reg.OpenKey(SoundPaths[j].RootPath, false) Then
        Begin
          Try
            If Stop Then
            Begin
              reg.CloseKey;
              Break;
            End;

            reg.getkeynames(APPName);
            TotalItems := TotalItems + APPName.Count;
          Finally
            reg.CloseKey;
          End;
        End;
      Finally
        reg.Free;
      End;
    End;

    // Настройка ProgressBar
    If Stop Then
      Exit;

    If TotalItems > 0 Then
    Begin
      Form1.ProgressBarRegCleaner.Max := TotalItems - 1;
      Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
    End;
    Form1.ProgressBarRegCleaner.Position := 0;
    Form1.Taskbar1.ProgressValue := 0;
    ProcessedItems := 0;
    Application.ProcessMessages;

    // ВТОРОЙ ПРОХОД: обработка элементов
    For j := 0 To 3 Do
    Begin
      If Stop Then
        Break;

      reg := tRegistry.Create;
      Try
        reg.Access := KEY_WOW64_64KEY Or KEY_READ;
        reg.RootKey := HKEY_CURRENT_USER;

        If Stop Then
          Break;
        If Not reg.OpenKey(SoundPaths[j].RootPath, false) Then
          Continue;

        Try
          // Получаем список событий
          If Stop Then
          Begin
            reg.CloseKey;
            Break;
          End;

          reg.getkeynames(APPName);
        Finally
          reg.CloseKey;
        End;

        // Проверяем каждый тип события
        For i := 0 To APPName.Count - 1 Do
        Begin
          If Stop Then
            Break;

          // Обновление ProgressBar
          Form1.ProgressBarRegCleaner.Position := ProcessedItems;
          Form1.Taskbar1.ProgressValue := ProcessedItems;
          Inc(ProcessedItems);

          // Формируем путь к ключу
          CurrentPath := SoundPaths[j].RootPath + APPName[i] + SoundPaths[j].SubKey;

          // Обновление статуса
          If Not Stop Then
          Begin
            Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxSound.Caption;
            Form1.StatusBarRegCleaner.Panels[1].Text := CurrentPath;
            Application.ProcessMessages;
          End;

          If Stop Then
            Break;
          If Not reg.OpenKey(CurrentPath, false) Then
            Continue;

          Try
            // Проверка остановки перед чтением значения
            If Stop Then
              Break;

            // Читаем строку звука (значение по умолчанию '')
            If reg.ValueExists('') And (reg.GetDataType('') = rdString) Then
            Begin
              SoundString := reg.ReadString('');

              // Быстрые проверки для пропуска
              If (SoundString = '') Or (pos('%', SoundString) > 0) Then
                Continue;

              // Проверка остановки перед проверкой файлов
              If Stop Then
                Break;

              // Проверяем существование файла звука
              If FileExists(RunPath(SoundString)) Or FileExists(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Media\' + SoundString) Then
                Continue;

              // Проверка остановки перед проверкой исключений
              If Stop Then
                Break;

              // Проверяем исключения
              If Not ExlPathReg(LowerCase(CurrentPath)) And Not ExlPathReg(LowerCase(SoundString)) Then
              Begin
                // Последняя проверка перед добавлением
                If Not Stop Then
                Begin
                  soundListitem := Form1.ListViewRegCleaner.Items.Add;
                  With soundListitem Do
                  Begin
                    MakeVisible(true);
                    Caption := 'HKEY_CURRENT_USER';
                    SubItems.Add(CurrentPath);
                    SubItems.Add('');
                    SubItems.Add(SoundString);
                    SubItems.Add(CheckBoxSound.Caption);
                    SubItems.Add('DelVal');
                    Checked := true;

                    Application.ProcessMessages;
                    Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                  End;
                End;
              End;
            End;
          Finally
            reg.CloseKey;
          End;
        End; // For i

      Finally
        reg.Free;
      End;
    End; // For j

    // Финальное обновление ProgressBar если не было остановки
    If Not Stop Then
    Begin
      Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
      Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
    End;

  Finally
    APPName.Free;
  End;
End;

Procedure TForm1.StopSearch;
Var
  u: Integer;
Begin
  Stop := true;
  // ListViewRegCleaner.Enabled := true;
  // ListViewOption.Enabled := true;

  If Form1.ListViewRegCleaner.Items.Count > 0 Then
    ButtonFix.Enabled := true;

  Form1.PopupMenuList.AutoPopup := true;
  Form1.PopupMenuOption.AutoPopup := true;
  Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
  Form1.StatusBarRegCleaner.Panels[0].Text := '';
  Form1.StatusBarRegCleaner.Panels[1].Text := '';
  Form1.ProgressBarRegCleaner.Position := 0;
  Form1.Taskbar1.ProgressValue := Form1.ProgressBarRegCleaner.Position;
  Application.ProcessMessages;
  For u := 0 To Form1.ListViewRegCleaner.Columns.Count - 1 Do
  Begin
    ListView_SetColumnWidth(Form1.ListViewRegCleaner.Handle, u, LVSCW_AUTOSIZE_USEHEADER);
  End;
End;

Procedure TForm1.SpeedButton2Click(Sender: TObject);
Begin
  ButtonSearch.Enabled := false;
  Repair;
  ButtonSearch.Enabled := true;
End;

Procedure TForm1.WMMouseMove(Var Message: TWMMouseMove);
Begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := false;
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
      ButtonRight.X := SpeedButton_GeneralMenu.Left;
      ButtonRight.Y := SpeedButton_GeneralMenu.Top;
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

// ShellExtensions (13)
Procedure TForm1.ShellExtensions;
Var
  i: Integer;
  param, Publisher: String;
  lName: TStringList;
  ListItemFONT: TListItem;
  reg, rg: tRegistry;
Begin
  If Stop Then
    Exit;
  Stop := False;

  reg := Nil;
  rg := Nil;
  lName := Nil;

  Try
    // Инициализация объектов
    reg := tRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.Access := KEY_WOW64_64KEY Or KEY_READ;

    rg := tRegistry.Create;
    rg.RootKey := HKEY_CLASSES_ROOT;
    rg.Access := KEY_WOW64_64KEY Or KEY_READ;

    lName := TStringList.Create;

    // Открываем ключ Approved
    If Stop Then
      Exit;
    If Not reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved\', false) Then
      Exit;

    Try
      // Получаем список значений
      If Stop Then
      Begin
        reg.CloseKey;
        Exit;
      End;

      reg.GetValueNames(lName);
    Finally
      reg.CloseKey;
    End;

    // Настройка ProgressBar
    If Stop Then
      Exit;

    If lName.Count > 0 Then
    Begin
      Form1.ProgressBarRegCleaner.Max := lName.Count - 1;
      Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
    End;
    Form1.ProgressBarRegCleaner.Position := 0;
    Form1.Taskbar1.ProgressValue := 0;
    Application.ProcessMessages;

    // Обработка каждого значения
    For i := 0 To lName.Count - 1 Do
    Begin
      If Stop Then
        Break; // Выход из цикла при остановке

      param := lName[i];

      // Обновление прогресса
      Form1.ProgressBarRegCleaner.Position := i;
      Form1.Taskbar1.ProgressValue := i;

      // Читаем значение
      If Not reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved\', false) Then
        Continue;

      Try
        Publisher := reg.ReadString(param);

        // Обновление статуса
        If Not Stop Then
        Begin
          Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxShellExtensions.Caption;
          Form1.StatusBarRegCleaner.Panels[1].Text := Publisher;
          Application.ProcessMessages;
        End;

        // Быстрые проверки
        If (Publisher = '') Or (Pos('%', Publisher) > 0) Then
          Continue;

        // Проверяем существование соответствующего CLSID
        If Not rg.KeyExists('\CLSID\' + param) Then
        Begin
          // Проверяем исключения и добавляем
          If Not Stop And Not ExlPathReg(LowerCase(param)) Then
          Begin
            ListItemFONT := Form1.ListViewRegCleaner.Items.Add;
            With ListItemFONT Do
            Begin
              Caption := 'HKEY_LOCAL_MACHINE';
              SubItems.Add('\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved\');
              SubItems.Add(param);
              SubItems.Add(Publisher);
              SubItems.Add(CheckBoxShellExtensions.Caption);
              SubItems.Add('DelVal');
              Checked := True;
              MakeVisible(True);
            End;

            Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
            Application.ProcessMessages;
          End;
        End;

      Finally
        reg.CloseKey;
      End;
    End; // Конец цикла

    // Финальное обновление
    If Not Stop Then
    Begin
      Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
      Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
    End;

  Finally
    // Безопасное освобождение ресурсов
    If Assigned(rg) Then
      rg.Free;
    If Assigned(reg) Then
      reg.Free;
    If Assigned(lName) Then
      lName.Free;
  End;
End;

// Брандмауэр (14)
Procedure TForm1.FirewallPolicy;
Var
  i, j: Integer;
  param, FilePath: String;
  lName: TStringList;
  ListItemSharedDLLs: TListItem;
  ProfileKeys: Array[0..1] Of String;
  DriveType: UINT;
  TotalItems, ProcessedItems: Integer;
Begin
  // Проверка остановки в начале процедуры
  If Stop Then
    Exit;
  Stop := False;

  ProfileKeys[0] := '\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\AuthorizedApplications\List\';
  ProfileKeys[1] := '\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List\';

  lName := TStringList.Create;
  reg := TRegistry.Create;

  Try
    // Проверка перед настройкой реестра
    If Stop Then
    Begin
      reg.Free;
      lName.Free;
      Exit;
    End;

    reg.Access := KEY_WOW64_64KEY Or KEY_READ;
    reg.RootKey := HKEY_LOCAL_MACHINE;

    // ПЕРВЫЙ ПРОХОД: подсчет общего количества элементов
    TotalItems := 0;
    For j := 0 To Length(ProfileKeys) - 1 Do
    Begin
      If Stop Then
        Break;

      If reg.OpenKey(ProfileKeys[j], False) Then
      Begin
        Try
          If Stop Then
          Begin
            reg.CloseKey;
            Break;
          End;

          reg.GetValueNames(lName);
          TotalItems := TotalItems + lName.Count;
        Finally
          reg.CloseKey;
        End;
      End;
    End;

    // Настройка ProgressBar
    If Stop Then
      Exit;

    If TotalItems > 0 Then
    Begin
      Form1.ProgressBarRegCleaner.Max := TotalItems - 1;
      Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
    End;
    Form1.ProgressBarRegCleaner.Position := 0;
    Form1.Taskbar1.ProgressValue := 0;
    ProcessedItems := 0;
    Application.ProcessMessages;

    // ВТОРОЙ ПРОХОД: обработка элементов
    For j := 0 To Length(ProfileKeys) - 1 Do
    Begin
      // Проверка остановки для каждого профиля
      If Stop Then
        Break;

      If Not reg.OpenKey(ProfileKeys[j], False) Then
        Continue;

      Try
        // Получаем список значений
        If Stop Then
        Begin
          reg.CloseKey;
          Break;
        End;

        reg.GetValueNames(lName);
      Finally
        reg.CloseKey;
      End;

      // Обрабатываем каждое значение
      For i := 0 To lName.Count - 1 Do
      Begin
        // Проверка остановки для каждого значения
        If Stop Then
          Break;

        param := lName[i];

        // Обновление ProgressBar
        Form1.ProgressBarRegCleaner.Position := ProcessedItems;
        Form1.Taskbar1.ProgressValue := ProcessedItems;
        Inc(ProcessedItems);

        // Обновление статуса
        If Not Stop Then
        Begin
          Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxFirewallPolicy.Caption;
          Form1.StatusBarRegCleaner.Panels[1].Text := param;
          Application.ProcessMessages;
        End;

        // Проверка остановки перед проверкой типа данных
        If Stop Then
          Break;

        // Открываем ключ для проверки типа данных
        If Not reg.OpenKey(ProfileKeys[j], False) Then
          Continue;

        Try
          // Пропускаем нестроковые значения
          If reg.GetDataType(param) <> rdString Then
            Continue;

          // Проверки условий пропуска
          If Pos('%', param) > 0 Then
            Continue;

          // Проверка остановки перед проверкой файла
          If Stop Then
            Break;

          FilePath := RunPath(param);

          If FileExists(FilePath) Then
            Continue;

          // Проверка типа диска
          DriveType := GetDriveType(PChar(ExtractFileDrive(FilePath)));
          If (DriveType = DRIVE_CDROM) Or (DriveType = DRIVE_REMOVABLE) Then
            Continue;

          // Проверка остановки перед проверкой исключений
          If Stop Then
            Break;

          If ExlPathReg(LowerCase(param)) Then
            Continue;

          // Проверка остановки перед чтением значения
          If Stop Then
            Break;

          // Добавление в список для очистки (только если не остановлено)
          If Not Stop Then
          Begin
            ListItemSharedDLLs := Form1.ListViewRegCleaner.Items.Add;
            With ListItemSharedDLLs Do
            Begin
              MakeVisible(True);
              Caption := 'HKEY_LOCAL_MACHINE';
              SubItems.Add(ProfileKeys[j]);
              SubItems.Add(param);
              SubItems.Add(reg.ReadString(param));
              SubItems.Add(CheckBoxFirewallPolicy.Caption);
              SubItems.Add('DelVal');
              Checked := True;
              Application.ProcessMessages;
              Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
            End;
          End;

        Finally
          reg.CloseKey;
        End;
      End; // Конец цикла по значениям

      // Очистка списка для следующего профиля
      lName.Clear;
    End; // Конец цикла по профилям

    // Финальное обновление ProgressBar если не было остановки
    If Not Stop Then
    Begin
      Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
      Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
    End;

  Finally
    reg.Free;
    lName.Free;
  End;
End;

// Кэш MUI  (15)
Procedure TForm1.LoadFromMUI;
Var
  i: Integer;
  param, Publisher: String;
  lName: TStringList;
  ListItem: TListItem;
  RegPaths: TArray<String>;
  CurrentPath: String;
  TotalItems, ProcessedItems: Integer;
Begin
  // Проверка остановки в начале процедуры
  If Stop Then
    Exit;
  Stop := False;

  // Определяем пути реестра для обработки
  RegPaths := ['\Software\Microsoft\Windows\ShellNoRoam\MUICache\', '\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache\'];

  lName := TStringList.Create;

  Try
    // ПЕРВЫЙ ПРОХОД: подсчет общего количества элементов
    TotalItems := 0;
    For CurrentPath In RegPaths Do
    Begin
      If Stop Then
        Break;

      reg := TRegistry.Create;
      Try
        reg.Access := KEY_WOW64_64KEY Or KEY_READ;
        reg.RootKey := HKEY_CURRENT_USER;

        If Stop Then
          Break;
        If Not reg.OpenKey(CurrentPath, False) Then
          Continue;

        Try
          // Проверка остановки перед получением имен значений
          If Stop Then
          Begin
            reg.CloseKey;
            Break;
          End;

          reg.GetValueNames(lName);
          TotalItems := TotalItems + lName.Count;
        Finally
          reg.CloseKey;
        End;
      Finally
        reg.Free;
      End;
    End;

    // Настройка ProgressBar
    If Stop Then
      Exit;

    If TotalItems > 0 Then
    Begin
      ProgressBarRegCleaner.Max := TotalItems - 1;
      Taskbar1.ProgressMaxValue := ProgressBarRegCleaner.Max;
    End;
    ProgressBarRegCleaner.Position := 0;
    Taskbar1.ProgressValue := 0;
    ProcessedItems := 0;
    Application.ProcessMessages;

    // ВТОРОЙ ПРОХОД: обработка элементов
    For CurrentPath In RegPaths Do
    Begin
      If Stop Then
        Break;

      reg := TRegistry.Create;
      Try
        reg.Access := KEY_WOW64_64KEY Or KEY_READ;
        reg.RootKey := HKEY_CURRENT_USER;

        If Stop Then
          Break;
        If Not reg.OpenKey(CurrentPath, False) Then
          Continue;

        Try
          // Получаем список значений
          If Stop Then
          Begin
            reg.CloseKey;
            Break;
          End;

          reg.GetValueNames(lName);
        Finally
          reg.CloseKey;
        End;

        // Обработка каждого значения
        For i := 0 To lName.Count - 1 Do
        Begin
          // Проверка остановки в начале каждой итерации
          If Stop Then
            Break;

          param := lName[i];

          // Обновление ProgressBar
          ProgressBarRegCleaner.Position := ProcessedItems;
          Taskbar1.ProgressValue := ProcessedItems;
          Inc(ProcessedItems);

          // Проверка остановки перед открытием ключа
          If Stop Then
            Break;

          // Открываем ключ для чтения значения
          If Not reg.OpenKey(CurrentPath, False) Then
            Continue;

          Try
            // Проверка типа данных
            If Stop Then
              Break;

            If reg.GetDataType(param) <> rdString Then
              Continue;

            // Чтение значения
            If Stop Then
              Break;
            Publisher := reg.ReadString(param);

            // Обновление статуса если не остановлено
            If Not Stop Then
            Begin
              StatusBarRegCleaner.Panels[0].Text := CheckBoxMUI.Caption;
              StatusBarRegCleaner.Panels[1].Text := param;
              Application.ProcessMessages;
            End;

            // Пропускаем значения с '%'
            If Pos('%', Publisher) > 0 Then
              Continue;

            // Проверка остановки перед проверкой исключений
            If Stop Then
              Break;

            // Проверяем исключения
            If Not ExlPathReg(LowerCase(param)) Then
            Begin
              // Последняя проверка перед добавлением
              If Not Stop Then
              Begin
                ListItem := ListViewRegCleaner.Items.Add;
                With ListItem Do
                Begin
                  MakeVisible(True);
                  Caption := 'HKEY_CURRENT_USER';
                  SubItems.Add(CurrentPath);
                  SubItems.Add(param);
                  SubItems.Add(Publisher);
                  SubItems.Add(CheckBoxMUI.Caption);
                  SubItems.Add('DelVal');
                  Checked := True;

                  // Обновление счетчика
                  Label1.Caption := LangTotal.Caption + IntToStr(ListViewRegCleaner.Items.Count);
                  Application.ProcessMessages;
                End;
              End;
            End;
          Finally
            reg.CloseKey;
          End;
        End; // Конец цикла по значениям

      Finally
        reg.Free;
      End;
    End; // Конец цикла по путям

    // Финальное обновление ProgressBar если не было остановки
    If Not Stop Then
    Begin
      ProgressBarRegCleaner.Position := ProgressBarRegCleaner.Max;
      Taskbar1.ProgressValue := Taskbar1.ProgressMaxValue;
    End;

  Finally
    lName.Free;
  End;
End;

// 16
// Классы компонентов

// Функция для преобразования строки в символ (берет первый символ строки)
Function Str2Char(Const S: String): Char;
Begin
  If Length(S) > 0 Then
    Result := S[1]
  Else
    Result := #0;
End;

Procedure TForm1.ClassKom;
Var
  i, g: Integer;
  LastUsedSource, typename, CurrentPath: String;
  FileExtsName, Value: TStringList;
  ClassListitem: TListItem;
  reg, rg1, rg2: TRegistry;
  d: Char;
  TotalItems, ProcessedItems, SectionItems: Integer;
Begin
  // Проверка остановки в начале процедуры
  If Stop Then
    Exit;
  Stop := False;

  FileExtsName := TStringList.Create;
  Value := TStringList.Create;

  Try
    // ПЕРВЫЙ ПРОХОД: подсчет общего количества элементов во всех разделах
    TotalItems := 0;

    // 1. Считаем элементы из HKEY_CLASSES_ROOT\Installer\Products\
    reg := TRegistry.Create;
    Try
      reg.Access := KEY_WOW64_64KEY Or KEY_READ;
      reg.RootKey := HKEY_CLASSES_ROOT;

      If Stop Then
        Exit;
      If reg.OpenKey('\Installer\Products\', False) Then
      Begin
        Try
          If Stop Then
          Begin
            reg.CloseKey;
            Exit;
          End;

          reg.GetKeyNames(FileExtsName);
          TotalItems := TotalItems + FileExtsName.Count;
        Finally
          reg.CloseKey;
        End;
      End;
    Finally
      reg.Free;
    End;

    // 2. Считаем элементы из HKEY_LOCAL_MACHINE Components
    reg := TRegistry.Create;
    Try
      reg.Access := KEY_WOW64_64KEY Or KEY_READ;
      reg.RootKey := HKEY_LOCAL_MACHINE;

      If Stop Then
        Exit;
      If reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\', False) Then
      Begin
        Try
          If Stop Then
          Begin
            reg.CloseKey;
            Exit;
          End;

          reg.GetKeyNames(FileExtsName);
          TotalItems := TotalItems + FileExtsName.Count;
        Finally
          reg.CloseKey;
        End;
      End;
    Finally
      reg.Free;
    End;

    // 3. Считаем элементы из Component Based Servicing Packages
    reg := TRegistry.Create;
    Try
      reg.Access := KEY_WOW64_64KEY Or KEY_READ;
      reg.RootKey := HKEY_LOCAL_MACHINE;

      If Stop Then
        Exit;
      If reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\', False) Then
      Begin
        Try
          If Stop Then
          Begin
            reg.CloseKey;
            Exit;
          End;

          reg.GetKeyNames(FileExtsName);
          TotalItems := TotalItems + FileExtsName.Count;
        Finally
          reg.CloseKey;
        End;
      End;
    Finally
      reg.Free;
    End;

    // Настройка ProgressBar
    If Stop Then
      Exit;

    If TotalItems > 0 Then
    Begin
      Form1.ProgressBarRegCleaner.Max := TotalItems - 1;
      Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;
    End;
    Form1.ProgressBarRegCleaner.Position := 0;
    Form1.Taskbar1.ProgressValue := 0;
    ProcessedItems := 0;
    Application.ProcessMessages;

    // === 1. Обработка HKEY_CLASSES_ROOT\Installer\Products\ ===
    reg := TRegistry.Create;
    Try
      reg.Access := KEY_WOW64_64KEY Or KEY_READ;
      reg.RootKey := HKEY_CLASSES_ROOT;

      If Stop Then
        Exit;
      If reg.OpenKey('\Installer\Products\', False) Then
      Begin
        Try
          // Получаем список продуктов
          If Stop Then
          Begin
            reg.CloseKey;
            Exit;
          End;

          reg.GetKeyNames(FileExtsName);
        Finally
          reg.CloseKey;
        End;

        For i := 0 To FileExtsName.Count - 1 Do
        Begin
          // Проверка остановки в начале каждой итерации
          If Stop Then
            Break;

          // Обновление ProgressBar
          Form1.ProgressBarRegCleaner.Position := ProcessedItems;
          Form1.Taskbar1.ProgressValue := ProcessedItems;
          Inc(ProcessedItems);

          // Обновление статуса
          If Not Stop Then
          Begin
            Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxClassKom.Caption;
            Form1.StatusBarRegCleaner.Panels[1].Text := '\Installer\Products\' + FileExtsName[i];
            Application.ProcessMessages;
          End;

          // Проверка LastUsedSource в SourceList
          CurrentPath := '\Installer\Products\' + FileExtsName[i] + '\SourceList\';
          If Stop Then
            Break;

          If reg.OpenKey(CurrentPath, False) Then
          Begin
            Try
              // Проверка остановки перед чтением значения
              If Stop Then
                Break;

              If reg.ValueExists('LastUsedSource') And (reg.GetDataType('LastUsedSource') = rdString) Then
              Begin
                LastUsedSource := reg.ReadString('LastUsedSource');

                If (LastUsedSource <> '') And (Pos('%', LastUsedSource) = 0) Then
                Begin
                  // Проверка остановки перед проверкой диска
                  If Stop Then
                    Break;

                  d := Str2Char(ExtractFileDrive(RunPath(LastUsedSource)));
                  If DiskExist(d) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_CDROM) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_REMOVABLE) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_NO_ROOT_DIR) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_UNKNOWN) And (Not DirectoryExists(RunPath(LastUsedSource))) And (Not ExlPathReg(LowerCase(CurrentPath))) And (Not ExlPathReg(LowerCase(LastUsedSource))) Then
                  Begin
                    // Проверка остановки перед добавлением
                    If Not Stop Then
                    Begin
                      ClassListitem := Form1.ListViewRegCleaner.Items.Add;
                      With ClassListitem Do
                      Begin
                        MakeVisible(True);
                        Caption := 'HKEY_CLASSES_ROOT';
                        SubItems.Add(CurrentPath);
                        SubItems.Add('LastUsedSource');
                        SubItems.Add(LastUsedSource);
                        SubItems.Add(CheckBoxClassKom.Caption);
                        SubItems.Add('DelVal');
                        Checked := True;
                        Application.ProcessMessages;
                        Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                      End;
                    End;
                  End;
                End;
              End;
            Finally
              reg.CloseKey;
            End;
          End;

          // Проверка значений '1' и '2' в SourceList\Net
          If Stop Then
            Break;

          CurrentPath := '\Installer\Products\' + FileExtsName[i] + '\SourceList\Net\';
          If reg.OpenKey(CurrentPath, False) Then
          Begin
            Try
              For g := 1 To 2 Do
              Begin
                If Stop Then
                  Break;

                If reg.ValueExists(IntToStr(g)) And (reg.GetDataType(IntToStr(g)) = rdString) Then
                Begin
                  LastUsedSource := reg.ReadString(IntToStr(g));

                  If (LastUsedSource <> '') And (Pos('%', LastUsedSource) = 0) Then
                  Begin
                    // Проверка остановки перед проверкой диска
                    If Stop Then
                      Break;

                    d := Str2Char(ExtractFileDrive(RunPath(LastUsedSource)));
                    If DiskExist(d) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_CDROM) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_REMOVABLE) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_NO_ROOT_DIR) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_UNKNOWN) And (Not DirectoryExists(RunPath(LastUsedSource))) And (Not ExlPathReg(LowerCase(CurrentPath))) And (Not ExlPathReg(LowerCase(LastUsedSource))) Then
                    Begin
                      // Проверка остановки перед добавлением
                      If Not Stop Then
                      Begin
                        ClassListitem := Form1.ListViewRegCleaner.Items.Add;
                        With ClassListitem Do
                        Begin
                          MakeVisible(True);
                          Caption := 'HKEY_CLASSES_ROOT';
                          SubItems.Add(CurrentPath);
                          SubItems.Add(IntToStr(g));
                          SubItems.Add(LastUsedSource);
                          SubItems.Add(CheckBoxClassKom.Caption);
                          SubItems.Add('DelVal');
                          Checked := True;
                          Application.ProcessMessages;
                          Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                        End;
                      End;
                    End;
                  End;
                End;
              End;
            Finally
              reg.CloseKey;
            End;
          End;
        End;
      End;
    Finally
      reg.Free;
    End;

    // Проверка остановки перед переходом к следующему разделу
    If Stop Then
      Exit;

    // === 2. Обработка HKEY_LOCAL_MACHINE Components ===
    reg := TRegistry.Create;
    Try
      reg.Access := KEY_WOW64_64KEY Or KEY_READ;
      reg.RootKey := HKEY_LOCAL_MACHINE;

      If Stop Then
        Exit;
      If reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\', False) Then
      Begin
        Try
          // Получаем список компонентов
          If Stop Then
          Begin
            reg.CloseKey;
            Exit;
          End;

          reg.GetKeyNames(FileExtsName);
        Finally
          reg.CloseKey;
        End;

        For i := 0 To FileExtsName.Count - 1 Do
        Begin
          // Проверка остановки в начале каждой итерации
          If Stop Then
            Break;

          // Обновление ProgressBar
          Form1.ProgressBarRegCleaner.Position := ProcessedItems;
          Form1.Taskbar1.ProgressValue := ProcessedItems;
          Inc(ProcessedItems);

          CurrentPath := '\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\' + FileExtsName[i] + '\';

          // Обновление статуса
          If Not Stop Then
          Begin
            Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxClassKom.Caption;
            Form1.StatusBarRegCleaner.Panels[1].Text := CurrentPath;
            Application.ProcessMessages;
          End;

          If Stop Then
            Break;
          If reg.OpenKey(CurrentPath, False) Then
          Begin
            Try
              // Получаем список значений
              If Stop Then
                Break;

              reg.GetValueNames(Value);

              For g := 0 To Value.Count - 1 Do
              Begin
                If Stop Then
                  Break;

                If reg.ValueExists(Value[g]) And (reg.GetDataType(Value[g]) = rdString) Then
                Begin
                  typename := reg.ReadString(Value[g]);

                  // Нормализация пути
                  typename := StringReplace(typename, '?', ':', [rfReplaceAll]);
                  typename := StringReplace(typename, '\:', '\', [rfReplaceAll]);
                  typename := StringReplace(typename, '20:', '', [rfReplaceAll]);
                  typename := StringReplace(typename, '21:', '', [rfReplaceAll]);
                  typename := StringReplace(typename, '22:', '', [rfReplaceAll]);
                  typename := StringReplace(typename, '02:', '', [rfReplaceAll]);
                  typename := StringReplace(typename, '00:', '', [rfReplaceAll]);
                  typename := StringReplace(typename, '01:', '', [rfReplaceAll]);

                  // Пропускаем пустые строки и строки с определенными шаблонами
                  If (typename = '') Or (Pos('%', typename) > 0) Or (Pos('SOFTWARE', ANSIUpperCase(typename)) > 0) Or (Pos('CLSID', ANSIUpperCase(typename)) > 0) Or (Pos('SYSTEM', ANSIUpperCase(typename)) > 0) Or (Pos('TYPELIB', ANSIUpperCase(typename)) > 0) Or (Pos('RECORD', ANSIUpperCase(typename)) > 0) Or (Pos('\.', ANSIUpperCase(typename)) > 0) Or (Pos('WINDOWS', ANSIUpperCase(typename)) > 0) Or (Pos('SYSTEM32', ANSIUpperCase(typename)) > 0) Or (Pos('<', typename) > 0) Or (Pos('>', typename) > 0) Or (Pos('*', typename) > 0) Then
                    Continue;

                  // Проверка остановки перед проверкой существования ключей
                  If Stop Then
                    Break;

                  // Проверка существования ключа в других разделах реестра
                  rg1 := TRegistry.Create;
                  Try
                    rg1.Access := KEY_WOW64_64KEY Or KEY_READ;
                    rg1.RootKey := HKEY_LOCAL_MACHINE;
                    If rg1.KeyExists(typename) Then
                      Continue;
                  Finally
                    rg1.Free;
                  End;

                  rg2 := TRegistry.Create;
                  Try
                    rg2.Access := KEY_WOW64_64KEY Or KEY_READ;
                    rg2.RootKey := HKEY_CURRENT_USER;
                    If rg2.KeyExists(typename) Then
                      Continue;
                  Finally
                    rg2.Free;
                  End;

                  rg2 := TRegistry.Create;
                  Try
                    rg2.Access := KEY_WOW64_64KEY Or KEY_READ;
                    rg2.RootKey := HKEY_CLASSES_ROOT;
                    If rg2.KeyExists(typename) Then
                      Continue;
                  Finally
                    rg2.Free;
                  End;

                  // Проверка существования пути
                  If (typename <> '') And (Pos('%', typename) = 0) Then
                  Begin
                    // Проверка остановки перед проверкой диска
                    If Stop Then
                      Break;

                    d := Str2Char(ExtractFileDrive(RunPath(typename)));
                    If DiskExist(d) And (GetDriveType(PChar(ExtractFileDrive(RunPath(typename)))) <> DRIVE_CDROM) And (GetDriveType(PChar(ExtractFileDrive(RunPath(typename)))) <> DRIVE_REMOVABLE) And (GetDriveType(PChar(ExtractFileDrive(RunPath(typename)))) <> DRIVE_NO_ROOT_DIR) And (GetDriveType(PChar(ExtractFileDrive(RunPath(typename)))) <> DRIVE_UNKNOWN) And (Not DirectoryExists(RunPath(typename))) And (Not FileExists(typename)) And (Not ExlPathReg(LowerCase(CurrentPath))) And (Not ExlPathReg(LowerCase(typename))) Then
                    Begin
                      // Проверка остановки перед добавлением
                      If Not Stop Then
                      Begin
                        ClassListitem := Form1.ListViewRegCleaner.Items.Add;
                        With ClassListitem Do
                        Begin
                          MakeVisible(True);
                          Caption := 'HKEY_LOCAL_MACHINE';
                          SubItems.Add(CurrentPath);
                          SubItems.Add(Value[g]);
                          SubItems.Add(typename);
                          SubItems.Add(CheckBoxClassKom.Caption);
                          SubItems.Add('DelVal');
                          Checked := True;
                          Application.ProcessMessages;
                          Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                        End;
                      End;
                    End;
                  End;
                End;
              End;
            Finally
              reg.CloseKey;
            End;
          End;
        End;
      End;
    Finally
      reg.Free;
    End;

    // Проверка остановки перед переходом к следующему разделу
    If Stop Then
      Exit;

    // === 3. Обработка Component Based Servicing Packages ===
    reg := TRegistry.Create;
    Try
      reg.Access := KEY_WOW64_64KEY Or KEY_READ;
      reg.RootKey := HKEY_LOCAL_MACHINE;

      If Stop Then
        Exit;
      If reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\', False) Then
      Begin
        Try
          // Получаем список пакетов
          If Stop Then
          Begin
            reg.CloseKey;
            Exit;
          End;

          reg.GetKeyNames(FileExtsName);
        Finally
          reg.CloseKey;
        End;

        For i := 0 To FileExtsName.Count - 1 Do
        Begin
          // Проверка остановки в начале каждой итерации
          If Stop Then
            Break;

          // Обновление ProgressBar
          Form1.ProgressBarRegCleaner.Position := ProcessedItems;
          Form1.Taskbar1.ProgressValue := ProcessedItems;
          Inc(ProcessedItems);

          CurrentPath := '\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\' + FileExtsName[i];

          // Обновление статуса
          If Not Stop Then
          Begin
            Form1.StatusBarRegCleaner.Panels[0].Text := CheckBoxClassKom.Caption;
            Form1.StatusBarRegCleaner.Panels[1].Text := CurrentPath;
            Application.ProcessMessages;
          End;

          If Stop Then
            Break;
          If reg.OpenKey(CurrentPath, False) Then
          Begin
            Try
              // Проверка остановки перед чтением значения
              If Stop Then
                Break;

              If reg.ValueExists('InstallLocation') And (reg.GetDataType('InstallLocation') = rdString) Then
              Begin
                LastUsedSource := reg.ReadString('InstallLocation');

                If (LastUsedSource <> '') And (Pos('%', LastUsedSource) = 0) Then
                Begin
                  // Проверка остановки перед проверкой диска
                  If Stop Then
                    Break;

                  d := Str2Char(ExtractFileDrive(RunPath(LastUsedSource)));
                  If DiskExist(d) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_CDROM) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_REMOVABLE) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_NO_ROOT_DIR) And (GetDriveType(PChar(ExtractFileDrive(RunPath(LastUsedSource)))) <> DRIVE_UNKNOWN) And (Not DirectoryExists(RunPath(LastUsedSource))) And (Not ExlPathReg(LowerCase(CurrentPath))) And (Not ExlPathReg(LowerCase(LastUsedSource))) Then
                  Begin
                    // Проверка остановки перед добавлением
                    If Not Stop Then
                    Begin
                      ClassListitem := Form1.ListViewRegCleaner.Items.Add;
                      With ClassListitem Do
                      Begin
                        MakeVisible(True);
                        Caption := 'HKEY_LOCAL_MACHINE';
                        SubItems.Add(CurrentPath);
                        SubItems.Add('InstallLocation');
                        SubItems.Add(LastUsedSource);
                        SubItems.Add(CheckBoxClassKom.Caption);
                        SubItems.Add('DelVal');
                        Checked := True;
                        Application.ProcessMessages;
                        Form1.Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
                      End;
                    End;
                  End;
                End;
              End;
            Finally
              reg.CloseKey;
            End;
          End;
        End;
      End;
    Finally
      reg.Free;
    End;

    // Финальное обновление ProgressBar если не было остановки
    If Not Stop Then
    Begin
      Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
      Form1.Taskbar1.ProgressValue := Form1.Taskbar1.ProgressMaxValue;
    End;

  Finally
    FileExtsName.Free;
    Value.Free;
  End;
End;

Procedure TForm1.TabSheetBackupsShow(Sender: TObject);
Begin
  Try
    FindFileCopy(ExtractFilePath(ParamStr(0)) + 'backup\');
  Except
  End;
End;

Procedure TForm1.RegCopy;
Var
  i: Integer;
  RegPath, ValueName, ValueData: String;
  BackupPath: String;
Begin
  Memo1.Clear;
  Memo1.Lines.BeginUpdate;
  Try
    Memo1.Lines.Add('Windows Registry Editor Version 5.00');

    For i := 0 To ListViewRegCleaner.Items.Count - 1 Do
    Begin
      If Not ListViewRegCleaner.Items[i].Checked Then
        Continue;

      RegPath := ListViewRegCleaner.Items[i].Caption + ListViewRegCleaner.Items[i].SubItems[0];
      ValueName := ListViewRegCleaner.Items[i].SubItems[1];
      ValueData := ListViewRegCleaner.Items[i].SubItems[2];

      Memo1.Lines.Add('');
      Memo1.Lines.Add('[' + RegPath + ']');

      If ValueName <> '' Then
        Memo1.Lines.Add('"' + ValueName + '"="' + StringReplace(ValueData, '\', '\\', [rfReplaceAll]) + '"')
      Else
        Memo1.Lines.Add('@="' + StringReplace(ValueData, '\', '\\', [rfReplaceAll]) + '"');

      Application.ProcessMessages;
    End;
  Finally
    Memo1.Lines.EndUpdate;
  End;

  // Создаем директорию для backup
  BackupPath := ExtractFilePath(ParamStr(0)) + 'backup\';
  If Not DirectoryExists(BackupPath) Then
    ForceDirectories(BackupPath);

  // Сохраняем файл
  Memo1.Lines.SaveToFile(BackupPath + 'AllClear_' + FormatDateTime('yyyy-mm-dd_hh-nn-ss', Now) + '.reg', TEncoding.Unicode);
End;

Procedure TForm1.Repair;
Var
  rg: TRegistry;
  Root: HKEY;
  CurrentItem: TListItem;
  OperationType: String;
Begin
  // Инициализация интерфейса
  Form1.StatusBarRegCleaner.Panels[0].Text := '';
  Form1.RegCopy;
  Form1.ProgressBarRegCleaner.Position := 0;
  Form1.Taskbar1.ProgressValue := 0;
  Form1.ProgressBarRegCleaner.Max := Form1.ListViewRegCleaner.Items.Count - 1;
  Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarRegCleaner.Max;

  // Основной цикл обработки
  While Form1.ListViewRegCleaner.Items.Count > 0 Do
  Begin
    CurrentItem := Form1.ListViewRegCleaner.Items[0];
    CurrentItem.MakeVisible(True);

    If CurrentItem.Checked Then
    Begin
      OperationType := CurrentItem.SubItems[4];

      // Создаем экземпляр реестра только если нужно выполнить операцию
      If (OperationType = 'DelKey') Or (OperationType = 'DelVal') Then
      Begin
        rg := TRegistry.Create;
        Try
          // Устанавливаем права доступа (исправлено - убрано дублирование)
          rg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;

          // Определяем корневой раздел
          If CurrentItem.Caption = 'HKEY_CURRENT_USER' Then
            Root := HKEY_CURRENT_USER
          Else If CurrentItem.Caption = 'HKEY_LOCAL_MACHINE' Then
            Root := HKEY_LOCAL_MACHINE
          Else If CurrentItem.Caption = 'HKEY_CLASSES_ROOT' Then
            Root := HKEY_CLASSES_ROOT
          Else
            Root := HKEY_CURRENT_USER; // значение по умолчанию

          rg.RootKey := Root;

          // Выполняем операцию в зависимости от типа
          If OperationType = 'DelKey' Then
          Begin
            rg.DeleteKey(CurrentItem.SubItems[0]);
          End
          Else If OperationType = 'DelVal' Then
          Begin
            If rg.OpenKey(CurrentItem.SubItems[0], False) Then
            Begin
              rg.DeleteValue(CurrentItem.SubItems[1]);
              rg.CloseKey;
            End;
          End;
        Finally
          rg.Free;
        End;
      End;
    End;

    // Удаляем обработанный элемент
    CurrentItem.Delete;

    // Обновляем прогресс
    Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Position + 1;
    Form1.Taskbar1.ProgressValue := Form1.ProgressBarRegCleaner.Position;

    // Обрабатываем сообщения, чтобы интерфейс не "зависал"
    Application.ProcessMessages;
  End;

  // Завершение
  Form1.StatusBarRegCleaner.Panels[0].Text := LangReady.Caption;
  Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
End;

Procedure TForm1.ButtonFixClick(Sender: TObject);
Begin
  ButtonSearch.Enabled := false;
  ButtonFix.Enabled := false;
  TabControlRegOption.Enabled := false;
  TabControlRegistry.Enabled := false;
  SpeedButton_GeneralMenu.Enabled := false;
  Repair;
  ButtonSearch.Enabled := true;
  TabControlRegOption.Enabled := true;
  TabControlRegistry.Enabled := true;
  SpeedButton_GeneralMenu.Enabled := true;
End;

Procedure TForm1.ButtonRegCleanClick(Sender: TObject);
Begin
  PageControl1.ActivePageIndex := 0;
  ButtonRegClean.font.Style := [fsBold];
  ButtonExceptions.font.Style := [];
  ButtonBackups.font.Style := [];
End;

// Переход на ключ реестра

Procedure TForm1.JumpToKey(Key: String);
Var
  i, n: Integer;
  hWin: HWND;
  ExecInfo: ShellExecuteInfoA;
Begin
  hWin := FindWindowA(PAnsiChar('RegEdit_RegEdit'), Nil);
  If hWin = 0 Then
  { if Regedit doesn’t run then we launch it }
  Begin
    FillChar(ExecInfo, 60, #0);
    With ExecInfo Do
    Begin
      cbSize := 60;
      fMask := SEE_MASK_NOCLOSEPROCESS;
      lpVerb := PAnsiChar('open');
      lpFile := PAnsiChar('regedit.exe');
      nShow := 1;
    End;
    ShellExecuteExA(@ExecInfo);
    WaitForInputIdle(ExecInfo.hProcess, 200);
    hWin := FindWindowA(PAnsiChar('RegEdit_RegEdit'), Nil);
  End;
  ShowWindow(hWin, SW_SHOWMAXIMIZED);
  hWin := FindWindowExA(hWin, 0, PAnsiChar('SysTreeView32'), Nil);
  SetForegroundWindow(hWin);
  i := 30;
  Repeat
    SendMessageA(hWin, WM_KEYDOWN, VK_LEFT, 0);
    Dec(i);
  Until i = 0;
  SendMessageA(hWin, WM_KEYDOWN, VK_RIGHT, 0);
  i := 1;
  n := Length(Key);
  Repeat
    If Key[i] = '\' Then
    Begin
      SendMessageA(hWin, WM_KEYDOWN, VK_RIGHT, 0);
    End
    Else
      SendMessageA(hWin, WM_CHAR, Integer(Key[i]), 0);
    i := i + 1;
  Until i = n;
End;

Procedure JumpToKey(Key: String);
Var
  i, n: Integer;
  hWin: HWND;
  ExecInfo: ShellExecuteInfoA;
Begin
  hWin := FindWindowA(PAnsiChar('RegEdit_RegEdit'), Nil);
  If hWin = 0 Then
  { if Regedit doesn't run then we launch it }
  Begin
    FillChar(ExecInfo, 60, #0);
    With ExecInfo Do
    Begin
      cbSize := 60;
      fMask := SEE_MASK_NOCLOSEPROCESS;
      lpVerb := PAnsiChar('open');
      lpFile := PAnsiChar('regedit.exe');
      nShow := 1;
    End;
    ShellExecuteExA(@ExecInfo);
    WaitForInputIdle(ExecInfo.hProcess, 200);
    hWin := FindWindowA(PAnsiChar('RegEdit_RegEdit'), Nil);
  End;
  ShowWindow(hWin, SW_SHOWNORMAL);
  hWin := FindWindowExA(hWin, 0, PAnsiChar('SysTreeView32'), Nil);
  SetForegroundWindow(hWin);
  i := 30;
  Repeat
    SendMessageA(hWin, WM_KEYDOWN, VK_LEFT, 0);
    Dec(i);
  Until i = 0;
  // Sleep(500);
  SendMessageA(hWin, WM_KEYDOWN, VK_RIGHT, 0);
  // Sleep(500);
  i := 1;
  n := Length(Key);
  Repeat
    If Key[i] = '\' Then
    Begin
      SendMessageA(hWin, WM_KEYDOWN, VK_RIGHT, 0);
      // Sleep(500);
    End
    Else
      SendMessageA(hWin, WM_CHAR, Integer(Key[i]), 0);
    i := i + 1;
  Until i = n;
End;

Procedure TForm1.CopyKeyMenuClick(Sender: TObject);
Begin
  If ListViewRegCleaner.ItemIndex = -1 Then
    Exit;
  { JumpToKey(ListViewRegCleaner.Selected.Caption +
    ListViewRegCleaner.Selected.SubItems.Strings[0]);
    if not OpenRegEditAndJumpToKey(ListViewRegCleaner.Selected.Caption +
    ListViewRegCleaner.Selected.SubItems.Strings[0]) then
    RaiseLastOSError; }
  Clipboard.AsText := ListViewRegCleaner.Selected.SubItems.Strings[0];
End;

Procedure TForm1.AddKeyMenuClick(Sender: TObject);
Begin
  If ListViewRegCleaner.ItemIndex = -1 Then
    Exit;
  With ListViewExceptions.Items.Add Do
  Begin
    Caption := Form1.ListViewRegCleaner.Selected.SubItems[0];
    Application.ProcessMessages;
    SubItems.Add(Form1.ListViewRegCleaner.Selected.SubItems[3]);
    Application.ProcessMessages;
    Form1.ListViewRegCleaner.DeleteSelected;
    Application.ProcessMessages;
    Checked := true;
    Application.ProcessMessages;
  End;
  Form1.StatusBarRegCleaner.Panels[0].Text := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
End;

Procedure TForm1.CheckAll(Checked: boolean);
Var
  i, c: Integer;
Begin
  c := Form1.ListViewRegCleaner.Items.Count - 1;
  For i := 0 To c Do
  Begin
    Form1.ListViewRegCleaner.Items[i].Checked := Checked;
    Application.ProcessMessages;
  End;
End;

Procedure TForm1.SelectAllMenuClick(Sender: TObject);
Begin
  CheckAll(true);
  ButtonFix.Enabled := true;
End;

Procedure TForm1.ExcludeAllMenuClick(Sender: TObject);
Begin
  CheckAll(false);
  ButtonFix.Enabled := false;
End;

Procedure TForm1.OptionSaveMenuClick(Sender: TObject);
Begin
  SaveNastr;
  Application.ProcessMessages;
End;

Function IsWow64: BOOL;
Type
  TIsWow64Process = Function(hProcess: THandle; Var Wow64Process: BOOL): BOOL; Stdcall;
Var
  IsWow64Process: TIsWow64Process;
Begin
  Result := false;
  @IsWow64Process := GetProcAddress(GetModuleHandle(kernel32), 'IsWow64Process');
  If assigned(@IsWow64Process) Then
    IsWow64Process(GetCurrentProcess, Result);
End;

Function Is64BitWindows: boolean;
Var
  IsWow64Process: Function(hProcess: THandle; Out Wow64Process: BOOL): BOOL; Stdcall;
  Wow64Process: BOOL;
Begin
{$IF Defined(CPU64)}
  Result := true;
  // 64-битная программа запускается только на Win64
{$ELSEIF Defined(CPU16)}
  Result := false;
  // Win64 не поддерживает 16-разрядные приложения
{$ELSE}
  // 32-битные программы могут работать и на 32-разрядной и на 64-разрядной Windows
  // так что этот вопрос требует дальнейшего исследования
  IsWow64Process := GetProcAddress(GetModuleHandle(kernel32), 'IsWow64Process');

  Wow64Process := false;
  If assigned(IsWow64Process) Then
    Wow64Process := IsWow64Process(GetCurrentProcess, Wow64Process) And Wow64Process;

  Result := Wow64Process;
{$IFEND}
End;

Procedure TForm1.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  SaveExclusionReg;
  // SaveQuicklyClean;
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
  createicon(ListViewBackups);
  Application.ProcessMessages;
  CreateDir(ExtractFilePath(ParamStr(0)) + 'backup');
  Application.ProcessMessages;
  Form1.LoadNastr;
  LoadExclusionReg;
  Application.ProcessMessages;
  TabSheetRegistry.TabVisible := false;
  TabSheetExceptions.TabVisible := false;
  TabSheetBackups.TabVisible := false;
  Form1.PageControl1.ActivePage := TabSheetRegistry;
End;

Procedure TForm1.ButtonExceptionsClick(Sender: TObject);
Begin
  PageControl1.ActivePageIndex := 1;
  ButtonRegClean.font.Style := [];
  ButtonExceptions.font.Style := [fsBold];
  ButtonBackups.font.Style := [];
End;

Procedure TForm1.ButtonBackupsClick(Sender: TObject);
Begin
  PageControl1.ActivePageIndex := 2;
  ButtonRegClean.font.Style := [];
  ButtonExceptions.font.Style := [];
  ButtonBackups.font.Style := [fsBold];
End;

Procedure TForm1.ButtonSearchClick(Sender: TObject);
Begin
  Case ButtonSearch.Tag Of
    0:
      Begin
        ButtonFix.Enabled := false;
        ButtonSearch.Tag := 1;
        TabControlRegOption.Enabled := false;
        TabControlRegistry.Enabled := false;
        TabControlPanel.Enabled := false;
        SpeedButton_GeneralMenu.Enabled := false;
        ButtonSearch.Caption := LangStop.Caption;
        Search;
        ButtonSearch.Tag := 0;
        ButtonSearch.Caption := LangSearch.Caption;
        TabControlRegOption.Enabled := true;
        TabControlRegistry.Enabled := true;
        TabControlPanel.Enabled := true;
        SpeedButton_GeneralMenu.Enabled := true;
      End;
    1:
      Begin
        ButtonSearch.Tag := 0;
        ButtonSearch.Caption := LangSearch.Caption;
        StopSearch;
        TabControlRegOption.Enabled := true;
        TabControlRegistry.Enabled := true;
        TabControlPanel.Enabled := true;
        SpeedButton_GeneralMenu.Enabled := true;
        Form1.ProgressBarRegCleaner.Position := Form1.ProgressBarRegCleaner.Max;
        Form1.Taskbar1.ProgressValue := Form1.ProgressBarRegCleaner.Position;
      End;
  End;
End;

Procedure TForm1.BackupsRestoreMenuClick(Sender: TObject);
Begin
  If ListViewBackups.ItemIndex = -1 Then
    Exit;
  If (Form1.ListViewBackups.Selected <> Nil) And (Form1.ListViewBackups.Selected.Caption <> '') Then
  Begin
    ShellExecute(0, Nil, 'regedit.exe', pchar('/s "' + Form1.ListViewBackups.Selected.SubItems.Strings[2] + '"'), Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;
End;

Procedure TForm1.DeleteAll;
Begin
  Try
    While Form1.ListViewBackups.Items.Count > 0 Do
    Begin
      If Form1.ListViewBackups.Items[0].Checked = true Then
      Begin
        Form1.ListViewBackups.Items.Item[0].MakeVisible(true);
        DeleteFile(Form1.ListViewBackups.Items[0].SubItems.Strings[2]);
        Form1.ListViewBackups.Items[0].Delete;
        Application.ProcessMessages;
      End;
    End;
  Except
  End;
End;

Procedure TForm1.BackupsDelAllMenuClick(Sender: TObject);
Begin
  If ListViewBackups.ItemIndex = -1 Then
    Exit;
  Try
    DeleteAll;
    FindFileCopy(ExtractFilePath(ParamStr(0)) + 'backup\');
  Except
  End;
End;

Procedure TForm1.SaveExceptionsMenuClick(Sender: TObject);
Begin
  Form1.SaveNastr;
End;

Procedure TForm1.DeleteFileSelected;
Begin
  If (ListViewBackups.Selected <> Nil) And (ListViewBackups.Selected.Caption <> '') Then
  Begin
    DeleteFile(ListViewBackups.Selected.SubItems.Strings[2]);
    Application.ProcessMessages;
  End;
End;

Procedure TForm1.BackupsDelMenuClick(Sender: TObject);
Begin
  If ListViewBackups.ItemIndex = -1 Then
    Exit;
  Try
    DeleteFileSelected;
    FindFileCopy(ExtractFilePath(ParamStr(0)) + 'backup\');
  Except
  End;
End;

Procedure TForm1.DeleteAllExceptionsMenuClick(Sender: TObject);
Begin
  If ListViewExceptions.ItemIndex = -1 Then
    Exit;
  Try
    While ListViewExceptions.Items.Count > 0 Do
    Begin
      If ListViewExceptions.Items[0].Checked = true Then
      Begin
        ListViewExceptions.Items[0].Delete;
      End;
    End;
  Except
  End;
End;

Procedure TForm1.DeletaExceptionsMenuClick(Sender: TObject);
Begin
  If ListViewExceptions.ItemIndex = -1 Then
    Exit;
  Try
    If ListViewExceptions.Selected <> Nil Then
    Begin
      ListViewExceptions.DeleteSelected;
    End;
  Except
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
    ListViewBackups.Clear;
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
      ListItem := ListViewBackups.Items.Add;
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

    For i := 0 To ListViewBackups.Columns.Count - 1 Do
    Begin
      ListView_SetColumnWidth(ListViewBackups.Handle, i, LVSCW_AUTOSIZE_USEHEADER);
    End;

  Except
    // В случае ошибки возвращаем False
    Result := False;
    Exit;
  End;

  Result := FilesFound; // Возвращаем true, если найдены файлы
End;

Procedure TForm1.BackupsUpdateMenuClick(Sender: TObject);
Begin
  Try
    FindFileCopy(ExtractFilePath(ParamStr(0)) + 'backup\');
  Except
  End;
End;

Procedure TForm1.AddParameterMenuClick(Sender: TObject);
Begin
  If ListViewRegCleaner.ItemIndex = -1 Then
    Exit;
  With ListViewExceptions.Items.Add Do
  Begin
    Caption := Form1.ListViewRegCleaner.Selected.SubItems[1];
    Application.ProcessMessages;
    SubItems.Add(Form1.ListViewRegCleaner.Selected.SubItems[3]);
    Application.ProcessMessages;
    Form1.ListViewRegCleaner.DeleteSelected;
    Application.ProcessMessages;
    Checked := true;
    Application.ProcessMessages;
  End;

  Form1.StatusBarRegCleaner.Panels[0].Text := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
End;

Procedure TForm1.CheckAll1(Checked: boolean);
Var
  i: Integer;
Begin
  For i := 0 To TabControlRegOption.ControlCount - 1 Do
  Begin
    If TabControlRegOption.Controls[i] Is TCheckBox Then
      TCheckBox(TabControlRegOption.Controls[i]).Checked := Checked;
  End;

  { CheckBoxApplicationPaths.Checked := Checked;
    CheckBoxSharedDLLs.Checked := Checked;
    CheckBoxFonts
    CheckBoxHelp
    CheckBoxKnownDLLs
    CheckBoxCodec
    CheckBoxLoadUninstall
    CheckBoxInstall
    CheckBoxServices
    CheckBoxDriver
    CheckBoxFileExts
    CheckBoxHKLMSOFTWARE
    CheckBoxSound
    CheckBoxShellExtensions
    CheckBoxFirewallPolicy
    CheckBoxMUI
    CheckBoxClassKom }
  Application.ProcessMessages;
End;

Procedure TForm1.ClearListMenuClick(Sender: TObject);
Begin
  Form1.ListViewRegCleaner.Clear;
  ButtonFix.Enabled := false;
  Label1.Caption := LangTotal.Caption + IntToStr(Form1.ListViewRegCleaner.Items.Count);
End;

Procedure TForm1.OptionSelectAllMenuClick(Sender: TObject);
Begin
  CheckAll1(true);
  SaveNastr;
  Application.ProcessMessages;
End;

Procedure TForm1.OptionExcludeAllMenuClick(Sender: TObject);
Begin
  CheckAll1(false);
  SaveNastr;
  Application.ProcessMessages;
End;

Procedure TForm1.ListViewRegCleanerEditing(Sender: TObject; Item: TListItem; Var AllowEdit: boolean);
Begin
  AllowEdit := false;
  Application.ProcessMessages;
End;

Procedure TForm1.ListViewOptionClick(Sender: TObject);
Begin
  SaveNastr;
  Application.ProcessMessages;
End;

Procedure TForm1.ListViewOptionEditing(Sender: TObject; Item: TListItem; Var AllowEdit: boolean);
Begin
  AllowEdit := false;
  Application.ProcessMessages;
End;

Function SortCaptionAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  If ANSIUpperCase(Item1.Caption) > ANSIUpperCase(Item2.Caption) Then
    Result := ParamSort
  Else If ANSIUpperCase(Item1.Caption) < ANSIUpperCase(Item2.Caption) Then
    Result := -ParamSort;
End;

Function SortFirstSubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  If ANSIUpperCase(Item1.SubItems[0]) > ANSIUpperCase(Item2.SubItems[0]) Then
    Result := ParamSort
  Else If ANSIUpperCase(Item1.SubItems[0]) < ANSIUpperCase(Item2.SubItems[0]) Then
    Result := -ParamSort;
End;

Function Sort1SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  If ANSIUpperCase(Item1.SubItems[1]) > ANSIUpperCase(Item2.SubItems[1]) Then
    Result := ParamSort
  Else If ANSIUpperCase(Item1.SubItems[1]) < ANSIUpperCase(Item2.SubItems[1]) Then
    Result := -ParamSort;
End;

Function Sort2SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  If ANSIUpperCase(Item1.SubItems[2]) > ANSIUpperCase(Item2.SubItems[2]) Then
    Result := ParamSort
  Else If ANSIUpperCase(Item1.SubItems[2]) < ANSIUpperCase(Item2.SubItems[2]) Then
    Result := -ParamSort;
End;

Function Sort3SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  If ANSIUpperCase(Item1.SubItems[3]) > ANSIUpperCase(Item2.SubItems[3]) Then
    Result := ParamSort
  Else If ANSIUpperCase(Item1.SubItems[3]) < ANSIUpperCase(Item2.SubItems[3]) Then
    Result := -ParamSort;
End;

Procedure TForm1.ListViewRegCleanerColumnClick(Sender: TObject; Column: TListColumn);
Begin
  sort := -sort;
  If Column = ListViewRegCleaner.Columns[0] Then
    ListViewRegCleaner.CustomSort(@SortCaptionAsString, sort)
  Else If Column = ListViewRegCleaner.Columns[1] Then
    ListViewRegCleaner.CustomSort(@SortFirstSubItemAsString, sort)
  Else If Column = ListViewRegCleaner.Columns[2] Then
    ListViewRegCleaner.CustomSort(@Sort1SubItemAsString, sort)
  Else If Column = ListViewRegCleaner.Columns[3] Then
    ListViewRegCleaner.CustomSort(@Sort2SubItemAsString, sort)
  Else If Column = ListViewRegCleaner.Columns[4] Then
    ListViewRegCleaner.CustomSort(@Sort3SubItemAsString, sort);
End;

End.

