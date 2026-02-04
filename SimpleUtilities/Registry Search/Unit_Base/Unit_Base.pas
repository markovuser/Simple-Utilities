Unit Unit_Base;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, registry, Menus, IniFiles, ImgList, shellapi,
  ShlObj, SHFolder, SHDocVw, Gauges, PngImage, CommCtrl, System.ImageList,
  Vcl.Buttons, WindowsDarkMode, Translation, FileInfoUtils;

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
    PopupMenuDelete: TPopupMenu;
    DeleteItemMenu: TMenuItem;
    ListClearMenu: TMenuItem;
    N3: TMenuItem;
    DeleteRegKeyMenu: TMenuItem;
    DeleteRegValueMenu: TMenuItem;
    StatusBarRegSearch: TStatusBar;
    SaveDialogReport: TSaveDialog;
    TabControlRegSearch4: TTabControl;
    TabControlRegSearch3: TTabControl;
    ButtonSearchRegSearch: TButton;
    PopupMenuGeneral: TPopupMenu;
    LogMenu: TMenuItem;
    SpeedButton_GeneralMenu: TSpeedButton;
    PopupMenuLanguage: TPopupMenu;
    LangSearchLog: TMenuItem;
    LangStop: TMenuItem;
    LangFound: TMenuItem;
    LangError: TMenuItem;
    LangTotal: TMenuItem;
    LangAttention: TMenuItem;
    LangDeleteValue: TMenuItem;
    LangDeleteKey: TMenuItem;
    LangEnterSearch: TMenuItem;
    LangChapter: TMenuItem;
    LangKey: TMenuItem;
    LangValue: TMenuItem;
    LangMeaning: TMenuItem;
    TabControlPanel: TTabControl;
    ButtonRegSearch: TButton;
    ButtonBackupsRegSearch: TButton;
    PageControl: TPageControl;
    TabSheetRegistry: TTabSheet;
    LabelStatusRegSearch: TLabel;
    TabSheetBackups: TTabSheet;
    TabControlBackupsRegSearch: TTabControl;
    ListViewBackupsRegSearch: TListView;
    TabControlRegSearch1: TTabControl;
    GroupBoxParametersRegSearch: TGroupBox;
    CheckBoxKeysRegSearch: TCheckBox;
    CheckBoxValuesRegSearch: TCheckBox;
    CheckBoxDataRegSearch: TCheckBox;
    GroupBoxHKEYRegSearch: TGroupBox;
    CheckBoxHKCRRegSearch: TCheckBox;
    CheckBoxHKCCRegSearch: TCheckBox;
    CheckBoxHKCURegSearch: TCheckBox;
    CheckBoxHKLMRegSearch: TCheckBox;
    CheckBoxHKURegSearch: TCheckBox;
    GroupBoxSearchRegSearch: TGroupBox;
    EditSearchRegSearch: TEdit;
    ImageList3: TImageList;
    PopupMenuBackups: TPopupMenu;
    BackupsUpdateMenu: TMenuItem;
    N1: TMenuItem;
    BackupsRestoreMenu: TMenuItem;
    N2: TMenuItem;
    BackupsDelAllMenu: TMenuItem;
    BackupsDelMenu: TMenuItem;
    TabControlRegSearch2: TTabControl;
    ListViewRegSearch: TListView;
    MemoBackupsRegSearch: TMemo;
    LangOnlyWindows: TMenuItem;
    Procedure FormCreate(Sender: TObject);
    Procedure LoadNastr;
    Procedure SaveNastr;
    Procedure Report;
    Procedure IsValidData(Const AKey, AValue, AData: pchar);
    Procedure InitScan;
    Procedure Scan(Key: String);
    Procedure RegCopy;
    Procedure DeleteItemMenuClick(Sender: TObject);
    Procedure ListClearMenuClick(Sender: TObject);
    Procedure DeleteRegKeyMenuClick(Sender: TObject);
    Procedure DeleteRegValueMenuClick(Sender: TObject);
    Procedure N3Click(Sender: TObject);
    Procedure ButtonSearchRegSearchClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure LogMenuClick(Sender: TObject);
    Procedure SpeedButton_GeneralMenuClick(Sender: TObject);
    Procedure globload;
    Procedure CleanTranslationsLikeGlobload;
    Function FindFileCopy(Dir: String): Boolean;
    Procedure ButtonBackupsRegSearchClick(Sender: TObject);
    Procedure ButtonRegSearchClick(Sender: TObject);
    Procedure BackupsUpdateMenuClick(Sender: TObject);
    Procedure BackupsRestoreMenuClick(Sender: TObject);
    Procedure BackupsDelAllMenuClick(Sender: TObject);
    Procedure BackupsDelMenuClick(Sender: TObject);
    Function IsWindows10Or11: Boolean;
    Function PortablePath: String;
  Private
    Procedure WMMouseMove(Var Message: TWMMouseMove); Message WM_MOUSEMOVE;
    Procedure WMSettingChange(Var Message: TWMSettingChange); Message WM_SETTINGCHANGE;
  Public
    { Public declarations }
  End;

