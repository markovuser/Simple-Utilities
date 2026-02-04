unit Unit_Base;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, IniFiles, ImgList, shellapi, Menus, StdCtrls, pngimage,
  System.ImageList, WindowsDarkMode, Vcl.Buttons, Translation, CommCtrl, ShlObj,
  FileInfoUtils;

type
  TWmMoving = record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  end;

type
  TListView = class(ComCtrls.TListView)
  protected
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
  end;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    TabControlTitle: TTabControl;
    ImageTitle: TImage;
    TabControlBody: TTabControl;
    ListViewUtilities: TListView;
    PopupMenu_General: TPopupMenu;
    RefreshListMenu: TMenuItem;
    AboutMenu: TMenuItem;
    Separator2: TMenuItem;
    CheckUpdateMenu: TMenuItem;
    N1: TMenuItem;
    ThemeMenu: TMenuItem;
    N3: TMenuItem;
    ThemeAuto: TMenuItem;
    ThemeLight: TMenuItem;
    ThemeDark: TMenuItem;
    LanguageMenu: TMenuItem;
    PopupMenuLanguage: TPopupMenu;
    LangOnlyWindows: TMenuItem;
    LangError: TMenuItem;
    LangElements: TMenuItem;
    LangFileNotFound: TMenuItem;
    LangOther: TMenuItem;
    LangNotExecutable: TMenuItem;
    SpeedButton_GeneralMenu: TSpeedButton;
    ViewMenu: TMenuItem;
    IconSmallMenu: TMenuItem;
    IconBigMenu: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure LoadNastr;
    procedure SaveNastr;
    procedure UnCheckTheme;
    procedure ListViewUtilitiesDblClick(Sender: TObject);
    procedure ListViewUtilitiesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FindDocs(const Root: string);
    function MatchFileName(const FileName: string; const TargetFiles: array of string): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListViewUtilitiesClick(Sender: TObject);
    procedure RefreshListMenuClick(Sender: TObject);
    procedure AboutMenuClick(Sender: TObject);
    procedure SpeedButton_GeneralMenuClick(Sender: TObject);
    procedure Globload;
    procedure LoadLanguage;
    procedure CleanTranslationsLikeGlobload;
    procedure CheckUpdateMenuClick(Sender: TObject);
    procedure ThemeAutoClick(Sender: TObject);
    procedure ThemeLightClick(Sender: TObject);
    procedure ThemeDarkClick(Sender: TObject);
    function IsWindows10Or11: Boolean;
    function PortablePath: string;
    function GetBinaryPlatform(aFileName: string): string;
    procedure IconSmallMenuClick(Sender: TObject);
    procedure IconBigMenuClick(Sender: TObject);
  private
    procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
    procedure WMSettingChange(var Message: TWMSettingChange); message WM_SETTINGCHANGE;
    procedure LanguageMenuItemClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  g, AIndex: Integer;
  portable: Boolean;
  LangCode: string;
  LangLocal: string;

const
  ServerName = 'Simple-Utilities';
  ApiGithub = 'https://api.github.com/repos/markovuser/' + ServerName + '/releases/latest';

implementation

uses
  Unit_About, Unit_Update;
{$R *.dfm}

procedure TForm1.IconBigMenuClick(Sender: TObject);
begin
  IconSmallMenu.Checked := false;
  IconBigMenu.Checked := true;
  SetListViewSystemIcons(ListViewUtilities, true);
  RefreshListMenuClick(Sender);
end;

procedure TForm1.IconSmallMenuClick(Sender: TObject);
begin
  IconSmallMenu.Checked := true;
  IconBigMenu.Checked := false;
  SetListViewSystemIcons(ListViewUtilities, false);
  RefreshListMenuClick(Sender);
end;

function TForm1.IsWindows10Or11: Boolean;
begin
  Result := (TOSVersion.Major = 10) and (TOSVersion.Build >= 10240);
end;

