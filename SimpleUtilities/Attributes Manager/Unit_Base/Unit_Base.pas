Unit Unit_Base;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls,
  CheckLst, Buttons, ComCtrls, shellapi, ExtCtrls, Graphics, Menus, ShlObj,
  SHFolder, ShellCtrls, FileCtrl, IniFiles, SHDocVw, ActiveX, ToolWin, ImgList,
  System.ImageList, Vcl.Imaging.pngimage, CommCtrl, WindowsDarkMode, Translation,
  Vcl.WinXPickers, FileInfoUtils;

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
    ImageList2: TImageList;
    GroupBox2: TGroupBox;
    Memo2: TMemo;
    TabControl1: TTabControl;
    ListViewAttributes: TListView;
    TabControl2: TTabControl;
    GroupBox1: TGroupBox;
    cbPath: TComboBox;
    ButtonRefresh: TButton;
    ButtonUP: TButton;
    ComboBoxDrive: TComboBox;
    TabControl12: TTabControl;
    PopupMenuGeneral: TPopupMenu;
    PopupRefreshList: TMenuItem;
    SpeedButton_GeneralMenu: TSpeedButton;
    View: TMenuItem;
    IconSmall: TMenuItem;
    IconBig: TMenuItem;
    Separator1: TMenuItem;
    PopupMenuLanguage: TPopupMenu;
    LangElements: TMenuItem;
    CheckBox_System: TCheckBox;
    CheckBox_Hide: TCheckBox;
    CheckBox_ReadOnly: TCheckBox;
    CheckBox_Archive: TCheckBox;
    Button_Apply: TButton;
    GroupBox3: TGroupBox;
    Button_DateTime: TButton;
    DatePicker1: TDatePicker;
    TimePicker1: TTimePicker;
    PopupMenuDateTime: TPopupMenu;
    CurrentDateTime: TMenuItem;
    StatusBar1: TStatusBar;
    LangOnlyWindows: TMenuItem;
    LangError: TMenuItem;
    LangErrorTime: TMenuItem;
    Procedure FormCreate(Sender: TObject);
    Procedure ListViewAttributesClick(Sender: TObject);
    Procedure ListViewAttributesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    Procedure WMMoving(Var Msg: TWmMoving); Message WM_MOVING;
    Procedure ListViewAttributesColumnClick(Sender: TObject; Column: TListColumn);
    Procedure ListViewAttributesDblClick(Sender: TObject);
    Procedure cbPathKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Procedure cbPathChange(Sender: TObject);
    Procedure ComboBoxDriveChange(Sender: TObject);
    Procedure ButtonUPClick(Sender: TObject);
    Procedure ButtonRefreshClick(Sender: TObject);
    Procedure SaveNastr;
    Procedure LoadNastr;
    Procedure GetAttrAttributes;
    Function AddFile(FileMask: String; FFileAttr: Integer): Boolean;
    Procedure cbPathKeyPress(Sender: TObject; Var Key: Char);
    Procedure cbPathEnter(Sender: TObject);
    Procedure cbPathMouseEnter(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure SpeedButton_GeneralMenuClick(Sender: TObject);
    Procedure PopupRefreshListClick(Sender: TObject);
    Procedure IconSmallClick(Sender: TObject);
    Procedure IconBigClick(Sender: TObject);
    Procedure globLoad;
    Procedure CleanTranslationsLikeGlobload;
    Procedure GlobGetAttrDateTime;
    Function IsProtectedItem(Const ItemName: String): Boolean;
    Procedure Button_ApplyClick(Sender: TObject);
    Procedure Button_DateTimeClick(Sender: TObject);
    Procedure CurrentDateTimeClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Function IsWindows10Or11: Boolean;
    Function PortablePath: String;

  Private
    { Private declarations }
    Procedure WMMouseMove(Var Message: TWMMouseMove); Message WM_MOUSEMOVE;
    Procedure WMSettingChange(Var Message: TWMSettingChange); Message WM_SETTINGCHANGE;
  Public
    { Public declarations }
    Procedure WMDeviceChange(Var Msg: Tmessage); Message WM_DEVICECHANGE;
  End;

Var
  Form1: TForm1;
  puti: String;
  stop: Boolean;
  drive: String;
  i: Integer;
  Sort: Integer = 1;
  OldWndProc: Integer;
  portable: boolean;

Const
  FILE_WRITE_ATTRIBUTES = $0100;

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
  Ini.Free;
End;

Function TrimEX(Word, TrimSymbols: String): String;
Var
  X, a, b: Integer;
Begin
  Result := Word;
  If TrimSymbols = '' Then
    Exit;
  Word := Trim(Word);
  If Length(Word) = 0 Then
    Exit;
  X := 0;
  Repeat
    X := X + 1;
  Until (pos(AnsiUpperCase(Word[X]), AnsiUpperCase(TrimSymbols)) = 0) Or (X = Length(Word));
  a := X;
  X := Length(Word) + 1;
  Repeat
    X := X - 1;
  Until (pos(AnsiUpperCase(Word[X]), AnsiUpperCase(TrimSymbols)) = 0) Or (X = 1);
  b := X;
  Word := copy(Word, a, b - a + 1);
  Result := Word;
End;

Function GetParentDir(StartDirectory: String): String;
Var
  X: Integer;
Begin
  Result := '';
  If SysUtils.DirectoryExists(StartDirectory) = false Then
    Exit;
  StartDirectory := TrimEX(StartDirectory, '\');
  If Length(StartDirectory) = 0 Then
    Exit;
  X := Length(StartDirectory) + 1;
  Repeat
    X := X - 1;
  Until (StartDirectory[X] = '\') Or (X = 1);
  Result := copy(StartDirectory, 1, X);
  If Result[Length(Result)] <> '\' Then
    Result := Result + '\';
  If SysUtils.DirectoryExists(Result) = false Then
  Begin
    Result := '';
    Exit;
  End;
End;

Function SortCaptionAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  Try
    If AnsiUpperCase(Item1.Caption) > AnsiUpperCase(Item2.Caption) Then
      Result := ParamSort
    Else If AnsiUpperCase(Item1.Caption) < AnsiUpperCase(Item2.Caption) Then
      Result := -ParamSort;
  Except
    // В случае исключения оставляем Result = 0
  End;
End;

Function SortFirstSubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  Try
    If AnsiUpperCase(Item1.SubItems[0]) > AnsiUpperCase(Item2.SubItems[0]) Then
      Result := ParamSort
    Else If AnsiUpperCase(Item1.SubItems[0]) < AnsiUpperCase(Item2.SubItems[0]) Then
      Result := -ParamSort;
  Except
    // В случае исключения оставляем Result = 0
  End;
End;

Function Sort1SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  Try
    If AnsiUpperCase(Item1.SubItems[1]) > AnsiUpperCase(Item2.SubItems[1]) Then
      Result := ParamSort
    Else If AnsiUpperCase(Item1.SubItems[1]) < AnsiUpperCase(Item2.SubItems[1]) Then
      Result := -ParamSort;
  Except
    // В случае исключения оставляем Result = 0
  End;
End;

Function Sort1SubItemAsString1(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  Result := 0;
  Try
    If AnsiUpperCase(Item1.SubItems[2]) > AnsiUpperCase(Item2.SubItems[2]) Then
      Result := ParamSort
    Else If AnsiUpperCase(Item1.SubItems[2]) < AnsiUpperCase(Item2.SubItems[2]) Then
      Result := -ParamSort;
  Except
    // В случае исключения оставляем Result = 0
  End;
End;

Procedure TListView.WMVScroll(Var Message: TWMVScroll);
Begin
  TWinControl(self).DefaultHandler(Message);
End;

Procedure TForm1.FormShow(Sender: TObject);
Begin
  form1.StatusBar1.Panels[0].Text := LangElements.Caption + ' ' + inttostr(form1.ListViewAttributes.Items.Count);
  Application.ProcessMessages;
End;

Procedure TForm1.CurrentDateTimeClick(Sender: TObject);
Begin
  DatePicker1.Date := now();
  TimePicker1.Time := now();
End;


// Метки диска
Function GetDriveVolume(drive: String): String;
Var
  _VolumeName, _FileSystemName: Array[0..MAX_PATH - 1] Of Char;
  _VolumeSerialNo, _MaxComponentLength, _FileSystemFlags: LongWord;
Begin
  Result := '';
  If GetVolumeInformation(pchar(drive + ':\'), _VolumeName, MAX_PATH, @_VolumeSerialNo, _MaxComponentLength, _FileSystemFlags, _FileSystemName, MAX_PATH) Then
    Result := _VolumeName;
End;

Procedure getDrive;
Var
  drive: Char;
Begin
  form1.ComboBoxDrive.Clear;
  For drive := 'a' To 'z' Do
  Begin
    Case GetDriveType(pchar(drive + ':\')) Of
      DRIVE_REMOVABLE:
        Begin
          form1.ComboBoxDrive.Items.Add(UpperCase(drive) + ':\ [' + GetDriveVolume(drive) + ' ]');
        End;
      DRIVE_FIXED:
        Begin
          form1.ComboBoxDrive.Items.Add(UpperCase(drive) + ':\ [' + GetDriveVolume(drive) + ' ]');
        End;
      { DRIVE_CDROM:
        begin
        form1.ComboBoxDrive.Items.Add(AnsiUpperCase(Drive) + ':\ [' +
        GetDriveVolume(Drive) + ' ]');
        end; }
      { DRIVE_REMOTE:
        begin
        form1.ComboBoxDrive.Items.Add(UpperCase(drive) + ':\ [' +
        GetDriveVolume(drive) + ' ]');
        application.ProcessMessages;
        end; }
      { DRIVE_RAMDISK:
        begin
        form1.ComboBoxDrive.Items.Add(UpperCase(Drive) + ':\ [' +
        GetDriveVolume(Drive) + ' ]');
        end; }
    End;
  End;
  form1.ComboBoxDrive.ItemIndex := 0;
End;

Function TForm1.AddFile(FileMask: String; FFileAttr: Integer): Boolean;
Var
  {$IFDEF MSWINDOWS}
  ShInfo: TSHFileInfo;
  {$ENDIF}
  Attributes, FileName, FullPath: String;
  hFindFile: THandle;
  SearchRec: TSearchRec;
  ListItem: TListItem;
  FileSize: Int64;

  Function AttrStr(Attr: Integer): String;
  Begin
    Result := '';
    If (FILE_ATTRIBUTE_ARCHIVE And Attr) > 0 Then
      Result := Result + 'A';
    If (FILE_ATTRIBUTE_READONLY And Attr) > 0 Then
      Result := Result + 'R';
    If (FILE_ATTRIBUTE_HIDDEN And Attr) > 0 Then
      Result := Result + 'H';
    If (FILE_ATTRIBUTE_SYSTEM And Attr) > 0 Then
      Result := Result + 'S';
  End;

Begin
  ListViewAttributes.Items.BeginUpdate;
  Try
    ListViewAttributes.Items.Clear;
    Result := False;

    // Используем кроссплатформенные константы атрибутов
    hFindFile := FindFirst(FileMask, FFileAttr, SearchRec);
    If hFindFile = INVALID_HANDLE_VALUE Then
      Exit;

    Try
      Repeat
        With SearchRec Do
        Begin
          // Пропускаем специальные директории
          If (Name = '.') Or (Name = '..') Or (Name = '') Then
            Continue;

          FullPath := IncludeTrailingPathDelimiter(cbPath.Text) + Name;
          FileName := Name;

          // Кроссплатформенное получение информации о файле
          Attributes := AttrStr(SearchRec.Attr);

          // Создаем элемент списка
          ListItem := ListViewAttributes.Items.Add;
          With ListItem Do
          Begin
            Caption := FileName;

            {$IFDEF MSWINDOWS}
            // Получаем иконку и тип файла только на Windows
            If SHGetFileInfo(PChar(FullPath), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX) <> 0 Then
            Begin
              ImageIndex := ShInfo.iIcon;
              SubItems.Add(ShInfo.szTypeName);
            End
            Else
            Begin
              ImageIndex := -1;
              SubItems.Add('');
            End;
            {$ELSE}
            ImageIndex := -1;
            SubItems.Add('');
            {$ENDIF}

            SubItems.Add(FormatDateTime('dd.mm.yyyy hh:mm', SearchRec.TimeStamp));

            // Определяем размер файла
            If (faDirectory And SearchRec.Attr) > 0 Then
            Begin
              SubItems.Add(''); // для директории размер пустой
              SubItems.Add(Attributes);
              SubItems.Add(FullPath);
              SubItems.Add('dir');
            End
            Else
            Begin
              FileSize := SearchRec.Size;
              If FileSize = 0 Then
                SubItems.Add('')
              Else
                SubItems.Add(GetNormalSize(FileSize));
              SubItems.Add(Attributes);
              SubItems.Add(FullPath);
              SubItems.Add('file');
            End;
          End;

          Result := True; // Найден хотя бы один файл
        End;
      Until FindNext(SearchRec) <> 0;
    Finally
      FindClose(SearchRec);
    End;

  Finally
    ListViewAttributes.Items.EndUpdate;
  End;

  // Сортировка и обновление интерфейса
  If ListViewAttributes.Items.Count > 0 Then
  Begin
    ListViewAttributes.CustomSort(@Sort1SubItemAsString1, Sort);

    Try
      With ListViewAttributes Do
      Begin
        Items[0].MakeVisible(True);
        Items[0].Selected := True;
        Items[0].Focused := True;
        SetFocus;
      End;
    Except
      // Игнорируем ошибки выделения
    End;
  End;

  // Обновление статусной строки
  StatusBar1.Panels[0].Text := LangElements.Caption + ' ' + IntToStr(ListViewAttributes.Items.Count);
  Application.ProcessMessages;
End;

Procedure TForm1.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  SaveNastr;
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
  createicon(ListViewAttributes);
  getDrive;
  form1.LoadNastr;
  Application.ProcessMessages;
  ComboBoxDriveChange(Sender);
  Application.ProcessMessages;
End;

Procedure TForm1.GetAttrAttributes;
Var
  S: String;
  attrs: Integer;
Begin
  Try
    If ListViewAttributes.ItemIndex = -1 Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'Documents and Settings' Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'System Volume Information' Then
      Exit;
    If ListViewAttributes.Selected.Caption = '$RECYCLE.BIN' Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'Boot' Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'Windows' Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'bootmgr' Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'BOOTNXT' Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'ProgramData' Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'Users' Then
      Exit;

    S := StringReplace(cbPath.Text + '\' + ListViewAttributes.Selected.Caption, '\\', '\', [rfReplaceAll]);
    // Получение атрибутов файла
    // attrs := FileGetAttr(s);
    attrs := Windows.GetFileAttributes(pchar(S));
    form1.CheckBox_Archive.Checked := false;
    form1.CheckBox_System.Checked := false;
    form1.CheckBox_Hide.Checked := false;
    form1.CheckBox_ReadOnly.Checked := false;
    GroupBox1.Enabled := true;
    Application.ProcessMessages;
    // Показ этих атрибутов
    If attrs And FILE_ATTRIBUTE_READONLY > 0 Then
      form1.CheckBox_ReadOnly.Checked := true
    Else
      form1.CheckBox_ReadOnly.Checked := false;

    If attrs And FILE_ATTRIBUTE_HIDDEN > 0 Then
      form1.CheckBox_Hide.Checked := true
    Else
      form1.CheckBox_Hide.Checked := false;

    If attrs And FILE_ATTRIBUTE_SYSTEM > 0 Then
      form1.CheckBox_System.Checked := true
    Else
      form1.CheckBox_System.Checked := false;

    If attrs And FILE_ATTRIBUTE_ARCHIVE > 0 Then
      form1.CheckBox_Archive.Checked := true
    Else
      form1.CheckBox_Archive.Checked := false;
  Except
  End;
End;

Function GetDirTime(Const Dir: String): TDateTime;
Var
  H: Integer;
  F: TFileTime;
  S: TSystemTime;
Begin
  H := CreateFile(pchar(Dir), $0080, 0, Nil, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, 0);
  If H <> -1 Then
  Begin
    GetFileTime(H, @F, Nil, Nil);
    FileTimeToLocalFileTime(F, F);
    FileTimeToSystemTime(F, S);
    Result := SystemTimeToDateTime(S);
    CloseHandle(H);
  End
  Else
    Result := -1;
End;

Function GetFileModDate(FileName: String): TDateTime;
Var
  F: TSearchRec;
Begin
  FindFirst(FileName, faAnyFile, F);
  Result := F.TimeStamp;
  // if you really wanted an Int, change the return type and use this line:
  // Result := F.Time;
  FindClose(F);
End;

Procedure TForm1.GlobGetAttrDateTime;
Var
  S: String;
Begin
  form1.StatusBar1.Panels[0].Text := LangElements.Caption + ' ' + inttostr(form1.ListViewAttributes.Items.Count);
  Application.ProcessMessages;
  Try
    If ListViewAttributes.ItemIndex = -1 Then
    Begin
      form1.CheckBox_Archive.Checked := false;
      form1.CheckBox_System.Checked := false;
      form1.CheckBox_Hide.Checked := false;
      form1.CheckBox_ReadOnly.Checked := false;
      GroupBox1.Enabled := false;
      GroupBox3.Enabled := false;
    End;
    form1.CheckBox_Archive.Checked := false;
    form1.CheckBox_System.Checked := false;
    form1.CheckBox_Hide.Checked := false;
    form1.CheckBox_ReadOnly.Checked := false;
    If ListViewAttributes.Selected.Caption = 'Documents and Settings' Then
      GroupBox1.Enabled := false;
    GroupBox3.Enabled := false;
    If ListViewAttributes.Selected.Caption = 'System Volume Information' Then
      GroupBox1.Enabled := false;
    GroupBox3.Enabled := false;
    If ListViewAttributes.Selected.Caption = '$RECYCLE.BIN' Then
      GroupBox1.Enabled := false;
    GroupBox3.Enabled := false;
    If ListViewAttributes.Selected.Caption = 'Boot' Then
      GroupBox1.Enabled := false;
    GroupBox3.Enabled := false;
    If ListViewAttributes.Selected.Caption = 'Windows' Then
      GroupBox1.Enabled := false;
    GroupBox3.Enabled := false;
    If ListViewAttributes.Selected.Caption = 'bootmgr' Then
      GroupBox1.Enabled := false;
    GroupBox3.Enabled := false;
    If ListViewAttributes.Selected.Caption = 'BOOTNXT' Then
      GroupBox1.Enabled := false;
    GroupBox3.Enabled := false;
    If ListViewAttributes.Selected.Caption = 'ProgramData' Then
      GroupBox1.Enabled := false;
    GroupBox3.Enabled := false;
    If ListViewAttributes.Selected.Caption = 'Users' Then
      GroupBox1.Enabled := false;
    GroupBox3.Enabled := false;
  Except
  End;

  GetAttrAttributes;
  Application.ProcessMessages;
  If (ListViewAttributes.Selected.SubItems[5] = 'dir') Then
  Begin
    Button_DateTime.Enabled := false;
    GroupBox3.Enabled := false;
    S := StringReplace(cbPath.Text + '\' + ListViewAttributes.Selected.Caption, '\\', '\', [rfReplaceAll]);
    // DatePicker1.Date := GetDirTime(s);
    DatePicker1.Date := GetFileModDate(S);
    Application.ProcessMessages;
    TimePicker1.Time := GetFileModDate(S);

    Application.ProcessMessages;
  End;
  Try
    StatusBar1.Panels[1].Text := '';
    StatusBar1.Panels[2].Text := '';
    If (ListViewAttributes.Selected.SubItems[5] <> 'dir') Then
    Begin
      Button_DateTime.Enabled := true;
      GroupBox3.Enabled := true;
      S := StringReplace(cbPath.Text + '\' + ListViewAttributes.Selected.Caption, '\\', '\', [rfReplaceAll]);
      DatePicker1.Date := GetFileModDate(S);
      Application.ProcessMessages;
      TimePicker1.Time := GetFileModDate(S);
      Application.ProcessMessages;
    End;
  Except
  End;
End;

Procedure TForm1.ListViewAttributesClick(Sender: TObject);
Begin
  Try
    GlobGetAttrDateTime;
  Except
  End;
End;

Procedure TForm1.ListViewAttributesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
Begin
  Try
    GlobGetAttrDateTime;
  Except
  End;
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

Procedure TForm1.PopupRefreshListClick(Sender: TObject);
Begin
  ButtonRefreshClick(Sender);
End;

Procedure TForm1.IconSmallClick(Sender: TObject);
Begin
  SetListViewSystemIcons(ListViewAttributes,False);
  IconSmall.Checked := true;
  IconBig.Checked := False;
  ButtonRefreshClick(Sender);
End;

Procedure TForm1.IconBigClick(Sender: TObject);
Begin
  SetListViewSystemIcons(ListViewAttributes,True);
  IconSmall.Checked := False;
  IconBig.Checked := True;
  ButtonRefreshClick(Sender);
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

  IconSmall.Checked := Ini.ReadBool(Application.Title, IconSmall.Name, false);
  If IconSmall.Checked Then
  Begin
    IconSmallClick(self);
  End;

  IconBig.Checked := Ini.ReadBool(Application.Title, IconBig.Name, false);
  If IconBig.Checked Then
  Begin
    IconBigClick(self);
  End;

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
  Application.ProcessMessages;
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

  Ini.WriteBool(Application.Title, IconSmall.Name, IconSmall.Checked);
  Ini.WriteBool(Application.Title, IconBig.Name, IconBig.Checked);

  If form1.WindowState = wsMaximized Then
    Ini.WriteString(Application.Title, 'Window', 'wsMaximized');
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

Function CustomSortProc(Item1, Item2: TListItem; ParamSort: Integer): Integer; Stdcall;
Begin
  If ParamSort = 0 Then
    Result := CompareText(Item1.Caption, Item2.Caption)
  Else If Item1.SubItems.Count > ParamSort - 1 Then
  Begin
    If Item2.SubItems.Count > ParamSort - 1 Then
      Result := CompareText(Item1.SubItems[ParamSort - 1], Item2.SubItems[ParamSort - 1])
    Else
      Result := 1;
  End
  Else
    Result := -1;
End;

Procedure TForm1.WMDeviceChange(Var Msg: Tmessage);
Const
  DBT_DEVICEARRIVAL = $8000; // system detected a new device
  DBT_DEVICEREMOVECOMPLETE = $8004; // device is gone
Var
  myMsg: String;
  r: LongWord;
  Drives: Array[0..128] Of Char;
  pDrive: pchar;
Begin
  Try
    Inherited;
    Case Msg.WParam Of
      DBT_DEVICEARRIVAL:
        myMsg := 'OK';
      DBT_DEVICEREMOVECOMPLETE:
        myMsg := 'NO';
    End;
    If myMsg = 'OK' Then
    Begin
      r := GetLogicalDriveStrings(sizeof(Drives), Drives);
      If r = 0 Then
        Exit;
      If r > sizeof(Drives) Then
        Raise Exception.Create(SysErrorMessage(ERROR_OUTOFMEMORY));
      pDrive := Drives;
      While pDrive^ <> #0 Do
      Begin
        If GetDriveType(pDrive) = DRIVE_REMOVABLE Then
          drive := pDrive;
        inc(pDrive, 4);
      End;
      getDrive;
    End;
    If myMsg = 'NO' Then
    Begin
      getDrive;
    End;
  Except
  End;
End;

Procedure TForm1.ListViewAttributesColumnClick(Sender: TObject; Column: TListColumn);
Begin
  Try
    Sort := -Sort;
    If Column = ListViewAttributes.Columns[0] Then
      ListViewAttributes.CustomSort(@SortCaptionAsString, Sort)
    Else If Column = ListViewAttributes.Columns[1] Then
      ListViewAttributes.CustomSort(@Sort1SubItemAsString1, Sort)
    Else If Column = ListViewAttributes.Columns[2] Then
      ListViewAttributes.CustomSort(@Sort1SubItemAsString, Sort)
    Else If Column = ListViewAttributes.Columns[3] Then
      ListViewAttributes.CustomSort(@Sort1SubItemAsString1, Sort);
    // ListViewAttributes.CustomSort(@CustomSortProc, Column.Index);
  Except
  End;
End;

Procedure TForm1.ListViewAttributesDblClick(Sender: TObject);
Begin
  Try
    If ListViewAttributes.ItemIndex = -1 Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'Documents and Settings' Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'System Volume Information' Then
      Exit;
    If ListViewAttributes.Selected.Caption = '$RECYCLE.BIN' Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'Boot' Then
      Exit;
    If ListViewAttributes.Selected.Caption = 'Windows' Then
      Exit;
    If (ListViewAttributes.Selected <> Nil) Then
      If (ListViewAttributes.Selected.SubItems[5] = 'dir') Then // Если это папка,
      Begin
        // то прибавить имя выделенной папки к пути (и войти в нее)
        // и изменить текст текущей папки в DirectoryEdit
        cbPath.Text := cbPath.Text + ListViewAttributes.Selected.Caption + '\';
        form1.cbPath.Items.Add(StringReplace(cbPath.Text, '\\', '\', [rfReplaceAll]));

        AddFile(cbPath.Text + '*.*', faAnyFile); // перечитать файлы из нее
      End
      Else // Иначе (если это не папка), это файл и запустить его с помощью ShellExecute
        ShellExecute(Application.MainForm.Handle, Nil,
          // Указываем главное окно прог-мы и запускаем файл
          pchar(cbPath.Text + ListViewAttributes.Selected.Caption), '',
          // Полный путь к файлу и строка параметров для команд. строке
          pchar(cbPath.Text), SW_SHOW);
  Except
  End;
End;


Procedure TForm1.cbPathKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  Key := 0;
  PostMessage(cbPath.Handle, CB_SETEDITSEL, Cardinal(-1), 0);
End;

Procedure TForm1.cbPathKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := #0;
  PostMessage(cbPath.Handle, CB_SETEDITSEL, Cardinal(-1), 0);
End;

Procedure TForm1.cbPathMouseEnter(Sender: TObject);
Begin
  PostMessage(cbPath.Handle, CB_SETEDITSEL, Cardinal(-1), 0);
End;

Procedure TForm1.ButtonUPClick(Sender: TObject);
Begin
  Try
    If cbPath.Text = ExtractFileDrive(cbPath.Text) Then
      Exit;
    If cbPath.Text = ExtractFileDrive(cbPath.Text) + '\' Then
      Exit;
    If cbPath.Text <> ExtractFileDrive(cbPath.Text) Then
    Begin
      cbPath.Text := GetParentDir(StringReplace(cbPath.Text, '\\', '\', [rfReplaceAll]));
      cbPathChange(Sender);
      Application.ProcessMessages;
    End;
  Except
  End;
End;

Procedure TForm1.Button_ApplyClick(Sender: TObject);
Var
  FileAttributes: Integer;
  FilePath: String;
  Success: Boolean;
Begin
  // Проверка выбранного элемента
  If (ListViewAttributes.ItemIndex = -1) Or Not Assigned(ListViewAttributes.Selected) Then
    Exit;

  // Проверка на защищенные системные папки/файлы
  If IsProtectedItem(ListViewAttributes.Selected.Caption) Then
    Exit;

  // Установка атрибутов файла
  FileAttributes := 0;

  If CheckBox_ReadOnly.Checked Then
    FileAttributes := FileAttributes Or FILE_ATTRIBUTE_READONLY;

  If CheckBox_Hide.Checked Then
    FileAttributes := FileAttributes Or FILE_ATTRIBUTE_HIDDEN;

  If CheckBox_System.Checked Then
    FileAttributes := FileAttributes Or FILE_ATTRIBUTE_SYSTEM;

  If CheckBox_Archive.Checked Then
    FileAttributes := FileAttributes Or FILE_ATTRIBUTE_ARCHIVE;

  // Формирование пути к файлу
  FilePath := IncludeTrailingPathDelimiter(cbPath.Text) + ListViewAttributes.Selected.Caption;
  FilePath := StringReplace(FilePath, '\\', '\', [rfReplaceAll]);

  Try
    // Установка атрибутов через Windows API
    If FileExists(FilePath) Or SysUtils.DirectoryExists(FilePath) Then
    Begin
      Success := Windows.SetFileAttributes(PChar(FilePath), FileAttributes);

      // Проверка успешности операции
      If Not Success Then
      Begin
        // Можно обработать ошибку, например:
        // ShowMessage('Ошибка установки атрибутов. Код ошибки: ' + IntToStr(GetLastError));
      End;
    End;

  Except
    On E: Exception Do
    Begin
      // Обработка ошибок
      // ShowMessage('Ошибка установки атрибутов: ' + E.Message);
      Exit;
    End;
  End;

  // Обновление интерфейса
  GetAttrAttributes;
  Application.ProcessMessages;

  // Уведомление системы об изменениях
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, Nil, Nil);
  SendMessage(FindWindow('Progman', 'Program Manager'), WM_COMMAND, $A065, 0);

  Application.ProcessMessages;
End;

Function TForm1.IsProtectedItem(Const ItemName: String): Boolean;
Const
  ProtectedItems: Array[0..8] Of String = ('Documents and Settings', 'System Volume Information', '$RECYCLE.BIN', 'Boot', 'Windows', 'bootmgr', 'BOOTNXT', 'ProgramData', 'Users');
Var
  I: Integer;
Begin
  Result := False;
  For I := Low(ProtectedItems) To High(ProtectedItems) Do
    If SameText(ItemName, ProtectedItems[I]) Then
    Begin
      Result := True;
      Break;
    End;
End;

Function SetFileDateTime(Const FileName: String; NewDateTime: TDateTime): Boolean;
Var
  FileHandle: Integer;
  FileTime: TFileTime;
  LFT: TFileTime;
  LST: TSystemTime;
Begin
  Result := false;
  FileHandle := -1; // Инициализируем значением по умолчанию
  Try
    DecodeDate(NewDateTime, LST.wYear, LST.wMonth, LST.wDay);
    DecodeTime(NewDateTime, LST.wHour, LST.wMinute, LST.wSecond, LST.wMilliSeconds);
    If SystemTimeToFileTime(LST, LFT) Then
    Begin
      If LocalFileTimeToFileTime(LFT, FileTime) Then
      Begin
        FileHandle := FileOpen(FileName, fmOpenReadWrite Or fmShareExclusive);
        If FileHandle <> -1 Then // Проверяем, что файл успешно открыт
        Begin
          If SetFileTime(FileHandle, Nil, Nil, @FileTime) Then
            Result := true;
        End;
      End;
    End;
  Finally
    If FileHandle <> -1 Then // Закрываем только если файл был открыт
      FileClose(FileHandle);
  End;
End;

Function NT_SetDateTime(FileName: String; dtCreation, dtLastAccessTime, dtLastWriteTime: TDateTime): Boolean;
Var
  hDir: THandle;
  ftCreation: TFileTime;
  ftLastAccessTime: TFileTime;
  ftLastWriteTime: TFileTime;

  Function DTtoFT(dt: TDateTime): TFileTime;
  Var
    dwft: DWORD;
    ft: TFileTime;
  Begin
    dwft := DateTimeToFileDate(dt);
    DosDateTimeToFileTime(LongRec(dwft).Hi, LongRec(dwft).Lo, ft);
    LocalFileTimeToFileTime(ft, Result);
  End;

Begin
  hDir := CreateFile(pchar(FileName), GENERIC_READ Or GENERIC_WRITE, 0, Nil, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, 0);
  If hDir <> INVALID_HANDLE_VALUE Then
  Begin
    Try
      ftCreation := DTtoFT(dtCreation);
      ftLastAccessTime := DTtoFT(dtLastAccessTime);
      ftLastWriteTime := DTtoFT(dtLastWriteTime);
      Result := SetFileTime(hDir, @ftCreation, @ftLastAccessTime, @ftLastWriteTime);
    Finally
      CloseHandle(hDir);
    End;
  End
  Else
    Result := false;
End;

Function SetDirTime(Const Dir: String; DateTimeSource: TDateTime): Boolean;
Var
  H: THandle;
  F: TFileTime;
  S: TSystemTime;

  Function ConvertDateTimeToSystemTime(UseIndividualValues: Boolean): TSystemTime;
  Begin
    If UseIndividualValues Then
    Begin
      // Здесь должна быть реализация для индивидуальных значений
      // Например, можно использовать текущее время или другие значения
      DateTimeToSystemTime(Now, Result);
    End
    Else
      DateTimeToSystemTime(DateTimeSource, Result);
  End;

Begin
  H := CreateFile(PChar(Dir), $0100, 0, Nil, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, 0);
  If H <> INVALID_HANDLE_VALUE Then
  Begin
    Try
      // Передаем False для использования переданного DateTimeSource
      S := ConvertDateTimeToSystemTime(False);
      SystemTimeToFileTime(S, F);
      LocalFileTimeToFileTime(F, F);
      Result := SetFileTime(H, @F, @F, @F);
    Finally
      CloseHandle(H);
    End;
  End
  Else
    Result := False;
End;

Procedure TForm1.Button_DateTimeClick(Sender: TObject);
Var
  S: String;
  SelectedItem: TListItem;
  IsDirectory: Boolean;
  NewDateTime: TDateTime;
Begin
  // Проверка наличия выбранного элемента
  If Not Assigned(ListViewAttributes.Selected) Then
    Exit;

  SelectedItem := ListViewAttributes.Selected;
  IsDirectory := (SelectedItem.SubItems[5] = 'dir');

  // Формирование пути
  S := StringReplace(cbPath.Text + '\' + SelectedItem.Caption, '\\', '\', [rfReplaceAll]);

  // Создание новой даты/времени
  NewDateTime := DatePicker1.Date + TimePicker1.Time;

  Try
    If IsDirectory Then
    Begin
      // Обработка директории
      SetDirTime(S, NewDateTime);
      SelectedItem.SubItems[1] := FormatDateTime('dd.mm.yyyy hh:mm', GetDirTime(S));
    End
    Else
    Begin
      // Обработка файла
      SetFileDateTime(S, NewDateTime);
      SelectedItem.SubItems[1] := FormatDateTime('dd.mm.yyyy hh:mm', GetFileModDate(S));
    End;

    // Обновление интерфейса
    GlobGetAttrDateTime;

    // Уведомление системы об изменениях
    SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, Nil, Nil);
    SendMessage(FindWindow('Progman', 'Program Manager'), WM_COMMAND, $A065, 0);

  Except
    On E: Exception Do
      ShowMessage(LangErrorTime.Caption + ' ' + E.Message);
  End;

  Application.ProcessMessages;
End;

Procedure TForm1.ButtonRefreshClick(Sender: TObject);
Begin
  Try
    form1.cbPath.SendToBack;
    cbPathChange(Sender);
  Except
  End;
End;

Function FileTimeToDateTimeStr(FileTime: TFileTime): String;
// Функция перевода сист. времени в строку
Var
  LocFTime: TFileTime;
  SysFTime: TSystemTime;
  DateStr: String;
  Date, Time: TDateTime;
Begin
  FileTimeToLocalFileTime(FileTime, LocFTime);
  FileTimeToSystemTime(LocFTime, SysFTime);
  Try
    With SysFTime Do
    Begin
      Date := EncodeDate(wYear, wMonth, wDay);
      DateStr := DateToStr(Date);
      Time := EncodeTime(wHour, wMinute, wSecond, wMilliSeconds);
    End;
    Result := DateTimeToStr(Date + Time);
  Except
    Result := '';
  End;
End;

Procedure TForm1.cbPathChange(Sender: TObject);
Var
  ind: Integer;
  Path: String;
Begin
  Try
    If form1.cbPath.Text = '' Then
      Exit;

    // Используем IncludeTrailingPathDelimiter вместо IncludeTrailingBackslash
    Path := IncludeTrailingPathDelimiter(StringReplace(cbPath.Text, '\\', '\', [rfReplaceAll]));

    If Not SysUtils.DirectoryExists(Path) Then
    Begin
      cbPath.ItemIndex := 0;
      ind := SendMessage(ComboBoxDrive.Handle, CB_FINDSTRING, -1, Integer(pchar(ExtractFileDrive(cbPath.Items[cbPath.ItemIndex]))));
      form1.ComboBoxDrive.ItemIndex := ind;
    End;

    If SysUtils.DirectoryExists(Path) Then
    Begin
      ind := SendMessage(ComboBoxDrive.Handle, CB_FINDSTRING, -1, Integer(pchar(ExtractFileDrive(cbPath.Items[cbPath.ItemIndex]))));
      form1.ComboBoxDrive.ItemIndex := ind;
      AddFile(cbPath.Text + '*.*', faAnyFile);
    End;

    Try
      If ListViewAttributes.ItemIndex = -1 Then
      Begin
        form1.CheckBox_Archive.Checked := false;
        form1.CheckBox_System.Checked := false;
        form1.CheckBox_Hide.Checked := false;
        form1.CheckBox_ReadOnly.Checked := false;
        form1.CheckBox_Archive.Enabled := false;
        form1.CheckBox_System.Enabled := false;
        form1.CheckBox_Hide.Enabled := false;
        form1.CheckBox_ReadOnly.Enabled := false;
      End;
      form1.GetAttrAttributes;
    Except
      // Лучше добавить обработку исключения или убрать пустой блок
    End;
  Except
    // Лучше добавить обработку исключения или убрать пустой блок
  End;
End;

Procedure TForm1.cbPathEnter(Sender: TObject);
Begin
  PostMessage(cbPath.Handle, CB_SETEDITSEL, Cardinal(-1), 0);
End;

Procedure TForm1.ComboBoxDriveChange(Sender: TObject);
Begin
  Try
    form1.cbPath.Items.Add(ExtractFileDrive(form1.ComboBoxDrive.Text) + '\');
    form1.cbPath.ItemIndex := form1.cbPath.Items.IndexOf(ExtractFileDrive(form1.ComboBoxDrive.Text) + '\');
    If ExtractFileDrive(form1.ComboBoxDrive.Text) + '\' = ExtractFileDrive(cbPath.Text) + '\' Then
    Begin
      AddFile(ExtractFileDrive(form1.ComboBoxDrive.Text) + '\' + '*.*', faAnyFile);
    End;
    AddFile(cbPath.Text + '*.*', faAnyFile);
  Except
  End;
End;

End.