Var
  Form1: TForm1;
  Root: Cardinal;
  sort: Integer = 1;
  Msg: Integer;
  reg: tRegistry;
  puti, FileDescription, CompanyName: String;
  Stop: Boolean;
  scanning: Boolean;
  FReg: tRegistry;
  FTotal, FLast: Integer;
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
  ThemeAuto: Boolean;
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

Procedure TForm1.IsValidData(Const AKey, AValue, AData: pchar);
Var
  TmpStr: pchar;
  ShInfo: TSHFileInfo;
  i: Integer;
Begin
  SHGetFileInfo(pchar(ParamStr(0)), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);

  Inc(FTotal);
  If FTotal - FLast > 500 Then
  Begin
    If scanning = false Then
      Exit;
    FLast := FTotal;
    StatusBarRegSearch.Panels.Items[0].Text := LangTotal.Caption + ' ' + IntToStr(FTotal);
    StatusBarRegSearch.Panels.Items[1].Text := LangFound.Caption + ' ' + IntToStr(ListViewRegSearch.Items.Count);
    TmpStr := AKey;
    If AValue <> '' Then
      TmpStr := pchar(TmpStr + ' {' + AValue + '}');
    StatusBarRegSearch.Panels.Items[3].Text := TmpStr;
    Application.ProcessMessages;
  End;
  If AKey <> '' Then
    If CheckBoxKeysRegSearch.Checked Then
      If Pos(EditSearchRegSearch.Text, AKey) > 0 Then
        With ListViewRegSearch.Items.Add Do
        Begin
          Caption := StatusBarRegSearch.Panels.Items[2].Text;
          SubItems.Add(AKey);
          SubItems.Add('');
          SubItems.Add('');
          ImageIndex := ShInfo.iIcon;
          Application.ProcessMessages;
        End;
  If AValue <> '' Then
    If CheckBoxValuesRegSearch.Checked Then
      If Pos(EditSearchRegSearch.Text, AValue) > 0 Then
        With ListViewRegSearch.Items.Add Do
        Begin
          Caption := StatusBarRegSearch.Panels.Items[2].Text;
          SubItems.Add(AKey);
          SubItems.Add(AValue);
          SubItems.Add('');
          ImageIndex := ShInfo.iIcon;
          Application.ProcessMessages;
        End;
  If AData <> '' Then
    If CheckBoxDataRegSearch.Checked Then
      If Pos(EditSearchRegSearch.Text, AData) > 0 Then
        With ListViewRegSearch.Items.Add Do
        Begin
          Caption := StatusBarRegSearch.Panels.Items[2].Text;
          SubItems.Add(AKey);
          SubItems.Add(AValue);
          SubItems.Add(AData);
          ImageIndex := ShInfo.iIcon;
          Application.ProcessMessages;

          For i := 0 To ListViewRegSearch.Columns.Count - 1 Do
          Begin
            ListView_SetColumnWidth(ListViewRegSearch.Handle, i, LVSCW_AUTOSIZE_USEHEADER);
          End;
        End;
End;