procedure TForm1.WMSettingChange(var Message: TWMSettingChange);
begin
  try
    if ThemeAuto.Checked = true then
    begin

      if DarkModeIsEnabled = true then
      begin
        SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
      end;

      if DarkModeIsEnabled = False then
      begin
        SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      end;
    end;
  except
  end;
  Application.ProcessMessages;
end;

function ExtractOnlyFileName(const FileName: string): string;
begin
  try
    Result := StringReplace(ExtractFileName(FileName), ExtractFileExt(FileName), '', []);
  except
  end;
end;

procedure TListView.WMVScroll(var Message: TWMVScroll);
begin
  TWinControl(self).DefaultHandler(Message);
end;

procedure TForm1.CheckUpdateMenuClick(Sender: TObject);
begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
  Form10.ShowModal;
end;

procedure TForm1.Globload;
var
  i: Integer;
  Internat: TTranslation;
  Ini: TMemIniFile;
  lang, lang_file: string;
begin
  for i := 0 to Screen.FormCount - 1 do
  begin
    Ini := TMemIniFile.Create(Form1.PortablePath);
    lang := Ini.ReadString('Language', 'Language', '');
    lang_file := ExtractFilePath(ParamStr(0)) + 'Language\' + lang + '.ini';
    Ini.Free;
    Ini := TMemIniFile.Create(lang_file);
    if Ini.SectionExists(Application.Title) then // Используем конкретную секцию
    begin
      Internat.Execute(Screen.Forms[i], Application.Title);
      // Передаем имя секции
      Application.ProcessMessages;
    end;
    Ini.Free;
  end;
end;

procedure TForm1.LoadNastr;
var
  Ini: TMemIniFile;
  i: Integer;
begin
  Ini := TMemIniFile.Create(Form1.PortablePath);

  IconSmallMenu.Checked := Ini.ReadBool('Option', IconSmallMenu.Name, False);
  if IconSmallMenu.Checked then
    IconSmallMenuClick(self);

  IconBigMenu.Checked := Ini.ReadBool('Option', IconBigMenu.Name, False);
  if IconBigMenu.Checked then
    IconBigMenuClick(self);

  for i := 0 to ThemeMenu.Count - 1 do
  begin
    ThemeMenu.Items[i].Checked := Ini.ReadBool('Option', ThemeMenu.Items[i].Name, False);
    if ThemeMenu.Items[i].Checked = true then
    begin
      ThemeMenu.Items[i].Click;
    end;
  end;
  if Ini.ReadString('Option', 'Window', '') = 'wsMaximized' then
  begin
    form1.WindowState := wsMaximized;
  end;

  if Ini.ReadString('Option', 'Window', '') <> 'wsMaximized' then
  begin
    form1.top := Ini.ReadInteger('Option', 'Top', form1.top);
    form1.left := Ini.ReadInteger('Option', 'Left', form1.left);
    form1.Height := Ini.ReadInteger('Option', 'Height', form1.Height);
    form1.Width := Ini.ReadInteger('Option', 'Width', form1.Width);
  end;
  Ini.Free;
end;

function GetAppDataRoamingPath: string;
var
  Path: array[0..MAX_PATH] of Char;
begin
  if SUCCEEDED(SHGetFolderPath(0, CSIDL_APPDATA, 0, 0, @Path[0])) then
    Result := IncludeTrailingPathDelimiter(Path)
  else
    Result := '';
end;

function TForm1.PortablePath: string;
begin
  if portable then
    Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini'
  else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(ParamStr(0))) + Application.Title + '\Config\Option.ini';
    //Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini';
  // Создаем папку для конфига
  ForceDirectories(ExtractFilePath(Result));
end;

procedure TForm1.SaveNastr;
var
  Ini: TMemIniFile;
  i: Integer;
