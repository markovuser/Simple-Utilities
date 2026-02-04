Unit Unit_Base;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, shellapi, StdCtrls, FileCtrl, ComCtrls, Registry, IniFiles, ShlObj,
  Menus, ImgList, CommCtrl, SHDocVw, pngimage, System.ImageList, Vcl.Buttons,
  WindowsDarkMode, Translation,FileInfoUtils;

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
    OpenDialogAddFile: TOpenDialog;
    PopupMenuEnCrypt: TPopupMenu;
    AddFileMenu: TMenuItem;
    OpenFolderMenu: TMenuItem;
    N11: TMenuItem;
    DeleteItemMenu: TMenuItem;
    ClearListMenu: TMenuItem;
    StatusBar1: TStatusBar;
    TabControl2: TTabControl;
    ListViewEnCrypt: TListView;
    TabControl3: TTabControl;
    CheckBoxShowPass: TCheckBox;
    GroupBoxEnCrypt1: TGroupBox;
    EditPass: TEdit;
    GroupBoxEnCrypt2: TGroupBox;
    EditRepeatPass: TEdit;
    EnCryptMenu: TMenuItem;
    N5: TMenuItem;
    DeCryptMenu: TMenuItem;
    TabControl1: TTabControl;
    TabControl4: TTabControl;
    ButtonEnCrypt: TButton;
    ButtonDeCrypt: TButton;
    PopupMenuGeneral: TPopupMenu;
    SpeedButton_GeneralMenu: TSpeedButton;
    PopupMenuLanguage: TPopupMenu;
    LangError: TMenuItem;
    LangNoPass: TMenuItem;
    LangRepeatPass: TMenuItem;
    LangIncorrectPass: TMenuItem;
    LangAddFile: TMenuItem;
    LangFileEncrypted: TMenuItem;
    LangFileDecrypted: TMenuItem;
    LangOnlyWindows: TMenuItem;
    Procedure FormCreate(Sender: TObject);
    Procedure SaveNastr;
    Procedure LoadNastr;
    Procedure ListView3Editing(Sender: TObject; Item: TListItem; Var AllowEdit: Boolean);
    Procedure Button9Click(Sender: TObject);
    Procedure AddFileMenuClick(Sender: TObject);
    Procedure OpenFolderMenuClick(Sender: TObject);
    Procedure DeleteItemMenuClick(Sender: TObject);
    Procedure ClearListMenuClick(Sender: TObject);
    Procedure CheckBoxShowPassClick(Sender: TObject);
    Procedure ListViewEnCryptClick(Sender: TObject);
    Procedure ListViewEnCryptSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    Procedure EnCryptMenuClick(Sender: TObject);
    Procedure DeCryptMenuClick(Sender: TObject);
    Procedure PopupMenuEnCryptPopup(Sender: TObject);
    Procedure ButtonEnCryptClick(Sender: TObject);
    Procedure ButtonDeCryptClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure SpeedButton_GeneralMenuClick(Sender: TObject);
    Procedure globLoad;
    Procedure CleanTranslationsLikeGlobload;
    Function IsWindows10Or11: Boolean;
    Function PortablePath: String;
  Private
    Procedure WMMouseMove(Var Message: TWMMouseMove); Message WM_MOUSEMOVE;
    Procedure WMSettingChange(Var Message: TWMSettingChange); Message WM_SETTINGCHANGE;
    Procedure WMDropFiles(Var Msg: TWMDropFiles); Message WM_DROPFILEs;
  Public
    { Public declarations }
  End;

Var
  Form1: TForm1;
  Handle: THandle;
  size, Msg: Integer;
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

Function Password(Psw: String): Integer;
Var
  I, res: Integer;
Begin
  Result := -1; // Значение по умолчанию
  Try
    res := 0;
    For I := 1 To Length(Psw) Do
      res := res + ord(Psw[I]);
    Result := res;
  Except
    // Можно добавить логирование ошибки
    // LogError('Ошибка в функции Password: ' + Exception(ExceptObject).Message);
  End;
