Unit Unit_Base;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, shellapi, StdCtrls, FileCtrl, ComCtrls, Registry, IniFiles, ShlObj,
  Menus, ImgList, CommCtrl, SHDocVw, pngimage, System.ImageList, Vcl.Buttons,
  WindowsDarkMode, Translation,FileInfoUtils;

Type
  TListView = Class(ComCtrls.TListView)
  Protected
    Procedure WMVScroll(Var Message: TWMVScroll); Message WM_VSCROLL;
  End;

Type
  TWmMoving = Record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  End;

Type
  TForm1 = Class(TForm)
    PopupMenuList: TPopupMenu;
    RegSelected: TMenuItem;
    UnRegSelected: TMenuItem;
    n10: TMenuItem;
    OpenFolder: TMenuItem;
    n12: TMenuItem;
    Properties: TMenuItem;
    CheckAll: TMenuItem;
    N19: TMenuItem;
    UnCheckAll: TMenuItem;
    DeleteElement: TMenuItem;
    N29: TMenuItem;
    StatusBarLibraries: TStatusBar;
    MemoList: TMemo;
    TabControl2: TTabControl;
    ClearList: TMenuItem;
    TabControl1: TTabControl;
    ImageList1: TImageList;
    PopupMenuGeneral: TPopupMenu;
    CheckBoxSkip: TMenuItem;
    SpeedButton_GeneralMenu: TSpeedButton;
    PopupMenuLanguage: TPopupMenu;
    LangReady: TMenuItem;
    LangReg: TMenuItem;
    LangTotal: TMenuItem;
    LangStop: TMenuItem;
    LangSearch: TMenuItem;
    LangWarningDanger: TMenuItem;
    LangRedyUnReg: TMenuItem;
    LangFolder: TMenuItem;
    LangUsedApp: TMenuItem;
    LangList: TMenuItem;
    LangRegGood: TMenuItem;
    LangUnRegGood: TMenuItem;
    LangNotReg: TMenuItem;
    LangNotUnReg: TMenuItem;
    TabControlPanel: TTabControl;
    ButtonUser: TButton;
    ButtonExpert: TButton;
    ImageList3: TImageList;
    TabControl5: TTabControl;
    ListViewLibraries: TListView;
    PageControl: TPageControl;
    TabSheetBase: TTabSheet;
    TabSheetPro: TTabSheet;
    ButtonSearchLibraries: TButton;
    ButtonRegLibraries: TButton;
    ButtonUnRegLibraries: TButton;
    ButtonList: TButton;
    LangUnReg: TMenuItem;
    TabControlLibraries: TTabControl;
    EditSearchPath: TEdit;
    ButtonBrowse: TButton;
    ButtonReset: TButton;
    FilterComboBox: TFilterComboBox;
    LangOnlyWindows: TMenuItem;
    LangError: TMenuItem;
    ButtonRegLibrariesBase: TButton;
    ImageListRegOCX: TImageList;
    Procedure FormCreate(Sender: TObject);
    Procedure SaveNastr;
    Procedure LoadNastr;
    Procedure Spisok;
    Procedure RegisterOCX;
    Procedure UnRegisterOCX;
    Procedure Find(Dir: String);
    Procedure LoadIcons;
    Procedure AddExt(Extension, Description: String; EChecked: Boolean; List: TListView);
    Procedure RegSelectedClick(Sender: TObject);
    Procedure UnRegSelectedClick(Sender: TObject);
    Procedure OpenFolderClick(Sender: TObject);
    Procedure PropertiesClick(Sender: TObject);
    Procedure CheckAllClick(Sender: TObject);
    Procedure UnCheckAllClick(Sender: TObject);
    Procedure DeleteElementClick(Sender: TObject);
    Procedure WMMoving(Var Msg: TWmMoving); Message WM_MOVING;
    Procedure ListViewLibrariesClick(Sender: TObject);
    Procedure ListViewLibrariesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    Procedure ClearListClick(Sender: TObject);
    Procedure ButtonSearchLibrariesClick(Sender: TObject);
    Procedure ButtonListClick(Sender: TObject);
    Procedure ButtonRegLibrariesClick(Sender: TObject);
    Procedure FormDestroy(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure Button1Click(Sender: TObject);
    Procedure Button2Click(Sender: TObject);
    Procedure ButtonUnRegLibrariesClick(Sender: TObject);
    Procedure SpeedButton_GeneralMenuClick(Sender: TObject);
    Procedure globload;
    Procedure CleanTranslationsLikeGlobload;
    Procedure CheckBoxSkipClick(Sender: TObject);
    Procedure ButtonExpertClick(Sender: TObject);
    Procedure ButtonUserClick(Sender: TObject);
    Procedure ButtonBrowseClick(Sender: TObject);
    Procedure ButtonResetClick(Sender: TObject);
    Function IsWindows10Or11: Boolean;
    Function PortablePath: String;
  Private
    SuccessIconIndex: Integer;
    FailIconIndex: Integer;
    IconsLoaded: Boolean;
    Procedure WMMouseMove(Var Message: TWMMouseMove); Message WM_MOUSEMOVE;
    Procedure WMDropFiles(Var Msg: TWMDropFiles); Message WM_DROPFILEs;
    Procedure WMSettingChange(Var Message: TWMSettingChange); Message WM_SETTINGCHANGE;
  Public
    { Public declarations }
  End;

Var
  Form1: TForm1;
  Handle: THandle;
  Stop: Boolean;
  size, Msg: Integer;
  PUTI: String;
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

Procedure TForm1.WMMoving(Var Msg: TWmMoving);
Var
  r: TRect;
Begin
  r := Screen.WorkareaRect;
  If Msg.lpRect^.left < r.left Then
    OffsetRect(Msg.lpRect^, r.left - Msg.lpRect^.left, 0);
  If Msg.lpRect^.top < r.top Then
    OffsetRect(Msg.lpRect^, 0, r.top - Msg.lpRect^.top);
  If Msg.lpRect^.right > r.right Then
    OffsetRect(Msg.lpRect^, r.right - Msg.lpRect^.right, 0);
  If Msg.lpRect^.bottom > r.bottom Then
    OffsetRect(Msg.lpRect^, 0, r.bottom - Msg.lpRect^.bottom);
  Inherited;
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

Function IsFileInUse(FileName: TFileName): Boolean;
Var
  HFileRes: HFILE;
Begin
  Result := false;
  If Not FileExists(FileName) Then
    Exit;
  HFileRes := CreateFile(pchar(FileName), GENERIC_READ Or GENERIC_WRITE, 0, Nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  If Not Result Then
    CloseHandle(HFileRes);
End;

Function ExecAndWait(Const ExecuteFile, ParamString: String): Boolean;
Var
  SEInfo: TSHELLEXECUTEINFO;
  ExitCode: dword;
Begin
  FillChar(SEInfo, SizeOf(SEInfo), 0);
  SEInfo.cbSize := SizeOf(TSHELLEXECUTEINFO);
  With SEInfo Do
  Begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpFile := pchar(ExecuteFile);
    lpParameters := pchar(ParamString);
    nShow := SW_HIDE;
  End;
  If ShellExecuteEx(@SEInfo) Then
  Begin
    Repeat
      Application.ProcessMessages;
      GetExitCodeProcess(SEInfo.hProcess, ExitCode);
    Until (ExitCode <> STILL_ACTIVE) Or Application.Terminated;
    Result := true;
  End
  Else
    Result := false;
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

Function OpenExplorerAndSelectFile(Path: String): Boolean;

  Function ParseURLName(Const Value: String): String;
  Const
    scFilePath: Array[0..7] Of char = ('f', 'i', 'l', 'e', ':', '/', '/', '/');
  Begin
    If (Length(Value) >= 8) And CompareMem(@scFilePath[0], @Value[1], 8) Then
    Begin
      Result := Copy(Value, 9, Length(Value));
      Result := StringReplace(Result, '/', '\', [rfReplaceAll]);
      Result := StringReplace(Result, '%20', ' ', [rfReplaceAll]);
      // Исправление: используем IncludeTrailingPathDelimiter вместо устаревшей функции
      Result := IncludeTrailingPathDelimiter(Result);
    End
    Else
      Result := Value;
  End;

Var
  iShellWindow: IShellWindows;
  iWB: IWebBrowserApp;
  spDisp: IDispatch;
  I: Integer;
  S, FilePath, FileName: String;
Begin
  Result := FileExists(Path);
  If Not Result Then
    Exit;

  FilePath := UpperCase(ExtractFilePath(Path));
  FileName := ExtractFileName(Path);

  Try
    iShellWindow := CoShellWindows.Create;
    For I := 0 To iShellWindow.Count - 1 Do
    Begin
      spDisp := iShellWindow.Item(I);
      If spDisp = Nil Then
        Continue;

      If Supports(spDisp, IWebBrowserApp, iWB) Then
      Begin
        S := ParseURLName(iWB.LocationURL);
        If UpperCase(S) = FilePath Then
        Begin
          SendMessage(iWB.HWnd, WM_SYSCOMMAND, SC_CLOSE, 0);
          Break;
        End;
      End;
    End;
  Except
    // Игнорируем ошибки при работе с COM-объектами
  End;

  // Исправление: правильное использование ShellExecute
  ShellExecute(0, 'open', 'explorer.exe', PChar('/select,' + AnsiQuotedStr(Path, ' ')), PChar(ExtractFilePath(Path)), SW_SHOWNORMAL);
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

Procedure TForm1.AddExt(Extension, Description: String; EChecked: Boolean; List: TListView);
Var
  ListItem: TListItem;
Begin
  ListItem := List.Items.Add;
  With ListItem Do
  Begin
    Caption := Extension;
    SubItems.Add(Description);
    Checked := EChecked;
  End;
End;

Procedure TForm1.ListViewLibrariesClick(Sender: TObject);
Begin
  If ListViewLibraries.ItemIndex = -1 Then
  Begin
    ButtonRegLibraries.Enabled := false;
    ButtonUnRegLibraries.Enabled := false;
  End;
  If ListViewLibraries.ItemIndex <> -1 Then
  Begin
    ButtonRegLibraries.Enabled := true;
    ButtonUnRegLibraries.Enabled := true;
  End;
End;

Procedure TForm1.ListViewLibrariesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
Begin
  If ListViewLibraries.ItemIndex = -1 Then
  Begin
    ButtonRegLibraries.Enabled := false;
    ButtonUnRegLibraries.Enabled := false;
  End;
  If ListViewLibraries.ItemIndex <> -1 Then
  Begin
    ButtonRegLibraries.Enabled := true;
    ButtonUnRegLibraries.Enabled := true;
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

Procedure TForm1.LoadNastr;
Var
  Ini: TMemIniFile;
  WindowCenter: Boolean;
  ThemeAuto, ThemeLight, ThemeDark: Boolean;
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

  CheckBoxSkip.Checked := Ini.ReadBool(Application.Title, CheckBoxSkip.Name, false);

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
  SysUtils.ForceDirectories(ExtractFilePath(Result));
End;

Procedure TForm1.SaveNastr;
Var
  Ini: TMemIniFile;
Begin

  Ini := TMemIniFile.Create(Form1.PortablePath);

  Ini.WriteBool(Application.Title, CheckBoxSkip.Name, CheckBoxSkip.Checked);

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

Function GetDriveVolume(Drive: String): String;
Var
  _VolumeName, _FileSystemName: Array[0..MAX_PATH - 1] Of char;
  _VolumeSerialNo, _MaxComponentLength, _FileSystemFlags: LongWord;
Begin
  Result := '';
  If GetVolumeInformation(pchar(Drive + ':\'), _VolumeName, MAX_PATH, @_VolumeSerialNo, _MaxComponentLength, _FileSystemFlags, _FileSystemName, MAX_PATH) Then
    Result := _VolumeName;
End;

Procedure TForm1.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  SaveNastr;
End;

Procedure TForm1.LoadIcons;
Var
  ShInfo: TSHFileInfo;
Begin
  If Not IconsLoaded Then
  Begin
    SHGetFileInfo(pchar(ExtractFilePath(ParamStr(0)) + 'Data\yes.ico'), 0, ShInfo, SizeOf(ShInfo), SHGFI_ICON Or SHGFI_SYSICONINDEX);
    SuccessIconIndex := ShInfo.iIcon;

    SHGetFileInfo(pchar(ExtractFilePath(ParamStr(0)) + 'Data\no.ico'), 0, ShInfo, SizeOf(ShInfo), SHGFI_ICON Or SHGFI_SYSICONINDEX);
    FailIconIndex := ShInfo.iIcon;

    IconsLoaded := True;
  End;
End;


// Оптимизированная RegisterOCX
Procedure TForm1.RegisterOCX;
Type
  TRegFunc = Function: HResult; Stdcall;
Var
  ARegFunc: TRegFunc;
  aHandle: THandle;
  ocxPath: String;
  I: Integer;
  RegSvrPath: String;
  Success: Boolean;
Begin
  If Form1.ListViewLibraries.ItemIndex = -1 Then
    Exit;

  Stop := False;
  LoadIcons; // Загружаем иконки один раз
  RegSvrPath := GetSpecialFolderPath(CSIDL_SYSTEM) + '\regsvr32.exe';

  For I := 0 To Form1.ListViewLibraries.Items.Count - 1 Do
  Begin
    If Stop Then
      Exit;

    Application.ProcessMessages;

    If Not Form1.ListViewLibraries.Items[I].Checked Then
      Continue;

    ocxPath := Form1.ListViewLibraries.Items[I].Caption;
    Success := False;

    aHandle := LoadLibrary(pchar(ocxPath));
    If aHandle <> 0 Then
    Begin
      Try
        ARegFunc := GetProcAddress(aHandle, 'DllRegisterServer');
        If Assigned(ARegFunc) Then
        Begin
          If ARegFunc = S_OK Then
            Success := True
          Else If ExecAndWait(pchar(RegSvrPath), pchar('/s "' + ocxPath + '"')) Then
            Success := True;
        End
        Else If ExecAndWait(pchar(RegSvrPath), pchar('/s "' + ocxPath + '"')) Then
          Success := True;
      Finally
        FreeLibrary(aHandle);
      End;
    End;

    // Обновляем UI с предзагруженными иконками
    If Success Then
    Begin
      Form1.ListViewLibraries.Items[I].ImageIndex := SuccessIconIndex;
    End
    Else
    Begin
      Form1.ListViewLibraries.Items[I].ImageIndex := FailIconIndex;
    End;

    Form1.ListViewLibraries.Items[I].MakeVisible(True);
    Application.ProcessMessages;
  End;

  Form1.StatusBarLibraries.Panels[0].Text := 'Всего: ' + IntToStr(Form1.ListViewLibraries.Items.Count);
  Form1.StatusBarLibraries.Panels[1].Text := '';
End;

// Оптимизированная UnRegisterOCX
Procedure TForm1.UnRegisterOCX;
Type
  TRegFunc = Function: HResult; Stdcall;
Var
  ARegFunc: TRegFunc;
  aHandle: THandle;
  ocxPath: String;
  I: Integer;
  RegSvrPath: String;
  Success: Boolean;
Begin
  If Form1.ListViewLibraries.ItemIndex = -1 Then
    Exit;

  Stop := False;
  LoadIcons; // Загружаем иконки один раз
  Form1.StatusBarLibraries.Panels[0].Text := '';
  Form1.StatusBarLibraries.Panels[1].Text := '';
  RegSvrPath := GetSpecialFolderPath(CSIDL_SYSTEM) + '\regsvr32.exe';

  For I := 0 To Form1.ListViewLibraries.Items.Count - 1 Do
  Begin
    If Stop Then
      Exit;

    Application.ProcessMessages;

    If Not Form1.ListViewLibraries.Items[I].Checked Then
      Continue;

    ocxPath := Form1.ListViewLibraries.Items[I].Caption;
    Success := False;

    aHandle := LoadLibrary(pchar(ocxPath));
    If aHandle <> 0 Then
    Begin
      Try
        ARegFunc := GetProcAddress(aHandle, 'DllUnregisterServer');
        If Assigned(ARegFunc) Then
        Begin
          If ARegFunc = S_OK Then
            Success := True
          Else If ExecAndWait(pchar(RegSvrPath), pchar('/u /s "' + ocxPath + '"')) Then
            Success := True;
        End
        Else If ExecAndWait(pchar(RegSvrPath), pchar('/u /s "' + ocxPath + '"')) Then
          Success := True;
      Finally
        FreeLibrary(aHandle);
      End;
    End;

    // Обновляем UI с предзагруженными иконками
    If Success Then
    Begin
      Form1.ListViewLibraries.Items[I].ImageIndex := SuccessIconIndex;
    End
    Else
    Begin
      Form1.ListViewLibraries.Items[I].ImageIndex := FailIconIndex;
    End;

    Form1.ListViewLibraries.Items[I].MakeVisible(True);
    Application.ProcessMessages;
  End;

  Form1.StatusBarLibraries.Panels[0].Text := LangTotal.Caption + ' ' + IntToStr(Form1.ListViewLibraries.Items.Count);
  Form1.StatusBarLibraries.Panels[1].Text := '';
End;

// Оптимизированная RegSelectedClick
Procedure TForm1.RegSelectedClick(Sender: TObject);
Type
  TRegFunc = Function: HResult; Stdcall;
Var
  ARegFunc: TRegFunc;
  aHandle: THandle;
  ocxPath: String;
  RegSvrPath: String;
  Success: Boolean;
Begin
  If (ListViewLibraries.ItemIndex = -1) Or (ListViewLibraries.Selected = Nil) Then
    Exit;

  LoadIcons; // Загружаем иконки
  ocxPath := ListViewLibraries.Selected.Caption;

  If IsFileInUse(ocxPath) Then
  Begin
    ListViewLibraries.Selected.ImageIndex := FailIconIndex;
    ListViewLibraries.Selected.MakeVisible(True);
    Form1.StatusBarLibraries.Panels[0].Text := LangReady.Caption;
    Form1.StatusBarLibraries.Panels[1].Text := '';
    Exit;
  End;

  Success := False;
  RegSvrPath := GetSpecialFolderPath(CSIDL_SYSTEM) + '\regsvr32.exe';

  aHandle := LoadLibrary(pchar(ocxPath));
  If aHandle <> 0 Then
  Begin
    Try
      ARegFunc := GetProcAddress(aHandle, 'DllRegisterServer');
      If Assigned(ARegFunc) Then
      Begin
        If ARegFunc = S_OK Then
          Success := True
        Else If ExecAndWait(pchar(RegSvrPath), pchar('/s "' + ocxPath + '"')) Then
          Success := True;
      End
      Else If ExecAndWait(pchar(RegSvrPath), pchar('/s "' + ocxPath + '"')) Then
        Success := True;
    Finally
      FreeLibrary(aHandle);
    End;
  End;

  // Обновляем UI с предзагруженными иконками
  If Success Then
  Begin
    ListViewLibraries.Selected.ImageIndex := SuccessIconIndex;
  End
  Else
  Begin
    ListViewLibraries.Selected.ImageIndex := FailIconIndex;
  End;

  ListViewLibraries.Selected.MakeVisible(True);
  Form1.StatusBarLibraries.Panels[0].Text := LangReady.Caption;
  Form1.StatusBarLibraries.Panels[1].Text := '';
End;

// Оптимизированная UnRegSelectedClick
Procedure TForm1.UnRegSelectedClick(Sender: TObject);
Type
  TRegFunc = Function: HResult; Stdcall;
Var
  ARegFunc: TRegFunc;
  aHandle: THandle;
  ocxPath: String;
  RegSvrPath: String;
  Success: Boolean;
  Msg: Integer;
Begin
  If (ListViewLibraries.ItemIndex = -1) Or (ListViewLibraries.Selected = Nil) Then
    Exit;

  LoadIcons; // Загружаем иконки

  Msg := MessageBox(Application.MainForm.Handle, pchar(LangRedyUnReg.Caption), pchar(LangWarningDanger.Caption), MB_ICONWARNING Or MB_YESNO);
  If Msg <> IDYES Then
    Exit;

  ocxPath := ListViewLibraries.Selected.Caption;

  If IsFileInUse(ocxPath) Then
  Begin
    ListViewLibraries.Selected.ImageIndex := FailIconIndex;
    ListViewLibraries.Selected.MakeVisible(True);
    Form1.StatusBarLibraries.Panels[0].Text := LangReady.Caption;
    Form1.StatusBarLibraries.Panels[1].Text := '';
    Exit;
  End;

  Success := False;
  RegSvrPath := GetSpecialFolderPath(CSIDL_SYSTEM) + '\regsvr32.exe';

  aHandle := LoadLibrary(pchar(ocxPath));
  If aHandle <> 0 Then
  Begin
    Try
      ARegFunc := GetProcAddress(aHandle, 'DllUnregisterServer');
      If Assigned(ARegFunc) Then
      Begin
        If ARegFunc = S_OK Then
          Success := True
        Else If ExecAndWait(pchar(RegSvrPath), pchar('/u /s "' + ocxPath + '"')) Then
          Success := True;
      End
      Else If ExecAndWait(pchar(RegSvrPath), pchar('/u /s "' + ocxPath + '"')) Then
        Success := True;
    Finally
      FreeLibrary(aHandle);
    End;
  End;

  // Обновляем UI с предзагруженными иконками
  If Success Then
  Begin
    ListViewLibraries.Selected.ImageIndex := SuccessIconIndex;
  End
  Else
  Begin
    ListViewLibraries.Selected.ImageIndex := FailIconIndex;
  End;

  ListViewLibraries.Selected.MakeVisible(True);
  Application.ProcessMessages;
  Form1.StatusBarLibraries.Panels[0].Text := LangReady.Caption;
  Form1.StatusBarLibraries.Panels[1].Text := '';
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
  TabSheetBase.TabVisible := false;
  TabSheetPro.TabVisible := false;
  Application.ProcessMessages;
  DragAcceptFiles(Handle, true);
  Application.ProcessMessages;
  createicon(ListViewLibraries);
  IconsLoaded := False;
  LoadIcons;
  Application.ProcessMessages;

  Application.ProcessMessages;
  Form1.LoadNastr;
  ButtonUserClick(Sender);
  Application.ProcessMessages;
End;

Procedure TForm1.FormDestroy(Sender: TObject);
Begin
  DragAcceptFiles(Handle, false);
End;

Procedure TForm1.UnCheckAllClick(Sender: TObject);
Var
  I, c: Integer;
Begin
  c := Form1.ListViewLibraries.Items.Count - 1;
  For I := 0 To c Do
  Begin
    Form1.ListViewLibraries.Items[I].Checked := false;
  End;
End;

Procedure TForm1.DeleteElementClick(Sender: TObject);
Begin
  If ListViewLibraries.ItemIndex = -1 Then
    Exit;
  Form1.ListViewLibraries.Selected.Delete;
  If ListViewLibraries.ItemIndex <> -1 Then
  Begin
    ButtonRegLibraries.Enabled := true;
    ButtonUnRegLibraries.Enabled := true;
  End;
  If ListViewLibraries.ItemIndex = -1 Then
  Begin
    ButtonRegLibraries.Enabled := false;
    ButtonUnRegLibraries.Enabled := false;
  End;
  Form1.StatusBarLibraries.Panels[0].Text := LangTotal.Caption + ' ' + inttostr(Form1.ListViewLibraries.Items.Count);
  Form1.StatusBarLibraries.Panels[1].Text := '';
End;

Procedure TForm1.CheckAllClick(Sender: TObject);
Var
  I, c: Integer;
Begin
  c := Form1.ListViewLibraries.Items.Count - 1;
  For I := 0 To c Do
  Begin
    Form1.ListViewLibraries.Items[I].Checked := true;
  End;
End;

Procedure TForm1.CheckBoxSkipClick(Sender: TObject);
Begin
  Application.ProcessMessages;
End;

Procedure TForm1.ClearListClick(Sender: TObject);
Begin
  Form1.ListViewLibraries.Clear;
  ButtonRegLibraries.Enabled := false;
  ButtonUnRegLibraries.Enabled := false;
  Form1.StatusBarLibraries.Panels[0].Text := LangTotal.Caption + ' ' + inttostr(Form1.ListViewLibraries.Items.Count);
  Form1.StatusBarLibraries.Panels[1].Text := '';
End;

Procedure TForm1.Button1Click(Sender: TObject);
Var
  put: String;
Begin
  SelectDirectory(LangFolder.Caption, '', put, [sdNewFolder, sdNewUI, sdValidateDir, sdShowShares]);
  If put <> '' Then
  Begin
    put := pchar(StringReplace(put, '\\', '\', [rfReplaceAll]));
    EditSearchPath.Text := put + '\';
  End;
  If put = '' Then
  Begin
    EditSearchPath.Text := GetSpecialFolderPath(CSIDL_SYSTEM) + '\';
  End;
End;

Procedure TForm1.Button2Click(Sender: TObject);
Begin
  EditSearchPath.Text := GetSpecialFolderPath(CSIDL_SYSTEM) + '\';
End;

Procedure TForm1.ButtonBrowseClick(Sender: TObject);
Var
  put: String;
Begin
  SelectDirectory(Form1.LangFolder.Caption, '', put, [sdNewFolder, sdNewUI, sdValidateDir, sdShowShares]);
  If put <> '' Then
  Begin
    put := pchar(StringReplace(put, '\\', '\', [rfReplaceAll]));
    EditSearchPath.Text := put + '\';
  End;
  If put = '' Then
  Begin
    EditSearchPath.Text := GetSpecialFolderPath(CSIDL_SYSTEM) + '\';
  End;
End;

Procedure TForm1.ButtonExpertClick(Sender: TObject);
Begin
  UnRegSelected.Enabled := true;
  TabControlLibraries.Visible := true;
  PageControl.ActivePageIndex := 1;
  ButtonSearchLibraries.Enabled := true;
  ButtonUser.Font.Style := [];
  ButtonExpert.Font.Style := [fsBold];
End;

Procedure TForm1.ButtonUserClick(Sender: TObject);
Begin
  UnRegSelected.Enabled := false;
  TabControlLibraries.Visible := false;
  PageControl.ActivePageIndex := 0;
  ButtonSearchLibraries.Enabled := false;
  ButtonUser.Font.Style := [fsBold];
  ButtonExpert.Font.Style := [];
End;

Procedure TForm1.ButtonUnRegLibrariesClick(Sender: TObject);
Begin
  Msg := messagebox(Application.MainForm.Handle, pchar(LangRedyUnReg.Caption), pchar(LangWarningDanger.Caption), MB_ICONWARNING Or mb_yesno);
  If Msg = idyes Then
  Begin
    Case ButtonUnRegLibraries.Tag Of
      0:
        Begin
          ButtonUnRegLibraries.Tag := 1;
          ButtonUnRegLibraries.Caption := LangStop.Caption;
          ButtonSearchLibraries.Enabled := false;
          ButtonRegLibraries.Enabled := false;
          PopupMenuList.AutoPopup := false;
          TabControl5.Enabled := false;
          TabControlPanel.Enabled := false;
          TabControlLibraries.Enabled := false;
          SpeedButton_GeneralMenu.Enabled := false;
          Stop := false;
          UnRegisterOCX;
          ButtonUnRegLibraries.Tag := 0;
          ButtonUnRegLibraries.Caption := LangUnReg.Caption;
          ButtonSearchLibraries.Enabled := true;
          ButtonRegLibraries.Enabled := true;
          PopupMenuList.AutoPopup := true;
          TabControl5.Enabled := true;
          TabControlPanel.Enabled := true;
          TabControlLibraries.Enabled := true;
          SpeedButton_GeneralMenu.Enabled := true;
        End;
      1:
        Begin
          Stop := true;
          ButtonUnRegLibraries.Tag := 0;
          ButtonUnRegLibraries.Caption := LangUnReg.Caption;
          ButtonRegLibraries.Enabled := true;
          ButtonSearchLibraries.Enabled := true;
          PopupMenuList.AutoPopup := true;
          TabControl5.Enabled := true;
          TabControlPanel.Enabled := true;
          TabControlLibraries.Enabled := true;
          SpeedButton_GeneralMenu.Enabled := true;
          Form1.ListViewLibraries.Items[0].MakeVisible(true);
          Form1.ListViewLibraries.Items[0].Selected := true;
          Form1.ListViewLibraries.Items[0].Focused := true;
          Form1.ListViewLibraries.SetFocus;
          Form1.StatusBarLibraries.Panels[0].Text := LangTotal.Caption + ' ' + inttostr(Form1.ListViewLibraries.Items.Count);
          Form1.StatusBarLibraries.Panels[1].Text := '';
        End;
    End;
  End;
End;

Procedure TForm1.ButtonListClick(Sender: TObject);
Var
  g: Integer;
Begin
  Case ButtonList.Tag Of
    0:
      Begin
        ButtonList.Tag := 1;
        ButtonList.Caption := LangStop.Caption;
        ButtonRegLibraries.Enabled := false;
        ButtonUnRegLibraries.Enabled := false;
        ButtonSearchLibraries.Enabled := false;
        SpeedButton_GeneralMenu.Enabled := false;
        ButtonRegLibrariesBase.Enabled := False;
        Stop := false;
        TabControl5.Enabled := false;
        TabControlPanel.Enabled := false;
        Spisok;
        ButtonList.Tag := 0;
        ButtonList.Caption := LangList.Caption;
        ButtonSearchLibraries.Enabled := true;
        TabControl5.Enabled := true;
        TabControlPanel.Enabled := true;
        SpeedButton_GeneralMenu.Enabled := true;
        ButtonRegLibrariesBase.Enabled := true;
        Try
          Form1.ListViewLibraries.Items[0].MakeVisible(true);
          Form1.ListViewLibraries.Items[0].Selected := true;
          Form1.ListViewLibraries.Items[0].Focused := true;
          Form1.ListViewLibraries.SetFocus;
        Except
        End;
        Application.ProcessMessages;
        Try
          For g := 0 To Form1.ListViewLibraries.Columns.Count - 1 Do
          Begin
            ListView_SetColumnWidth(Form1.ListViewLibraries.Handle, g, LVSCW_AUTOSIZE_USEHEADER);
          End;
        Except
        End;
      End;
    1:
      Begin
        Stop := true;
        ButtonList.Tag := 0;
        ButtonList.Caption := LangList.Caption;
        ButtonSearchLibraries.Enabled := true;
        TabControl5.Enabled := true;
        TabControlPanel.Enabled := true;
        SpeedButton_GeneralMenu.Enabled := true;
        ButtonRegLibrariesBase.Enabled := true;
        Try
          Form1.ListViewLibraries.Items[0].MakeVisible(true);
          Form1.ListViewLibraries.Items[0].Selected := true;
          Form1.ListViewLibraries.Items[0].Focused := true;
          Form1.ListViewLibraries.SetFocus;
        Except
        End;
        Application.ProcessMessages;
        Try
          For g := 0 To Form1.ListViewLibraries.Columns.Count - 1 Do
          Begin
            ListView_SetColumnWidth(Form1.ListViewLibraries.Handle, g, LVSCW_AUTOSIZE_USEHEADER);
          End;
        Except
        End;
      End;
  End;
End;

Procedure TForm1.ButtonRegLibrariesClick(Sender: TObject);
Begin
  Case ButtonRegLibraries.Tag Of
    0:
      Begin
        ButtonRegLibraries.Tag := 1;
        ButtonRegLibrariesBase.Tag := 1;
        ButtonRegLibraries.Caption := LangStop.Caption;
        ButtonRegLibrariesBase.Caption := LangStop.Caption;
        ButtonUnRegLibraries.Enabled := false;
        ButtonSearchLibraries.Enabled := false;
        TabControlLibraries.Enabled := false;
        PopupMenuList.AutoPopup := false;
        ButtonList.Enabled := false;
        Stop := false;
        TabControl5.Enabled := false;
        TabControlPanel.Enabled := false;
        SpeedButton_GeneralMenu.Enabled := false;
        RegisterOCX;
        ButtonRegLibraries.Tag := 0;
        ButtonRegLibrariesBase.Tag := 0;
        ButtonRegLibraries.Caption := LangReg.Caption;
        ButtonRegLibrariesBase.Caption := LangReg.Caption;
        ButtonUnRegLibraries.Enabled := true;
        ButtonSearchLibraries.Enabled := true;
        TabControlLibraries.Enabled := true;
        PopupMenuList.AutoPopup := true;
        ButtonList.Enabled := true;
        TabControl5.Enabled := true;
        TabControlPanel.Enabled := true;
        SpeedButton_GeneralMenu.Enabled := true;
      End;
    1:
      Begin
        Stop := true;
        ButtonRegLibraries.Tag := 0;
        ButtonRegLibrariesBase.Tag := 0;
        ButtonRegLibraries.Caption := LangReg.Caption;
        ButtonRegLibrariesBase.Caption := LangReg.Caption;
        ButtonUnRegLibraries.Enabled := true;
        ButtonSearchLibraries.Enabled := true;
        TabControlLibraries.Enabled := true;
        PopupMenuList.AutoPopup := true;
        ButtonList.Enabled := true;
        TabControl5.Enabled := true;
        TabControlPanel.Enabled := true;
        SpeedButton_GeneralMenu.Enabled := true;
        Form1.ListViewLibraries.Items[0].MakeVisible(true);
        Form1.ListViewLibraries.Items[0].Selected := true;
        Form1.ListViewLibraries.Items[0].Focused := true;
        Form1.ListViewLibraries.SetFocus;
        Form1.StatusBarLibraries.Panels[0].Text := LangTotal.Caption + ' ' + inttostr(Form1.ListViewLibraries.Items.Count);
        Form1.StatusBarLibraries.Panels[1].Text := '';
      End;
  End;
End;

Procedure TForm1.ButtonResetClick(Sender: TObject);
Begin
  EditSearchPath.Text := GetSpecialFolderPath(CSIDL_SYSTEM) + '\';
End;

Procedure TForm1.ButtonSearchLibrariesClick(Sender: TObject);
Var
  g: Integer;
Begin
  Case ButtonSearchLibraries.Tag Of
    0:
      Begin
        ButtonSearchLibraries.Tag := 1;
        ButtonSearchLibraries.Caption := LangStop.Caption;
        ButtonRegLibraries.Enabled := false;
        ButtonUnRegLibraries.Enabled := false;
        TabControlLibraries.Enabled := false;
        SpeedButton_GeneralMenu.Enabled := false;
        Stop := false;
        TabControl5.Enabled := false;
        TabControlPanel.Enabled := false;
        Find(EditSearchPath.Text);
        Form1.StatusBarLibraries.Panels[1].Text := '';
        ButtonSearchLibraries.Tag := 0;
        ButtonSearchLibraries.Caption := LangSearch.Caption;
        ButtonRegLibraries.Enabled := true;
        ButtonUnRegLibraries.Enabled := true;
        TabControl5.Enabled := true;
        TabControlPanel.Enabled := true;
        TabControlLibraries.Enabled := true;
        SpeedButton_GeneralMenu.Enabled := true;
        Try
          Form1.ListViewLibraries.Items[0].MakeVisible(true);
          Form1.ListViewLibraries.Items[0].Selected := true;
          Form1.ListViewLibraries.Items[0].Focused := true;
          Form1.ListViewLibraries.SetFocus;
        Except
        End;
        Try
          For g := 0 To Form1.ListViewLibraries.Columns.Count - 1 Do
          Begin
            ListView_SetColumnWidth(Form1.ListViewLibraries.Handle, g, LVSCW_AUTOSIZE_USEHEADER);
          End;
        Except
        End;
      End;
    1:
      Begin
        Stop := true;
        Form1.StatusBarLibraries.Panels[1].Text := '';
        ButtonSearchLibraries.Tag := 0;
        ButtonSearchLibraries.Caption := LangSearch.Caption;
        ButtonRegLibraries.Enabled := true;
        ButtonUnRegLibraries.Enabled := true;
        TabControl5.Enabled := true;
        TabControlPanel.Enabled := true;
        TabControlLibraries.Enabled := true;
        SpeedButton_GeneralMenu.Enabled := true;
        Try
          Form1.ListViewLibraries.Items[0].MakeVisible(true);
          Form1.ListViewLibraries.Items[0].Selected := true;
          Form1.ListViewLibraries.Items[0].Focused := true;
          Form1.ListViewLibraries.SetFocus;
        Except
        End;
        Try
          For g := 0 To Form1.ListViewLibraries.Columns.Count - 1 Do
          Begin
            ListView_SetColumnWidth(Form1.ListViewLibraries.Handle, g, LVSCW_AUTOSIZE_USEHEADER);
          End;
        Except
        End;
      End;
  End;
End;

Procedure TForm1.Find(Dir: String);
Var
  DirInfo: TSearchRec;
  FindRes: Integer;
  ListItem: TListItem;
  ShInfo: TSHFileInfo;
Begin
  If Stop = true Then
    Exit;
  Form1.ListViewLibraries.Clear;
  Form1.StatusBarLibraries.Panels[0].Text := '';
  Form1.StatusBarLibraries.Panels[1].Text := '';
  If Form1.CheckBoxSkip.Checked Then
  Begin
    FindRes := FindFirst(Dir + FilterComboBox.Mask, faAnyFile, DirInfo);
    While FindRes = 0 Do
    Begin
      If Stop = true Then
        Exit;
      If Stop = true Then
        FindClose(DirInfo);
      Application.ProcessMessages;
      If ((DirInfo.Attr And faDirectory) = faDirectory) And ((DirInfo.Name = '.') Or (DirInfo.Name = '..')) Then
      Begin
        FindRes := FindNext(DirInfo);
        Continue;
      End;
      If ((DirInfo.Attr And faDirectory) = faDirectory) Then
      Begin
        Find(Dir + DirInfo.Name + '\');
        FindRes := FindNext(DirInfo);
        Continue;
      End;
      If IsFileInUse(Dir + DirInfo.Name) = false Then
      Begin
        ListItem := Form1.ListViewLibraries.Items.Add;
        PUTI := Dir + DirInfo.Name;
        With ListItem Do
        Begin
          SHGetFileInfo(pchar(PUTI), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
          ImageIndex := ShInfo.iIcon;
          Caption := PUTI;
          Form1.StatusBarLibraries.Panels[1].Text := PUTI;
          SubItems.Add(ShInfo.szTypeName);
          SubItems.Add(getCompanyName(PUTI));
          SubItems.Add(GetFileVersion(PUTI));
          SubItems.Add(GetNormalSize(GetFileSize(pchar(PUTI))));
          SubItems.Add(FormatDateTime('dd.mm.yy hh:mm', GetFileDateTime(PUTI)));
          SubItems.Add(getFileDescription(PUTI));
          Checked := true;
          Application.ProcessMessages;
          Form1.StatusBarLibraries.Panels[0].Text := LangTotal.Caption + ' ' + inttostr(Form1.ListViewLibraries.Items.Count);
        End;
      End;
      FindRes := FindNext(DirInfo);
    End;
    FindClose(DirInfo);
  End;

  If Form1.CheckBoxSkip.Checked = false Then
  Begin
    FindRes := FindFirst(Dir + FilterComboBox.Mask, faAnyFile, DirInfo);
    While FindRes = 0 Do
    Begin
      If Stop = true Then
        Exit;
      If Stop = true Then
        FindClose(DirInfo);
      If ((DirInfo.Attr And faDirectory) = faDirectory) And ((DirInfo.Name = '.') Or (DirInfo.Name = '..')) Then
      Begin
        FindRes := FindNext(DirInfo);
        Continue;
      End;
      If ((DirInfo.Attr And faDirectory) = faDirectory) Then
      Begin
        Find(pchar(Dir + DirInfo.Name + '\'));
        FindRes := FindNext(DirInfo);
        Continue;
      End;
      PUTI := Dir + DirInfo.Name;
      ListItem := Form1.ListViewLibraries.Items.Add;
      With ListItem Do
      Begin
        SHGetFileInfo(pchar(PUTI), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
        ImageIndex := ShInfo.iIcon;
        Caption := PUTI;
        Form1.StatusBarLibraries.Panels[1].Text := PUTI;
        SubItems.Add(ShInfo.szTypeName);
        SubItems.Add(getCompanyName(PUTI));
        SubItems.Add(GetFileVersion(PUTI));
        SubItems.Add(GetNormalSize(GetFileSize(pchar(PUTI))));
        SubItems.Add(FormatDateTime('dd.mm.yy hh:mm', GetFileDateTime(PUTI)));
        SubItems.Add(getFileDescription(PUTI));
        Checked := true;
        Application.ProcessMessages;
        Form1.StatusBarLibraries.Panels[0].Text := LangTotal.Caption + ' ' + inttostr(Form1.ListViewLibraries.Items.Count);
      End;
      FindRes := FindNext(DirInfo);
    End;
    FindClose(DirInfo);
  End;
  If ListViewLibraries.ItemIndex <> -1 Then
  Begin
    ButtonRegLibraries.Enabled := true;
    ButtonUnRegLibraries.Enabled := true;
  End;
  If ListViewLibraries.ItemIndex = -1 Then
  Begin
    ButtonRegLibraries.Enabled := false;
    ButtonUnRegLibraries.Enabled := false;
  End;
  Form1.StatusBarLibraries.Panels[1].Text := '';
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

Procedure TForm1.Spisok;
Var
  I: Integer;
  ShInfo: TSHFileInfo;
  PUTI: String;
Begin
  Stop := false;
  ListViewLibraries.Clear;
  Form1.StatusBarLibraries.Panels[0].Text := '';
  Form1.StatusBarLibraries.Panels[1].Text := '';
  For I := 0 To Form1.MemoList.Lines.Count - 1 Do
  Begin
    If Stop = true Then
      Exit;
    PUTI := GetSpecialFolderPath(CSIDL_SYSTEM) + '\' + Form1.MemoList.Lines.Strings[I];
    Application.ProcessMessages;
    If FileExists(PUTI) = false Then
      Continue;

    If Form1.CheckBoxSkip.Checked Then
    Begin
      If IsFileInUse(PUTI) = true Then
        Continue;
      With Form1.ListViewLibraries.Items.Add Do
      Begin
        SHGetFileInfo(pchar(PUTI), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
        ImageIndex := ShInfo.iIcon;
        Caption := PUTI;
        Form1.StatusBarLibraries.Panels[1].Text := PUTI;
        SubItems.Add(ShInfo.szTypeName);
        SubItems.Add(getCompanyName(PUTI));
        SubItems.Add(GetFileVersion(PUTI));
        SubItems.Add(GetNormalSize(GetFileSize(pchar(PUTI))));
        SubItems.Add(FormatDateTime('dd.mm.yy hh:mm', GetFileDateTime(PUTI)));
        SubItems.Add(getFileDescription(PUTI));
        Checked := true;
        Application.ProcessMessages;
        Form1.StatusBarLibraries.Panels[0].Text := LangTotal.Caption + ' ' + inttostr(Form1.ListViewLibraries.Items.Count);
      End;
    End;

    If Form1.CheckBoxSkip.Checked = false Then
    Begin
      If IsFileInUse(PUTI) = false Then
      Begin
        With Form1.ListViewLibraries.Items.Add Do
        Begin
          SHGetFileInfo(pchar(PUTI), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
          ImageIndex := ShInfo.iIcon;
          Caption := PUTI;
          Form1.StatusBarLibraries.Panels[1].Text := PUTI;
          SubItems.Add(ShInfo.szTypeName);
          SubItems.Add(getCompanyName(PUTI));
          SubItems.Add(GetFileVersion(PUTI));
          SubItems.Add(GetNormalSize(GetFileSize(pchar(PUTI))));
          SubItems.Add(FormatDateTime('dd.mm.yy hh:mm', GetFileDateTime(PUTI)));
          SubItems.Add(getFileDescription(PUTI));
          Checked := true;
          Application.ProcessMessages;
          Form1.StatusBarLibraries.Panels[0].Text := LangTotal.Caption + ' ' + inttostr(Form1.ListViewLibraries.Items.Count);
        End;
      End;
    End;
  End;
  If ListViewLibraries.ItemIndex <> -1 Then
  Begin
    ButtonRegLibraries.Enabled := true;
    ButtonUnRegLibraries.Enabled := true;
  End;
  If ListViewLibraries.ItemIndex = -1 Then
  Begin
    ButtonRegLibraries.Enabled := false;
    ButtonUnRegLibraries.Enabled := false;
  End;
  Form1.StatusBarLibraries.Panels[1].Text := '';
  Application.ProcessMessages;
End;

Procedure TForm1.OpenFolderClick(Sender: TObject);
Begin
  If ListViewLibraries.ItemIndex = -1 Then
    Exit;
  OpenExplorerAndSelectFile(ListViewLibraries.Selected.Caption);
  Application.ProcessMessages;
End;

Procedure ShowPropertiesDialog(FName: String);
Var
  SExInfo: TSHELLEXECUTEINFO;
  // Error: LongInt;
Begin
  ZeroMemory(Addr(SExInfo), SizeOf(SExInfo));
  SExInfo.cbSize := SizeOf(SExInfo);
  SExInfo.lpFile := pchar(FName);
  SExInfo.lpVerb := 'properties';
  SExInfo.fMask := SEE_MASK_INVOKEIDLIST;
  ShellExecuteEx(Addr(SExInfo));
End;

Procedure TForm1.PropertiesClick(Sender: TObject);
Begin
  If ListViewLibraries.ItemIndex = -1 Then
    Exit;
  ShowPropertiesDialog(pchar(ListViewLibraries.Selected.Caption));
  Application.ProcessMessages;
End;

Procedure TForm1.WMDropFiles(Var Msg: TWMDropFiles);
Const
  maxlen = 254;
Var
  h: THandle;
  I, num: Integer;
  pchr: Array[0..maxlen] Of char;
  FName: String;
  ListItem: TListItem;
  ShInfo: TSHFileInfo;
Begin
  Try
    h := Msg.Drop;
    num := DragQueryFile(h, dword(-1), Nil, 0);
    For I := 0 To num - 1 Do
    Begin
      DragQueryFile(h, I, pchr, maxlen);
      FName := pchr;
      If Form1.CheckBoxSkip.Checked Then
      Begin
        If (lowercase(ExtractFileExt(FName)) = '.dll') Or (lowercase(ExtractFileExt(FName)) = '.ocx') Or (lowercase(ExtractFileExt(FName)) = '.ax') Then
        Begin
          If IsFileInUse(FName) = false Then
          Begin
            ListItem := Form1.ListViewLibraries.Items.Add;
            With ListItem Do
            Begin
              SHGetFileInfo(pchar(FName), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
              ImageIndex := ShInfo.iIcon;
              Caption := FName;
              SubItems.Add(ShInfo.szTypeName);
              SubItems.Add(getCompanyName(FName));
              SubItems.Add(GetFileVersion(FName));
              SubItems.Add(GetNormalSize(GetFileSize(pchar(ExpandFileName(FName)))));
              // SubItems.Add(FileCreationTime(FName));
              SubItems.Add(FormatDateTime('dd.mm.yy hh:mm', GetFileDateTime(PUTI)));
              SubItems.Add(getFileDescription(FName));
              Checked := true;
              Application.ProcessMessages;
            End;
          End;
        End;
      End;
    End;

    If Form1.CheckBoxSkip.Checked = false Then
    Begin
      If (lowercase(ExtractFileExt(FName)) = '.dll') Or (lowercase(ExtractFileExt(FName)) = '.ocx') Or (lowercase(ExtractFileExt(FName)) = '.ax') Then
      Begin
        ListItem := Form1.ListViewLibraries.Items.Add;
        With ListItem Do
        Begin
          SHGetFileInfo(pchar(FName), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
          ImageIndex := ShInfo.iIcon;
          Caption := FName;
          SubItems.Add(ShInfo.szTypeName);
          SubItems.Add(getCompanyName(FName));
          SubItems.Add(GetFileVersion(FName));
          SubItems.Add(GetNormalSize(GetFileSize(pchar(ExpandFileName(FName)))));
          // SubItems.Add(FileCreationTime(FName));
          SubItems.Add(FormatDateTime('dd.mm.yy hh:mm', GetFileDateTime(PUTI)));
          SubItems.Add(getFileDescription(FName));
          Checked := true;
          Application.ProcessMessages;
        End;
      End;
    End;
    DragFinish(h);
    Form1.StatusBarLibraries.Panels[0].Text := LangTotal.Caption + ' ' + inttostr(Form1.ListViewLibraries.Items.Count);
  Except
  End;
End;

End.