begin
  Ini := TMemIniFile.Create(Form1.PortablePath);

  Ini.WriteBool('Option', Form10.CheckBoxQuickUpdate.Name, Form10.CheckBoxQuickUpdate.Checked);
  Ini.WriteBool('Option', Form1.IconSmallMenu.Name, Form1.IconSmallMenu.Checked);
  Ini.WriteBool('Option', Form1.IconBigMenu.Name, Form1.IconBigMenu.Checked);

  for i := 0 to ThemeMenu.Count - 1 do
  begin
    Ini.WriteBool('Option', ThemeMenu.Items[i].Name, ThemeMenu.Items[i].Checked);
  end;

  if Form1.WindowState = wsMaximized then
  begin
    Ini.WriteString(Application.Title, 'Window', 'wsMaximized');
  end;
  if Form1.WindowState <> wsMaximized then
  begin
    Ini.WriteString(Application.Title, 'Window', 'wsNormal');
    Ini.WriteInteger(Application.Title, 'Top', Form1.top);
    Ini.WriteInteger(Application.Title, 'Left', Form1.left);
    Ini.WriteInteger(Application.Title, 'Height', Form1.Height);
    Ini.WriteInteger(Application.Title, 'Width', Form1.Width);
  end;
  Ini.UpdateFile;
  Ini.Free;
end;

procedure TForm1.AboutMenuClick(Sender: TObject);
begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
  Form8.ShowModal;
end;

procedure TForm1.WMMouseMove(var Message: TWMMouseMove);
begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
end;

procedure TForm1.SpeedButton_GeneralMenuClick(Sender: TObject);
var
  ButtonRight: TPoint;
begin
  if (SpeedButton_GeneralMenu.AllowAllUp) then
  begin
    SpeedButton_GeneralMenu.AllowAllUp := False;
    SpeedButton_GeneralMenu.Down := true;
    Application.ProcessMessages;
    if Sender is TControl then
    begin
      ButtonRight.X := SpeedButton_GeneralMenu.left;
      ButtonRight.Y := SpeedButton_GeneralMenu.top;
      ButtonRight := ClientToScreen(ButtonRight);
      PopupMenu_General.Popup(ButtonRight.X + SpeedButton_GeneralMenu.Width, ButtonRight.Y + SpeedButton_GeneralMenu.Height);
    end;
  end
  else
  begin
    SpeedButton_GeneralMenu.AllowAllUp := true;
    SpeedButton_GeneralMenu.Down := False;
    PopupMenu_General.CloseMenu;
    Application.ProcessMessages;
  end;
end;

procedure TForm1.UnCheckTheme;
var
  i: Integer;
begin
  for i := 0 to ThemeMenu.Count - 1 do
  begin
    ThemeMenu.Items[i].Checked := False;
  end;
end;

procedure TForm1.ThemeAutoClick(Sender: TObject);
begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
  UnCheckTheme;
  ThemeAuto.Checked := true;
  if DarkModeIsEnabled = true then
  begin
    SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
    Application.ProcessMessages;
  end;

  if DarkModeIsEnabled = False then
  begin
    SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
    Application.ProcessMessages;
  end;
end;

procedure TForm1.ThemeDarkClick(Sender: TObject);
begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
  UnCheckTheme;
  ThemeDark.Checked := true;
  SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
  Application.ProcessMessages;
end;

procedure TForm1.ThemeLightClick(Sender: TObject);
begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
  UnCheckTheme;
  ThemeLight.Checked := true;
  SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
  Application.ProcessMessages;
end;

procedure MenuHelpRight(MainMenu: TMainMenu; NameMenuItem: TMenuItem);
begin
  ModifyMenu(MainMenu.Handle, NameMenuItem.MenuIndex, mf_ByPosition or mf_Popup or mf_Help, NameMenuItem.Handle, pchar(NameMenuItem.Caption))
end;