End;

Procedure CryptFile(Const FileName: String); Stdcall;
Var
  fs: TFileStream;
  I, Len: Longint;
  c1, c2: Byte;
Begin
  Try
    fs := TFileStream.Create(FileName, fmOpenReadWrite);
    Len := fs.size;
    For I := 0 To Len - 2 Do
    Begin
      fs.Seek(I, soFromBeginning);
      fs.Read(c1, 1);
      fs.Seek(I + 1, soFromBeginning);
      fs.Read(c2, 1);
      c1 := c1 + c2 + Password(form1.EditPass.Text);
      fs.Seek(I, soFromBeginning);
      fs.Write(c1, 1);
    End;

    For I := 0 To Len - 2 Do
    Begin
      fs.Seek(I, soFromBeginning);
      fs.Read(c1, 1);
      fs.Seek(I + 1, soFromBeginning);
      fs.Read(c2, 1);
      c1 := c1 + c2 + Password(form1.EditPass.Text);
      fs.Seek(I, soFromBeginning);
      fs.Write(c1, 1);
    End;
    fs.Free;
  Except
  End;
End;

Procedure DeCryptFile(Const FileName: String); Stdcall;
Var
  fs: TFileStream;
  I, Len: Longint;
  c1, c2: Byte;
Begin
  Try
    fs := TFileStream.Create(FileName, fmOpenReadWrite);
    Len := fs.size - 1;
    For I := Len Downto 1 Do
    Begin
      fs.Seek(I, soFromBeginning);
      fs.Read(c1, 1);
      fs.Seek(I - 1, soFromBeginning);
      fs.Read(c2, 1);
      c1 := c2 - c1 - Password(form1.EditPass.Text);
      fs.Seek(I - 1, soFromBeginning);
      fs.Write(c1, 1);
    End;

    For I := Len Downto 1 Do
    Begin
      fs.Seek(I, soFromBeginning);
      fs.Read(c1, 1);
      fs.Seek(I - 1, soFromBeginning);
      fs.Read(c2, 1);
      c1 := c2 - c1 - Password(form1.EditPass.Text);
      fs.Seek(I - 1, soFromBeginning);
      fs.Write(c1, 1);
    End;
    fs.Free;
  Except
  End;
End;

Function GetNormalSize(size: Int64): String;
Var
  kb, Mb, Gb: Real;
Begin
  Result := IntToStr(size) + '  Б';
  kb := size / 1024;
  kb := Trunc(kb * 10) / 10;
  If kb < 0.7 Then
    Exit;
  Result := FloatToStr(kb) + ' кБ';
  Mb := kb / 1024;
  Mb := Trunc(Mb * 10) / 10;
  If Mb < 0.7 Then
    Exit;
  Result := FloatToStr(Mb) + ' МБ';
  Gb := Mb / 1024;
  Gb := Trunc(Gb * 10) / 10;
  If Gb < 0.7 Then
    Exit;
  Result := FloatToStr(Gb) + ' ГБ';
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
  Ini := TMemIniFile.Create(form1.PortablePath);

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

  CheckBoxShowPass.Checked := Ini.ReadBool(Application.Title, CheckBoxShowPass.Name, false);

  WindowCenter := Ini.ReadBool('Position', 'WindowCenter', false);
  If WindowCenter = true Then
  Begin
    form1.Position := poDesktopCenter;
  End;
  If WindowCenter = false Then
  Begin
    form1.Position := poDesigned;
  End;

  If Ini.ReadString(Application.Title, 'Window', '') = 'wsMaximized' Then
  Begin
    form1.WindowState := wsMaximized;
  End;

  If Ini.ReadString(Application.Title, 'Window', '') <> 'wsMaximized' Then
  Begin
    form1.top := Ini.ReadInteger(Application.Title, 'Top', form1.top);
    form1.left := Ini.ReadInteger(Application.Title, 'Left', form1.left);
    form1.Height := Ini.ReadInteger(Application.Title, 'Height', form1.Height);
    form1.Width := Ini.ReadInteger(Application.Title, 'Width', form1.Width);
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
  Ini := TMemIniFile.Create(form1.PortablePath);
  Ini.WriteBool(Application.Title, CheckBoxShowPass.Name, CheckBoxShowPass.Checked);

  If form1.WindowState = wsMaximized Then
  Begin
    Ini.WriteString(Application.Title, 'Window', 'wsMaximized');
  End;
  If form1.WindowState <> wsMaximized Then
  Begin
    Ini.WriteString(Application.Title, 'Window', 'wsNormal');
    Ini.WriteInteger(Application.Title, 'Top', form1.top);
    Ini.WriteInteger(Application.Title, 'Left', form1.left);
    Ini.WriteInteger(Application.Title, 'Height', form1.Height);
    Ini.WriteInteger(Application.Title, 'Width', form1.Width);
  End;
  Ini.UpdateFile;
  Ini.Free;
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

