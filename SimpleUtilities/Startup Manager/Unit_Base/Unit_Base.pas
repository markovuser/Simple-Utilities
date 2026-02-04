Unit Unit_Base;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Registry, shellapi, Menus, ImgList,
  TLHelp32, ComObj, ShlObj, ActiveX, IniFiles, CheckLst, SHFolder, SHDocVw,
  KnownFolders, CommCtrl, pngimage, System.ImageList, FileCtrl, Vcl.Buttons,
  System.IOUtils, WindowsDarkMode, WinTask, Translation, System.UITypes,
  TaskScheduler_TLB, FileInfoUtils, MSXML, UWPUtils;

Type
  TMachineType = (mtUnknown, mt32Bit, mt64Bit, mtOther);

Type
  TWmMoving = Record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  End;

Type
  TTaskInfo = Record
    TaskName: String;
    ApplicationPath: String;
    CompatibilityAsString: String;
    Description: String;
  End;

{Type
  TListView = Class(ComCtrls.TListView)
  Protected
    Procedure WMVScroll(Var Message: TWMVScroll); Message WM_VSCROLL;
  End; }

Type
  TForm1 = Class(TForm)
    PopupMenuStartup: TPopupMenu;
    OpenFolderMenu: TMenuItem;
    PropertiesMenu: TMenuItem;
    StatusBar1: TStatusBar;
    DeleteMenu: TMenuItem;
    ListViewStartup: TListView;
    N2: TMenuItem;
    ListBoxKeys: TListBox;
    MemoSaveCopy: TMemo;
    TabControlStartup1: TTabControl;
    PopupMenuGeneral: TPopupMenu;
    RefreshListMenu: TMenuItem;
    Separator1: TMenuItem;
    ViewMenu: TMenuItem;
    IconSmallMenu: TMenuItem;
    IconBigMenu: TMenuItem;
    SpeedButton_GeneralMenu: TSpeedButton;
    PopupMenuLanguage: TPopupMenu;
    LangTotal: TMenuItem;
    LangAttention: TMenuItem;
    LangWinTaskScheduler: TMenuItem;
    LangWindowsVista: TMenuItem;
    LangDelete: TMenuItem;
    TabControlPanelStartup: TTabControl;
    ButtonAutoStartStartup: TButton;
    ButtonBackupsStartup: TButton;
    ImageList3: TImageList;
    PageControlStartup: TPageControl;
    TabBackups: TTabSheet;
    ListViewBackups: TListView;
    TabAutoStart: TTabSheet;
    PopupMenuBackups: TPopupMenu;
    BackupsUpdateMenu: TMenuItem;
    SeparatorBack1: TMenuItem;
    BackupsRestoreMenu: TMenuItem;
    SeparatorBack2: TMenuItem;
    BackupsDelAllMenu: TMenuItem;
    BackupsDelMenu: TMenuItem;
    ButtonAddStartStartup: TButton;
    TabAddStart: TTabSheet;
    TabControlStartup3: TTabControl;
    RadioButtonHKLMStartup: TRadioButton;
    RadioButtonHKCUStartup: TRadioButton;
    TabControl1: TTabControl;
    ButtonAddStartup: TButton;
    TabControlStartup2: TTabControl;
    LabelPathStartup: TLabel;
    LabelNameStartup: TLabel;
    EditPathStartup: TEdit;
    ButtonBrowseStartup: TButton;
    EditNameStartup: TEdit;
    OpenDialogStartup: TOpenDialog;
    LangOnlyWindows: TMenuItem;
    LangError: TMenuItem;
    LangElements: TMenuItem;
    LangNoNameApp: TMenuItem;
    LangSelectStartApp: TMenuItem;
    LangFileNotFound: TMenuItem;
    LangOther: TMenuItem;
    LangNotExecutable: TMenuItem;
    Procedure LoadRun;
    Procedure LoadStarFolder;
    Procedure LoadNastr;
    Procedure SaveCopy;
    Procedure removeRun;
    Procedure SaveNastr;
    Procedure FormCreate(Sender: TObject);
    Procedure ListViewStartupColumnClick(Sender: TObject; Column: TListColumn);
    Procedure PropertiesMenuClick(Sender: TObject);
    Procedure OpenFolderMenuClick(Sender: TObject);
    Function ExtractOnlyFileName(Const FileName: String): String;
    Function DelPath(Path: String): String;
    Function RunPath(Path: String): String;
    Procedure DeleteMenuClick(Sender: TObject);
    Procedure ListViewStartupClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure IconBigMenuClick(Sender: TObject);
    Procedure IconSmallMenuClick(Sender: TObject);
    Function FindFileCopy(Dir: String): Boolean;
    Procedure SpeedButton_GeneralMenuClick(Sender: TObject);
    Procedure RefreshListMenuClick(Sender: TObject);
    Procedure CleanTranslationsLikeGlobload;
    Procedure Globload;
    Procedure GlobalRun;
    Function ToggleStartupItem(Item: TListItem; Enable: Boolean): Boolean;
    Procedure UpdateSchedulerTaskWithFileInfo;
    Procedure ProcessLnkFile(ListItem: TListItem; LnkName, TargetPath, FilePath, UserType: String);
    Procedure AutoFindFileAllUser;
    Procedure SearchInStartupFolder(Const Dir: String; Const UserType: String);
    Procedure ButtonAutoStartStartupClick(Sender: TObject);
    Procedure ButtonBackupsStartupClick(Sender: TObject);
    Procedure BackupsUpdateMenuClick(Sender: TObject);
    Procedure BackupsRestoreMenuClick(Sender: TObject);
    Procedure BackupsDelAllMenuClick(Sender: TObject);
    Procedure BackupsDelMenuClick(Sender: TObject);
    Procedure ButtonAddStartStartupClick(Sender: TObject);
    Procedure ButtonBrowseStartupClick(Sender: TObject);
    Procedure ButtonAddStartupClick(Sender: TObject);
    Function IsWindows10Or11: Boolean;
    Function PortablePath: String;
    Procedure FormActivate(Sender: TObject);
    Procedure ListViewStartupItemCheckedForUWP(Sender: TObject; Item: TListItem);
    Procedure ListViewStartupItemCheckedForRegistry(Sender: TObject; Item: TListItem);
    Procedure ListViewStartupItemChecked(Sender: TObject; Item: TListItem);
    Procedure ListViewStartupItemCheckedForStartupFolder(Sender: TObject; Item: TListItem);
    Procedure ListViewStartupItemCheckedForTask(Sender: TObject; Item: TListItem);
    Procedure SaveTaskEnabledState(Task: IRegisteredTask; Enabled: Boolean);
    Procedure UpdateTaskEnabledState(Task: IRegisteredTask; Enabled: Boolean);
    Procedure UpdateTaskEnabledStateAlternative(TaskPath: String; Enabled: Boolean);
    Procedure ListViewStartupSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);

  Private
    WinTasks: TWinTaskScheduler;
    SelectedTaskIndex: Integer;

    Procedure LoadAllUWPStartupTasks;

    Procedure WMMouseMove(Var Message: TWMMouseMove); Message WM_MOUSEMOVE;
    Procedure WMSettingChange(Var Message: TWMSettingChange); Message WM_SETTINGCHANGE;
    Procedure Task;
  Public
    { Public declarations }
  End;

Var
  Form1: TForm1;
  reg, R: TRegistry;
  Stop: Boolean;
  i, Msg, AIndex: Integer;
  Sort: Integer = 1;
  PUTI, FileDescription, CompanyName, PUTI0: String;
  Portable: Boolean;

Const
  STARTUP_STATE_DISABLED_BY_SYSTEM = $01;
  STARTUP_STATE_ENABLED_BY_USER = $02;
  STARTUP_STATE_DISABLED_BY_USER = $03;
  STARTUP_STATE_SOFT_DISABLED_BY_SYSTEM = $04;
  STARTUP_STATE_DISABLED_BY_POLICY = $05;
  STARTUP_STATE_ENABLED_BY_POLICY = $06;
  STARTUP_DISABLED = $03;
  STARTUP_ENABLED = $02;
  STARTUP_DISABLED_BY_USER = $01;
  TASK_CREATE_OR_UPDATE = 6;
  TASK_LOGON_NONE = 0;
  TASK_ENUM_HIDDEN = $1;

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
      Application.ProcessMessages;
    End;

    If DarkModeIsEnabled = False Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      Application.ProcessMessages;
    End;
  End;
  Ini.Free;
End;

{Procedure TListView.WMVScroll(Var Message: TWMVScroll);
Begin
  TWinControl(self).DefaultHandler(Message);
End; }

Function SortCaptionAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  Try
    If (Item1 <> Nil) And (Item2 <> Nil) Then
    Begin
      If AnsiUpperCase(Item1.Caption) > AnsiUpperCase(Item2.Caption) Then
        Result := ParamSort
      Else If AnsiUpperCase(Item1.Caption) < AnsiUpperCase(Item2.Caption) Then
        Result := -ParamSort;
    End;
  Except
    Result := 0;
  End;
End;

Function SortFirstSubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  Try
    If (Item1 <> Nil) And (Item2 <> Nil) And (Item1.SubItems.Count > 0) And (Item2.SubItems.Count > 0) Then
    Begin
      If AnsiUpperCase(Item1.SubItems[0]) > AnsiUpperCase(Item2.SubItems[0]) Then
        Result := ParamSort
      Else If AnsiUpperCase(Item1.SubItems[0]) < AnsiUpperCase(Item2.SubItems[0]) Then
        Result := -ParamSort;
    End;
  Except
    Result := 0;
  End;
End;

Function Sort1SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  Try
    If (Item1 <> Nil) And (Item2 <> Nil) And (Item1.SubItems.Count > 1) And (Item2.SubItems.Count > 1) Then
    Begin
      If AnsiUpperCase(Item1.SubItems[1]) > AnsiUpperCase(Item2.SubItems[1]) Then
        Result := ParamSort
      Else If AnsiUpperCase(Item1.SubItems[1]) < AnsiUpperCase(Item2.SubItems[1]) Then
        Result := -ParamSort;
    End;
  Except
    Result := 0;
  End;
End;

Function Sort2SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  Try
    If (Item1 <> Nil) And (Item2 <> Nil) And (Item1.SubItems.Count > 2) And (Item2.SubItems.Count > 2) Then
    Begin
      If AnsiUpperCase(Item1.SubItems[2]) > AnsiUpperCase(Item2.SubItems[2]) Then
        Result := ParamSort
      Else If AnsiUpperCase(Item1.SubItems[2]) < AnsiUpperCase(Item2.SubItems[2]) Then
        Result := -ParamSort;
    End;
  Except
    Result := 0;
  End;