{Function GetExeBitness(Const ExePath: String): String;
Var
  F: File;
  Buffer: Array[0..$200] Of Byte;
  PEOffset: Integer;
  Machine: Word;
Begin
  Result := 'Unknown';

  AssignFile(F, ExePath);
  Reset(F, 1);
  Try
    BlockRead(F, Buffer, SizeOf(Buffer));

    // Проверка MZ
    If PWord(@Buffer[0])^ <> $5A4D Then
      Exit;

    // Смещение PE
    PEOffset := PInteger(@Buffer[$3C])^;
    If PEOffset > SizeOf(Buffer) - 6 Then
      Exit;

    // Проверка PE
    If PCardinal(@Buffer[PEOffset])^ <> $00004550 Then
      Exit;

    // Тип машины
    Machine := PWord(@Buffer[PEOffset + 4])^;

    If Machine = $14C Then
      Result := '32-bit'
    Else If Machine = $8664 Then
      Result := '64-bit';
  Finally
    CloseFile(F);
  End;
End;   }

function GetApplicationBitness: string;
begin
  {$IFDEF WIN64}
  Result := '(64-bit)';
  {$ELSE}
  Result := '(32-bit)';
  {$ENDIF}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  portable := fileExists(ExtractFilePath(ParamStr(0)) + 'portable.ini');
  Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness;
  if portable then
    Form1.Caption := Form1.Caption + ' Portable';

  SendMessage(ListViewUtilities.Handle, LVM_SETEXTENDEDLISTVIEWSTYLE, LVS_EX_DOUBLEBUFFER, LVS_EX_DOUBLEBUFFER);
  createicon(ListViewUtilities);
  Application.ProcessMessages;
  ListViewUtilities.Items.BeginUpdate;
  FindDocs(ExtractFilePath(ParamStr(0)));
  ListViewUtilities.Items.EndUpdate;
end;

procedure TForm1.RefreshListMenuClick(Sender: TObject);
begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := False;
  ListViewUtilities.Clear;
  ListViewUtilities.Items.BeginUpdate;
  FindDocs(ExtractFilePath(ParamStr(0)));
  ListViewUtilities.Items.EndUpdate;
  try
    with ListViewUtilities do
      if AIndex >= 0 then
      begin
        if AIndex >= Items.Count then
          AIndex := Items.Count - 1;
        ItemIndex := AIndex;
        Invalidate;
        if ItemIndex >= 0 then
          Selected.MakeVisible(False);
        ListViewUtilities.Items.Item[AIndex].Selected;
        Form1.ListViewUtilities.Items[AIndex].MakeVisible(true);
        Form1.ListViewUtilities.Items[AIndex].Selected := true;
        Form1.ListViewUtilities.Items[AIndex].Focused := true;
      end;
  except
  end;
end;

procedure TForm1.CleanTranslationsLikeGlobload;
var
  i, j, k, m: Integer;
  Ini: TMemIniFile;
  Sections, Keys: TStringList;
  SearchRec: TSearchRec;
  FindResult: Integer;
  CompPath, FormName, CompName, PropName: string;
  FirstDot, SecondDot: Integer;
  FormExists, CompExists: Boolean;
  CurrentForm: TForm;
  CurrentComponent: TComponent;
  Modified: Boolean;
  IsDuplicate: Boolean;
  n: Integer;
  CompareKey, CompareFormName: string;
  CompareDotPos: Integer;