Procedure TForm1.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  SaveNastr;
  DragAcceptFiles(Handle, false);
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
  DragAcceptFiles(Handle, true);
  portable := fileExists(ExtractFilePath(ParamStr(0)) + 'portable.ini');
  If portable = True Then
    Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness + ' Portable'
  Else
    Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness;
  createicon(ListViewEnCrypt);
  Application.ProcessMessages;
  form1.LoadNastr;
  Application.ProcessMessages;
End;

Procedure TForm1.AddFileMenuClick(Sender: TObject);
Var
  ListItem: TListItem;
  Dir, FileName: String;
  ShInfo: TSHFileInfo;
  I: Integer;
Begin
  If form1.OpenDialogAddFile.Execute Then
  Begin
    FileName := ExtractFileName(form1.OpenDialogAddFile.FileName);
    Dir := ExtractFilePath(form1.OpenDialogAddFile.FileName);
    ListItem := form1.ListViewEnCrypt.Items.Add;
    SHGetFileInfo(pchar(Dir + FileName), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
    With ListItem Do
    Begin
      Caption := FileName;
      SubItems.Add(Dir);
      SubItems.Add(ShInfo.szTypeName);
      SubItems.Add(GetNormalSize(GetFileSize(Dir + FileName)));
      // Checked := true;
      ImageIndex := ShInfo.iIcon;
      Application.ProcessMessages;
      Try
        For I := 0 To ListViewEnCrypt.Columns.count - 1 Do
          ListView_SetColumnWidth(ListViewEnCrypt.Handle, I, LVSCW_AUTOSIZE_USEHEADER);
      Except
      End;
    End;
  End;
End;

Procedure TForm1.DeleteItemMenuClick(Sender: TObject);
Begin
  If ListViewEnCrypt.ItemIndex = -1 Then
    Exit;
  If form1.ListViewEnCrypt.Selected <> Nil Then
    form1.ListViewEnCrypt.DeleteSelected;
End;

Procedure TForm1.ClearListMenuClick(Sender: TObject);
Begin
  form1.ListViewEnCrypt.Clear;
End;

Procedure TForm1.EnCryptMenuClick(Sender: TObject);
Begin
  If ListViewEnCrypt.ItemIndex = -1 Then
  Begin
    Application.messagebox(pchar(LangAddFile.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditPass.Text = '' Then
  Begin
    Application.messagebox(pchar(LangNoPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditRepeatPass.Text = '' Then
  Begin
    Application.messagebox(pchar(LangRepeatPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditRepeatPass.Text = EditPass.Text Then
  Begin
    Try
      form1.StatusBar1.Panels[0].Text := '';
      CryptFile(form1.ListViewEnCrypt.Selected.SubItems.Strings[0] + form1.ListViewEnCrypt.Selected.Caption);
      form1.StatusBar1.Panels[0].Text := LangFileEncrypted.Caption;
    Except
    End;
  End;
  If EditRepeatPass.Text <> EditPass.Text Then
  Begin
    Application.messagebox(pchar(LangIncorrectPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    EditRepeatPass.Clear;
  End;
  EditPass.Clear;
  EditRepeatPass.Clear;
End;

Procedure TForm1.DeCryptMenuClick(Sender: TObject);
Begin
  If ListViewEnCrypt.ItemIndex = -1 Then
  Begin
    Application.messagebox(pchar(LangAddFile.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditPass.Text = '' Then
  Begin
    Application.messagebox(pchar(LangNoPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditRepeatPass.Text = '' Then
  Begin
    Application.messagebox(pchar(LangRepeatPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditRepeatPass.Text = EditPass.Text Then
  Begin
    Try
      form1.StatusBar1.Panels[0].Text := '';
      DeCryptFile(form1.ListViewEnCrypt.Selected.SubItems.Strings[0] + form1.ListViewEnCrypt.Selected.Caption);
      form1.StatusBar1.Panels[0].Text := LangFileDecrypted.Caption;
    Except
    End;
  End;
  If EditRepeatPass.Text <> EditPass.Text Then
  Begin
    Application.messagebox(pchar(LangIncorrectPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    EditRepeatPass.Clear;
  End;
  EditPass.Clear;
  EditRepeatPass.Clear;
End;

Procedure TForm1.PopupMenuEnCryptPopup(Sender: TObject);
Begin
  If ListViewEnCrypt.ItemIndex = -1 Then
  Begin
    EnCryptMenu.Visible := false;
    DeCryptMenu.Visible := false;
    OpenFolderMenu.Visible := false;
    DeleteItemMenu.Visible := false;
  End;
  If ListViewEnCrypt.ItemIndex <> -1 Then
  Begin
    EnCryptMenu.Visible := true;
    DeCryptMenu.Visible := true;
    OpenFolderMenu.Visible := true;
    DeleteItemMenu.Visible := true;
  End;
End;


Procedure TForm1.ButtonDeCryptClick(Sender: TObject);
Begin
  If ListViewEnCrypt.ItemIndex = -1 Then
  Begin
    Application.messagebox(pchar(LangAddFile.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditPass.Text = '' Then
  Begin
    Application.messagebox(pchar(LangNoPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditRepeatPass.Text = '' Then
  Begin
    Application.messagebox(pchar(LangRepeatPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditRepeatPass.Text = EditPass.Text Then
  Begin
    form1.StatusBar1.Panels[0].Text := '';
    DeCryptFile(form1.ListViewEnCrypt.Selected.SubItems.Strings[0] + form1.ListViewEnCrypt.Selected.Caption);
    form1.StatusBar1.Panels[0].Text := LangFileDecrypted.Caption;
  End;
  If EditRepeatPass.Text <> EditPass.Text Then
  Begin
    Application.messagebox(pchar(LangIncorrectPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    EditRepeatPass.Clear;
  End;
  EditPass.Clear;
  EditRepeatPass.Clear;
End;

Procedure TForm1.ButtonEnCryptClick(Sender: TObject);
Begin
  If ListViewEnCrypt.ItemIndex = -1 Then
  Begin
    Application.messagebox(pchar(LangAddFile.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditPass.Text = '' Then
  Begin
    Application.messagebox(pchar(LangNoPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditRepeatPass.Text = '' Then
  Begin
    Application.messagebox(pchar(LangRepeatPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditRepeatPass.Text = EditPass.Text Then
  Begin
    form1.StatusBar1.Panels[0].Text := '';
    CryptFile(form1.ListViewEnCrypt.Selected.SubItems.Strings[0] + form1.ListViewEnCrypt.Selected.Caption);
    form1.StatusBar1.Panels[0].Text := LangFileEncrypted.Caption;
  End;
  If EditRepeatPass.Text <> EditPass.Text Then
  Begin
    Application.messagebox(pchar(LangIncorrectPass.Caption), pchar(LangError.Caption), mb_iconerror Or mb_ok);
    EditRepeatPass.Clear;
  End;
  EditPass.Clear;
  EditRepeatPass.Clear;
End;

Procedure TForm1.CheckBoxShowPassClick(Sender: TObject);
Begin
  If form1.CheckBoxShowPass.Checked Then
  Begin
    form1.EditPass.PasswordChar := #0;
    form1.EditRepeatPass.PasswordChar := #0;
  End;
  If form1.CheckBoxShowPass.Checked = false Then
  Begin
    form1.EditPass.PasswordChar := '•';
    form1.EditRepeatPass.PasswordChar := '•';
  End;
End;

Procedure TForm1.ListView3Editing(Sender: TObject; Item: TListItem; Var AllowEdit: Boolean);
Begin
  AllowEdit := false;
End;

Procedure TForm1.ListViewEnCryptClick(Sender: TObject);
Begin
  If ListViewEnCrypt.ItemIndex = -1 Then
  Begin
    EnCryptMenu.Visible := false;
    DeCryptMenu.Visible := false;
    OpenFolderMenu.Visible := false;
    DeleteItemMenu.Visible := false;
    ButtonEnCrypt.Enabled := false;
    ButtonDeCrypt.Enabled := false;
  End;
  If ListViewEnCrypt.ItemIndex <> -1 Then
  Begin
    EnCryptMenu.Visible := true;
    DeCryptMenu.Visible := true;
    OpenFolderMenu.Visible := true;
    DeleteItemMenu.Visible := true;
    ButtonEnCrypt.Enabled := true;
    ButtonDeCrypt.Enabled := true;
  End;
End;

Procedure TForm1.ListViewEnCryptSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
Begin
  If ListViewEnCrypt.ItemIndex = -1 Then
  Begin
    EnCryptMenu.Visible := false;
    DeCryptMenu.Visible := false;
    OpenFolderMenu.Visible := false;
    DeleteItemMenu.Visible := false;
    ButtonEnCrypt.Enabled := false;
    ButtonDeCrypt.Enabled := false;
  End;
  If ListViewEnCrypt.ItemIndex <> -1 Then
  Begin
    EnCryptMenu.Visible := true;
    DeCryptMenu.Visible := true;
    OpenFolderMenu.Visible := true;
    DeleteItemMenu.Visible := true;
    ButtonEnCrypt.Enabled := true;
    ButtonDeCrypt.Enabled := true;
  End;
End;

Procedure TForm1.Button9Click(Sender: TObject);
Begin
  form1.SaveNastr;
End;

Procedure TForm1.OpenFolderMenuClick(Sender: TObject);
Var
  I: Integer;
Begin
  If ListViewEnCrypt.ItemIndex = -1 Then
    Exit;
  OpenExplorerAndSelectFile(ListViewEnCrypt.Selected.SubItems.Strings[0] + ListViewEnCrypt.Selected.Caption);
  For I := 0 To ListViewEnCrypt.Columns.count - 1 Do
    ListView_SetColumnWidth(ListViewEnCrypt.Handle, I, LVSCW_AUTOSIZE_USEHEADER);
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
  h := Msg.Drop;
  Application.ProcessMessages;
  num := DragQueryFile(h, dword(-1), Nil, 0);
  Application.ProcessMessages;
  For I := 0 To num - 1 Do
  Begin
    DragQueryFile(h, I, pchr, maxlen);
    FName := pchr;
    Application.ProcessMessages;
    ListItem := form1.ListViewEnCrypt.Items.Add;
    Application.ProcessMessages;
    SHGetFileInfo(pchar(FName), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);
    Application.ProcessMessages;
    With ListItem Do
    Begin
      ImageIndex := ShInfo.iIcon;
      Caption := ExtractFileName(FName);
      SubItems.Add(ExtractFilePath(FName));
      SubItems.Add(ShInfo.szTypeName);
      SubItems.Add(GetNormalSize(GetFileSize(FName)));
      Application.ProcessMessages;
    End;
  End;
  DragFinish(h);
  form1.StatusBar1.Panels[0].Text := IntToStr(form1.ListViewEnCrypt.Items.count);
End;

End.