End;

Function Sort3SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  Try
    If (Item1 <> Nil) And (Item2 <> Nil) And (Item1.SubItems.Count > 3) And (Item2.SubItems.Count > 3) Then
    Begin
      If AnsiUpperCase(Item1.SubItems[3]) > AnsiUpperCase(Item2.SubItems[3]) Then
        Result := ParamSort
      Else If AnsiUpperCase(Item1.SubItems[3]) < AnsiUpperCase(Item2.SubItems[3]) Then
        Result := -ParamSort;
    End;
  Except
    Result := 0;
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

Function ExtractFileNameEx(FileName: String; ShowExtension: Boolean): String;
// Функция возвращает имя файла, без или с его расширением.
Var
  i: Integer;
  S, S1: String;
Begin
  i := Length(FileName);
  If i <> 0 Then
  Begin
    While (FileName[i] <> '\') And (i > 0) Do
      i := i - 1;
    S := Copy(FileName, i + 1, Length(FileName) - i);
    i := Length(S);
    If i = 0 Then
    Begin
      Result := '';
      Exit;
    End;
    While (S[i] <> '.') And (i > 0) Do
      i := i - 1;
    S1 := Copy(S, 1, i - 1);
    If S1 = '' Then
      S1 := S;
    If ShowExtension = true Then
      Result := S
    Else
      Result := S1;
  End
  Else
    Result := '';
End;

Function TForm1.RunPath(Path: String): String;
Var
  TempPath, TestPath: String;
  IsWow64: BOOL;
Begin
  // Оригинальная обработка как в вашей функции
  TempPath := Trim(Path);
  TempPath := StringReplace(TempPath, '\\', '\', [rfReplaceAll]);
  TempPath := StringReplace(TempPath, '\"', '"', [rfReplaceAll]);
  TempPath := StringReplace(TempPath, '"', '', [rfReplaceAll]);
  TempPath := StringReplace(TempPath, '%windir%', GetSpecialFolderPath(CSIDL_WINDOWS), [rfIgnoreCase]);
  TempPath := StringReplace(TempPath, 'rundll32.exe', '', [rfIgnoreCase]);
  TempPath := StringReplace(TempPath, 'rundll32', '', [rfIgnoreCase]);
  TempPath := LowerCase(Trim(TempPath));

  // Убираем параметры после запятой
  If Pos(',', TempPath) > 0 Then
    TempPath := Copy(TempPath, 1, Pos(',', TempPath) - 1);
  TempPath := Trim(TempPath);

  // Если путь содержит system32, проверяем все варианты
  If Pos('system32', TempPath) > 0 Then
  Begin
    // 1. Оригинальный путь
    If FileExists(TempPath) Then
    Begin
      Result := DelPath(TempPath);
      Exit;
    End;

    // Проверяем WOW64
    IsWow64 := False;
    IsWow64Process(GetCurrentProcess, IsWow64);

    // 2. SysNative (только для WOW64)
    If IsWow64 Then
    Begin
      TestPath := StringReplace(TempPath, 'system32', 'sysnative', [rfReplaceAll]);
      If FileExists(TestPath) Then
      Begin
        Result := DelPath(TestPath);
        Exit;
      End;
    End;

    // 3. SysWOW64
    TestPath := StringReplace(TempPath, 'system32', 'syswow64', [rfReplaceAll]);
    If FileExists(TestPath) Then
    Begin
      Result := DelPath(TestPath);
      Exit;
    End;

    Result := '';
  End
  Else
  Begin
    // Для обычных путей
    Result := DelPath(TempPath);
  End;
End;

Function TForm1.DelPath(Path: String): String;
Var
  i, j, QuoteCount: Integer;
  CleanPath, LowerPath, NextWord, TestPath: String;
  ParamKeywords: TStringList;
  InQuotedPath: Boolean;
Begin
  CleanPath := Trim(Path);
  Result := CleanPath;

  If CleanPath = '' Then
    Exit;

  // Заменяем двойные обратные слеши на одинарные
  CleanPath := StringReplace(CleanPath, '\\', '\', [rfReplaceAll]);
  CleanPath := StringReplace(CleanPath, '\"', '"', [rfReplaceAll]);

  // Удаляем обрамляющие кавычки, если они есть
  If (Length(CleanPath) > 1) And (CleanPath[1] = '"') And (CleanPath[Length(CleanPath)] = '"') Then
  Begin
    CleanPath := Copy(CleanPath, 2, Length(CleanPath) - 2);
    CleanPath := Trim(CleanPath);
  End;

  // Если путь начинается с кавычки, находим закрывающую кавычку
  If (Length(CleanPath) > 0) And (CleanPath[1] = '"') Then
  Begin
    i := Pos('"', Copy(CleanPath, 2, MaxInt));
    If i > 0 Then
    Begin
      Result := Copy(CleanPath, 2, i - 1);
      // Проверяем существование файла
      If FileExists(Result) Then
        Exit;
      // Если не найден, пробуем добавить .exe
      If ExtractFileExt(Result) = '' Then
      Begin
        TestPath := Result + '.exe';
        If FileExists(TestPath) Then
        Begin
          Result := TestPath;
          Exit;
        End;
      End;
    End;
  End;

  // Подсчитываем кавычки в строке
  QuoteCount := 0;
  For i := 1 To Length(CleanPath) Do
    If CleanPath[i] = '"' Then
      Inc(QuoteCount);

  // Если есть непарные кавычки, убираем все кавычки
  If (QuoteCount > 0) And (QuoteCount Mod 2 <> 0) Then
    CleanPath := StringReplace(CleanPath, '"', '', [rfReplaceAll]);

  CleanPath := Trim(CleanPath);

  // Ищем первый пробел вне кавычек
  InQuotedPath := False;
  For i := 1 To Length(CleanPath) Do
  Begin
    If CleanPath[i] = '"' Then
      InQuotedPath := Not InQuotedPath
    Else If (CleanPath[i] = ' ') And (Not InQuotedPath) Then
    Begin
      // Проверяем, начинается ли следующий токен с символа параметра
      If (i < Length(CleanPath)) And CharInSet(CleanPath[i + 1], ['/', '-']) Then
      Begin
        Result := Trim(Copy(CleanPath, 1, i));
        Break;
      End;

      // Пропускаем пробелы
      j := i;
      While (j <= Length(CleanPath)) And (CleanPath[j] = ' ') Do
        Inc(j);

      // Проверяем ключевые слова параметров
      If j <= Length(CleanPath) Then
      Begin
        ParamKeywords := TStringList.Create;
        Try
          ParamKeywords.Add('run');
          ParamKeywords.Add('start');
          ParamKeywords.Add('min');
          ParamKeywords.Add('minimize');
          ParamKeywords.Add('hide');
          ParamKeywords.Add('hidden');
          ParamKeywords.Add('silent');
          ParamKeywords.Add('background');
          ParamKeywords.Add('tray');
          ParamKeywords.Add('launch');
          ParamKeywords.Add('execute');
          ParamKeywords.Add('cmd');
          ParamKeywords.Add('exe');
          ParamKeywords.Add('--');
          ParamKeywords.Add('-');

          LowerPath := LowerCase(Copy(CleanPath, j, MaxInt));

          For Var k := 0 To ParamKeywords.Count - 1 Do
          Begin
            Var Keyword := ParamKeywords[k];
            If (LowerCase(Copy(LowerPath, 1, Length(Keyword))) = Keyword) And ((Length(LowerPath) = Length(Keyword)) Or (Length(LowerPath) > Length(Keyword)) And (LowerPath[Length(Keyword) + 1] = ' ')) Then
            Begin
              Result := Trim(Copy(CleanPath, 1, i - 1));
              Break;
            End;
          End;
        Finally
          ParamKeywords.Free;
        End;
      End;

      If Result <> CleanPath Then
        Break;
    End;
  End;

  // Если не нашли параметры, используем всю строку
  If i > Length(CleanPath) Then
    Result := CleanPath;

  // После удаления параметров проверяем вариации Program Files
  TestPath := StringReplace(Result, '%programfiles%', GetEnvironmentVariable('SystemDrive') + '\Program Files (x86)', [rfReplaceAll, rfIgnoreCase]);
  If FileExists(TestPath) Then
  Begin
    Result := TestPath;
    Exit;
  End;

  TestPath := StringReplace(Result, '%programfiles%', GetEnvironmentVariable('SystemDrive') + '\Program Files', [rfReplaceAll, rfIgnoreCase]);
  If FileExists(TestPath) Then
  Begin
    Result := TestPath;
    Exit;
  End;

  // Проверяем системные пути
  TestPath := StringReplace(Result, '%programfiles%', GetSpecialFolderPath(CSIDL_PROGRAM_FILESX86), [rfReplaceAll, rfIgnoreCase]);
  If FileExists(TestPath) Then
  Begin
    Result := TestPath;
    Exit;
  End;

  TestPath := StringReplace(Result, '%programfiles%', GetSpecialFolderPath(CSIDL_PROGRAM_FILES), [rfReplaceAll, rfIgnoreCase]);
  If FileExists(TestPath) Then
  Begin
    Result := TestPath;
    Exit;
  End;

  // Если файл существует без замен, возвращаем как есть
  If FileExists(Result) Then
    Exit;

  // Если файл не найден, пробуем добавить .exe
  If ExtractFileExt(Result) = '' Then
  Begin
    TestPath := Result + '.exe';
    If FileExists(TestPath) Then
    Begin
      Result := TestPath;
      Exit;
    End;
  End;
End;

Function DeleteFileWithUndo(sFileName: String): Boolean;
Var
  fos: TSHFileOpStruct;
Begin
  sFileName := sFileName + #0;
  FillChar(fos, SizeOf(fos), 0);
  With fos Do
  Begin
    wFunc := FO_DELETE;
    pFrom := pchar(sFileName);
    fFlags := FOF_ALLOWUNDO Or FOF_NOCONFIRMATION Or FOF_SILENT;
  End;
  Result := (0 = ShFileOperation(fos));
End;

Function GetFileNamefromLink(LinkFileName: String): String;
Var
  MyObject: IUnknown;
  MySLink: IShellLink;
  MyPFile: IPersistFile;
  FileInfo: TWin32FINDDATA;
  WidePath: Array[0..MAX_PATH] Of WideChar;
  Buff: Array[0..MAX_PATH] Of char;
Begin
  Result := '';
  If (fileexists(LinkFileName) = False) Then
    Exit;
  MyObject := CreateComObject(CLSID_ShellLink);
  MyPFile := MyObject As IPersistFile;
  MySLink := MyObject As IShellLink;
  StringToWideChar(LinkFileName, WidePath, SizeOf(WidePath));
  MyPFile.Load(WidePath, STGM_READ);
  MySLink.GetPath(Buff, MAX_PATH, FileInfo, SLGP_UNCPRIORITY);
  Result := Buff;
End;

{Function TForm1.GetBinaryPlatform(aFileName: String): String;
Var
  BinaryType: DWORD;
Begin
  If Not FileExists(aFileName) Then
  Begin
    Result := LangFileNotFound.caption;
    Exit;
  End;

  If GetBinaryType(PChar(aFileName), BinaryType) Then
  Begin
    If BinaryType = SCS_32BIT_BINARY Then
      Result := '32-bit'
    Else If BinaryType = SCS_64BIT_BINARY Then
      Result := '64-bit'
    Else
      Result := LangOther.Caption + ' (' + IntToStr(BinaryType) + ')';
  End
  Else
  Begin
    Result := LangNotExecutable.Caption;
  End;
End;    }

Procedure TForm1.ButtonAddStartStartupClick(Sender: TObject);
Begin
  Form1.PageControlStartup.ActivePageIndex := 2;
  ButtonAddStartStartup.Font.Style := [fsBold];
  ButtonAutoStartStartup.Font.Style := [];
  ButtonBackupsStartup.Font.Style := [];
  // form2.ShowModal;
  Application.ProcessMessages;
End;

Procedure TForm1.ButtonAddStartupClick(Sender: TObject);
Begin
  Try
    If EditNameStartup.Text = '' Then
    Begin
      Application.Messagebox(Pchar(LangNoNameApp.Caption), PChar(LangError.Caption), mb_iconerror Or mb_ok);
      Exit;
    End;
    If EditPathStartup.Text = '' Then
    Begin
      Application.Messagebox(PChar(LangSelectStartApp.Caption), PChar(LangError.Caption), mb_iconerror Or mb_ok);
      Exit;
    End;
    If RadioButtonHKLMStartup.Checked Then
    Begin
      reg := TRegistry.Create(KEY_ALL_ACCESS Or KEY_WOW64_64KEY Or KEY_WOW64_32KEY);
      reg.RootKey := HKEY_LOCAL_MACHINE;
      reg.Access := KEY_WOW64_32KEY Or KEY_ALL_ACCESS;
      reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
      reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', true);
      reg.WriteString(EditNameStartup.Text, EditPathStartup.Text);
      reg.CloseKey;
      reg.Free;
    End;
    If RadioButtonHKCUStartup.Checked Then
    Begin
      reg := TRegistry.Create(KEY_ALL_ACCESS Or KEY_WOW64_64KEY Or KEY_WOW64_32KEY);
      reg.RootKey := HKEY_CURRENT_USER;
      reg.Access := KEY_WOW64_32KEY Or KEY_ALL_ACCESS;
      reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', true);
      reg.WriteString(EditNameStartup.Text, EditPathStartup.Text);
      reg.CloseKey;
      reg.Free;
    End;
    EditPathStartup.Clear;
    EditNameStartup.Clear;
    // form1.FormActivate(Sender);
  Except
  End;
  Form1.ButtonAutoStartStartupClick(Sender);
  Application.ProcessMessages;
End;

Procedure TForm1.ButtonAutoStartStartupClick(Sender: TObject);
Begin
  Form1.PageControlStartup.ActivePageIndex := 0;
  ButtonAutoStartStartup.Font.Style := [fsBold];
  ButtonAddStartStartup.Font.Style := [];
  ButtonBackupsStartup.Font.Style := [];
  // Form1.GlobalRun;
  Application.ProcessMessages;
End;

Procedure TForm1.ButtonBackupsStartupClick(Sender: TObject);
Begin
  Form1.PageControlStartup.ActivePageIndex := 1;
  ButtonAutoStartStartup.Font.Style := [];
  ButtonBackupsStartup.Font.Style := [fsBold];
  ButtonAddStartStartup.Font.Style := [];
  Try
    FindFileCopy(ExtractFilePath(paramstr(0)) + 'backup\');
  Except
  End;
End;

Procedure TForm1.ButtonBrowseStartupClick(Sender: TObject);
Begin
  Try
    If OpenDialogStartup.Execute Then
    Begin
      EditPathStartup.Text := OpenDialogStartup.FileName;
      ButtonAddStartup.Enabled := true;
      EditNameStartup.Text := ExtractFileNameEx(EditPathStartup.Text, False);
    End;
    self.ActiveControl := Nil;
  Except
  End;
End;


// Извлечение имени файла
Function TForm1.ExtractOnlyFileName(Const FileName: String): String;
Begin
  Result := stringreplace(ExtractFileName(FileName), ExtractFileExt(FileName), '', []);
  Application.ProcessMessages;
End;

Function TForm1.ToggleStartupItem(Item: TListItem; Enable: Boolean): Boolean;
Var
  uniqueID, rootKey, regPath, valueName: String;
  parts: TStringList;
  tempReg: TRegistry;
  i: integer;
Begin
  Result := False;

  If Item.SubItems.Count >= 10 Then
  Begin
    uniqueID := Item.SubItems[9];
    parts := TStringList.Create;
    Try
      // Парсим уникальный идентификатор: HKLM\Path\Value или HKCU\Path\Value
      parts.Delimiter := '\';
      parts.DelimitedText := uniqueID;

      If parts.Count >= 3 Then
      Begin
        rootKey := parts[0];
        valueName := parts[parts.Count - 1];

        // Формируем путь без первого элемента (корневой ключ) и последнего (имя значения)
        regPath := '';
        For i := 1 To parts.Count - 2 Do
        Begin
          If regPath <> '' Then
            regPath := regPath + '\';
          regPath := regPath + parts[i];
        End;

        tempReg := TRegistry.Create;
        Try
          If rootKey = 'HKLM' Then
          Begin
            tempReg.RootKey := HKEY_LOCAL_MACHINE;
            tempReg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
          End
          Else If rootKey = 'HKCU' Then
          Begin
            tempReg.RootKey := HKEY_CURRENT_USER;
            tempReg.Access := KEY_WOW64_32KEY Or KEY_ALL_ACCESS;
          End
          Else
            Exit;

          If tempReg.OpenKey(regPath, False) Then
          Begin
            // Здесь можно сохранить оригинальное значение перед отключением
            // или просто пометить как отключенное в своем реестре
            Result := True;
          End;
        Finally
          tempReg.Free;
        End;
      End;
    Finally
      parts.Free;
    End;
  End;
End;

Procedure TForm1.LoadRun;
Var
  i, g: Integer;
  path, valueName: String;
  ShInfo: TSHFileInfo;
  keys: TStringList;
  isEnabled: Boolean;
  reg, regStartupApproved: TRegistry;
  startupApprovedPath: String;
  tempData: Array[0..11] Of Byte;
  dataSize, j: Integer;
Begin
  // Очистка ListView
  Form1.ListViewStartup.Clear;

  // HKEY_LOCAL_MACHINE x64
  For g := 0 To Form1.ListBoxKeys.Items.Count - 1 Do
  Begin
    keys := TStringList.Create;
    reg := TRegistry.Create(KEY_READ Or KEY_WOW64_64KEY);
    reg.RootKey := HKEY_LOCAL_MACHINE;

    If reg.OpenKey(Form1.ListBoxKeys.Items.Strings[g], False) Then
    Begin
      reg.GetValueNames(keys);
      startupApprovedPath := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run';

      regStartupApproved := TRegistry.Create(KEY_READ Or KEY_WOW64_64KEY);
      Try
        regStartupApproved.RootKey := HKEY_LOCAL_MACHINE;

        // Открываем ключ StartupApproved
        If regStartupApproved.OpenKey(startupApprovedPath, False) Then
        Begin
          For i := 0 To keys.Count - 1 Do
          Begin
            valueName := keys[i];
            path := reg.ReadString(valueName);

            If path <> '' Then
            Begin
              // Проверяем состояние в StartupApproved
              isEnabled := True; // По умолчанию включено

              If regStartupApproved.ValueExists(valueName) Then
              Begin
                // Инициализируем массив
                For j := 0 To 11 Do
                  tempData[j] := 0;
                dataSize := SizeOf(tempData);

                // Читаем двоичные данные
                If regStartupApproved.ReadBinaryData(valueName, tempData, dataSize) = 12 Then
                Begin
                  // Проверяем первый байт
                  Case tempData[0] Of
                    $02, $06:
                      isEnabled := True;  // Включено
                    $01, $03, $04, $05:
                      isEnabled := False; // Отключено
                  Else
                    isEnabled := True; // По умолчанию включено
                  End;
                End;
              End;

              With ListViewStartup.Items.Add Do
              Begin
                Caption := valueName;
                Checked := isEnabled;
                GroupID := 0;

                SubItems.Add(path);
                SubItems.Add(GetBinaryPlatform(RunPath(path)));
                SubItems.Add(getFileDescription(RunPath(path)));
                SubItems.Add(getCompanyName(RunPath(path)));
                SubItems.Add(GetFileVersion(RunPath(path)));
                SubItems.Add(GetNormalSize(GetMyFileSize(pchar(RunPath(path)))));
                SubItems.Add('HKEY_LOCAL_MACHINE');
                SubItems.Add(Form1.ListBoxKeys.Items.Strings[g]);
                SubItems.Add('Registry');
                SubItems.Add(RunPath(path));

                If FileExists(RunPath(path)) Then
                Begin
                  SHGetFileInfo(pchar(RunPath(path)), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
                  ImageIndex := ShInfo.iIcon;
                End
                Else
                  ImageIndex := -1;

                Application.ProcessMessages;
              End;
            End;
          End;
          regStartupApproved.CloseKey;
        End;
      Finally
        regStartupApproved.Free;
      End;
    End;

    reg.Free;
    keys.Free;
  End;

  // HKEY_CURRENT_USER x86
  For g := 0 To Form1.ListBoxKeys.Items.Count - 1 Do
  Begin
    keys := TStringList.Create;
    reg := TRegistry.Create(KEY_READ Or KEY_WOW64_32KEY);
    reg.RootKey := HKEY_CURRENT_USER;

    If reg.OpenKey(Form1.ListBoxKeys.Items.Strings[g], False) Then
    Begin
      reg.GetValueNames(keys);
      startupApprovedPath := 'Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run';

      regStartupApproved := TRegistry.Create(KEY_READ);
      Try
        regStartupApproved.RootKey := HKEY_CURRENT_USER;

        // Открываем ключ StartupApproved
        If regStartupApproved.OpenKey(startupApprovedPath, False) Then
        Begin
          For i := 0 To keys.Count - 1 Do
          Begin
            valueName := keys[i];
            path := reg.ReadString(valueName);

            If path <> '' Then
            Begin
              // Проверяем состояние в StartupApproved
              isEnabled := True; // По умолчанию включено

              If regStartupApproved.ValueExists(valueName) Then
              Begin
                For j := 0 To 11 Do
                  tempData[j] := 0;
                dataSize := SizeOf(tempData);

                If regStartupApproved.ReadBinaryData(valueName, tempData, dataSize) = 12 Then
                Begin
                  Case tempData[0] Of
                    $02, $06:
                      isEnabled := True;  // Включено
                    $01, $03, $04, $05:
                      isEnabled := False; // Отключено
                  Else
                    isEnabled := True; // По умолчанию включено
                  End;
                End;
              End;

              With ListViewStartup.Items.Add Do
              Begin
                Caption := valueName;
                Checked := isEnabled;
                GroupID := 0;

                SubItems.Add(path);
                SubItems.Add(GetBinaryPlatform(RunPath(path)));
                SubItems.Add(getFileDescription(RunPath(path)));
                SubItems.Add(getCompanyName(RunPath(path)));
                SubItems.Add(GetFileVersion(RunPath(path)));
                SubItems.Add(GetNormalSize(GetMyFileSize(pchar(RunPath(path)))));
                SubItems.Add('HKEY_CURRENT_USER');
                SubItems.Add(Form1.ListBoxKeys.Items.Strings[g]);
                SubItems.Add('Registry');
                SubItems.Add(RunPath(path));

                If FileExists(RunPath(path)) Then
                Begin
                  SHGetFileInfo(pchar(RunPath(path)), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
                  ImageIndex := ShInfo.iIcon;
                End
                Else
                  ImageIndex := -1;

                Application.ProcessMessages;
              End;
            End;
          End;
          regStartupApproved.CloseKey;
        End;
      Finally
        regStartupApproved.Free;
      End;
    End;

    reg.Free;
    keys.Free;
  End;

  Application.ProcessMessages;
End;

Procedure TForm1.AutoFindFileAllUser;
Var
  AllUserPath, CurrentUserPath: String;
Begin
  // Получаем пути к папкам автозагрузки
  AllUserPath := GetSpecialFolderPath(CSIDL_COMMON_STARTUP);
  CurrentUserPath := GetSpecialFolderPath(CSIDL_STARTUP);

  // Добавляем обратные слеши если их нет
  AllUserPath := IncludeTrailingPathDelimiter(AllUserPath);
  CurrentUserPath := IncludeTrailingPathDelimiter(CurrentUserPath);

  // Ищем в папке All User
  If SysUtils.DirectoryExists(AllUserPath) Then
    SearchInStartupFolder(AllUserPath, 'All User');

  // Ищем в папке Current User
  If SysUtils.DirectoryExists(CurrentUserPath) Then
    SearchInStartupFolder(CurrentUserPath, 'Current User');
End;

Procedure TForm1.SearchInStartupFolder(Const Dir: String; Const UserType: String);
Var
  DirInfo: TSearchRec;
  FindRes: Integer;
  ListItem: TListItem;
  ShInfo: TSHFileInfo;
  S, s2, lnkName, startupKey: String;
  FilePath: String;
  isEnabled: Boolean;
  regStartupApproved: TRegistry;
  tempData: Array[0..11] Of Byte;
  dataSize, j: Integer;
Begin
  FilePath := IncludeTrailingPathDelimiter(Dir);

  // Проверяем состояние в StartupApproved\StartupFolder
  regStartupApproved := TRegistry.Create(KEY_READ);
  Try
    regStartupApproved.RootKey := HKEY_CURRENT_USER;

    FindRes := FindFirst(FilePath + '*.*', faAnyFile, DirInfo);
    Try
      While FindRes = 0 Do
      Begin
        Application.ProcessMessages;

        // Пропускаем системные директории . и ..
        If (DirInfo.Attr And faDirectory) = faDirectory Then
        Begin
          If (DirInfo.Name = '.') Or (DirInfo.Name = '..') Then
          Begin
            FindRes := FindNext(DirInfo);
            Continue;
          End;

          // Рекурсивный вызов для поддиректорий
          SearchInStartupFolder(FilePath + DirInfo.Name, UserType);
          FindRes := FindNext(DirInfo);
          Continue;
        End;

        // Пропускаем desktop.ini
        If SameText(DirInfo.Name, 'desktop.ini') Then
        Begin
          FindRes := FindNext(DirInfo);
          Continue;
        End;

        ListItem := Form1.ListViewStartup.Items.Add;

        With ListItem Do
        Begin
          // Обработка не-LNK файлов
          If Not SameText(ExtractFileExt(DirInfo.Name), '.lnk') Then
          Begin
            Caption := ExtractOnlyFileName(DirInfo.Name);
            GroupID := 1;
            SubItems.Add(FilePath + DirInfo.Name);
            SubItems.Add(GetFileVersion(FilePath + DirInfo.Name));
            SubItems.Add(GetBinaryPlatform(FilePath + DirInfo.Name));
            SubItems.Add(getFileDescription(FilePath + DirInfo.Name));
            SubItems.Add(getCompanyName(FilePath + DirInfo.Name));
            SubItems.Add(GetFileVersion(FilePath + DirInfo.Name));
            SubItems.Add(GetNormalSize(GetMyFileSize(PChar(FilePath + DirInfo.Name))));
            SubItems.Add(AnsiUpperCase(UserType));
            SubItems.Add(FilePath);
            SubItems.Add('Start Menu');
            SubItems.Add(FilePath + DirInfo.Name);

            // Проверяем, отключен ли этот ярлык
            startupKey := 'Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder';
            isEnabled := True;

            If regStartupApproved.OpenKey(startupKey, False) Then
            Begin
              // Для папок автозагрузки используется полный путь к файлу как ключ
              If regStartupApproved.ValueExists(FilePath + DirInfo.Name) Then
              Begin
                // Инициализируем временный массив
                For j := 0 To 11 Do
                  tempData[j] := 0;
                dataSize := SizeOf(tempData);

                // Читаем данные
                If regStartupApproved.ReadBinaryData(FilePath + DirInfo.Name, tempData, dataSize) = 12 Then
                Begin
                  // Проверяем первый байт
                  Case tempData[0] Of
                    $02, $06:
                      isEnabled := True;  // Включено
                    $01, $03, $04, $05:
                      isEnabled := False; // Отключено
                  Else
                    isEnabled := True; // По умолчанию включено
                  End;
                End;
              End;
              regStartupApproved.CloseKey;
            End;

            Checked := isEnabled;

            If SHGetFileInfo(PChar(FilePath + DirInfo.Name), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX) <> 0 Then
              ImageIndex := ShInfo.iIcon;
          End
          // Обработка LNK файлов
          Else If SameText(ExtractFileExt(DirInfo.Name), '.lnk') Then
          Begin
            S := GetFileNamefromLink(FilePath + DirInfo.Name);
            s2 := StringReplace(S, ' (x86)', '', [rfReplaceAll, rfIgnoreCase]);

            If FileExists(S) Then
              ProcessLnkFile(ListItem, DirInfo.Name, S, FilePath, UserType)
            Else If FileExists(s2) Then
              ProcessLnkFile(ListItem, DirInfo.Name, s2, FilePath, UserType)
            Else
              ProcessLnkFile(ListItem, DirInfo.Name, S, FilePath, UserType);

            // Проверяем состояние для LNK файла
            startupKey := 'Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder';
            isEnabled := True;

            If regStartupApproved.OpenKey(startupKey, False) Then
            Begin
              // Используем полный путь к LNK файлу
              lnkName := FilePath + DirInfo.Name;
              If regStartupApproved.ValueExists(lnkName) Then
              Begin
                // Инициализируем временный массив
                For j := 0 To 11 Do
                  tempData[j] := 0;
                dataSize := SizeOf(tempData);

                If regStartupApproved.ReadBinaryData(lnkName, tempData, dataSize) = 12 Then
                Begin
                  Case tempData[0] Of
                    $02, $06:
                      isEnabled := True;
                    $01, $03, $04, $05:
                      isEnabled := False;
                  Else
                    isEnabled := True;
                  End;
                End;
              End;
              regStartupApproved.CloseKey;
            End;

            ListItem.Checked := isEnabled;
          End;
        End;

        FindRes := FindNext(DirInfo);
        Application.ProcessMessages;
      End;
    Finally
      FindClose(DirInfo);
    End;
  Finally
    regStartupApproved.Free;
  End;
End;

Procedure TForm1.ProcessLnkFile(ListItem: TListItem; LnkName, TargetPath, FilePath, UserType: String);
Var
  ShInfo: TSHFileInfo;
  lnkPath: String;
Begin
  lnkPath := FilePath + LnkName;

  With ListItem Do
  Begin
    Caption := ExtractOnlyFileName(LnkName);
    GroupID := 1;

    // 0 - Целевой путь
    SubItems.Add(TargetPath);
    // 1 - Версия файла
    SubItems.Add(GetFileVersion(TargetPath));
    // 2 - Платформа
    SubItems.Add(GetBinaryPlatform(TargetPath));
    // 3 - Описание файла
    SubItems.Add(getFileDescription(TargetPath));
    // 4 - Компания
    SubItems.Add(getCompanyName(TargetPath));
    // 5 - Версия файла (дублирует 1)
    SubItems.Add(GetFileVersion(TargetPath));
    // 6 - Размер файла
    SubItems.Add(GetNormalSize(GetMyFileSize(PChar(TargetPath))));
    // 7 - Тип пользователя
    SubItems.Add(AnsiUpperCase(UserType));
    // 8 - Папка где лежит ярлык
    SubItems.Add(FilePath);
    // 9 - Тип (Start Menu)
    SubItems.Add('Start Menu');
    // 10 - Полный путь к ярлыку
    SubItems.Add(lnkPath);

    If FileExists(TargetPath) Then
    Begin
      If SHGetFileInfo(PChar(TargetPath), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX) <> 0 Then
        ImageIndex := ShInfo.iIcon;
    End
    Else
    Begin
      // Если целевой файл не найден, используем иконку ярлыка
      If SHGetFileInfo(PChar(lnkPath), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX) <> 0 Then
        ImageIndex := ShInfo.iIcon;
    End;
  End;
End;

Procedure TForm1.LoadStarFolder;
Begin
  AutoFindFileAllUser;
End;

//UWP
Procedure TForm1.LoadAllUWPStartupTasks;
Var
  reg, regPackage: TRegistry;
  packages, subKeys: TStringList;
  i, j: Integer;
  packageName, subKeyName, packagePath, subKeyPath: String;
  stateValue: Integer;
  isEnabled: Boolean;
  appName: String;
Begin
  reg := TRegistry.Create(KEY_READ);
  regPackage := TRegistry.Create(KEY_READ);
  Try
    reg.RootKey := HKEY_CURRENT_USER;
    regPackage.RootKey := HKEY_CURRENT_USER;
    If reg.OpenKey('SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData', False) Then
    Begin
      packages := TStringList.Create;
      Try
        reg.GetKeyNames(packages);
        For i := 0 To packages.Count - 1 Do
        Begin
          packageName := packages[i];
          // Формируем полный путь к пакету
          packagePath := 'SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\' + packageName;

          // Используем отдельный экземпляр TRegistry для открытия подразделов
          If regPackage.OpenKey(packagePath, False) Then
          Begin
            subKeys := TStringList.Create;
            Try
              regPackage.GetKeyNames(subKeys);
              For j := 0 To subKeys.Count - 1 Do
              Begin
                subKeyName := subKeys[j];

                // Игнорируем системные подразделы
                If (subKeyName = 'PSR') Or (subKeyName = 'Schemas') Or (subKeyName = 'SplashScreen') Or (subKeyName = 'HAM') Or (subKeyName = 'ApplicationFrame') Or (subKeyName = 'PersistedStorageItemTable') Or (subKeyName = 'PersistedTitleBarData') Then
                Begin
                  Continue;
                End;

                // Открываем подраздел относительно текущего пути
                If regPackage.OpenKey(subKeyName, False) Then
                Begin
                  If regPackage.ValueExists('State') Then
                  Begin
                    Try
                      stateValue := regPackage.ReadInteger('State');
                      isEnabled := (stateValue = 2);
                      // Получаем имя приложения
                      Try
                        appName := GetUWPAppName(packageName);
                        // Добавляем в список
                        With ListViewStartup.Items.Add Do
                        Begin
                          Caption := appName;
                          Checked := isEnabled;
                          GroupID := 3;
                          SubItems.Add(subKeyName);
                          SubItems.Add(GetBinaryPlatform(GetUWPAppExecutableByPackageFullName(packageName)));
                          if  GetFileComment(GetUWPAppExecutableByPackageFullName(packageName))<>'' then
                          SubItems.Add(GetFileComment(GetUWPAppExecutableByPackageFullName(packageName)))
                           else
                          SubItems.Add(GetFileDescription(GetUWPAppExecutableByPackageFullName(packageName)));

                          SubItems.Add(GetCompanyName(GetUWPAppExecutableByPackageFullName(packageName)));
                          SubItems.Add(GetFileVersion(GetUWPAppExecutableByPackageFullName(packageName)));
                          SubItems.Add(GetNormalSize(GetMyFileSize(GetUWPAppExecutableByPackageFullName(packageName))));
                          SubItems.Add('HKEY_CURRENT_USER');
                          SubItems.Add('\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\' + packageName + '\' + subKeyName);
                          SubItems.Add('UWP');
                          SubItems.Add(GetUWPAppExecutableByPackageFullName(packageName));
                          ImageIndex := GetUWPAppIconIndex(packageName);
                        End;
                      Except
                        On E: Exception Do
                        Begin
                          // Добавляем хотя бы с именем пакета
                          With ListViewStartup.Items.Add Do
                          Begin
                            Caption := packageName;
                            Checked := isEnabled;
                            GroupID := 3;
                            SubItems.Add(subKeyName);
                            SubItems.Add('');
                            SubItems.Add('');
                            SubItems.Add('');
                            SubItems.Add('');
                            SubItems.Add('');
                            SubItems.Add('HKEY_CURRENT_USER');
                            SubItems.Add('\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\' + packageName + '\' + subKeyName);
                            SubItems.Add('UWP');
                            SubItems.Add('');
                            ImageIndex := -1;
                          End;
                        End;
                      End;
                    Except
                      On E: Exception Do
                      Begin
                      End;
                    End;
                  End
                  Else
                  Begin
                  End;

                  // Возвращаемся к пути пакета
                  regPackage.CloseKey;
                  regPackage.OpenKey(packagePath, False);
                End
                Else
                Begin
                End;
              End;
            Finally
              subKeys.Free;
            End;

            regPackage.CloseKey;
          End
          Else
          Begin
          End;
        End;
      Finally
        packages.Free;
      End;

      reg.CloseKey;
    End
    Else
    Begin
    End;
  Finally
    regPackage.Free;
    reg.Free;
  End;

End;
// end UWP

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
        SubItems.Add(GetNormalSize(GetMyFileSize(pchar(PUTI))));
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

Procedure TForm1.BackupsDelAllMenuClick(Sender: TObject);
Begin
  Try
    While ListViewBackups.Items.Count > 0 Do
    Begin
      If ListViewBackups.Items[0].Checked = true Then
      Begin
        //ListViewBackups.Items.Item[0].MakeVisible(true);
        DeleteFile(ListViewBackups.Items[0].SubItems.Strings[2]);
        ListViewBackups.Items[0].Delete;
        Application.ProcessMessages;
      End;
    End;
  Except
  End;
End;

Procedure TForm1.BackupsDelMenuClick(Sender: TObject);
Begin
  If (ListViewBackups.Selected <> Nil) And (ListViewBackups.Selected.Caption <> '') Then
  Begin
    DeleteFile(ListViewBackups.Selected.SubItems.Strings[2]);
    Application.ProcessMessages;
    FindFileCopy(ExtractFilePath(paramstr(0)) + 'backup\');
    Application.ProcessMessages;
  End;
End;

Procedure TForm1.BackupsRestoreMenuClick(Sender: TObject);
Begin
  If (ListViewBackups.Selected <> Nil) And (ListViewBackups.Selected.Caption <> '') Then
  Begin
    ShellExecute(0, Nil, 'regedit.exe', pchar('/s "' + ListViewBackups.Selected.SubItems.Strings[2] + '"'), Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;
End;

Procedure TForm1.BackupsUpdateMenuClick(Sender: TObject);
Begin
  Try
    FindFileCopy(ExtractFilePath(paramstr(0)) + 'backup\');
  Except
  End;
End;

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
      Application.ProcessMessages;
    End;

    If DarkModeIsEnabled = False Then
    Begin
      SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      Application.ProcessMessages;
    End;
  End;

  ThemeLight := Ini.ReadBool('Option', 'ThemeLight', False);
  If ThemeLight = true Then
  Begin
    SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
    Application.ProcessMessages;
  End;

  ThemeDark := Ini.ReadBool('Option', 'ThemeDark', False);
  If ThemeDark = true Then
  Begin
    SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
    Application.ProcessMessages;
  End;

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

  If Ini.ReadString(Application.Title, 'Window', '') = 'wsMaximized' Then
  Begin
    Form1.WindowState := wsMaximized;
  End;

  If Ini.ReadString(Application.Title, 'Window', '') <> 'wsMaximized' Then
  Begin
    Form1.top := Ini.ReadInteger('Position', 'Top', Form1.top);
    Form1.left := Ini.ReadInteger('Position', 'Left', Form1.left);
    Form1.Height := Ini.ReadInteger('Position', 'Height', Form1.Height);
    Form1.Width := Ini.ReadInteger('Position', 'Width', Form1.Width);
  End;
  Ini.Free;
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
    Result := ExtractFilePath(paramstr(0)) + 'Config\Option.ini'
  Else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(paramstr(0))) + '\Simple Utilities\Config\Option.ini';
    //Result := ExtractFilePath(paramstr(0)) + 'Config\Option.ini';
  // Создаем папку для конфига
  SysUtils.ForceDirectories(ExtractFilePath(Result));
End;

Procedure TForm1.SaveNastr;
Var
  Ini: TMemIniFile;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);

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

Procedure TForm1.FormActivate(Sender: TObject);
Begin
  form1.GlobalRun;
End;

Procedure TForm1.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  WinTasks.Free;
  Form1.SaveNastr;
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

Procedure TForm1.UpdateSchedulerTaskWithFileInfo;
Var
  TaskService: ITaskService;
  RootFolder: ITaskFolder;
  Tasks: IRegisteredTaskCollection;
  Task: IRegisteredTask;
  TaskDef: ITaskDefinition;
  Actions: IActionCollection;
  i, j: Integer;
  TaskItem: TListItem;
  ShInfo: TSHFileInfo;
  TaskName, AppPath, TaskDesc, CompatStr: String;
  ExecAction: IExecAction;
  IsTaskEnabled: Boolean;
Begin
  Try
    CoInitialize(Nil);
    Try
      TaskService := CoTaskScheduler_.Create;
      TaskService.Connect(EmptyParam, EmptyParam, EmptyParam, EmptyParam);
      RootFolder := TaskService.GetFolder('\');
      Tasks := RootFolder.GetTasks(TASK_ENUM_HIDDEN);

      For i := 1 To Tasks.Count Do
      Begin
        Task := Tasks.Item[i];
        TaskName := Task.Name;

        AppPath := '';
        TaskDesc := '';
        CompatStr := '';

        Try
          // Проверяем состояние задачи (Enabled/Disabled)
          IsTaskEnabled := Task.Enabled;

          TaskDef := Task.Definition;
          TaskDesc := TaskDef.RegistrationInfo.Description;

          Case TaskDef.Settings.Compatibility Of
            TASK_COMPATIBILITY_AT:
              CompatStr := 'AT';
            TASK_COMPATIBILITY_V1:
              CompatStr := 'V1 (WinXP)';
            TASK_COMPATIBILITY_V2:
              CompatStr := 'V2 (Vista)';
            TASK_COMPATIBILITY_V2_1:
              CompatStr := 'V2_1 (Win7)';
            TASK_COMPATIBILITY_V2_2:
              CompatStr := 'V2_2 (Win8)';
            TASK_COMPATIBILITY_V2_3:
              CompatStr := 'V2_3 (Win8.1)';
            TASK_COMPATIBILITY_V2_4:
              CompatStr := 'V2_4 (Win10+)';
          Else
            CompatStr := 'Unknown';
          End;

          Actions := TaskDef.Actions;

          For j := 1 To Actions.Count Do
          Begin
            If Actions.Item[j].Type_ = TASK_ACTION_EXEC Then
            Begin
              ExecAction := Actions.Item[j] As IExecAction;
              AppPath := ExecAction.Path;
              Break;
            End;
          End;
        Except
          AppPath := '[System Task]';
          IsTaskEnabled := True; // По умолчанию включена
        End;

        TaskItem := ListViewStartup.Items.Add;
        TaskItem.GroupID := 2;
        TaskItem.Caption := TaskName;

        // Устанавливаем состояние чекбокса
        TaskItem.Checked := IsTaskEnabled;

        TaskItem.SubItems.Add(AppPath);
        TaskItem.SubItems.Add(GetBinaryPlatform(RunPath(AppPath)));
        TaskItem.SubItems.Add(getFileDescription(RunPath(AppPath)));
        TaskItem.SubItems.Add(getCompanyName(RunPath(AppPath)));
        TaskItem.SubItems.Add(GetFileVersion(RunPath(AppPath)));
        TaskItem.SubItems.Add(GetNormalSize(GetMyFileSize(PChar(RunPath(AppPath)))));
        TaskItem.SubItems.Add(CompatStr);

        If TaskDesc <> '' Then
        Begin
          TaskItem.SubItems.Add(TaskDesc);
        End
        Else
        Begin
          TaskItem.SubItems.Add(getFileDescription(RunPath(AppPath)));
        End;

        TaskItem.SubItems.Add('TASK');
        TaskItem.SubItems.Add(RunPath(AppPath));
        TaskItem.SubItems.Add(Task.Path); // Сохраняем полный путь к задаче

        If FileExists(RunPath(AppPath)) Then
        Begin
          SHGetFileInfo(PChar(RunPath(AppPath)), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
          TaskItem.ImageIndex := ShInfo.iIcon;
        End
        Else
        Begin
          TaskItem.ImageIndex := -1;
        End;

        Application.ProcessMessages;
      End;

    Except
      On E: Exception Do
        ShowMessage(LangError.Caption + ' ' + E.Message);
    End;

  Finally
    CoUninitialize;
  End;
End;

Procedure TForm1.GlobalRun;
Begin
  Form1.ListViewStartup.Items.BeginUpdate;
  Form1.ListViewStartup.Clear;
  Application.ProcessMessages;
  PageControlStartup.Enabled := False;
  TabControlPanelStartup.Enabled := False;
  PageControlStartup.Enabled := False;
  LoadRun;
  Application.ProcessMessages;
  LoadStarFolder;
  Application.ProcessMessages;
  UpdateSchedulerTaskWithFileInfo;
  Application.ProcessMessages;
  LoadAllUWPStartupTasks;
  Application.ProcessMessages;
  PageControlStartup.Enabled := true;
  TabControlPanelStartup.Enabled := true;
  PageControlStartup.Enabled := true;
  Form1.ListViewStartup.Items.EndUpdate;
  Try
   // Form1.ListViewStartup.Items[0].MakeVisible(true);
    Form1.ListViewStartup.Items[0].Selected := true;
   { Form1.ListViewStartup.Items[0].Focused := true;
    Form1.ListViewStartup.SetFocus; }
  Except
  End;
  Form1.StatusBar1.Panels[0].Text := LangElements.Caption + ' ' + IntToStr(Form1.ListViewStartup.Items.Count);
  Application.ProcessMessages;
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

Procedure TForm1.Task;
Var
  hr: HResult;
Begin
  hr := CreateWinTaskScheduler(WinTasks);
  If failed(hr) Then
  Begin
    If hr = NotAvailOnXp Then
    Begin
      Messagebox(Application.MainForm.Handle, pchar(LangWindowsVista.Caption), pchar(LangAttention.Caption), mb_iconerror Or mb_ok);
      Halt(1)
    End
    Else
    Begin
      Messagebox(Application.MainForm.Handle, pchar(LangWinTaskScheduler.Caption + IntToHex(hr, 8)), pchar(LangAttention.Caption), mb_iconerror Or mb_ok);
      Halt(2)
    End;
  End;
End;

Procedure TForm1.FormCreate(Sender: TObject);
Begin
  portable := fileExists(ExtractFilePath(ParamStr(0)) + 'portable.ini');
  If portable = True Then
    Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness + ' Portable'
  Else
    Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness;
  Task;
  createicon(ListViewStartup);
  createicon(ListViewBackups);
  ListViewStartup.Perform(WM_CHANGEUISTATE, MakeWParam(UIS_SET, UISF_HIDEFOCUS), 0);
  Application.ProcessMessages;
  TabAutoStart.TabVisible := False;
  TabBackups.TabVisible := False;
  TabAddStart.TabVisible := False;
  Form1.PageControlStartup.ActivePage := TabAutoStart;
  Form1.LoadNastr;
  form1.Globload;
  Sort := Sort;
  Form1.StatusBar1.Panels[0].Text := LangElements.Caption + IntToStr(Form1.ListViewStartup.Items.Count);
  Application.ProcessMessages;
End;

// Количество элементов в группе
Function GetItemsCountInGroup(ListView: TListView; GroupID: Integer): Integer;
Var
  i: Integer;
Begin
  Result := 0;
  For i := 0 To ListView.Items.Count - 1 Do
    If ListView.Items[i].GroupID = GroupID Then
      Inc(Result);
End;

Function GetAbsoluteIndexWithGroups(ListView: TListView; Item: TListItem): Integer;
Var
  i: Integer;
Begin
  Result := -1;
  If Not Assigned(Item) Then
    Exit;

  // Просто возвращаем стандартный индекс, если группировка отключена
  If Not ListView.GroupView Then
  Begin
    Result := Item.Index;
    Exit;
  End;

  // Для ListView с группировкой
  Result := 0;
  For i := 0 To ListView.Items.Count - 1 Do
  Begin
    If ListView.Items[i] = Item Then
      break;
    Inc(Result);
  End;
End;

Procedure TForm1.ListViewStartupClick(Sender: TObject);
Begin
  If Form1.ListViewStartup.ItemIndex = -1 Then
  Begin
    AIndex := 0;
  End;
  If Form1.ListViewStartup.ItemIndex <> -1 Then
  Begin
    AIndex := 0;
    AIndex := ListViewStartup.Selected.Index;
  End;

  If Form1.ListViewStartup.Selected.SubItems.Strings[8] <> 'UWP' Then
  Begin
    DeleteMenu.Enabled := true;
  End;
  If Form1.ListViewStartup.Selected.SubItems.Strings[8] = 'UWP' Then
  Begin
    DeleteMenu.Enabled := false;
  End;
End;

Procedure TForm1.ListViewStartupColumnClick(Sender: TObject; Column: TListColumn);
Begin
  Try
    Sort := -Sort;
    If Column = ListViewStartup.Columns[0] Then
      ListViewStartup.CustomSort(@SortCaptionAsString, Sort)
    Else If Column = ListViewStartup.Columns[1] Then
      ListViewStartup.CustomSort(@SortFirstSubItemAsString, Sort)
    Else If Column = ListViewStartup.Columns[2] Then
      ListViewStartup.CustomSort(@Sort1SubItemAsString, Sort)
    Else If Column = ListViewStartup.Columns[3] Then
      ListViewStartup.CustomSort(@Sort2SubItemAsString, Sort)
    Else If Column = ListViewStartup.Columns[4] Then
      ListViewStartup.CustomSort(@Sort3SubItemAsString, Sort);
    Application.ProcessMessages;
  Except
  End;
End;

Procedure TForm1.ListViewStartupItemChecked(Sender: TObject; Item: TListItem);
Var
  itemType: String;
Begin
  If (Item = Nil) Or (Item.SubItems.Count < 9) Then
    Exit;

  itemType := Item.SubItems[8]; // 'Registry', 'Start Menu', 'TASK' или 'UWP'

  If itemType = 'Registry' Then
  Begin
    ListViewStartupItemCheckedForRegistry(Sender, Item);
  End
  Else If itemType = 'Start Menu' Then
  Begin
    ListViewStartupItemCheckedForStartupFolder(Sender, Item);
  End
  Else If itemType = 'TASK' Then
  Begin
    ListViewStartupItemCheckedForTask(Sender, Item);
  End
  Else If itemType = 'UWP' Then
  Begin
    ListViewStartupItemCheckedForUWP(Sender, Item);
  End
  Else
  Begin
  End;

  Application.ProcessMessages;
End;

Procedure TForm1.ListViewStartupItemCheckedForTask(Sender: TObject; Item: TListItem);
Var
  TaskService: ITaskService;
  RootFolder: ITaskFolder;
  Task: IRegisteredTask;
  TaskPath, TaskName, FolderPath: String;
Begin
  If (Item = Nil) Or (Item.SubItems.Count < 11) Then
    Exit;

  // Проверяем, это элемент из планировщика задач
  If Item.SubItems[8] = 'TASK' Then
  Begin
    // Получаем путь к задаче
    TaskPath := Item.SubItems[10]; // Путь к задаче хранится в 10-м SubItem

    If TaskPath = '' Then
      Exit;

    Try
      CoInitialize(Nil);
      Try
        TaskService := CoTaskScheduler_.Create;
        TaskService.Connect(EmptyParam, EmptyParam, EmptyParam, EmptyParam);

        // Получаем корневую папку
        RootFolder := TaskService.GetFolder('\');

        // Пробуем получить задачу напрямую из корневой папки
        Try
          Task := RootFolder.GetTask(TaskPath);
        Except
          // Если не нашли, пытаемся получить из подпапки
          Try
            // Извлекаем путь к папке и имя задачи
            FolderPath := ExtractFilePath(TaskPath);
            If FolderPath <> '' Then
            Begin
              // Убираем начальный и конечный слэши
              If FolderPath[1] = '\' Then
                FolderPath := Copy(FolderPath, 2, Length(FolderPath) - 1);
              If (FolderPath <> '') And (FolderPath[Length(FolderPath)] = '\') Then
                FolderPath := Copy(FolderPath, 1, Length(FolderPath) - 1);

              TaskName := ExtractFileName(TaskPath);

              If FolderPath <> '' Then
              Begin
                // Получаем нужную папку
                RootFolder := TaskService.GetFolder(FolderPath);
                Task := RootFolder.GetTask(TaskName);
              End
              Else
              Begin
                // Задача в корневой папке
                Task := RootFolder.GetTask(TaskName);
              End;
            End;
          Except
            Task := Nil;
          End;
        End;

        If Assigned(Task) Then
        Begin
          // Альтернативный способ - получаем задачу через коллекцию
          UpdateTaskEnabledState(Task, Item.Checked);
        End
        Else
        Begin
          // Если не удалось получить задачу, пробуем другой метод
          UpdateTaskEnabledStateAlternative(TaskPath, Item.Checked);
        End;
      Finally
        CoUninitialize;
      End;
    Except
    End;
  End;
End;

Procedure TForm1.UpdateTaskEnabledState(Task: IRegisteredTask; Enabled: Boolean);
Var
  TaskDef: ITaskDefinition;
  Settings: ITaskSettings;
  XMLText: WideString;
  TaskService: ITaskService;
  TaskFolder: ITaskFolder;
  FolderPath, TaskName: String;
Begin
  Try
    // Получаем определение задачи
    TaskDef := Task.Definition;

    // Получаем настройки
    Settings := TaskDef.Settings;

    // Изменяем состояние
    Settings.Enabled := Enabled;

    // Сохраняем XML задачи
    XMLText := TaskDef.XmlText;

    // Инициализируем TaskService
    TaskService := CoTaskScheduler_.Create;
    TaskService.Connect(EmptyParam, EmptyParam, EmptyParam, EmptyParam);

    // Получаем путь к папке и имя задачи
    FolderPath := ExtractFilePath(Task.Path);
    TaskName := ExtractFileName(Task.Path);

    // Убираем начальный слэш
    If (FolderPath <> '') And (FolderPath[1] = '\') Then
      FolderPath := Copy(FolderPath, 2, Length(FolderPath) - 1);

    // Получаем папку с задачей
    If FolderPath = '' Then
      TaskFolder := TaskService.GetFolder('\')
    Else
      TaskFolder := TaskService.GetFolder(FolderPath);

    If Assigned(TaskFolder) Then
    Begin
      // Регистрируем задачу с обновленными настройками
      // TASK_CREATE_OR_UPDATE = 6
      TaskFolder.RegisterTask(TaskName,                   // Имя задачи
        XMLText,                    // XML определение
        TASK_CREATE_OR_UPDATE,      // Флаг создания/обновления
        EmptyParam,                 // User
        EmptyParam,                 // Password
        TASK_LOGON_NONE,            // Тип входа
        EmptyParam                  // SDDL
      );
    End;
  Except
    On E: Exception Do
    Begin
      // Если не удалось, пробуем простой способ
      Try
        // Просто меняем свойство Enabled
        TaskDef := Task.Definition;
        Settings := TaskDef.Settings;
        Settings.Enabled := Enabled;
      Except
      End;
    End;
  End;
End;

Procedure TForm1.UpdateTaskEnabledStateAlternative(TaskPath: String; Enabled: Boolean);
Var
  TaskService: ITaskService;
  RootFolder: ITaskFolder;
  Tasks: IRegisteredTaskCollection;
  Task: IRegisteredTask;
  i: Integer;
  TaskName: String;
Begin
  Try
    CoInitialize(Nil);
    Try
      TaskService := CoTaskScheduler_.Create;
      TaskService.Connect(EmptyParam, EmptyParam, EmptyParam, EmptyParam);

      // Получаем корневую папку
      RootFolder := TaskService.GetFolder('\');

      // Получаем все задачи
      Tasks := RootFolder.GetTasks(TASK_ENUM_HIDDEN);

      // Ищем нужную задачу по имени
      TaskName := ExtractFileName(TaskPath);

      For i := 1 To Tasks.Count Do
      Begin
        Task := Tasks.Item[i];

        // Сравниваем имя задачи
        If SameText(Task.Name, TaskName) Then
        Begin
          // Нашли задачу, обновляем состояние
          Try
            UpdateTaskEnabledState(Task, Enabled);
            Break;
          Except
            // Пробуем другой метод
            Try
              // Прямое изменение через свойства
              If Task.Enabled <> Enabled Then
              Begin
                Task.Enabled := Enabled;
              End;
            Except
              // Если не получилось, выходим
            End;
          End;
        End;
      End;
    Finally
      CoUninitialize;
    End;
  Except
  End;
End;

Procedure TForm1.SaveTaskEnabledState(Task: IRegisteredTask; Enabled: Boolean);
Var
  TaskDef: ITaskDefinition;
  Settings: ITaskSettings;
  XMLText: WideString;
  TaskService: ITaskService;
  TaskFolder: ITaskFolder;
  RegisteredTask: IRegisteredTask;
Begin
  Try
    // Получаем определение задачи
    TaskDef := Task.Definition;

    // Получаем настройки
    Settings := TaskDef.Settings;

    // Изменяем состояние
    Settings.Enabled := Enabled;

    // Получаем XML задачи
    XMLText := TaskDef.XmlText;

    // Пересоздаем задачу с новыми настройками
    TaskService := CoTaskScheduler_.Create;
    TaskService.Connect(EmptyParam, EmptyParam, EmptyParam, EmptyParam);

    // Получаем папку, где находится задача
    TaskFolder := TaskService.GetFolder(ExtractFilePath(Task.Path));

    If Assigned(TaskFolder) Then
    Begin
      // Удаляем старую задачу
      TaskFolder.DeleteTask(ExtractFileName(Task.Path), 0);

      // Регистрируем новую задачу с обновленными настройками
      RegisteredTask := TaskFolder.RegisterTask(ExtractFileName(Task.Path), // Имя задачи
        XMLText,                    // XML определение
        TASK_CREATE_OR_UPDATE,      // Флаг создания/обновления
        EmptyParam,                 // User
        EmptyParam,                 // Password
        TASK_LOGON_NONE,            // Тип входа
        EmptyParam                  // SDDL
      );
    End;
  Except
    On E: Exception Do
    Begin
      // Альтернативный способ - через свойства задачи
      Try
        // Пробуем изменить свойство Enabled напрямую
        // Это может работать не для всех задач
        TaskDef := Task.Definition;
        Settings := TaskDef.Settings;
        Settings.Enabled := Enabled;
      Except
      End;
    End;
  End;
End;

Procedure TForm1.ListViewStartupItemCheckedForStartupFolder(Sender: TObject; Item: TListItem);
Var
  regStartupApproved: TRegistry;
  startupKey, fullPath: String;
  data: Array[0..11] Of Byte;
  i: Integer;
  fileTime: TFileTime;
  largeInt: Int64;
Begin
  If (Item = Nil) Or (Item.SubItems.Count < 11) Then
    Exit;

  // Проверяем, это элемент из папки автозагрузки
  If Item.SubItems[9] = 'Start Menu' Then
  Begin
    // Получаем полный путь к файлу/ярлыку
    fullPath := Item.SubItems[10]; // Полный путь хранится в 10-м SubItem

    If fullPath = '' Then
      Exit;

    regStartupApproved := TRegistry.Create(KEY_ALL_ACCESS);
    Try
      regStartupApproved.RootKey := HKEY_CURRENT_USER;
      startupKey := 'Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder';

      If regStartupApproved.OpenKey(startupKey, True) Then
      Begin
        // Инициализируем весь массив нулями
        For i := 0 To 11 Do
          data[i] := $00;

        If Item.Checked Then
        Begin
          // ВКЛЮЧАЕМ: только первый байт = 02, остальные = 00
          data[0] := $02; // Включено пользователем
          // data[1]..data[11] уже = 00

          regStartupApproved.WriteBinaryData(fullPath, data, 12);
        End
        Else
        Begin
          // ОТКЛЮЧАЕМ: первый байт = 03 + timestamp
          data[0] := $03; // Отключено пользователем

          // Получаем текущее время в формате FILETIME
          GetSystemTimeAsFileTime(fileTime);

          // Преобразуем FILETIME в 64-битное целое (little-endian)
          largeInt := (Int64(fileTime.dwHighDateTime) Shl 32) Or fileTime.dwLowDateTime;

          // Копируем timestamp в позиции 4-11
          Move(largeInt, data[4], 8);

          regStartupApproved.WriteBinaryData(fullPath, data, 12);
        End;

        regStartupApproved.CloseKey;
      End;
    Finally
      regStartupApproved.Free;
    End;

    // Уведомляем систему об изменении
    SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0, LPARAM(PChar('Environment')), SMTO_ABORTIFHUNG, 50, Nil);
    Application.ProcessMessages;
  End;
End;

Procedure TForm1.ListViewStartupItemCheckedForRegistry(Sender: TObject; Item: TListItem);
Var
  regStartupApproved: TRegistry;
  rootKeyStr, valueName, startupApprovedPath: String;
  data: Array[0..11] Of Byte;
  i: Integer;
  fileTime: TFileTime;
  largeInt: Int64;
  rootKey: HKEY;
  access: Cardinal;
Begin
  If (Item = Nil) Or (Item.SubItems.Count < 8) Then
    Exit;
  rootKeyStr := Item.SubItems[6];
  valueName := Item.Caption;
  If rootKeyStr = 'HKEY_LOCAL_MACHINE' Then
  Begin
    rootKey := HKEY_LOCAL_MACHINE;
    access := KEY_ALL_ACCESS Or KEY_WOW64_64KEY;
    startupApprovedPath := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run';
  End
  Else
  Begin
    rootKey := HKEY_CURRENT_USER;
    access := KEY_ALL_ACCESS;
    startupApprovedPath := 'Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run';
  End;
  regStartupApproved := TRegistry.Create(access);
  Try
    regStartupApproved.RootKey := rootKey;

    If regStartupApproved.OpenKey(startupApprovedPath, True) Then
    Begin
      For i := 0 To 11 Do
        data[i] := $00;
      If Item.Checked Then
      Begin
        data[0] := $02;
        regStartupApproved.WriteBinaryData(valueName, data, 12);
      End
      Else
      Begin
        data[0] := $03;
        GetSystemTimeAsFileTime(fileTime);
        largeInt := (Int64(fileTime.dwHighDateTime) Shl 32) Or fileTime.dwLowDateTime;
        Move(largeInt, data[4], 8);
        regStartupApproved.WriteBinaryData(valueName, data, 12);
      End;
      regStartupApproved.CloseKey;
    End;
  Finally
    regStartupApproved.Free;
  End;
  SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0, LPARAM(PChar('Environment')), SMTO_ABORTIFHUNG, 50, Nil);
  Application.ProcessMessages;
End;

Function ExtractUWPPackageName(Const PathOrName: String): String;
Begin
  Result := '';

  // Пытаемся извлечь package name из различных форматов

  // Если это полный путь в реестре
  If Pos('AppModel\SystemAppData\', PathOrName) > 0 Then
  Begin
    Result := Copy(PathOrName, Pos('AppModel\SystemAppData\', PathOrName) + 21, Length(PathOrName));
    Result := Copy(Result, 1, Pos('\', Result) - 1);
  End
  // Если это значение из SubItems (имя задачи с пакетом)
  Else If Pos('!', PathOrName) > 0 Then
  Begin
    Result := Copy(PathOrName, 1, Pos('!', PathOrName) - 1);
  End
  // Если это Microsoft.WindowsTerminal_8wekyb3d8bbwe
  Else If Pos('Microsoft.', PathOrName) = 1 Then
  Begin
    Result := PathOrName;
  End;

  // Если ничего не нашли, возвращаем оригинальное значение
  If Result = '' Then
    Result := PathOrName;
End;

Procedure UpdateUWPStartupApprovedState(Const PackageName, TaskName: String; Enabled: Boolean);
Var
  reg: TRegistry;
  valueName: String;
  data: Array[0..11] Of Byte;
  i: Integer;
  fileTime: TFileTime;
  largeInt: Int64;
Begin
  reg := TRegistry.Create(KEY_ALL_ACCESS);
  Try
    reg.RootKey := HKEY_CURRENT_USER;

    If reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run', True) Then
    Begin
      // Формируем имя значения (PackageName!TaskName)
      valueName := PackageName;
      If TaskName <> '' Then
        valueName := valueName + '!' + TaskName;

      // Инициализируем массив
      For i := 0 To 11 Do
        data[i] := $00;

      If Enabled Then
      Begin
        // ВКЛЮЧАЕМ: первый байт = 02
        data[0] := $02;
        reg.WriteBinaryData(valueName, data, 12);
      End
      Else
      Begin
        // ОТКЛЮЧАЕМ: первый байт = 03 + timestamp
        data[0] := $03;

        // Получаем текущее время
        GetSystemTimeAsFileTime(fileTime);
        largeInt := (Int64(fileTime.dwHighDateTime) Shl 32) Or fileTime.dwLowDateTime;
        Move(largeInt, data[4], 8);

        reg.WriteBinaryData(valueName, data, 12);
      End;

      reg.CloseKey;
    End;
  Finally
    reg.Free;
  End;
End;

Procedure UpdateUWPLastDisabledTime(Const PackageName, TaskName: String);
Var
  reg: TRegistry;
  regPath: String;
  fileTime: TFileTime;
  largeInt: Int64;
  binaryData: Array[0..7] Of Byte;
Begin
  reg := TRegistry.Create(KEY_ALL_ACCESS);
  Try
    reg.RootKey := HKEY_CURRENT_USER;

    // Формируем путь к задаче
    regPath := 'SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\' + PackageName + '\' + TaskName;

    If reg.OpenKey(regPath, False) Then
    Begin
      // Получаем текущее время в формате FILETIME
      GetSystemTimeAsFileTime(fileTime);
      largeInt := (Int64(fileTime.dwHighDateTime) Shl 32) Or fileTime.dwLowDateTime;

      // Записываем как двоичные данные
      Move(largeInt, binaryData[0], 8);
      reg.WriteBinaryData('LastDisabledTime', binaryData, 8);

      reg.CloseKey;
    End;
  Finally
    reg.Free;
  End;
End;

Procedure TForm1.ListViewStartupItemCheckedForUWP(Sender: TObject; Item: TListItem);
Var
  reg: TRegistry;
  rootKey: HKEY;
  regPath: String;
  stateValue: Integer;
Begin
  If (Item = Nil) Then
  Begin
    Exit;
  End;

  // ИСПРАВЛЕНО: для UWP элементов должно быть 10 SubItems (от 0 до 9)
  If (Item.SubItems.Count < 10) Then
  Begin
    Exit;
  End;

  // Преобразуем строку в HKEY
  If Item.SubItems[6] = 'HKEY_CURRENT_USER' Then
  Begin
    rootKey := HKEY_CURRENT_USER;
  End
  Else If Item.SubItems[6] = 'HKEY_LOCAL_MACHINE' Then
  Begin
    rootKey := HKEY_LOCAL_MACHINE;
  End
  Else
  Begin
    rootKey := HKEY_CURRENT_USER;
  End;

  regPath := Item.SubItems[7];
  reg := TRegistry.Create(KEY_ALL_ACCESS);
  Try
    reg.RootKey := rootKey;
    If reg.OpenKey(regPath, False) Then
    Begin

      // Меняем State: 2=включено, 1=отключено
      If Item.Checked Then
      Begin
        stateValue := 2;
      End
      Else
      Begin
        stateValue := 1;
      End;

      Try
        reg.WriteInteger('State', stateValue);
        // Проверяем, что записалось
        reg.CloseKey;
      Except
      End;

      reg.CloseKey;

      // Уведомляем систему
      SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0, LPARAM(PChar('Environment')), SMTO_ABORTIFHUNG, 100, Nil);

    End;

  Finally
    reg.Free;
  End;
End;

Procedure TForm1.ListViewStartupSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
Begin
  If ListViewStartup.ItemIndex = -1 Then
    Exit;

  If Form1.ListViewStartup.Selected.SubItems.Strings[8] <> 'UWP' Then
  Begin
    DeleteMenu.Enabled := true;
  End;
  If Form1.ListViewStartup.Selected.SubItems.Strings[8] = 'UWP' Then
  Begin
    DeleteMenu.Enabled := false;
  End;
End;

Procedure TForm1.PropertiesMenuClick(Sender: TObject);
Begin
  If Form1.ListViewStartup.ItemIndex = -1 Then
    Exit;
  ShowPropertiesDialog(Form1.ListViewStartup.Selected.SubItems.Strings[9]);
  Application.ProcessMessages;
End;

Procedure TForm1.RefreshListMenuClick(Sender: TObject);
Begin
  Form1.GlobalRun;
  Application.ProcessMessages;
End;

Procedure TForm1.OpenFolderMenuClick(Sender: TObject);
Begin
  If ListViewStartup.ItemIndex = -1 Then
    Exit;
  OpenExplorerAndSelectFile(ListViewStartup.Selected.SubItems.Strings[9]);
  Application.ProcessMessages;
End;

Procedure TForm1.SaveCopy;
Begin
  Try
    Form1.MemoSaveCopy.Clear;
    Form1.MemoSaveCopy.Lines.Add('Windows Registry Editor Version 5.00');
    Form1.MemoSaveCopy.Lines.Add('');
    Form1.MemoSaveCopy.Lines.Add('[' + Form1.ListViewStartup.Selected.SubItems.Strings[6] + Form1.ListViewStartup.Selected.SubItems.Strings[7] + ']');
    Form1.MemoSaveCopy.Lines.Add('"' + Form1.ListViewStartup.Selected.Caption + '"="' + stringreplace(stringreplace(Form1.ListViewStartup.Selected.SubItems.Strings[0], '\', '\\', [rfReplaceAll]), '"', '\"', [rfReplaceAll]) + '"');
    CreateDir(ExtractFilePath(paramstr(0)) + 'backup');
    Form1.MemoSaveCopy.Lines.SaveToFile(ExtractFilePath(paramstr(0)) + 'backup\' + Form1.ListViewStartup.Selected.Caption + '(' + DateToStr(now) + FormatDateTime('_hh-mm-ss', now) + ').reg', TEncoding.Unicode);
  Except
  End;
End;

Procedure TForm1.removeRun;
Var
  sn: String;
Begin
  If ListViewStartup.ItemIndex = -1 Then
    Exit;
  If ListViewStartup.Selected.SubItems.Strings[8] = 'Registry' Then
  Begin
    reg := TRegistry.Create;
    If ListViewStartup.Selected.SubItems.Strings[6] = 'HKEY_LOCAL_MACHINE' Then
    Begin
      reg.RootKey := HKEY_LOCAL_MACHINE;
      reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
      // reg.Access := KEY_WOW64_32KEY or KEY_ALL_ACCESS;
    End;
    If ListViewStartup.Selected.SubItems.Strings[6] = 'HKEY_CURRENT_USER' Then
    Begin
      reg.RootKey := HKEY_CURRENT_USER;
      reg.Access := KEY_WOW64_32KEY Or KEY_ALL_ACCESS;
    End;
    reg.OpenKey(ListViewStartup.Selected.SubItems.Strings[7], False);
    Msg := Messagebox(Application.MainForm.Handle, pchar(LangDelete.Caption + ' [ ' + ListViewStartup.Selected.Caption + ' ] ?'), pchar(LangAttention.Caption), mb_iconquestion Or mb_yesno);
    If Msg = idyes Then
    Begin
      SaveCopy;
      reg.DeleteValue(ListViewStartup.Selected.Caption);
      reg.CloseKey;
      reg.Free;
      // FormActivate(self);
      Form1.GlobalRun;
      Application.ProcessMessages;
    End;

  End;

  If ListViewStartup.Selected.SubItems.Strings[8] = 'Start Menu' Then
  Begin
    Msg := Messagebox(Application.MainForm.Handle, pchar(LangDelete.Caption + ' [ ' + ListViewStartup.Selected.Caption + ' ] ?'), pchar(LangAttention.Caption), mb_iconquestion Or mb_yesno);
    If Msg = idyes Then
    Begin
      FileSetReadOnly(ListViewStartup.Selected.SubItems.Strings[0], False);
      SetFileAttributes(pchar(ListViewStartup.Selected.SubItems.Strings[0]), FILE_ATTRIBUTE_NORMAL);
      DeleteFileWithUndo(ListViewStartup.Selected.SubItems.Strings[0]);
      DeleteFile(ListViewStartup.Selected.SubItems.Strings[0]);
      // FormActivate(self);
      Form1.GlobalRun;
      Application.ProcessMessages;
    End;
  End;

  If ListViewStartup.Selected.SubItems.Strings[8] = 'TASK' Then
  Begin
    If SelectedTaskIndex >= 0 Then
      With WinTasks.TaskFolder Do
      Begin
        sn := ListViewStartup.Items.Item[ListViewStartup.Selected.Index].Caption;
        Msg := Messagebox(Application.MainForm.Handle, pchar(LangDelete.Caption + ' [ ' + sn + ' ] ?'), pchar(LangAttention.Caption), mb_iconquestion Or mb_yesno);
        If Msg = idyes Then
        Begin
          If Not DeleteTask(sn) Then
            MessageDlg(ErrorMessage, mtError, [mbOK], 0);
          // FormActivate(self);
          Form1.GlobalRun;
          Application.ProcessMessages;
        End
        Else
          Exit;
        // UpdateListView(GetListIndex(SelectedTaskIndex));
      End;
  End;
End;

Procedure TForm1.IconSmallMenuClick(Sender: TObject);
Begin
  SetListViewSystemIcons(ListViewStartup, False);  // Маленькие иконки
End;

Procedure TForm1.IconBigMenuClick(Sender: TObject);
Begin
  SetListViewSystemIcons(ListViewStartup, True);   // Большие иконки
End;

Procedure TForm1.DeleteMenuClick(Sender: TObject);
Begin
  Form1.removeRun;
  Application.ProcessMessages;
End;

End.