begin
  // Создаем все формы проекта (если нужно)
  // CreateAllProjectForms;

  FindResult := FindFirst(ExtractFilePath(ParamStr(0)) + 'Language\*.ini', faAnyFile, SearchRec);
  if FindResult = 0 then
  begin
    repeat
      if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
      begin
        Ini := TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Language\' + SearchRec.Name);
        Sections := TStringList.Create;
        Keys := TStringList.Create;
        Modified := False;

        try
          Ini.ReadSections(Sections);

          for i := 0 to Sections.Count - 1 do
          begin
            if SameText(Sections[i], Application.Title) then
            begin
            // ========== ИСКЛЮЧАЕМ ЭТИ СЕКЦИИ ИЗ ОБРАБОТКИ ==========
              if SameText(Sections[i], 'Language information') or SameText(Sections[i], 'DestDir') then
                Continue; // Пропускаем эти секции полностью

              Ini.ReadSection(Sections[i], Keys);

            // Проходим по всем ключам в обратном порядке
              for j := Keys.Count - 1 downto 0 do
              begin
                CompPath := Keys[j];
                FirstDot := Pos('.', CompPath);

                if FirstDot > 0 then
                begin
                  FormName := Copy(CompPath, 1, FirstDot - 1);
                  FormExists := False;
                  CompExists := False;

                // ==================== ПРОВЕРКА СУЩЕСТВОВАНИЯ КОМПОНЕНТА ====================
                // Проверяем ВСЕ формы в Screen
                  for k := 0 to Screen.FormCount - 1 do
                  begin
                    if SameText(Screen.Forms[k].Name, FormName) then
                    begin
                      FormExists := True;
                      CurrentForm := Screen.Forms[k];

                    // Извлекаем остаток пути после имени формы
                      CompName := Copy(CompPath, FirstDot + 1, Length(CompPath));
                      SecondDot := Pos('.', CompName);

                      if SecondDot > 0 then
                      begin
                      // Есть вложенный компонент: Form1.TrayIcon1.Hint
                        PropName := Copy(CompName, SecondDot + 1, Length(CompName));
                        CompName := Copy(CompName, 1, SecondDot - 1);

                      // Ищем компонент на форме
                        CurrentComponent := CurrentForm.FindComponent(CompName);

                      // Если не нашли через FindComponent, ищем вручную
                        if CurrentComponent = nil then
                        begin
                          for m := 0 to CurrentForm.ComponentCount - 1 do
                          begin
                            if SameText(CurrentForm.Components[m].Name, CompName) then
                            begin
                              CurrentComponent := CurrentForm.Components[m];
                              Break;
                            end;
                          end;
                        end;

                        CompExists := (CurrentComponent <> nil);
                      end
                      else
                      begin
                      // Нет второй точки - это свойство формы (Form1.Caption)
                        CompExists := True;
                      end;

                      Break; // Форма найдена, выходим из цикла
                    end;
                  end;

                // ==================== ПРОВЕРКА ДУБЛИКАТОВ ====================
                  IsDuplicate := False;
                // Проверяем предыдущие ключи на дубликаты (только внутри той же формы)
                  for n := 0 to j - 1 do
                  begin
                    CompareKey := Keys[n];
                    CompareDotPos := Pos('.', CompareKey);

                    if CompareDotPos > 0 then
                    begin
                      CompareFormName := Copy(CompareKey, 1, CompareDotPos - 1);

                    // Дубликатом считаем только если:
                    // 1. Имя формы совпадает
                    // 2. Полный путь совпадает (регистронезависимо)
                      if (SameText(FormName, CompareFormName)) and (SameText(CompPath, CompareKey)) then
                      begin
                        IsDuplicate := True;
                        Break;
                      end;
                    end;
                  end;

                // ==================== УДАЛЕНИЕ КЛЮЧА ====================
                // Удаляем если:
                // 1. Форма или компонент не существуют ИЛИ
                // 2. Найден дубликат в той же форме
                  if (not (FormExists and CompExists)) or IsDuplicate then
                  begin
                    Ini.DeleteKey(Sections[i], Keys[j]);
                    Modified := True;
                  end;
                end
                else
                begin
                // Некорректный формат - удаляем
                  Ini.DeleteKey(Sections[i], Keys[j]);
                  Modified := True;
                end;
              end;

            // Проверяем, не пустая ли секция после удаления
            // (кроме исключенных секций)
              if not (SameText(Sections[i], 'Language information') or SameText(Sections[i], 'DestDir')) then
              begin
                Ini.ReadSection(Sections[i], Keys);
                if Keys.Count = 0 then
                begin
                  Ini.EraseSection(Sections[i]);
                  Modified := True;
                end;
              end;
            end;

            if Modified then
              Ini.UpdateFile;
          end;

        finally
          Keys.Free;
          Sections.Free;
          Ini.Free;
        end;
      end;
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;
end;