Function OpenRegEditAndJumpToKey(Const KeyName: String): Boolean;
Begin
  With tRegistry.Create Do
  Try
    RootKey := HKEY_CURRENT_USER;
    Result := OpenKey('Software\Microsoft\Windows\CurrentVersion\Applets\Regedit', false);
    If Result Then
    Try
      Try
        WriteString('LastKey', KeyName);
      Except
        Result := false;
        Exit;
      End;
    Except
      CloseKey;
    End;
  Except
    Free;
  End;
  Result := ShellExecute(0, 'open', 'regedit.exe', Nil, Nil, SW_SHOWNORMAL) > HINSTANCE_ERROR;
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

// Сохранение настроек

Procedure TForm1.SaveNastr;
Var
  Ini: TMemIniFile;
Begin

  Ini := TMemIniFile.Create(Form1.PortablePath);

  Ini.WriteBool(Application.Title, CheckBoxHKLMRegSearch.Name, CheckBoxHKLMRegSearch.Checked);
  Ini.WriteBool(Application.Title, CheckBoxHKCURegSearch.Name, CheckBoxHKCURegSearch.Checked);
  Ini.WriteBool(Application.Title, CheckBoxHKCCRegSearch.Name, CheckBoxHKCCRegSearch.Checked);
  Ini.WriteBool(Application.Title, CheckBoxHKCRRegSearch.Name, CheckBoxHKCRRegSearch.Checked);
  Ini.WriteBool(Application.Title, CheckBoxHKURegSearch.Name, CheckBoxHKURegSearch.Checked);
  Ini.WriteBool(Application.Title, CheckBoxKeysRegSearch.Name, CheckBoxKeysRegSearch.Checked);
  Ini.WriteBool(Application.Title, CheckBoxValuesRegSearch.Name, CheckBoxValuesRegSearch.Checked);
  Ini.WriteBool(Application.Title, CheckBoxDataRegSearch.Name, CheckBoxDataRegSearch.Checked);

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

// Загрузка настроек

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

  CheckBoxHKLMRegSearch.Checked := Ini.ReadBool(Application.Title, CheckBoxHKLMRegSearch.Name, false);
  CheckBoxHKCURegSearch.Checked := Ini.ReadBool(Application.Title, CheckBoxHKCURegSearch.Name, false);
  CheckBoxHKCCRegSearch.Checked := Ini.ReadBool(Application.Title, CheckBoxHKCCRegSearch.Name, false);
  CheckBoxHKCRRegSearch.Checked := Ini.ReadBool(Application.Title, CheckBoxHKCRRegSearch.Name, false);
  CheckBoxHKURegSearch.Checked := Ini.ReadBool(Application.Title, CheckBoxHKURegSearch.Name, false);
  CheckBoxKeysRegSearch.Checked := Ini.ReadBool(Application.Title, CheckBoxKeysRegSearch.Name, false);
  CheckBoxValuesRegSearch.Checked := Ini.ReadBool(Application.Title, CheckBoxValuesRegSearch.Name, false);
  CheckBoxDataRegSearch.Checked := Ini.ReadBool(Application.Title, CheckBoxDataRegSearch.Name, false);

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
    Form1.top := Ini.ReadInteger('Position', 'Top', Form1.top);
    Form1.left := Ini.ReadInteger('Position', 'Left', Form1.left);
    Form1.Height := Ini.ReadInteger('Position', 'Height', Form1.Height);
    Form1.Width := Ini.ReadInteger('Position', 'Width', Form1.Width);
  End;

  Ini.Free;
End;

Procedure TForm1.Report;
Var
  i: Integer;
  S: TStringList;
Begin
  If ListViewRegSearch.Items.Count = 0 Then
    Exit;
  If SaveDialogReport.Execute Then
  Begin
    If (lowercase(extractfileext(SaveDialogReport.FileName)) = '.txt') Then
    Begin
      SaveDialogReport.FileName := SaveDialogReport.FileName;
    End;
    If (lowercase(extractfileext(SaveDialogReport.FileName)) <> '.txt') Then
    Begin
      SaveDialogReport.FileName := SaveDialogReport.FileName + '.txt';
    End;
    S := TStringList.Create;
    Try
      For i := 0 To ListViewRegSearch.Items.Count - 1 Do
      Begin
        S.Add(LangChapter.Caption + ListViewRegSearch.Items.Item[i].Caption);
        S.Add(LangKey.Caption + ListViewRegSearch.Items.Item[i].SubItems.Strings[0]);
        S.Add(LangValue.Caption + ListViewRegSearch.Items.Item[i].SubItems.Strings[1]);
        S.Add(LangMeaning.Caption + ListViewRegSearch.Items.Item[i].SubItems.Strings[2]);
        S.Add('====================================================================');
        S.Add('');
        Application.ProcessMessages;
      End;
      S.SaveToFile(SaveDialogReport.FileName, TEncoding.Unicode);
    Finally
      S.Free;
    End;
  End;