procedure TForm1.LoadLanguage;
var
  Ini: TMemIniFile;
  LangFiles: TStringList;
  i: Integer;
  MenuItem: TMenuItem;
  FileName, DisplayName, MenuCaption: string;
  SearchRec: TSearchRec;
begin
  Ini := TMemIniFile.Create(PortablePath);
  while LanguageMenu.Count > 0 do
    LanguageMenu.Items[0].Free;
  LangLocal := Ini.ReadString('Language', 'Language', '');
  Ini.Free;

  LangFiles := TStringList.Create;
  try
    if FindFirst(ExtractFilePath(ParamStr(0)) + 'Language\*.ini', faAnyFile, SearchRec) = 0 then
    begin
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          LangFiles.Add(SearchRec.Name);
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    end;
    LangFiles.Sort;
    for i := 0 to LangFiles.Count - 1 do
    begin
      FileName := LangFiles[i];
      LangCode := ChangeFileExt(FileName, '');
      DisplayName := LangCode;
      try
        Ini := TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Language\' + FileName);
        try
          DisplayName := Ini.ReadString('Language information', 'LANGNAME', LangCode);
        finally
          Ini.Free;
        end;
      except
      end;
      MenuCaption := LangCode + #9 + #9 + DisplayName;
      MenuItem := TMenuItem.Create(LanguageMenu);
      MenuItem.RadioItem := true;
      MenuItem.Caption := MenuCaption;
      MenuItem.AutoHotkeys := maManual;
      MenuItem.AutoCheck := True;
      if (LangCode = LangLocal) or (SameText(LangCode, LangLocal)) or (LangCode + '.ini' = LangLocal) then
        MenuItem.Checked := True;
      MenuItem.OnClick := LanguageMenuItemClick;
      LanguageMenu.Add(MenuItem);
    end;

  finally
    LangFiles.Free;
  end;
end;

procedure TForm1.LanguageMenuItemClick(Sender: TObject);
var
  MenuItem: TMenuItem;
  Ini: TMemIniFile;
  i: Integer;
begin
  if Sender is TMenuItem then
  begin
    MenuItem := TMenuItem(Sender);
    LangCode := Copy(MenuItem.Caption, 1, Pos(#9, MenuItem.Caption) - 1);
    LangLocal := LangCode;
    for i := 0 to LanguageMenu.Count - 1 do
      LanguageMenu.Items[i].Checked := False;
    MenuItem.Checked := True;
    Ini := TMemIniFile.Create(PortablePath);
    try
      Ini.WriteString('Language', 'Language', LangLocal);
      Ini.UpdateFile;
    finally
      Ini.Free;
    end;
    LoadLanguage;
    Form1.Globload;
    RefreshListMenuClick(Sender);
  end;
end;

procedure TForm1.ListViewUtilitiesClick(Sender: TObject);
begin
  try
    if Form1.ListViewUtilities.ItemIndex = -1 then
    begin
      AIndex := 0;
    end;
    if Form1.ListViewUtilities.ItemIndex <> -1 then
    begin
      AIndex := 0;
      AIndex := ListViewUtilities.Selected.Index;
    end;
  except
  end;
end;

procedure TForm1.ListViewUtilitiesDblClick(Sender: TObject);
begin
  if ListViewUtilities.ItemIndex = -1 then
    Exit;
  ShellExecute(Application.Handle, 'open', pchar(ListViewUtilities.Selected.SubItems.Strings[2]), nil, nil, SW_NORMAL);
  Application.ProcessMessages;
end;

function TForm1.GetBinaryPlatform(aFileName: string): string;
var
  BinaryType: DWORD;
begin
  if not FileExists(aFileName) then
  begin
    Result := LangFileNotFound.caption;
    Exit;
  end;

  if GetBinaryType(PChar(aFileName), BinaryType) then
  begin
    if BinaryType = SCS_32BIT_BINARY then
      Result := '32-bit'
    else if BinaryType = SCS_64BIT_BINARY then
      Result := '64-bit'
    else
      Result := LangOther.Caption + ' (' + IntToStr(BinaryType) + ')';
  end
  else
  begin
    Result := LangNotExecutable.Caption;
  end;
end;

procedure TForm1.FindDocs(const Root: string);
var
  SearchRec: TSearchRec;
  Folders: TStringList;
  Folder: string;
  i: Integer;
  ShInfo: TSHFileInfo;
  ListItem: TListItem;
  FilePath: string;
  TargetFiles: array of string;
begin
  // Список целевых файлов для поиска
  TargetFiles := ['AttributesManager.exe', 'DiskCleaner.exe', 'FileEnCryptDeCrypt.exe', 'FolderIconChanger.exe', 'LibrariesManager.exe', 'NetworkManager.exe', 'RegistryCleaner.exe', 'RegistrySearch.exe', 'StartupManager.exe', 'UninstallManager.exe'];

  Folders := TStringList.Create;
  try
    Folders.Add(Root);
    i := 0;

    while i < Folders.Count do
    begin
      Folder := IncludeTrailingPathDelimiter(Folders[i]);
      Inc(i);

      // Обработка статусной строки каждые 10 папок для снижения нагрузки
      if (i mod 10 = 0) then
      begin
        Form1.StatusBar1.Panels[0].Text := LangElements.Caption + ' ' + IntToStr(Form1.ListViewUtilities.Items.Count);
        Application.ProcessMessages;
      end;

      { Поиск подпапок }
      if FindFirst(Folder + '*.*', faDirectory, SearchRec) = 0 then
      begin
        try
          repeat
            if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and ((SearchRec.Attr and faDirectory) = faDirectory) then
            begin
              Folders.Add(Folder + SearchRec.Name);
            end;
          until FindNext(SearchRec) <> 0;
        finally
          FindClose(SearchRec);
        end;
      end;

      { Поиск файлов }
      if FindFirst(Folder + '*.exe', faAnyFile - faDirectory, SearchRec) = 0 then
      begin
        try
          repeat
            if (SearchRec.Attr and faDirectory) <> faDirectory then
            begin
              // Проверка через Pos для большей производительности
              if MatchFileName(SearchRec.Name, TargetFiles) then
              begin
                FilePath := Folder + SearchRec.Name;

                SHGetFileInfo(PChar(FilePath), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX);

                ListItem := Form1.ListViewUtilities.Items.Add;
                with ListItem do
                begin
                  ImageIndex := ShInfo.iIcon;
                  Caption := GetFileDescription(FilePath);
                  SubItems.Add(GetFileVersion(FilePath));
                  SubItems.Add(GetBinaryPlatform(FilePath));
                  //SubItems.Add(GetCompanyName(FilePath));
                  SubItems.Add(FilePath);
                  Checked := True;
                end;
              end;
            end;
          until FindNext(SearchRec) <> 0;
        finally
          FindClose(SearchRec);
        end;
      end;
    end;

    // Финальное обновление статуса
    Form1.StatusBar1.Panels[0].Text := LangElements.Caption + ' ' + IntToStr(Form1.ListViewUtilities.Items.Count);

  finally
    Folders.Free;
  end;
end;

// Вспомогательная функция для проверки соответствия имени файла
function TForm1.MatchFileName(const FileName: string; const TargetFiles: array of string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := Low(TargetFiles) to High(TargetFiles) do
  begin
    if SameText(FileName, TargetFiles[i]) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TForm1.ListViewUtilitiesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ListViewUtilities.ItemIndex = -1 then
    Exit;
  if (Key = 13) and (ListViewUtilities.Selected <> nil) then
  begin
    ShellExecute(Application.Handle, 'open', pchar(ListViewUtilities.Selected.SubItems.Strings[2]), nil, nil, SW_NORMAL);
    Application.ProcessMessages;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveNastr;
end;

end.