End;

Procedure TForm1.ButtonBackupsRegSearchClick(Sender: TObject);
Begin
  PageControl.ActivePageIndex := 1;
  ButtonRegSearch.Font.Style := [];
  ButtonBackupsRegSearch.Font.Style := [fsBold];
  FindFileCopy(ExtractFilePath(ParamStr(0)) + 'backup\');
End;

Procedure TForm1.ButtonRegSearchClick(Sender: TObject);
Begin
  PageControl.ActivePageIndex := 0;
  ButtonRegSearch.Font.Style := [fsBold];
  ButtonBackupsRegSearch.Font.Style := [];
End;

Procedure TForm1.ButtonSearchRegSearchClick(Sender: TObject);
Var
  i: Integer;
Begin
  Try
    If EditSearchRegSearch.Text = '' Then
    Begin
      Application.messagebox(pchar(LangEnterSearch.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
      Exit;
    End;

    Case ButtonSearchRegSearch.Tag Of
      0:
        Begin
          TabControlPanel.Enabled := false;
          TabControlRegSearch1.Enabled := false;
          TabControlRegSearch2.Enabled := false;
          SpeedButton_GeneralMenu.Enabled := false;
          ButtonSearchRegSearch.Caption := LangStop.Caption;
          ButtonSearchRegSearch.Tag := 1;
          scanning := true;
          InitScan;
          ButtonSearchRegSearch.Tag := 0;
          ButtonSearchRegSearch.Caption := LangSearchLog.Caption;
          Form1.StatusBarRegSearch.Panels[1].Text := LangFound.Caption + ' ' + IntToStr(ListViewRegSearch.Items.Count);
          Form1.StatusBarRegSearch.Panels[2].Text := '';
          Form1.StatusBarRegSearch.Panels[3].Text := '';
          TabControlPanel.Enabled := true;
          TabControlRegSearch1.Enabled := true;
          TabControlRegSearch2.Enabled := true;
          SpeedButton_GeneralMenu.Enabled := true;
        End;
      1:
        Begin
          scanning := false;
          ButtonSearchRegSearch.Tag := 0;
          ButtonSearchRegSearch.Caption := LangSearchLog.Caption;
          Form1.ListViewRegSearch.Items[0].MakeVisible(true);
          Form1.ListViewRegSearch.Items[0].Selected := true;
          Form1.ListViewRegSearch.Items[0].Focused := true;
          Form1.ListViewRegSearch.SetFocus;
          Form1.StatusBarRegSearch.Panels[1].Text := LangFound.Caption + ' ' + IntToStr(ListViewRegSearch.Items.Count);
          Form1.StatusBarRegSearch.Panels[2].Text := '';
          Form1.StatusBarRegSearch.Panels[3].Text := '';
          TabControlPanel.Enabled := true;
          TabControlRegSearch1.Enabled := true;
          TabControlRegSearch2.Enabled := true;
          SpeedButton_GeneralMenu.Enabled := true;
        End;
    End;
    Form1.ListViewRegSearch.Items[0].MakeVisible(true);
    Form1.ListViewRegSearch.Items[0].Selected := true;
    Form1.ListViewRegSearch.Items[0].Focused := true;
    Form1.ListViewRegSearch.SetFocus;
    Form1.StatusBarRegSearch.Panels[1].Text := LangFound.Caption + ' ' + IntToStr(ListViewRegSearch.Items.Count);
    Form1.StatusBarRegSearch.Panels[2].Text := '';
    Form1.StatusBarRegSearch.Panels[3].Text := '';

    For i := 0 To ListViewRegSearch.Columns.Count - 1 Do
    Begin
      ListView_SetColumnWidth(ListViewRegSearch.Handle, i, LVSCW_AUTOSIZE_USEHEADER);
    End;
  Except
  End;
End;

Procedure TForm1.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Form1.SaveNastr;
  FReg.Free;
  Stop := true;
  scanning := false;
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

  Form1.globload;
  FReg := tRegistry.Create;
  FReg.Access := KEY_WOW64_32KEY Or KEY_ALL_ACCESS;
  createicon(ListViewBackupsRegSearch);
  CreateDir(ExtractFilePath(ParamStr(0)) + 'backup');
  Application.ProcessMessages;
  Form1.LoadNastr;
  Application.ProcessMessages;
  Form1.StatusBarRegSearch.Panels[0].Text := LangTotal.Caption + ' 0';
  Form1.StatusBarRegSearch.Panels[1].Text := LangFound.Caption + ' 0';
  TabSheetRegistry.TabVisible := false;
  TabSheetBackups.TabVisible := false;
  Form1.PageControl.ActivePage := TabSheetRegistry;
End;

Procedure TForm1.N3Click(Sender: TObject);
Begin
  Report;
  Application.ProcessMessages;
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
    ListViewBackupsRegSearch.Clear;
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
      ListItem := ListViewBackupsRegSearch.Items.Add;
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

    For i := 0 To ListViewBackupsRegSearch.Columns.Count - 1 Do
    Begin
      ListView_SetColumnWidth(ListViewBackupsRegSearch.Handle, i, LVSCW_AUTOSIZE_USEHEADER);
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
  If ListViewBackupsRegSearch.ItemIndex = -1 Then
    Exit;
  Try
    While Form1.ListViewBackupsRegSearch.Items.Count > 0 Do
    Begin
      If Form1.ListViewBackupsRegSearch.Items[0].Checked = true Then
      Begin
        Form1.ListViewBackupsRegSearch.Items.Item[0].MakeVisible(true);
        DeleteFile(Form1.ListViewBackupsRegSearch.Items[0].SubItems.Strings[2]);
        Form1.ListViewBackupsRegSearch.Items[0].Delete;
        Application.ProcessMessages;
      End;
    End;
    FindFileCopy(ExtractFilePath(ParamStr(0)) + 'backup\');
  Except
  End;

End;

Procedure TForm1.BackupsDelMenuClick(Sender: TObject);
Begin
  If ListViewBackupsRegSearch.ItemIndex = -1 Then
    Exit;
  Try
    If (ListViewBackupsRegSearch.Selected <> Nil) And (ListViewBackupsRegSearch.Selected.Caption <> '') Then
    Begin
      DeleteFile(ListViewBackupsRegSearch.Selected.SubItems.Strings[2]);
      Application.ProcessMessages;
    End;
    FindFileCopy(ExtractFilePath(ParamStr(0)) + 'backup\');
  Except
  End;
End;

Procedure TForm1.BackupsRestoreMenuClick(Sender: TObject);
Begin
  If ListViewBackupsRegSearch.ItemIndex = -1 Then
    Exit;
  If (Form1.ListViewBackupsRegSearch.Selected <> Nil) And (Form1.ListViewBackupsRegSearch.Selected.Caption <> '') Then
  Begin
    ShellExecute(0, Nil, 'regedit.exe', pchar('/s "' + Form1.ListViewBackupsRegSearch.Selected.SubItems.Strings[2] + '"'), Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;
End;

Procedure TForm1.BackupsUpdateMenuClick(Sender: TObject);
Begin
  Try
    FindFileCopy(ExtractFilePath(ParamStr(0)) + 'backup\');
  Except
  End;
End;

Procedure TForm1.DeleteItemMenuClick(Sender: TObject);
Begin
  If ListViewRegSearch.ItemIndex = -1 Then
    Exit;
  ListViewRegSearch.Selected.Delete;
  Application.ProcessMessages;
End;

Procedure TForm1.ListClearMenuClick(Sender: TObject);
Begin
  ListViewRegSearch.clear;
  Application.ProcessMessages;
End;

Procedure TForm1.RegCopy;
Begin
  Try
    Form1.MemoBackupsRegSearch.clear;
    Form1.MemoBackupsRegSearch.Lines.Add('Windows Registry Editor Version 5.00');
    Form1.MemoBackupsRegSearch.Lines.Add('');
    Form1.MemoBackupsRegSearch.Lines.Add('[' + Form1.ListViewRegSearch.Selected.Caption + Form1.ListViewRegSearch.Selected.SubItems[0] + ']');
    If Form1.ListViewRegSearch.Selected.SubItems[1] <> '' Then
    Begin
      Form1.MemoBackupsRegSearch.Lines.Add('"' + Form1.ListViewRegSearch.Selected.SubItems[1] + '"="' + StringReplace(Form1.ListViewRegSearch.Selected.SubItems[2], '\', '\\', [rfReplaceAll]) + '"');
    End;
    If Form1.ListViewRegSearch.Selected.SubItems[1] = '' Then
    Begin
      Form1.MemoBackupsRegSearch.Lines.Add('@="' + StringReplace(Form1.ListViewRegSearch.Selected.SubItems[2], '\', '\\', [rfReplaceAll]) + '"');
    End;
    CreateDir(ExtractFilePath(ParamStr(0)) + 'backup');
    Form1.MemoBackupsRegSearch.Lines.SaveToFile(ExtractFilePath(ParamStr(0)) + 'backup\AllClear_' + DateToStr(Now) + FormatDateTime('_hh-mm-ss', Now) + '.reg', TEncoding.Unicode);
  Except
  End;
End;

Procedure TForm1.DeleteRegKeyMenuClick(Sender: TObject);
Var
  Msg: Integer;
Begin
  Try
    If ListViewRegSearch.ItemIndex = -1 Then
      Exit;
    reg := tRegistry.Create;
    If ListViewRegSearch.Selected.Caption = 'HKEY_LOCAL_MACHINE' Then
      reg.RootKey := HKEY_LOCAL_MACHINE;
    If ListViewRegSearch.Selected.Caption = 'HKEY_CURRENT_USER' Then
      reg.RootKey := HKEY_CURRENT_USER;
    If ListViewRegSearch.Selected.Caption = 'HKEY_CURRENT_CONFIG' Then
      reg.RootKey := HKEY_CURRENT_CONFIG;
    If ListViewRegSearch.Selected.Caption = 'HKEY_CLASSES_ROOT' Then
      reg.RootKey := HKEY_CLASSES_ROOT;
    If ListViewRegSearch.Selected.Caption = 'HKEY_USERS' Then
      reg.RootKey := HKEY_USERS;
    reg.Access := KEY_WOW64_32KEY Or KEY_ALL_ACCESS;
    reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    reg.OpenKey(ListViewRegSearch.Selected.SubItems.Strings[0], false);
    Msg := messagebox(Application.MainForm.Handle, pchar(LangDeleteKey.Caption), pchar(LangAttention.Caption), mb_iconquestion Or mb_yesno);

    If Msg = idyes Then
    Begin
      { if Form1.SaveOption.Checked = true then
        begin
        Form1.RegCopy;
        end; }
      Form1.RegCopy;
      reg.DeleteKey(ListViewRegSearch.Selected.SubItems.Strings[0]);
      ListViewRegSearch.Selected.Delete;
      reg.CloseKey;
      reg.Free;
    End;
  Except
  End;

End;

Procedure TForm1.DeleteRegValueMenuClick(Sender: TObject);
Var
  Msg: Integer;
Begin
  Try
    If ListViewRegSearch.ItemIndex = -1 Then
      Exit;
    reg := tRegistry.Create;
    If ListViewRegSearch.Selected.Caption = 'HKEY_LOCAL_MACHINE' Then
      reg.RootKey := HKEY_LOCAL_MACHINE;
    If ListViewRegSearch.Selected.Caption = 'HKEY_CURRENT_USER' Then
      reg.RootKey := HKEY_CURRENT_USER;
    If ListViewRegSearch.Selected.Caption = 'HKEY_CURRENT_CONFIG' Then
      reg.RootKey := HKEY_CURRENT_CONFIG;
    If ListViewRegSearch.Selected.Caption = 'HKEY_CLASSES_ROOT' Then
      reg.RootKey := HKEY_CLASSES_ROOT;
    If ListViewRegSearch.Selected.Caption = 'HKEY_USERS' Then
      reg.RootKey := HKEY_USERS;
    reg.Access := KEY_WOW64_32KEY Or KEY_ALL_ACCESS;
    reg.Access := KEY_WOW64_64KEY Or KEY_ALL_ACCESS;
    reg.OpenKey(ListViewRegSearch.Selected.SubItems.Strings[0], false);
    Msg := messagebox(Application.MainForm.Handle, pchar(LangDeleteValue.Caption), pchar(LangAttention.Caption), mb_iconquestion Or mb_yesno);

    If Msg = idyes Then
    Begin
      { if Form1.SaveOption.Checked = true then
        begin
        Form1.RegCopy;
        end; }
      Form1.RegCopy;
      reg.DeleteValue(ListViewRegSearch.Selected.SubItems.Strings[1]);
      ListViewRegSearch.Selected.Delete;
      reg.CloseKey;
      reg.Free;
    End;

  Except
  End;

End;

Procedure TForm1.LogMenuClick(Sender: TObject);
Begin
  Report;
  Application.ProcessMessages;
End;

Procedure TForm1.Scan(Key: String);
Var
  S: TStringList;
  i: Integer;
Begin
  If scanning = false Then
    Exit;
  If FReg.OpenKeyReadOnly(Key) Then
  Try
    S := TStringList.Create;
    Try
      FReg.GetValueNames(S);
      For i := 0 To S.Count - 1 Do
      Begin
        IsValidData(pchar(Key), pchar(S.Strings[i]), '');
        If FReg.GetDataType(S.Strings[i]) In [rdString, rdExpandString] Then
          IsValidData(pchar(Key), pchar(S.Strings[i]), pchar(FReg.ReadString(S.Strings[i])));
      End;
      S.clear;
      FReg.getkeynames(S);
      For i := 0 To S.Count - 1 Do
        If S.Strings[i] <> '' Then
          Scan(pchar(Key + '\' + S.Strings[i]));
    Except
      S.Free;
    End;
  Except
    FReg.CloseKey;
  End;
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

Procedure TForm1.InitScan;
Begin
  ListViewRegSearch.clear;
  FTotal := 0;
  FLast := 0;
  If scanning = false Then
    Exit;
  Try
    If CheckBoxHKCRRegSearch.Checked Then
    Begin
      FReg.RootKey := HKEY_CLASSES_ROOT;
      StatusBarRegSearch.Panels.Items[2].Text := CheckBoxHKCRRegSearch.Caption;
      Scan('');
      Application.ProcessMessages;
    End;
    If CheckBoxHKCURegSearch.Checked Then
    Begin
      FReg.RootKey := HKEY_CURRENT_USER;
      StatusBarRegSearch.Panels.Items[2].Text := CheckBoxHKCURegSearch.Caption;
      Scan('');
      Application.ProcessMessages;
    End;
    If CheckBoxHKLMRegSearch.Checked Then
    Begin
      FReg.RootKey := HKEY_LOCAL_MACHINE;
      StatusBarRegSearch.Panels.Items[2].Text := CheckBoxHKLMRegSearch.Caption;
      Scan('');
      Application.ProcessMessages;
    End;
    If CheckBoxHKURegSearch.Checked Then
    Begin
      FReg.RootKey := HKEY_USERS;
      StatusBarRegSearch.Panels.Items[2].Text := CheckBoxHKURegSearch.Caption;
      Scan('');
      Application.ProcessMessages;
    End;

    If CheckBoxHKCRRegSearch.Checked Then
    Begin
      FReg.RootKey := HKEY_CURRENT_CONFIG;
      StatusBarRegSearch.Panels.Items[2].Text := CheckBoxHKCRRegSearch.Caption;
      Scan('');
      Application.ProcessMessages;
    End;

  Except
    { btnSave.Enabled := ListViewRegSearch.Items.Count > 0;
      btnFind.Enabled := true;
      edValue.Enabled := true; }
  End;
End;

End.

