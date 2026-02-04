unit Unit_Base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Registry, FileCtrl, shellapi, Menus,
  ImgList, ActiveX, CheckLst, ShlObj, SHDocVw, clipbrd, CommCtrl, IniFiles,
  pngimage, ImageList, Math, Masks, Vcl.Buttons, WindowsDarkMode, System.IOUtils,
  System.Win.TaskbarCore, Vcl.Taskbar, Translation, System.Generics.Collections,
  System.UITypes, FileInfoUtils;

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
    PopupMenuFilter: TPopupMenu;
    AddFilter: TMenuItem;
    DeleteFilter: TMenuItem;
    SelectAllFilter: TMenuItem;
    ExcludeAllFilter: TMenuItem;
    PopupMenuExclusion: TPopupMenu;
    AddExclusion: TMenuItem;
    PopupMenuSearch: TPopupMenu;
    DeleteSelectFileSearch: TMenuItem;
    DeleteExclusion: TMenuItem;
    SelectAllExclusion: TMenuItem;
    ExcludeAllExclusion: TMenuItem;
    OpenFolderSearch: TMenuItem;
    PropertiesSearch: TMenuItem;
    SelectAllSearch: TMenuItem;
    ExcludeAllSearch: TMenuItem;
    AddExceptionsSearch: TMenuItem;
    ClearListSearch: TMenuItem;
    ChangeExclusion: TMenuItem;
    ChangeFilter: TMenuItem;
    PopupMenuQuicSearch: TPopupMenu;
    OpenFolderQuicSearch: TMenuItem;
    PopupMenuQuickClean: TPopupMenu;
    SelectAllQuickClean: TMenuItem;
    ExcludeAllQuickClean: TMenuItem;
    SaveQuickClean: TMenuItem;
    PropertiesQuicSearch: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    SelectAllQuicSearch: TMenuItem;
    ExcludeAllQuicSearch: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    PopupMenuExclusionReg: TPopupMenu;
    SelectAllExclusionReg: TMenuItem;
    ExcludeAllExclusionReg: TMenuItem;
    CaveExclusionReg: TMenuItem;
    DeleteExclusionReg: TMenuItem;
    AddExclusionReg: TMenuItem;
    ChangeExclusionReg: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    SaveExclusion: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    SaveFilter: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet6: TTabSheet;
    StatusBar2: TStatusBar;
    StatusBar4: TStatusBar;
    TabControl6: TTabControl;
    StatusBar1: TStatusBar;
    TabControl5: TTabControl;
    CheckBoxRecycleBin: TCheckBox;
    ListViewDiskCleaner: TListView;
    TabControl4: TTabControl;
    ButtonDelete: TButton;
    ButtonSearch: TButton;
    TabControlOption: TTabControl;
    TabControl9: TTabControl;
    ListViewQuicSearch: TListView;
    TabControl3: TTabControl;
    ButtonQuickDelete: TButton;
    ButtonQuickSearch: TButton;
    AddExceptionsDiskCleanerMenu: TMenuItem;
    N37: TMenuItem;
    DelRegKeyDiskCleanerMenu: TMenuItem;
    DeleteFolderQuicSearch: TMenuItem;
    N63: TMenuItem;
    DeleteFileQuicSearch: TMenuItem;
    TabControl11: TTabControl;
    TreeViewOption: TTreeView;
    TabControl8: TTabControl;
    ButtonSaveOption: TButton;
    ButtonDefaultDiskCleaner: TButton;
    ClearListQuicSearch: TMenuItem;
    TabControl2: TTabControl;
    MemoHKCU: TMemo;
    MemoFilters: TMemo;
    MemoHKLM: TMemo;
    ImageList3: TImageList;
    TabControl1: TTabControl;
    TabControl10: TTabControl;
    ListViewExclusionReg: TListView;
    ListViewExclusion: TListView;
    ListViewFilter: TListView;
    CheckBoxProgress: TCheckBox;
    ComboBoxDrive: TComboBox;
    ButtonCleanDisk: TButton;
    ButtonCleanFast: TButton;
    ButtonCleanOption: TButton;
    Taskbar1: TTaskbar;
    HeaderControl: THeaderControl;
    HeaderControl2: THeaderControl;
    HeaderControl3: THeaderControl;
    PopupMenuGeneral: TPopupMenu;
    SpeedButton_GeneralMenu: TSpeedButton;
    CheckBoxTempWindows: TCheckBox;
    CheckBoxTempAPP: TCheckBox;
    CheckBoxTrash: TCheckBox;
    CheckBoxClipboard: TCheckBox;
    CheckBoxWindowsLogs: TCheckBox;
    CheckBoxFontCache: TCheckBox;
    CheckBoxRegistry: TCheckBox;
    PopupMenuLanguage: TPopupMenu;
    LangSearch: TMenuItem;
    LangCancel: TMenuItem;
    LangReady: TMenuItem;
    LangDelFilter: TMenuItem;
    LangAttention: TMenuItem;
    LangDelExclusion: TMenuItem;
    ProgressBarQuickClean: TProgressBar;
    ProgressBarCleanDisk: TProgressBar;
    LangOnlyWindows: TMenuItem;
    LangError: TMenuItem;
    LangTotalFilters: TMenuItem;
    LangRegKey: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ListViewDiskCleanerColumnClick(Sender: TObject; Column: TListColumn);
    procedure CheckAll3(Checked: boolean);
    procedure LoadNastr;
    procedure SaveNastr;
    procedure ButtonSaveOptionClick(Sender: TObject);
    procedure AddFilterClick(Sender: TObject);
    procedure DeleteFilterClick(Sender: TObject);
    procedure WMDeviceChange(var Msg: Tmessage); message WM_DEVICECHANGE;
    procedure AddExl(Path: string; EChecked: boolean; List: TListView);
    procedure AddExt(Extension: string; EChecked: boolean; List: TListView);
    procedure CheckAll6(Checked: boolean);
    procedure CheckAll2(Checked: boolean);
    procedure ButtonSearchClick(Sender: TObject);
    procedure SelectAllFilterClick(Sender: TObject);
    procedure ExcludeAllFilterClick(Sender: TObject);
    procedure AddExclusionClick(Sender: TObject);
    procedure DeleteSelectFileSearchClick(Sender: TObject);
    procedure DeleteExclusionClick(Sender: TObject);
    procedure SelectAllExclusionClick(Sender: TObject);
    procedure ExcludeAllExclusionClick(Sender: TObject);
    procedure CheckAll4(Checked: boolean);
    procedure SelectAllSearchClick(Sender: TObject);
    procedure ExcludeAllSearchClick(Sender: TObject);
    procedure CheckAll1(Checked: boolean);
    procedure FindFiles;
    procedure RemRecycle;
    procedure getDrive;
    function InExt(const FileName: string): Boolean;
    function ExlPath(const Path: string): Boolean;
    procedure CheckAll7(Checked: boolean);
    procedure AddExceptionsSearchClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure CheckBoxRecycleBinClick(Sender: TObject);
    procedure ListViewFilterChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure ListViewExclusionChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure PropertiesSearchClick(Sender: TObject);
    procedure OpenFolderSearchClick(Sender: TObject);
    procedure ClearListSearchClick(Sender: TObject);
    procedure ButtonDefaultDiskCleanerClick(Sender: TObject);
    procedure ButtonQuickSearchClick(Sender: TObject);
    procedure ChangeExclusionClick(Sender: TObject);
    procedure ChangeFilterClick(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure OpenFolderQuicSearchClick(Sender: TObject);
    procedure CheckBox17Click(Sender: TObject);
    procedure CheckBox18Click(Sender: TObject);
    procedure CheckBox19Click(Sender: TObject);
    procedure SelectAllQuickCleanClick(Sender: TObject);
    procedure ExcludeAllQuickCleanClick(Sender: TObject);
    procedure SaveQuickCleanClick(Sender: TObject);
    procedure PropertiesQuicSearchClick(Sender: TObject);
    procedure ListViewQuicSearchSelectItem(Sender: TObject; Item: TListItem; Selected: boolean);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure Listview_quickCleanEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
    procedure ButtonQuickDeleteClick(Sender: TObject);
    procedure SelectAllQuicSearchClick(Sender: TObject);
    procedure ExcludeAllQuicSearchClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure ClearSelected;
    procedure cleanReg;
    procedure Find(Dir: string);
    procedure ListViewExclusionRegEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
    procedure ListViewExclusionRegChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure SelectAllExclusionRegClick(Sender: TObject);
    procedure ExcludeAllExclusionRegClick(Sender: TObject);
    procedure CaveExclusionRegClick(Sender: TObject);
    procedure DeleteExclusionRegClick(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
    procedure ListViewExclusionEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
    procedure ListViewFilterEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
    procedure ListViewQuicSearchEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
    procedure ListViewDiskCleanerEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
    procedure ListView5Editing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
    procedure AddExclusionRegClick(Sender: TObject);
    procedure SaveExclusionClick(Sender: TObject);
    procedure SaveFilterClick(Sender: TObject);
    procedure ChangeExclusionRegClick(Sender: TObject);
    procedure LoadSearchFilters;
    procedure SaveSearchFilter;
    function GetDirFullSize(const folder: string): Int64;
    procedure Find_Log(Path, Ext: string; HideExt: boolean);
    procedure QuickSearch;
    procedure DeleteAll;
    procedure DeleteFileSelected;
    procedure AddExceptionsDiskCleanerMenuClick(Sender: TObject);
    procedure DelRegKeyDiskCleanerMenuClick(Sender: TObject);
    procedure DeleteFileQuicSearchClick(Sender: TObject);
    procedure DeleteFolderQuicSearchClick(Sender: TObject);
    procedure TreeViewOptionClick(Sender: TObject);
    procedure ClearListQuicSearchClick(Sender: TObject);
    procedure ListViewQuicSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCleanFastClick(Sender: TObject);
    procedure ButtonCleanDiskClick(Sender: TObject);
    procedure ButtonCleanOptionClick(Sender: TObject);
    procedure SpeedButton_GeneralMenuClick(Sender: TObject);
    procedure globLoad;
    procedure CleanTranslationsLikeGlobload;
    function ForceDeleteFileAPI(const FileName: string): Boolean;
    function GetDriveVolume(drive: string): string;
    procedure TabSheet6Show(Sender: TObject);
    function IsWindows10Or11: Boolean;
    function PortablePath: string;
    function PortablePathFilters: string;
    function PortablePathregclean: string;
  private
    RegKeyCount: Integer;
    procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
    procedure WMSettingChange(var Message: TWMSettingChange); message WM_SETTINGCHANGE;

  public
  end;

function SHQueryRecycleBin(pszRootPath: pchar; var SHQueryRBInfo: TSHQueryRBInfo): HRESULT; stdcall; external 'Shell32.dll' name 'SHQueryRecycleBinA';

var
  Form1: TForm1;
  sort: Integer = 1;
  Msg: Integer;
  fullall: extended;
  full: Int64;
  Stop: boolean;
  reg: Tregistry;
  FScanAborted: boolean;
  F: Integer;
  Path: string;
  Portable: boolean;

implementation

uses
  Unit_Exclusion, Unit_Registry, Unit_Filter;

{$R *.dfm}

function TForm1.IsWindows10Or11: Boolean;
begin
  Result := (TOSVersion.Major = 10) and (TOSVersion.Build >= 10240);
end;

procedure TForm1.WMSettingChange(var Message: TWMSettingChange);
var
  Ini: TMemIniFile;
  ThemeAuto: boolean;
begin
  Ini := TMemIniFile.Create(Form1.PortablePath);

  ThemeAuto := Ini.ReadBool('Option', 'ThemeAuto', false);
  if ThemeAuto = true then
  begin
    if DarkModeIsEnabled = true then
    begin
      SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
      Application.ProcessMessages;
    end;

    if DarkModeIsEnabled = false then
    begin
      SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      Application.ProcessMessages;
    end;
  end;
  Ini.Free;
end;

procedure TListView.WMVScroll(var Message: TWMVScroll);
begin
  TWinControl(self).DefaultHandler(Message);
end;

function FullRemoveDir(const Dir: string): Boolean;

  function DeleteDirectory(const Directory: string): Boolean;
  var
    SearchRec: TSearchRec;
    FindResult: Integer;
    FilePath: string;
  begin
    Result := True;

    // Обрабатываем все элементы в папке
    FindResult := FindFirst(IncludeTrailingPathDelimiter(Directory) + '*', faAnyFile, SearchRec);
    if FindResult = 0 then
    begin
      try
        repeat
          if (SearchRec.Name = '.') or (SearchRec.Name = '..') then
            Continue;

          FilePath := IncludeTrailingPathDelimiter(Directory) + SearchRec.Name;

          // Сбрасываем атрибуты с помощью SetFileAttributes
          SetFileAttributes(PChar(FilePath), FILE_ATTRIBUTE_NORMAL);

          if (SearchRec.Attr and faDirectory) = faDirectory then
          begin
            // Рекурсивно удаляем подпапку
            if not DeleteDirectory(FilePath) then
              Result := False;
          end
          else
          begin
            // Удаляем файл
            if not DeleteFile(PChar(FilePath)) then
              Result := False;
          end;
        until FindNext(SearchRec) <> 0;
      finally
        FindClose(SearchRec);
      end;
    end;

    // Удаляем саму папку
   { If Not RemoveDir(Directory) Then
      Result := False; }
  end;

begin
  Result := DeleteDirectory(Dir);
end;

function OpenRegEditAndJumpToKey(const KeyName: string): boolean;
begin
  try
    with Tregistry.Create(KEY_ALL_ACCESS or KEY_WOW64_64KEY or KEY_WOW64_32KEY) do
    try
      if Form1.ListViewQuicSearch.Selected.Caption = 'HKEY_CURRENT_USER' then
      begin
        RootKey := HKEY_CURRENT_USER;
        reg.Access := KEY_WOW64_32KEY or KEY_ALL_ACCESS;
        reg.Access := KEY_WOW64_64KEY or KEY_ALL_ACCESS;
      end;
      if Form1.ListViewQuicSearch.Selected.Caption = 'HKEY_LOCAL_MACHINE' then
      begin
        RootKey := HKEY_LOCAL_MACHINE;
        reg.Access := KEY_WOW64_32KEY or KEY_ALL_ACCESS;
        reg.Access := KEY_WOW64_64KEY or KEY_ALL_ACCESS;
      end;
      Result := OpenKey('Software\Microsoft\Windows\CurrentVersion\Applets\Regedit', FALSE);
      if Result then
      try
        try
          WriteString('LastKey', KeyName);
        except
          Result := FALSE;
          Exit;
        end;
      finally
        CloseKey;
      end;
    finally
      Free;
    end;
    Result := ShellExecute(0, 'open', 'regedit.exe', nil, nil, SW_SHOWNORMAL) > HINSTANCE_ERROR;
  finally
  end;
end;



// Сортировка Listview

function SortCaptionAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; stdcall;
begin
  Result := 0;
  if AnsiUpperCase(Item1.Caption) > AnsiUpperCase(Item2.Caption) then
    Result := ParamSort
  else if AnsiUpperCase(Item1.Caption) < AnsiUpperCase(Item2.Caption) then
    Result := -ParamSort;
end;

function SortFirstSubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; stdcall;
begin
  Result := 0;
  if AnsiUpperCase(Item1.SubItems[0]) > AnsiUpperCase(Item2.SubItems[0]) then
    Result := ParamSort
  else if AnsiUpperCase(Item1.SubItems[0]) < AnsiUpperCase(Item2.SubItems[0]) then
    Result := -ParamSort;
end;

// Сортируем по третьей колонке
// SubItem2 - числовое поле

function Sort1SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; stdcall;
begin
  Result := 0;
  if AnsiUpperCase(Item1.SubItems[1]) > AnsiUpperCase(Item2.SubItems[1]) then
    Result := ParamSort
  else if AnsiUpperCase(Item1.SubItems[1]) < AnsiUpperCase(Item2.SubItems[1]) then
    Result := -ParamSort;
end;

function Sort2SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; stdcall;
begin
  Result := 0;
  if AnsiUpperCase(Item1.SubItems[2]) > AnsiUpperCase(Item2.SubItems[2]) then
    Result := ParamSort
  else if AnsiUpperCase(Item1.SubItems[2]) < AnsiUpperCase(Item2.SubItems[2]) then
    Result := -ParamSort;
end;

function Sort3SubItemAsString(Item1, Item2: TListItem; ParamSort: Integer): Integer; stdcall;
begin
  Result := 0;
  if AnsiUpperCase(Item1.SubItems[3]) > AnsiUpperCase(Item2.SubItems[3]) then
    Result := ParamSort
  else if AnsiUpperCase(Item1.SubItems[3]) < AnsiUpperCase(Item2.SubItems[3]) then
    Result := -ParamSort;
end;

// Получение спец папок Windows

function GetSpecialFolderPath(folder: Integer): string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  Path: array[0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @Path[0])) then
    Result := Path
  else
    Result := '';
end;

// Метки диска
function GetDriveVolume(drive: string): string;
var
  _VolumeName, _FileSystemName: array[0..MAX_PATH - 1] of char;
  _VolumeSerialNo, _MaxComponentLength, _FileSystemFlags: LongWord;
begin
  Result := '';
  if GetVolumeInformation(pchar(drive + ':\'), _VolumeName, MAX_PATH, @_VolumeSerialNo, _MaxComponentLength, _FileSystemFlags, _FileSystemName, MAX_PATH) then
    Result := _VolumeName;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveNastr;
  SaveSearchFilter;
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
  if portable = True then
    Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness + ' Portable'
  else
    Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness;

  createicon(ListViewDiskCleaner);
  createicon(ListViewQuicSearch);
  getDrive;
  Application.ProcessMessages;
  TabSheet1.TabVisible := FALSE;
  TabSheet2.TabVisible := FALSE;
  TabSheet6.TabVisible := FALSE;
  Form1.PageControl.ActivePage := TabSheet1;
  application.ProcessMessages;
  try
    Form1.TreeViewOption.SetFocus;
  except
  end;
end;



// Сортировка списка по заголовку
procedure TForm1.ListViewDiskCleanerColumnClick(Sender: TObject; Column: TListColumn);
begin
  sort := -sort;
  if Column = ListViewDiskCleaner.Columns[0] then
    ListViewDiskCleaner.CustomSort(@SortCaptionAsString, sort)
  else if Column = ListViewDiskCleaner.Columns[1] then
    ListViewDiskCleaner.CustomSort(@SortFirstSubItemAsString, sort)
  else if Column = ListViewDiskCleaner.Columns[2] then
    ListViewDiskCleaner.CustomSort(@Sort1SubItemAsString, sort)
  else if Column = ListViewDiskCleaner.Columns[3] then
    ListViewDiskCleaner.CustomSort(@Sort2SubItemAsString, sort)
  else if Column = ListViewDiskCleaner.Columns[4] then
    ListViewDiskCleaner.CustomSort(@Sort3SubItemAsString, sort);
end;

// Добавление маски поиска

procedure TForm1.AddExt(Extension: string; EChecked: boolean; List: TListView);
var
  ListItem: TListItem;
begin
  ListItem := List.Items.Add;
  with ListItem do
  begin
    Caption := Extension;
    Checked := EChecked;
  end;
end;

// Добавление исключения поиска

procedure TForm1.AddExl(Path: string; EChecked: boolean; List: TListView);
var
  ListItem: TListItem;
begin
  ListItem := List.Items.Add;
  with ListItem do
  begin
    Caption := Path;
    Checked := EChecked;
  end;
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
      Internat.Execute(Screen.Forms[i], Application.Title); // Передаем имя секции
      Application.ProcessMessages;
    end;
    Ini.Free;
  end;
end;

 // Загрузка настроек
procedure TForm1.LoadNastr;
var
  Ini: TMemIniFile;
  WindowCenter: boolean;
  ThemeAuto, ThemeLight, ThemeDark: Boolean;
  ch: integer;
begin

  Ini := TMemIniFile.Create(Form1.PortablePath);

  ThemeAuto := Ini.ReadBool('Option', 'ThemeAuto', false);
  if ThemeAuto = true then
  begin
    if DarkModeIsEnabled = true then
    begin
      SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
      Application.ProcessMessages;
    end;

    if DarkModeIsEnabled = false then
    begin
      SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      Application.ProcessMessages;
    end;
  end;

  ThemeLight := Ini.ReadBool('Option', 'ThemeLight', false);
  if ThemeLight = true then
  begin
    SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
    Application.ProcessMessages;
  end;

  ThemeDark := Ini.ReadBool('Option', 'ThemeDark', false);
  if ThemeDark = true then
  begin
    SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
    Application.ProcessMessages;
  end;

  CheckBoxRecycleBin.Checked := Ini.ReadBool(Application.Title, CheckBoxRecycleBin.Name, FALSE);
  CheckBoxProgress.Checked := Ini.ReadBool(Application.Title, CheckBoxProgress.Name, FALSE);

  for ch := 0 to TabControlOption.ControlCount - 1 do
  begin
    if TabControlOption.Controls[ch] is TCheckBox then
    begin
      TCheckBox(TabControlOption.Controls[ch]).Checked := Ini.ReadBool(Application.Title, TCheckBox(TabControlOption.Controls[ch]).Name, false);
    end;
  end;

  WindowCenter := Ini.ReadBool('Position', 'WindowCenter', FALSE);
  if WindowCenter = true then
  begin
    Form1.Position := poDesktopCenter;
  end;
  if WindowCenter = FALSE then
  begin
    Form1.Position := poDesigned;
  end;

  if Ini.readString(Application.Title, 'Window', '') = 'wsMaximized' then
  begin
    Form1.WindowState := wsMaximized;
  end;

  if Ini.readString(Application.Title, 'Window', '') <> 'wsMaximized' then
  begin
    Form1.top := Ini.ReadInteger(Application.Title, 'Top', Form1.top);
    Form1.left := Ini.ReadInteger(Application.Title, 'Left', Form1.left);
    Form1.Height := Ini.ReadInteger(Application.Title, 'Height', Form1.Height);
    Form1.Width := Ini.ReadInteger(Application.Title, 'Width', Form1.Width);
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

function TForm1.PortablePathregclean: string;
begin
  if portable then
    Result := ExtractFilePath(ParamStr(0)) + 'Config\regclean.ini'
  else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(ParamStr(0))) + '\Simple Utilities\Config\regclean.ini';
    //Result := ExtractFilePath(ParamStr(0)) + 'Config\Filters.ini';
  // Создаем папку для конфига
  SysUtils.ForceDirectories(ExtractFilePath(Result));
end;

function TForm1.PortablePathFilters: string;
begin
  if portable then
    Result := ExtractFilePath(ParamStr(0)) + 'Config\Filters.ini'
  else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(ParamStr(0))) + '\Simple Utilities\Config\Filters.ini';
    //Result := ExtractFilePath(ParamStr(0)) + 'Config\Filters.ini';
  // Создаем папку для конфига
  SysUtils.ForceDirectories(ExtractFilePath(Result));
end;

function TForm1.PortablePath: string;
begin
  if portable then
    Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini'
  else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(ParamStr(0))) + '\Simple Utilities\Config\Option.ini';
    //Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini';
  // Создаем папку для конфига
  SysUtils.ForceDirectories(ExtractFilePath(Result));
end;


// Сохранение настроек

procedure TForm1.SaveNastr;
var
  Ini: TMemIniFile;
  i: integer;
begin

  Ini := TMemIniFile.Create(Form1.PortablePath);
  Ini.WriteBool(Application.Title, CheckBoxRecycleBin.Name, CheckBoxRecycleBin.Checked);
  Ini.WriteBool(Application.Title, CheckBoxProgress.Name, CheckBoxProgress.Checked);

  for i := 0 to TabControlOption.ControlCount - 1 do
  begin
    if TabControlOption.Controls[i] is TCheckBox then
    begin
      Ini.WriteBool(Application.Title, TCheckBox(TabControlOption.Controls[i]).Name, TCheckBox(TabControlOption.Controls[i]).Checked);
    end;
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

procedure TForm1.WMMouseMove(var Message: TWMMouseMove);
begin
  SpeedButton_GeneralMenu.AllowAllUp := true;
  SpeedButton_GeneralMenu.Down := FALSE;
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
      ButtonRight.X := SpeedButton_GeneralMenu.Left;
      ButtonRight.Y := SpeedButton_GeneralMenu.Top;
      ButtonRight := ClientToScreen(ButtonRight);
      PopupMenuGeneral.Popup(ButtonRight.X + SpeedButton_GeneralMenu.Width, ButtonRight.Y + SpeedButton_GeneralMenu.Height);
    end;
  end
  else
  begin
    SpeedButton_GeneralMenu.AllowAllUp := true;
    SpeedButton_GeneralMenu.Down := False;
    PopupMenuGeneral.CloseMenu;
    Application.ProcessMessages;
  end;
end;

// сохранение настроек
procedure TForm1.SaveSearchFilter;
var
  Ini: TMemIniFile;
  i: Integer;
begin
  Ini := TMemIniFile.Create(PortablePathFilters);
  try
    with Ini do
    begin
      // Сохраняем фильтры
      WriteInteger('Filters', 'Count', ListViewFilter.Items.Count);
      for i := 0 to ListViewFilter.Items.Count - 1 do
      begin
        WriteString('Filters', 'F' + IntToStr(i), ListViewFilter.Items[i].Caption);
        WriteBool('Filters', 'CH' + IntToStr(i), ListViewFilter.Items[i].Checked);
      end;

      // Сохраняем исключения путей
      WriteInteger('Exclusion', 'Count', ListViewExclusion.Items.Count);
      for i := 0 to ListViewExclusion.Items.Count - 1 do
      begin
        WriteString('Exclusion', 'E' + IntToStr(i), ListViewExclusion.Items[i].Caption);
        WriteBool('Exclusion', 'CH' + IntToStr(i), ListViewExclusion.Items[i].Checked);
      end;

      // Сохраняем исключения реестра
      WriteInteger('ExclusionReg', 'Count', ListViewExclusionReg.Items.Count);
      for i := 0 to ListViewExclusionReg.Items.Count - 1 do
      begin
        WriteString('ExclusionReg', 'Reg' + IntToStr(i), ListViewExclusionReg.Items[i].Caption);
        WriteBool('ExclusionReg', 'CH' + IntToStr(i), ListViewExclusionReg.Items[i].Checked);
      end;

      UpdateFile;
    end;
  finally
    Ini.Free;
  end;
end;

procedure TForm1.LoadSearchFilters;
var
  Ini: TMemIniFile;
  Count, i: Integer;
  ItemText: string;
  ItemChecked: Boolean;
begin
  if not FileExists(PortablePathFilters) then
    Exit;

  Ini := TMemIniFile.Create(PortablePathFilters);
  try
    // Отключаем обновление ListView во время загрузки
    ListViewFilter.Items.BeginUpdate;
    ListViewExclusion.Items.BeginUpdate;
    ListViewExclusionReg.Items.BeginUpdate;

    try
      // Очищаем списки
      ListViewFilter.Clear;
      ListViewExclusion.Clear;
      ListViewExclusionReg.Clear;

      // Загружаем фильтры
      Count := Ini.ReadInteger('Filters', 'Count', 0);
      for i := 0 to Count - 1 do
      begin
        ItemText := Ini.ReadString('Filters', 'F' + IntToStr(i), '');
        ItemChecked := Ini.ReadBool('Filters', 'CH' + IntToStr(i), False);
        AddExt(ItemText, ItemChecked, ListViewFilter);
      end;

      // Загружаем исключения путей
      Count := Ini.ReadInteger('Exclusion', 'Count', 0);
      for i := 0 to Count - 1 do
      begin
        ItemText := Ini.ReadString('Exclusion', 'E' + IntToStr(i), '');
        ItemChecked := Ini.ReadBool('Exclusion', 'CH' + IntToStr(i), False);
        AddExl(ItemText, ItemChecked, ListViewExclusion);
      end;

      // Загружаем исключения реестра
      Count := Ini.ReadInteger('ExclusionReg', 'Count', 0);
      for i := 0 to Count - 1 do
      begin
        ItemText := Ini.ReadString('ExclusionReg', 'Reg' + IntToStr(i), '');
        ItemChecked := Ini.ReadBool('ExclusionReg', 'CH' + IntToStr(i), False);
        AddExl(ItemText, ItemChecked, ListViewExclusionReg);
      end;

    finally
      // Включаем обновление ListView
      ListViewFilter.Items.EndUpdate;
      ListViewExclusion.Items.EndUpdate;
      ListViewExclusionReg.Items.EndUpdate;
    end;

  finally
    Ini.Free;
  end;
end;

procedure TForm1.ButtonSaveOptionClick(Sender: TObject);
begin
  ButtonSaveOption.Enabled := FALSE;
  Form1.SaveNastr;
  Form1.SaveSearchFilter;
end;

function TForm1.InExt(const FileName: string): Boolean;
var
  i: Integer;
  Mask: string;
begin
  Result := False;

  for i := 0 to ListViewFilter.Items.Count - 1 do
  begin
    if not ListViewFilter.Items[i].Checked then
      Continue;

    Mask := ListViewFilter.Items[i].Caption;

    // Быстрая проверка простых случаев
    if (Mask = '*.*') or (Mask = '*') then
    begin
      Result := True;
      Exit;
    end;

    if MatchesMask(FileName, Mask) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function TForm1.ExlPath(const Path: string): Boolean;
var
  i: Integer;
  Exclusion: string;
begin
  Result := False;

  for i := 0 to ListViewExclusion.Items.Count - 1 do
  begin
    if not ListViewExclusion.Items[i].Checked then
      Continue;

    Exclusion := ListViewExclusion.Items[i].Caption;

    // Оптимизация: проверка на пустую строку
    if Exclusion = '' then
      Continue;

    // Используем Pos вместо ContainsText
    if Pos(Exclusion, Path) > 0 then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function ExlPathReg(Path: string): boolean;
var
  i: Integer;
begin
  for i := 0 to Form1.ListViewExclusionReg.Items.Count - 1 do
  begin
    if (Form1.ListViewExclusionReg.Items[i].Checked = true) and (Pos(Form1.ListViewExclusionReg.Items[i].Caption, Path) > 0) then
    begin
      Result := true;
      application.ProcessMessages;
      Exit;
    end;
  end;
  Result := FALSE;
end;

function RoundTime(ADate: string; Rounding: Integer; bRound: boolean): string;
var
  Hour, Min, Sec, MSec: Word;
  tmpDate: TDateTime;
  Res, Diff: string;
  M: Integer;
begin
  tmpDate := StrToDateTime(ADate);
  DecodeTime(tmpDate, Hour, Min, Sec, MSec);
  if (Rounding > 0) and (bRound = true) then
  begin
    if Min mod Rounding = 0 then
      Res := IntToStr(Min)
    else
      Res := IntToStr(Round(Min / Rounding) * Rounding);
    M := StrToInt(Copy(ADate, length(ADate) - 1, 2));
    Diff := IntToStr(StrToInt(Res) - M);
    if Copy(Diff, 1, 1) = '-' then
    begin
      Diff := Copy(Diff, 2, length(Diff) - 1);
      Result := FormatDateTime('dd mmmm yy г. hh:mm:ss', (tmpDate - StrToTime('00:00:00' + Diff)));
    end
    else
      Result := FormatDateTime('dd mmmm yy г. hh:mm:ss', (tmpDate + StrToTime('00:00:00' + Diff)));
  end
  else
    Result := ADate;
end;

// Удаление в корзину

function DeleteFileWithUndo(sFileName: string): boolean;
var
  fos: TSHFileOpStruct;
begin
  sFileName := sFileName + #0;
  FillChar(fos, sizeof(fos), 0);
  with fos do
  begin
    wFunc := FO_DELETE;
    pFrom := pchar(sFileName);
    fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION or FOF_SILENT;
  end;
  Result := (0 = ShFileOperation(fos));
end;

procedure TForm1.ChangeExclusionRegClick(Sender: TObject);
begin
  Form4.ButtonAddReg.Visible := FALSE;
  Form4.ButtonChangeReg.Visible := true;
  if Form1.ListViewExclusionReg.Selected <> nil then
  begin
    Form4.ButtonChangeReg.Enabled := true;
    Form4.EditRegKey.Text := Form1.ListViewExclusionReg.Selected.Caption;
    Form4.ShowModal;
  end;
end;

procedure TForm1.SaveExclusionClick(Sender: TObject);
begin
  SaveSearchFilter;
end;

procedure TForm1.SaveFilterClick(Sender: TObject);
begin
  SaveSearchFilter;
end;

procedure TForm1.DelRegKeyDiskCleanerMenuClick(Sender: TObject);
begin
  if Form1.ListViewQuicSearch.ItemIndex = -1 then
    Exit;
  reg := Tregistry.Create;
  reg.Access := KEY_WOW64_32KEY or KEY_ALL_ACCESS;
  reg.Access := KEY_WOW64_64KEY or KEY_ALL_ACCESS;
  if Form1.ListViewQuicSearch.Selected.Caption = 'HKEY_LOCAL_MACHINE' then
    reg.RootKey := HKEY_LOCAL_MACHINE;
  if Form1.ListViewQuicSearch.Selected.Caption = 'HKEY_CLASSES_ROOT' then
    reg.RootKey := HKEY_CLASSES_ROOT;
  if Form1.ListViewQuicSearch.Selected.Caption = 'HKEY_CURRENT_USER' then
    reg.RootKey := HKEY_CURRENT_USER;
  reg.DeleteKey(Form1.ListViewQuicSearch.Selected.SubItems.Strings[0]);
  Form1.ListViewQuicSearch.Selected.Delete;
  reg.Free;
end;

procedure TForm1.AddFilterClick(Sender: TObject);
begin
  Form3.EditFilter.Text := '';
  Form3.ButtonAddFilter.Enabled := FALSE;
  Form3.ButtonAddFilter.Visible := true;
  Form3.ButtonChangeFilter.Visible := FALSE;
  Form3.ShowModal;
end;

procedure TForm1.DeleteFolderQuicSearchClick(Sender: TObject);
begin
  if ListViewQuicSearch.ItemIndex = -1 then
    Exit;
  if Form1.ListViewQuicSearch.Items[0].SubItems[3] = 'Dir' then
  begin
    FullRemoveDir(Form1.ListViewQuicSearch.Selected.Caption);
    Form1.ListViewQuicSearch.Selected.Delete;
  end;
end;

procedure TForm1.DeleteFileQuicSearchClick(Sender: TObject);
begin
  if ListViewQuicSearch.ItemIndex = -1 then
    Exit;
  ForceDeleteFileAPI(Form1.ListViewQuicSearch.Selected.Caption);
  Form1.ListViewQuicSearch.Selected.Delete;
end;

procedure TForm1.DeleteFilterClick(Sender: TObject);
begin
  if ListViewFilter.ItemIndex = -1 then
    Exit;
  Msg := messagebox(application.MainForm.Handle, pchar(LangDelFilter.Caption + ' [' + ListViewFilter.Selected.Caption + '] ?'), pchar(LangAttention.Caption), mb_iconquestion or mb_yesno);
  if Msg = idyes then
    if Form1.ListViewFilter.Selected <> nil then
      Form1.ListViewFilter.DeleteSelected;
  Form1.StatusBar4.Panels[0].Text := IntToStr(Form1.ListViewFilter.Items.Count);
end;

procedure TForm1.ButtonSearchClick(Sender: TObject);
begin
  try
    case ButtonSearch.Tag of
      0:
        begin
          TabControl2.Enabled := false;
          ButtonSearch.Tag := 1;
          ButtonSearch.Caption := LangCancel.Caption;
          Stop := FALSE;
          ProgressBarCleanDisk.Position := 0;
          Form1.Taskbar1.ProgressValue := ProgressBarCleanDisk.Position;
          PopupMenuSearch.AutoPopup := FALSE;
          CheckBoxProgress.Enabled := FALSE;
          CheckBoxRecycleBin.Enabled := FALSE;
          ComboBoxDrive.Enabled := FALSE;
          TabControl6.Enabled := FALSE;
          TabSheet6.Enabled := FALSE;
          TabSheet2.Enabled := FALSE;
          ButtonDelete.Enabled := FALSE;
          SpeedButton_GeneralMenu.Enabled := FALSE;
          FindFiles;
          TabControl2.Enabled := true;
          ButtonSearch.Tag := 0;
          ButtonSearch.Caption := LangSearch.Caption;
          ButtonDelete.Enabled := true;
          PopupMenuSearch.AutoPopup := true;
          CheckBoxProgress.Enabled := true;
          CheckBoxRecycleBin.Enabled := true;
          ComboBoxDrive.Enabled := true;
          TabControl6.Enabled := true;
          TabSheet6.Enabled := true;
          TabSheet2.Enabled := true;
          ButtonDelete.Default := true;
          SpeedButton_GeneralMenu.Enabled := true;
          Form1.ListViewDiskCleaner.Items[0].MakeVisible(true);
          Form1.ListViewDiskCleaner.Items[0].Selected := true;
          Form1.ListViewDiskCleaner.Items[0].Focused := true;
        end;
      1:
        begin
          Stop := true;
          TabControl2.Enabled := true;
          ButtonSearch.Tag := 0;
          ButtonSearch.Caption := LangSearch.Caption;
          ButtonDelete.Enabled := true;
          PopupMenuSearch.AutoPopup := true;
          CheckBoxProgress.Enabled := true;
          CheckBoxRecycleBin.Enabled := true;
          ComboBoxDrive.Enabled := true;
          TabControl6.Enabled := true;
          TabSheet6.Enabled := true;
          TabSheet2.Enabled := true;
          ButtonDelete.Default := true;
          SpeedButton_GeneralMenu.Enabled := true;
          Form1.ListViewDiskCleaner.Items[0].MakeVisible(true);
          Form1.ListViewDiskCleaner.Items[0].Selected := true;
          Form1.ListViewDiskCleaner.Items[0].Focused := true;
        end;
    end;
  except
  end;
end;

procedure TForm1.ButtonCleanFastClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 1;
  ButtonCleanDisk.Font.Style := [];
  ButtonCleanFast.Font.Style := [fsBold];
  ButtonCleanOption.Font.Style := [];
end;

procedure TForm1.ButtonCleanOptionClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 2;
  ButtonCleanDisk.Font.Style := [];
  ButtonCleanFast.Font.Style := [];
  ButtonCleanOption.Font.Style := [fsBold];
end;

// Удаление в корзину (вариант 2)

procedure TForm1.CheckAll3(Checked: boolean);
var
  i, c: Integer;
begin
  c := Form1.ListViewFilter.Items.Count - 1;
  for i := 0 to c do
  begin
    Form1.ListViewFilter.Items[i].Checked := Checked;
  end;
end;

procedure TForm1.CheckAll4(Checked: boolean);
var
  i, c: Integer;
begin
  c := Form1.ListViewExclusion.Items.Count - 1;
  for i := 0 to c do
  begin
    Form1.ListViewExclusion.Items[i].Checked := Checked;
  end;
end;

procedure TForm1.CheckAll2(Checked: boolean);
var
  i, c: Integer;
begin
  c := Form1.ListViewQuicSearch.Items.Count - 1;
  for i := 0 to c do
  begin
    Form1.ListViewQuicSearch.Items[i].Checked := Checked;
  end;
end;

procedure TForm1.CheckAll1(Checked: boolean);
var
  i, c: Integer;
begin
  c := Form1.ListViewDiskCleaner.Items.Count - 1;
  for i := 0 to c do
  begin
    Form1.ListViewDiskCleaner.Items[i].Checked := Checked;
  end;
end;

procedure TForm1.CheckAll6(Checked: boolean);
begin
  CheckBoxTempWindows.Checked := Checked;
  CheckBoxTempAPP.Checked := Checked;
  CheckBoxTrash.Checked := Checked;
  CheckBoxClipboard.Checked := Checked;
  CheckBoxWindowsLogs.Checked := Checked;
  CheckBoxFontCache.Checked := Checked;
  CheckBoxRegistry.Checked := Checked;
end;

procedure TForm1.CheckAll7(Checked: boolean);
var
  i, c: Integer;
begin
  c := Form1.ListViewExclusionReg.Items.Count - 1;
  for i := 0 to c do
  begin
    Form1.ListViewExclusionReg.Items[i].Checked := Checked;
  end;
end;

procedure TForm1.SelectAllFilterClick(Sender: TObject);
begin
  CheckAll3(true);
end;

procedure TForm1.ExcludeAllFilterClick(Sender: TObject);
begin
  CheckAll3(FALSE);
end;

procedure TForm1.AddExclusionClick(Sender: TObject);
begin
  Form2.EditExceptions.Text := '';
  Form2.ButtonAddExceptions.Enabled := FALSE;
  Form2.ButtonAddExceptions.Visible := true;
  Form2.ButtonChangeExceptions.Visible := FALSE;
  Form2.ShowModal;
end;


// Отслеживание подключения диска

procedure TForm1.WMDeviceChange(var Msg: Tmessage);
const
  DBT_DEVICEARRIVAL = $8000; // system detected a new device
  DBT_DEVICEREMOVECOMPLETE = $8004; // device is gone
var
  myMsg: string;
begin
  inherited;
  case Msg.wParam of
    DBT_DEVICEARRIVAL:
      myMsg := 'OK';
    DBT_DEVICEREMOVECOMPLETE:
      myMsg := 'NO';
  end;
  if myMsg = 'OK' then
  begin
    getDrive;
  end;
  if myMsg = 'NO' then
  begin
    getDrive;
  end;
end;

function CountAllFoldersFast(const Path: string): Integer;
var
  SearchRec: TSearchRec;
  CurrentPath: string;
  FindResult: Integer;
begin

  Result := 0;
  if Stop = true then
    FindClose(SearchRec);
  CurrentPath := IncludeTrailingPathDelimiter(Path);

  FindResult := FindFirst(CurrentPath + '*', faDirectory, SearchRec);
  if FindResult = 0 then
  begin
    try
      repeat
        if (SearchRec.Attr and faDirectory) <> 0 then
        begin
          if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          begin
            Inc(Result);
            try
              Result := Result + CountAllFoldersFast(CurrentPath + SearchRec.Name);
              Form1.StatusBar1.Panels[0].Text := CurrentPath + SearchRec.Name;
              Application.ProcessMessages;
            except
              // Игнорируем ошибки доступа к папкам
            end;
          end;
        end;
      until FindNext(SearchRec) <> 0;
    finally
      FindClose(SearchRec);
    end;
  end;
end;

function CountAllFoldersIterative(const RootPath: string): Integer;
var
  Stack: TStringList;
  CurrentPath: string;
  SearchRec: TSearchRec;
begin
  Result := 0;
  if Stop = true then
    FindClose(SearchRec);
  Stack := TStringList.Create;
  try
    Stack.Add(RootPath);

    while Stack.Count > 0 do
    begin
      CurrentPath := Stack[Stack.Count - 1];
      Stack.Delete(Stack.Count - 1);

      if FindFirst(IncludeTrailingPathDelimiter(CurrentPath) + '*', faDirectory, SearchRec) = 0 then
      begin
        try
          repeat
            if (SearchRec.Attr and faDirectory) <> 0 then
            begin
              if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
              begin
                Inc(Result);
                Stack.Add(IncludeTrailingPathDelimiter(CurrentPath) + SearchRec.Name);
                Form1.StatusBar1.Panels[0].Text := CurrentPath + SearchRec.Name;
                Application.ProcessMessages;
              end;
            end;
          until FindNext(SearchRec) <> 0;
        finally
          FindClose(SearchRec);
        end;
      end;
    end;
  finally
    Stack.Free;
  end;
end;

function CountAllFoldersOptimized(const RootPath: string): Integer;
var
  Stack: TStack<string>;
  CurrentPath: string;
  SearchRec: TSearchRec;
  SearchResult: Integer;
begin
  Result := 0;
  if Stop then
    Exit(0);

  Stack := TStack<string>.Create;
  try
    Stack.Push(RootPath);

    while (Stack.Count > 0) and (not Stop) do
    begin
      CurrentPath := Stack.Pop;

      SearchResult := FindFirst(IncludeTrailingPathDelimiter(CurrentPath) + '*', faDirectory, SearchRec);
      if SearchResult = 0 then
      begin
        try
          repeat
            if Stop then
              Break;

            if (SearchRec.Attr and faDirectory) <> 0 then
            begin
              if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
              begin
                Inc(Result);
                Stack.Push(IncludeTrailingPathDelimiter(CurrentPath) + SearchRec.Name);
                Form1.StatusBar1.Panels[0].Text := IncludeTrailingPathDelimiter(CurrentPath) + SearchRec.Name;
                Application.ProcessMessages;
              end;
            end;
          until (FindNext(SearchRec) <> 0) or Stop;
        finally
          FindClose(SearchRec);
        end;
      end;
    end;
  finally
    Stack.Free;
  end;
end;

function GetFileTime(const FileName: string): Integer;
var
  FileHandle: Integer;
begin
  FileHandle := FileOpen(FileName, fmOpenRead or fmShareDenyNone);
  if FileHandle > 0 then
  try
    Result := FileGetDate(FileHandle);
  finally
    FileClose(FileHandle);
  end
  else
    Result := 0;
end;


// Поиск файлов и папок
procedure TForm1.Find(Dir: string);
var
  DirInfo: TSearchRec;
  FindRes: Integer;
  ListItem: TListItem;
  ShInfo: TSHFileInfo;
  i: Integer;
  CurrentDir: string;
  IsDirectory: Boolean;
begin
  if Stop then
    Exit;

  CurrentDir := IncludeTrailingPathDelimiter(Dir);
  FindRes := FindFirst(CurrentDir + '*.*', faAnyFile, DirInfo);

  try
    while (FindRes = 0) and not Stop do
    begin
      Application.ProcessMessages;
      if Stop then
        Break;

      // Пропускаем служебные директории . и ..
      if (DirInfo.Name = '.') or (DirInfo.Name = '..') then
      begin
        FindRes := FindNext(DirInfo);
        Continue;
      end;

      IsDirectory := (DirInfo.Attr and faDirectory) = faDirectory;

      if IsDirectory then
      begin
        // Рекурсивный вызов для поддиректории
        Find(CurrentDir + DirInfo.Name);

        if not Stop then
        begin
          StatusBar1.Panels[0].Text := CurrentDir + DirInfo.Name;

          if CheckBoxProgress.Checked then
          begin
            ProgressBarCleanDisk.Position := ProgressBarCleanDisk.Position + 1;
            Taskbar1.ProgressValue := ProgressBarCleanDisk.Position;
          end;
        end;
      end
      else if InExt(DirInfo.Name) and not ExlPath(DirInfo.Name) then
      begin
        // Обработка файла
        ListItem := ListViewDiskCleaner.Items.Add;
        with ListItem do
        begin
          SHGetFileInfo(PChar(CurrentDir + DirInfo.Name), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
          Caption := CurrentDir + DirInfo.Name;
          SubItems.Add(GetNormalSize(DirInfo.Size));
          SubItems.Add(ShInfo.szTypeName);
          // Исправление устаревшего символа - используем TimeStamp
          SubItems.Add(DateTimeToStr(DirInfo.TimeStamp));
          Checked := True;
          ImageIndex := ShInfo.iIcon;
        end;

        fullall := fullall + DirInfo.Size;

        // Автоподбор ширины колонок (с обработкой исключений)
        try
          for i := 0 to ListViewDiskCleaner.Columns.Count - 1 do
          begin
            ListView_SetColumnWidth(ListViewDiskCleaner.Handle, i, LVSCW_AUTOSIZE_USEHEADER);
          end;
        except
          // Игнорируем ошибки при изменении ширины колонок
        end;
      end;

      FindRes := FindNext(DirInfo);
    end;
  finally
    FindClose(DirInfo);
  end;
end;

// -------------------------------------------------------
// Поиск файлов

procedure TForm1.FindFiles;
begin
  fullall := 0;
  Stop := FALSE;
  Form1.ListViewDiskCleaner.Clear;
  Form1.StatusBar1.Panels[0].Text := '';

  if Form1.CheckBoxProgress.Checked = true then
  begin
    Form1.ProgressBarCleanDisk.Max := CountAllFoldersOptimized(ExtractFileDrive(Form1.ComboBoxDrive.Text));
    Form1.Taskbar1.ProgressMaxValue := Form1.ProgressBarCleanDisk.Max;
    Form1.ProgressBarCleanDisk.Position := 0;
    Form1.Taskbar1.ProgressValue := Form1.ProgressBarCleanDisk.Position;
  end;

  Find(ExtractFileDrive(Form1.ComboBoxDrive.Text) + '\');
  Form1.ProgressBarCleanDisk.Position := Form1.ProgressBarCleanDisk.Max;
  Form1.Taskbar1.ProgressValue := Form1.ProgressBarCleanDisk.Position;
  Form1.StatusBar1.Panels[0].Text := GetNormalSize(Round(fullall));
end;

procedure TForm1.DeleteFileSelected;
begin
  if Form1.ListViewDiskCleaner.ItemIndex = -1 then
    Exit;
  if (Form1.ListViewDiskCleaner.Selected <> nil) and (Form1.ListViewDiskCleaner.Selected.Caption <> '') then
  begin
    ForceDeleteFileAPI(Form1.ListViewDiskCleaner.Selected.Caption);
    Form1.ListViewDiskCleaner.Selected.Delete;
  end;
end;

procedure TForm1.DeleteSelectFileSearchClick(Sender: TObject);
begin
  DeleteFileSelected;
end;

procedure TForm1.DeleteExclusionClick(Sender: TObject);
begin
  if ListViewExclusion.ItemIndex = -1 then
    Exit;
  Msg := messagebox(application.MainForm.Handle, pchar(LangDelExclusion.Caption + ' [' + ListViewExclusion.Selected.Caption + ']?'), pchar(LangAttention.Caption), mb_iconquestion or mb_yesno);
  if Msg = idyes then
    if Form1.ListViewExclusion.Selected <> nil then
      Form1.ListViewExclusion.DeleteSelected;
  Form1.StatusBar4.Panels[0].Text := IntToStr(Form1.ListViewExclusion.Items.Count);
end;

procedure TForm1.SelectAllExclusionClick(Sender: TObject);
begin
  CheckAll4(true);
end;

procedure TForm1.ExcludeAllExclusionClick(Sender: TObject);
begin
  CheckAll4(FALSE);
end;

procedure TForm1.SelectAllSearchClick(Sender: TObject);
begin
  CheckAll1(true);
end;

procedure TForm1.ExcludeAllSearchClick(Sender: TObject);
begin
  CheckAll1(FALSE);
end;

procedure TForm1.AddExceptionsSearchClick(Sender: TObject);
begin
  if ListViewDiskCleaner.Selected <> nil then
  begin
    Form2.ButtonChangeExceptions.Enabled := true;
    Form2.EditExceptions.Text := ExtractFileName(ListViewDiskCleaner.Selected.Caption);
    Form2.ButtonAddExceptions.Visible := true;
    Form2.ButtonChangeExceptions.Visible := FALSE;
    Form2.ShowModal;
  end;
end;

procedure TForm1.RemRecycle;
var
  TotalItems: Integer;
  CurrentIndex: Integer;
begin
  try
    TotalItems := Form1.ListViewDiskCleaner.Items.Count;
    if TotalItems = 0 then
      Exit;

    Form1.ProgressBarCleanDisk.Max := TotalItems;
    Form1.ProgressBarCleanDisk.Position := 0;
    Form1.Taskbar1.ProgressMaxValue := TotalItems;
    Form1.Taskbar1.ProgressValue := 0;

    CurrentIndex := 0;
    while CurrentIndex < Form1.ListViewDiskCleaner.Items.Count do
    begin
      Form1.ListViewDiskCleaner.Items[CurrentIndex].MakeVisible(true);
      if Form1.ListViewDiskCleaner.Items[CurrentIndex].Checked then
      begin
        try
          SetFileAttributes(PChar(Form1.ListViewDiskCleaner.Items[CurrentIndex].Caption), FILE_ATTRIBUTE_NORMAL);
          DeleteFileWithUndo(Form1.ListViewDiskCleaner.Items[CurrentIndex].Caption);
        except
        end;
      end;
      Form1.ListViewDiskCleaner.Items[CurrentIndex].Delete;
      Form1.ProgressBarCleanDisk.Position := Form1.ProgressBarCleanDisk.Position + 1;
      Form1.Taskbar1.ProgressValue := Form1.ProgressBarCleanDisk.Position;
      Application.ProcessMessages;
    end;
    Form1.StatusBar1.Panels[0].Text := LangReady.Caption;
    Form1.StatusBar1.Panels[1].Text := '';
  except
  end;
end;

procedure TForm1.DeleteAll;
begin
  try
    Form1.ProgressBarCleanDisk.Max := Form1.ListViewDiskCleaner.Items.Count;
    if Assigned(Form1.Taskbar1) then
      Form1.Taskbar1.ProgressMaxValue := Form1.ListViewDiskCleaner.Items.Count;

    while Form1.ListViewDiskCleaner.Items.Count > 0 do
    begin
      Form1.ListViewDiskCleaner.Items.Item[0].MakeVisible(true);
      if Form1.ListViewDiskCleaner.Items[0].Checked then
      begin
        try
          ForceDeleteFileAPI(Form1.ListViewDiskCleaner.Items[0].Caption);
        except
        end;
      end;
      Form1.ListViewDiskCleaner.Items[0].Delete;
      Form1.ProgressBarCleanDisk.Position := Form1.ProgressBarCleanDisk.Position + 1;
      if Assigned(Form1.Taskbar1) then
        Form1.Taskbar1.ProgressValue := Form1.ProgressBarCleanDisk.Position;
      Application.ProcessMessages;
    end;
    Form1.ProgressBarCleanDisk.Position := 0;
    if Assigned(Form1.Taskbar1) then
      Form1.Taskbar1.ProgressValue := 0;
    Form1.StatusBar1.Panels[0].Text := LangReady.Caption;
    Form1.StatusBar1.Panels[1].Text := '';
  except
  end;
end;

procedure TForm1.ButtonDeleteClick(Sender: TObject);
begin
  if Form1.ListViewDiskCleaner.Items.Count = 0 then
    Exit;
  ButtonSearch.Enabled := FALSE;
  ButtonDelete.Enabled := FALSE;

  if CheckBoxRecycleBin.Checked = true then
  begin
    ProgressBarCleanDisk.Max := Form1.ListViewDiskCleaner.Items.Count;
    Form1.Taskbar1.ProgressMaxValue := ProgressBarCleanDisk.Max;
    Form1.ProgressBarCleanDisk.Position := 0;
    Form1.Taskbar1.ProgressValue := ProgressBarCleanDisk.Position;

    PopupMenuSearch.AutoPopup := FALSE;
    CheckBoxProgress.Enabled := FALSE;
    CheckBoxRecycleBin.Enabled := FALSE;
    TabControl6.Enabled := FALSE;
    TabSheet6.Enabled := FALSE;
    TabSheet2.Enabled := FALSE;
    SpeedButton_GeneralMenu.Enabled := FALSE;
    RemRecycle;
    TabControl6.Enabled := true;
    TabSheet6.Enabled := true;
    TabSheet2.Enabled := true;
    PopupMenuSearch.AutoPopup := true;
    CheckBoxProgress.Enabled := true;
    CheckBoxRecycleBin.Enabled := true;
    SpeedButton_GeneralMenu.Enabled := true;
    ProgressBarCleanDisk.Position := ProgressBarCleanDisk.Max;
    Form1.Taskbar1.ProgressValue := ProgressBarCleanDisk.Position;
  end;
  if CheckBoxRecycleBin.Checked = FALSE then
  begin
    ProgressBarCleanDisk.Max := Form1.ListViewDiskCleaner.Items.Count;
    Form1.Taskbar1.ProgressMaxValue := ProgressBarCleanDisk.Max;
    Form1.ProgressBarCleanDisk.Position := 0;
    Form1.Taskbar1.ProgressValue := ProgressBarCleanDisk.Position;
    PopupMenuSearch.AutoPopup := FALSE;
    CheckBoxProgress.Enabled := FALSE;
    CheckBoxRecycleBin.Enabled := FALSE;
    TabControl6.Enabled := FALSE;
    TabSheet6.Enabled := FALSE;
    TabSheet2.Enabled := FALSE;
    DeleteAll;
    TabControl6.Enabled := true;
    TabSheet6.Enabled := true;
    TabSheet2.Enabled := true;
    PopupMenuSearch.AutoPopup := true;
    CheckBoxProgress.Enabled := true;
    CheckBoxRecycleBin.Enabled := true;
    SpeedButton_GeneralMenu.Enabled := true;
    ProgressBarCleanDisk.Position := ProgressBarCleanDisk.Max;
    Form1.Taskbar1.ProgressValue := ProgressBarCleanDisk.Position;
  end;

  Form1.ButtonSearch.Enabled := true;
  ButtonDelete.Enabled := true;
  if ButtonSearch.Enabled = FALSE then
    Exit;
  if ButtonSearch.Enabled = true then
    ButtonSearch.SetFocus;
end;

procedure TForm1.CheckBoxRecycleBinClick(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.ListViewFilterChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.ListViewExclusionChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.PropertiesSearchClick(Sender: TObject);
begin
  if Form1.ListViewDiskCleaner.ItemIndex = -1 then
    Exit;
  ShowPropertiesDialog(Form1.ListViewDiskCleaner.Selected.Caption);
  application.ProcessMessages;
end;

procedure TForm1.OpenFolderSearchClick(Sender: TObject);
begin
  if ListViewDiskCleaner.ItemIndex = -1 then
    Exit;
  OpenExplorerAndSelectFile(ListViewDiskCleaner.Selected.Caption);
end;

procedure TForm1.ClearListSearchClick(Sender: TObject);
begin
  ListViewDiskCleaner.Clear;
  application.ProcessMessages;
end;

procedure TForm1.ButtonDefaultDiskCleanerClick(Sender: TObject);
begin
  MemoFilters.Lines.SaveToFile(Form1.PortablePathFilters);
  LoadSearchFilters;
end;

procedure TForm1.ButtonCleanDiskClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
  ButtonCleanDisk.Font.Style := [fsBold];
  ButtonCleanFast.Font.Style := [];
  ButtonCleanOption.Font.Style := [];
end;

// Количество файлов в папке

function GetFileCount(const ADirectory: string): Integer;
var
  Rec: TSearchRec;
  sts: Integer;
begin
  Result := 0;
  sts := FindFirst(ADirectory + '\*.*', faAnyFile, Rec);
  application.ProcessMessages;
  if sts = 0 then
  begin
    repeat
      if ((Rec.Attr and faDirectory) <> faDirectory) then
        inc(Result)
      else if (Rec.Name <> '.') and (Rec.Name <> '..') then
        Result := Result + GetFileCount(ADirectory + '\' + Rec.Name);
      application.ProcessMessages;
    until FindNext(Rec) <> 0;
    SysUtils.FindClose(Rec);
  end;
end;

// Очистка корзины

procedure EmptyRecycleBin;
const
  SHERB_NOCONFIRMATION = $00000001;
  SHERB_NOPROGRESSUI = $00000002;
  SHERB_NOSOUND = $00000004;
type
  TSHEmptyRecycleBin = function(Wnd: hwnd; pszRootPath: pchar; dwFlags: DWORD): HRESULT; stdcall;
var
  SHEmptyRecycleBin: TSHEmptyRecycleBin;
  LibHandle: THandle;
begin { EmptyRecycleBin }
  LibHandle := LoadLibrary(pchar('Shell32.dll'));
  if LibHandle <> 0 then
    @SHEmptyRecycleBin := GetProcAddress(LibHandle, 'SHEmptyRecycleBinA')
  else
  begin
    MessageDlg('Error Shell32.dll.', mtError, [mbOK], 0);
    Exit;
  end;
  if @SHEmptyRecycleBin <> nil then
    SHEmptyRecycleBin(application.Handle, nil, SHERB_NOCONFIRMATION or SHERB_NOPROGRESSUI or SHERB_NOSOUND);
  FreeLibrary(LibHandle);
  @SHEmptyRecycleBin := nil;
end;

// Получение размера папки


// В классе формы TForm1
function Tform1.GetDirFullSize(const folder: string): Int64;
var
  Stack: TStack<string>;
  CurrentFolder: string;
  SearchRec: TSearchRec;
  FindResult: Integer;
begin
  Result := 0;
  Stack := TStack<string>.Create;
  try
    Stack.Push(IncludeTrailingPathDelimiter(folder));

    while (Stack.Count > 0) and not Stop do
    begin
      CurrentFolder := Stack.Pop;

      // Проверка флага остановки
      if stop then
        Break;

      FindResult := FindFirst(CurrentFolder + '*', faAnyFile, SearchRec);
      if FindResult = 0 then
      begin
        try
          repeat

            if stop then
              Break;

            if (SearchRec.Name = '.') or (SearchRec.Name = '..') then
              Continue;

            if (SearchRec.Attr and faDirectory) <> 0 then
            begin
              Stack.Push(IncludeTrailingPathDelimiter(CurrentFolder) + SearchRec.Name);
            end
            else
            begin
              Inc(Result, SearchRec.Size);
            end;

          until (FindNext(SearchRec) <> 0) or stop;
        finally
          FindClose(SearchRec);
        end;
      end;
      if stop then
        Break;
      Application.ProcessMessages;
    end;
  finally
    Stack.Free;
  end;
end;

function IsEmtyDir(Path: TFileName): boolean;
var
  SR: TSearchRec;
  FindResult: Integer;
begin
  Result := True; // Предполагаем, что папка пуста

  // Добавляем проверку существования папки
  if not SysUtils.DirectoryExists(Path) then
  begin
    Result := True; // Несуществующая папка считается пустой
    Exit;
  end;

  FindResult := FindFirst(Path + '\*.*', faAnyFile, SR);
  try
    while FindResult = 0 do
    begin
      if (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        Result := False; // Найден файл/папка - директория не пуста
        Break;
      end;
      FindResult := FindNext(SR);
    end;
  finally
    FindClose(SR);
  end;
end;

// Преобразование времени
function FileTimeToDateTime(FileTime: TFileTime): TDateTime;
var
  ModifiedTime: TFileTime;
  SystemTime: TSystemTime;
begin
  Result := 0;
  if (FileTime.dwLowDateTime = 0) and (FileTime.dwHighDateTime = 0) then
    Exit;
  try
    FileTimeToLocalFileTime(FileTime, ModifiedTime);
    FileTimeToSystemTime(ModifiedTime, SystemTime);
    Result := SystemTimeToDateTime(SystemTime);
    application.ProcessMessages;
  except
    Result := Now; // Something to return in case of error
  end;
end;

// Получение временной папки
function GetWindowsDir: string;
var
  S: array[0..MAX_PATH] of char;
begin
  GetWindowsDirectory(S, sizeof(S));
  Result := S;
  application.ProcessMessages;
end;

function GetTempDir(): string;
var
  Buf: string;
  Len: UINT;
begin
  SetLength(Buf, MAX_PATH + 1);
  Len := GetTempPath(MAX_PATH, pchar(Buf));
  SetLength(Buf, Len);
  GetTempDir := Buf;
  application.ProcessMessages;
end;

function GetWin(Comand: string): string;
var
  buff: array[0..$FF] of char;
begin
  ExpandEnvironmentStrings(pchar(Comand), buff, sizeof(buff));
  Result := buff;
  application.ProcessMessages;
end;

procedure TForm1.Find_Log(Path, Ext: string; HideExt: boolean);
var
  SR: TSearchRec;
  ListItem: TListItem;
  ShInfo: TSHFileInfo;
  PUTI: string;
begin
  try
    if FindFirst(Path + Ext, faAnyFile, SR) = 0 then
    begin
      repeat
        if (SR.Attr <> faDirectory) then
        begin
          ListItem := Form1.ListViewQuicSearch.Items.Add;
          Path := StringReplace(Path + '\', '\\', '\', [rfReplaceAll]);
          PUTI := Path + SR.Name;
          SHGetFileInfo(pchar(PUTI), 0, ShInfo, sizeof(ShInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
          with ListItem do
          begin
            Caption := PUTI;
            SubItems.Add(CheckBoxWindowsLogs.Caption);
            SubItems.Add(GetNormalSize(GetMyFileSize(PUTI)));
            full := full + GetMyFileSize(PUTI);
            Form1.StatusBar2.Panels[0].Text := GetNormalSize(full);
            SubItems.Add('1');
            application.ProcessMessages;
            SubItems.Add('File');
            Checked := true;
            SHGetFileInfo(pchar(PUTI), 0, ShInfo, sizeof(ShInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
            ImageIndex := ShInfo.iIcon;
          end;
        end;
      until FindNext(SR) <> 0;
      FindClose(SR);
    end;
  except
  end;
end;

// Проверка не пуста ли папка
function IsEmptyDir(Path: TFileName): Boolean;
var
  SR: TSearchRec;
  FindResult: Integer;
begin
  Result := True; // Предполагаем, что папка пуста

  // Добавляем проверку существования папки
  if not SysUtils.DirectoryExists(Path) then
  begin
    Result := True; // Несуществующая папка считается пустой
    Exit;
  end;

  FindResult := FindFirst(Path + '\*.*', faAnyFile, SR);
  try
    while FindResult = 0 do
    begin
      if (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        Result := False; // Найден файл/папка - директория не пуста
        Break;
      end;
      FindResult := FindNext(SR);
    end;
  finally
    FindClose(SR);
  end;
end;

procedure TForm1.QuickSearch;
var
  ListItem: TListItem;
  ShInfo: TSHFileInfo;
  Info: TSHQueryRBInfo;
  DirSize: Int64;

  // Вспомогательные процедуры

  procedure AddDirectoryItem(const APath, ADescription: string; CheckedByDefault: Boolean = True);
  begin
    if not SysUtils.DirectoryExists(APath) or IsEmptyDir(APath) then
      Exit;

    ListItem := Form1.ListViewQuicSearch.Items.Add;
    with ListItem do
    begin
      Caption := APath;
      SubItems.Add(ADescription);
      DirSize := GetDirFullSize(APath);
      SubItems.Add(GetNormalSize(DirSize));
      full := full + DirSize;
      Form1.StatusBar2.Panels[0].Text := GetNormalSize(full);
      SubItems.Add(IntToStr(GetFileCount(APath)));
      SubItems.Add('Dir');
      Checked := CheckedByDefault;
      SHGetFileInfo(pchar(APath), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
      ImageIndex := ShInfo.iIcon;
    end;
    Application.ProcessMessages;
  end;

  procedure AddFileItem(const APath, ADescription: string; CheckedByDefault: Boolean = True);
  var
    FileSize: Int64;
  begin
    if not FileExists(APath) then
      Exit;

    ListItem := Form1.ListViewQuicSearch.Items.Add;
    with ListItem do
    begin
      Caption := APath;
      SubItems.Add(ADescription);
      FileSize := GetMyFileSize(APath);
      SubItems.Add(GetNormalSize(FileSize));
      full := full + FileSize;
      Form1.StatusBar2.Panels[0].Text := GetNormalSize(full);
      SubItems.Add('1');
      SubItems.Add('File');
      Checked := CheckedByDefault;
      SHGetFileInfo(pchar(APath), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
      ImageIndex := ShInfo.iIcon;
    end;
    Application.ProcessMessages;
  end;

  procedure ProcessMultiplePaths(const Paths: array of string; const Description: string);
  var
    Path: string;
  begin
    for Path in Paths do
    begin
      AddDirectoryItem(Path, Description);
    end;
  end;

  function GetLocalServiceTempPaths: TArray<string>;
  begin
    // Для совместимости с разными версиями Windows
    Result := [ExtractFileDrive(GetSpecialFolderPath(CSIDL_WINDOWS)) + ':\Documents and Settings\LocalService\Local Settings\Temp\', GetSpecialFolderPath(CSIDL_WINDOWS) + '\ServiceProfiles\LocalService\AppData\Local\Temp\'];
  end;

  function GetLocalServiceHistoryPaths: TArray<string>;
  begin
    Result := [ExtractFileDrive(GetWindowsDir) + ':\Documents and Settings\LocalService\Local Settings\History\', GetWindowsDir + '\ServiceProfiles\LocalService\AppData\Local\Microsoft\Windows\History\'];
  end;

  function GetCryptnetUrlCachePaths: TArray<string>;
  begin
    Result := [GetSpecialFolderPath(CSIDL_SYSTEM) + '\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\', GetSpecialFolderPath(CSIDL_SYSTEM) + '\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\', GetWin('%AppData%') + '\LocalLow\Microsoft\CryptnetUrlCache\', GetWin('%AppData%') + '\LocalLow\Microsoft\CryptnetUrlCache\MetaData\'];
  end;

begin
  // Инициализация
  Form1.StatusBar2.Panels[0].Text := '';
  Form1.ListViewQuicSearch.Clear;
  full := 0;
  Form1.StatusBar2.Panels[0].Text := GetNormalSize(full) + ' ' + LangRegKey.Caption + ' ' + inttostr(RegKeyCount);
  // Temp Windows
  if Form1.CheckBoxTempWindows.Checked then
  begin
    // Основные временные папки
    AddDirectoryItem(GetTempDir, CheckBoxTempWindows.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Temp\', CheckBoxTempWindows.Caption);

    // LocalService Temp
    ProcessMultiplePaths(GetLocalServiceTempPaths(), 'LocalService Temporary Files');

    // Специализированные временные папки
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_SYSTEM) + '\URTTemp\', CheckBoxTempWindows.Caption + ' URT Temp');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Prefetch\', CheckBoxTempWindows.Caption + ' Prefetch');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\CbsTemp\', CheckBoxTempWindows.Caption + ' CbsTemp');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_RECENT) + '\', CheckBoxTempWindows.Caption + ' RECENT');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_HISTORY) + '\', CheckBoxTempWindows.Caption + ' HISTORY');

    // LocalService History
    ProcessMultiplePaths(GetLocalServiceHistoryPaths(), 'LocalService History');

    // Minidump и CrashDumps
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Minidump\', CheckBoxTempWindows.Caption + ' Minidump');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA) + '\CrashDumps\', CheckBoxTempWindows.Caption + ' CrashDumps');

    // Кэши приложений
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_APPDATA) + '\Sun\Java\Deployment\cache\', CheckBoxTempWindows.Caption + ' Java');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\pchealth\helpctr\OfflineCache\', CheckBoxTempWindows.Caption + ' Pchealth');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_APPDATA) + '\Macromedia\Flash Player\', CheckBoxTempWindows.Caption + ' Flash Player');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_APPDATA) + '\microsoft\office\Последние файлы\', CheckBoxTempWindows.Caption + ' Microsoft Office');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Offline Web Pages\', CheckBoxTempWindows.Caption + ' Offline Web Pages');

    // Cryptnet Url Cache
    ProcessMultiplePaths(GetCryptnetUrlCachePaths(), CheckBoxTempWindows.Caption + ' Cryptnet Url Cache');

    // Другие кэши
    AddDirectoryItem(GetWin('%AppData%') + '\Local\D3DSCache\', CheckBoxTempWindows.Caption + ' D3DS Cache');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Installer\$PatchCache$\Managed\', CheckBoxTempWindows.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\SchCache\', CheckBoxTempWindows.Caption + ' SchCache');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\tracing\', CheckBoxTempWindows.Caption + ' tracing');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Downloaded Program Files\', 'Downloaded Program Files');
    AddDirectoryItem(GetWin('%AppData%') + '\Microsoft\Windows\Recent\AutomaticDestinations\', 'Automatic Destinations');
  end;

  // Корзина
  if Form1.CheckBoxTrash.Checked then
  begin
    ZeroMemory(@Info, SizeOf(Info));
    Info.cbSize := SizeOf(Info);
    SHQueryRecycleBin('', Info);

    if Info.i64NumItems <> 0 then
    begin
      ListItem := Form1.ListViewQuicSearch.Items.Add;
      with ListItem do
      begin
        Caption := CheckBoxTrash.Caption;
        SubItems.Add(CheckBoxTrash.Caption);
        SubItems.Add(GetNormalSize(Info.i64Size));
        full := full + Info.cbSize;
        Form1.StatusBar2.Panels[0].Text := GetNormalSize(full);
        SubItems.Add(Format('%d', [Info.i64NumItems]));
        SubItems.Add('Recycle');
        Checked := True;
        SHGetFileInfo(pchar(GetSpecialFolderPath(CSIDL_WINDOWS) + '\explorer.exe'), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
        ImageIndex := ShInfo.iIcon;
      end;
      Application.ProcessMessages;
    end;
  end;

  // Буфер обмена
  if Form1.CheckBoxClipboard.Checked then
  begin
  // Простая проверка, есть ли что-то в буфере обмена
    var HasContent: Boolean;
    begin
      HasContent := False;

    // Проверяем основные форматы
      if Clipboard.HasFormat(CF_TEXT) then
        HasContent := True
      else if Clipboard.HasFormat(CF_BITMAP) then
        HasContent := True
      else if Clipboard.HasFormat(CF_METAFILEPICT) then
        HasContent := True
      else if Clipboard.HasFormat(CF_DIB) then
        HasContent := True
      else if Clipboard.HasFormat(CF_UNICODETEXT) then
        HasContent := True
      else if Clipboard.HasFormat(CF_HDROP) then
        HasContent := True
      else if Clipboard.HasFormat(CF_LOCALE) then
        HasContent := True;

      if HasContent then
      begin
        ListItem := Form1.ListViewQuicSearch.Items.Add;
        with ListItem do
        begin
          Caption := Form1.CheckBoxClipboard.Caption;
          SubItems.Add(Form1.CheckBoxClipboard.Caption);
          SubItems.Add('');
          SubItems.Add('');
          SubItems.Add('clipbrd');
          Checked := True;
          SHGetFileInfo(pchar(''), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
          ImageIndex := ShInfo.iIcon;
        end;
        Application.ProcessMessages;
      end;
    end;
  end;

  // Журналы Windows
  if Form1.CheckBoxWindowsLogs.Checked then
  begin
  // Общие логи
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_SYSTEM) + '\wbem\Logs\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\SysWOW64\wbem\Logs\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_SYSTEM) + '\SleepStudy\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA) + '\Microsoft\Windows\WER\ReportQueue\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA) + '\USOShared\Logs\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Debug\UserMode\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_SYSTEM) + '\LogFiles\WMI\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_SYSTEM) + '\sru\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Logs\waasmedic\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\LiveKernelReports\', Form1.CheckBoxWindowsLogs.Caption + ' LiveKernelReports');
    AddDirectoryItem(ExtractFileDrive(GetWindowsDir) + '\PerfLogs\', Form1.CheckBoxWindowsLogs.Caption + ' PerfLogs');
  // Сетевые логи
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\', Form1.CheckBoxWindowsLogs.Caption + ' Network');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\', Form1.CheckBoxWindowsLogs.Caption + ' ModemLogs');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\ModemLogs\', Form1.CheckBoxWindowsLogs.Caption + ' Network');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\DiagTrack\', Form1.CheckBoxWindowsLogs.Caption + ' DiagTrack');

  // Логи обновлений
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Logs\WindowsUpdate\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Logs\CBS\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\SoftwareDistribution\DataStore\Logs\', Form1.CheckBoxWindowsLogs.Caption);

  // CLR логи
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA) + '\Microsoft\CLR_v4.0\UsageLogs\', Form1.CheckBoxWindowsLogs.Caption + ' CLR_v4.0');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA) + '\Microsoft\CLR_v4.0_32\UsageLogs\', Form1.CheckBoxWindowsLogs.Caption + ' CLR_v4.0');

  // Дополнительные папки логов
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Logs\SIH\', Form1.CheckBoxWindowsLogs.Caption);
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Logs\MeasuredBoot\', Form1.CheckBoxWindowsLogs.Caption);

  // Отдельные файлы логов
    AddFileItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\INF\setupapi.dev.log', Form1.CheckBoxWindowsLogs.Caption);
    AddFileItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Logs\MoSetup\UpdateAgent.log', Form1.CheckBoxWindowsLogs.Caption);

  // Поиск логов в папках (сохранена оригинальная логика)
    if not IsEmptyDir(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Logs\') then
      Find_Log(GetSpecialFolderPath(CSIDL_WINDOWS) + '\Logs\', '*.log', False);

    if not IsEmptyDir(GetSpecialFolderPath(CSIDL_WINDOWS) + '\') then
      Find_Log(GetSpecialFolderPath(CSIDL_WINDOWS) + '\', '*.log', False);

    if not IsEmptyDir(GetSpecialFolderPath(CSIDL_WINDOWS) + '\SoftwareDistribution\') then
      Find_Log(GetSpecialFolderPath(CSIDL_WINDOWS) + '\SoftwareDistribution\', '*.log', False);
  end;

  // Кеш шрифтов
  if Form1.CheckBoxFontCache.Checked then
  begin
  // Просто вызываем AddFileItem для каждого файла
    AddFileItem(GetSpecialFolderPath(CSIDL_SYSTEM) + '\FNTCACHE.DAT', Form1.CheckBoxFontCache.Caption);
    AddFileItem(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA) + '\GDIPFONTCACHEV1.DAT', Form1.CheckBoxFontCache.Caption);
    AddFileItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\ServiceProfiles\LocalService\AppData\Local\FontCache-S-1-5-21-3467938706-139659590-3667360442-1000-12288.dat', Form1.CheckBoxFontCache.Caption);
    AddFileItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\ServiceProfiles\LocalService\AppData\Local\FontCache-System.dat', Form1.CheckBoxFontCache.Caption);
    AddFileItem(GetSpecialFolderPath(CSIDL_WINDOWS) + '\ServiceProfiles\LocalService\AppData\Local\FontCache3.0.0.0.dat', Form1.CheckBoxFontCache.Caption);
  end;

  // Временные файлы программ
  if Form1.CheckBoxTempAPP.Checked then
  begin
    // NVIDIA
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_COMMON_APPDATA) + '\NVIDIA\', CheckBoxTempAPP.Caption + ' NVIDIA');
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_COMMON_APPDATA) + '\NVIDIA Corporation\', CheckBoxTempAPP.Caption + ' NVIDIA');

    // Telegram
    AddDirectoryItem(GetWin('%AppData%') + '\Telegram Desktop\tdata\user_data\', CheckBoxTempAPP.Caption + ' Telegram');

    // Lenovo
    AddDirectoryItem(GetSpecialFolderPath(CSIDL_COMMON_APPDATA) + '\Lenovo\SystemUpdate\sessionSE\Repository\', CheckBoxTempAPP.Caption + ' Lenovo');
  end;

  // Реестр
  if Form1.CheckBoxRegistry.Checked then
  begin
    cleanReg;
  end;

  // Финальное обновление статуса
  Form1.StatusBar2.Panels[0].Text := GetNormalSize(full) + ' ' + LangRegKey.Caption + ' ' + inttostr(RegKeyCount);
end;

procedure TForm1.ButtonQuickSearchClick(Sender: TObject);
var
  i: Integer;
begin
  try
    case ButtonQuickSearch.Tag of
      0: // Начать поиск
        begin
          TabControl2.Enabled := false;
          ButtonQuickSearch.Tag := 1;
          ButtonQuickSearch.Caption := LangCancel.Caption;
          Stop := FALSE;
          ButtonQuickDelete.Enabled := FALSE;
          ProgressBarQuickClean.Position := 0;
          Form1.Taskbar1.ProgressValue := ProgressBarQuickClean.Position;
          TabControlOption.Enabled := FALSE;
          TabControl8.Enabled := FALSE;
          TabSheet6.Enabled := FALSE;
          TabControl9.Enabled := false;
          TabControlOption.Enabled := false;
          SpeedButton_GeneralMenu.Enabled := FALSE;
          QuickSearch;
          TabControl9.Enabled := true;
          TabControlOption.Enabled := true;
          TabControl2.Enabled := true;
          stop := true;
          ButtonQuickSearch.Tag := 0;
          ButtonQuickSearch.Caption := LangSearch.Caption;
          ButtonQuickDelete.Enabled := true;
          PopupMenuSearch.AutoPopup := true;
          CheckBoxProgress.Enabled := true;
          CheckBoxRecycleBin.Enabled := true;
          ComboBoxDrive.Enabled := true;
          TabControl6.Enabled := true;
          TabSheet6.Enabled := true;
          TabSheet2.Enabled := true;
          SpeedButton_GeneralMenu.Enabled := true;
          ButtonQuickDelete.SetFocus;
          ButtonQuickDelete.Default := true;
          if Form1.ListViewQuicSearch.Items.Count > 0 then
          begin
            Form1.ListViewQuicSearch.Items[0].MakeVisible(true);
            Form1.ListViewQuicSearch.Items[0].Selected := true;
            Form1.ListViewQuicSearch.Items[0].Focused := true;
            Form1.ListViewQuicSearch.SetFocus;
          end;

          try
            for i := 0 to ListViewQuicSearch.Columns.Count - 1 do
              ListView_SetColumnWidth(ListViewQuicSearch.Handle, i, LVSCW_AUTOSIZE_USEHEADER);
          except
          end;
        end;
      1: // Остановить поиск
        begin
          Stop := true;
          TabControl9.Enabled := true;
          TabControlOption.Enabled := true;
          TabControl2.Enabled := true;
          ButtonQuickSearch.Tag := 0;
          ButtonQuickSearch.Caption := LangSearch.Caption;
          TabControl9.Enabled := true;
          TabControlOption.Enabled := true;
          ButtonQuickSearch.Enabled := true;
          ButtonQuickDelete.Enabled := true;
          PopupMenuquicSearch.AutoPopup := true;
          PopupMenuQuickClean.AutoPopup := true;
          SpeedButton_GeneralMenu.Enabled := true;
          TabControlOption.Enabled := true;
          TabControl8.Enabled := true;
          TabSheet6.Enabled := true;
          ButtonQuickDelete.SetFocus;
          ButtonQuickDelete.Default := true;
          if Form1.ListViewQuicSearch.Items.Count > 0 then
          begin
            Form1.ListViewQuicSearch.Items[0].MakeVisible(true);
            Form1.ListViewQuicSearch.Items[0].Selected := true;
            Form1.ListViewQuicSearch.Items[0].Focused := true;
            Form1.ListViewQuicSearch.SetFocus;
          end;

          try
            for i := 0 to ListViewQuicSearch.Columns.Count - 1 do
              ListView_SetColumnWidth(ListViewQuicSearch.Handle, i, LVSCW_AUTOSIZE_USEHEADER);
          except
          end;
        end;
    end;
  except
    // В случае ошибки сбрасываем состояние
    ButtonQuickSearch.Tag := 0;
    ButtonQuickSearch.Caption := LangSearch.Caption;
    Stop := False;
  end;
end;


// Изменение размера формы

procedure TForm1.ClearListQuicSearchClick(Sender: TObject);
begin
  ListViewQuicSearch.Clear;
end;

procedure TForm1.ChangeExclusionClick(Sender: TObject);
begin
  Form2.ButtonAddExceptions.Visible := FALSE;
  Form2.ButtonChangeExceptions.Visible := true;
  if ListViewExclusion.Selected <> nil then
  begin
    Form2.ButtonChangeExceptions.Enabled := true;
    Form2.EditExceptions.Text := Form1.ListViewExclusion.Selected.Caption;
    Form2.ShowModal;
  end;
end;

procedure TForm1.ChangeFilterClick(Sender: TObject);
begin
  Form3.ButtonAddFilter.Visible := FALSE;
  Form3.ButtonChangeFilter.Visible := true;
  if ListViewFilter.Selected <> nil then
  begin
    Form3.ButtonChangeFilter.Enabled := true;
    Form3.EditFilter.Text := Form1.ListViewFilter.Selected.Caption;
    Form3.ShowModal;
  end;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.CheckBox7Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.CheckBox8Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.CheckBox9Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.CheckBox10Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.CheckBox11Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.CheckBox12Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.CheckBox13Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

function TextSize(FileName: string): Integer;
var
  tmp: TStringList;
begin
  if FileExists(FileName) then
  begin
    tmp := TStringList.Create;
    tmp.LoadFromFile(FileName);
    Result := tmp.Count;
    tmp.Free;
  end
  else
    Result := -1;
end;

procedure TForm1.OpenFolderQuicSearchClick(Sender: TObject);
var
  recycleBinPIDL: PItemIDList;
  execInfo: TSHELLEXECUTEINFO;
begin
  if ListViewQuicSearch.ItemIndex = -1 then
    Exit;
  // s := pchar(ListViewQuicSearch.Selected.Caption);
  if ListViewQuicSearch.Selected.Caption <> 'Корзина' then
  begin
    ShellExecute(application.MainForm.Handle, 'Explore', nil, '', pchar(ExtractFilePath(ListViewQuicSearch.Selected.Caption)), SW_SHOWMAXIMIZED);
  end;
  if ListViewQuicSearch.Selected.Caption = 'Корзина' then
  begin
    SHGetSpecialFolderLocation(Handle, CSIDL_BITBUCKET, recycleBinPIDL);
    with execInfo do
    begin
      cbSize := sizeof(execInfo);
      fMask := SEE_MASK_IDLIST;
      Wnd := Handle;
      lpVerb := nil;
      lpFile := nil;
      lpParameters := nil;
      lpDirectory := nil;
      nShow := SW_SHOWMAXIMIZED;
      hInstApp := 0;
      lpIDList := recycleBinPIDL;
    end;
    ShellExecuteEx(@execInfo);
  end;
end;

procedure TForm1.AddExceptionsDiskCleanerMenuClick(Sender: TObject);
begin
  with Form1.ListViewExclusionReg.Items.Add do
  begin
    Caption := Form1.ListViewQuicSearch.Selected.SubItems[0];
    SubItems.Add('');
    Form1.ListViewQuicSearch.DeleteSelected;
    Checked := true;
  end;
end;

procedure TForm1.CheckBox17Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.CheckBox18Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.CheckBox19Click(Sender: TObject);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.SelectAllQuickCleanClick(Sender: TObject);
begin
  CheckAll6(true);
end;

procedure TForm1.ExcludeAllQuickCleanClick(Sender: TObject);
begin
  CheckAll6(FALSE);
end;

procedure TForm1.SaveQuickCleanClick(Sender: TObject);
begin
  SaveNastr;
  application.ProcessMessages;
end;

procedure TForm1.PropertiesQuicSearchClick(Sender: TObject);
begin
  if Form1.ListViewQuicSearch.ItemIndex = -1 then
    Exit;
  if Form1.ListViewQuicSearch.Selected.Caption = 'Корзина' then
    Exit;
  ShowPropertiesDialog(Form1.ListViewQuicSearch.Selected.Caption);
  application.ProcessMessages;
end;

procedure TForm1.ListViewQuicSearchSelectItem(Sender: TObject; Item: TListItem; Selected: boolean);
begin
  try
    if ListViewQuicSearch.ItemIndex = -1 then
      PopupMenuquicSearch.AutoPopup := FALSE;

    if ListViewQuicSearch.Selected.SubItems.Strings[3] <> '' then
    begin
      PopupMenuquicSearch.AutoPopup := true;

      if ListViewQuicSearch.Selected.SubItems.Strings[3] = 'Dir' then
      begin
        OpenFolderQuicSearch.Visible := true;
        PropertiesQuicSearch.Visible := true;
        DeleteFolderQuicSearch.Visible := true;
        DeleteFileQuicSearch.Visible := FALSE;
        AddExceptionsDiskCleanerMenu.Visible := FALSE;
        DelRegKeyDiskCleanerMenu.Visible := FALSE;
      end;

      if ListViewQuicSearch.Selected.SubItems.Strings[3] = 'File' then
      begin
        OpenFolderQuicSearch.Visible := true;
        PropertiesQuicSearch.Visible := true;
        DeleteFolderQuicSearch.Visible := FALSE;
        DeleteFileQuicSearch.Visible := true;
        AddExceptionsDiskCleanerMenu.Visible := FALSE;
        DelRegKeyDiskCleanerMenu.Visible := FALSE;
      end;

      if ListViewQuicSearch.Selected.SubItems.Strings[3] = 'clipbrd' then
      begin
        OpenFolderQuicSearch.Visible := FALSE;
        PropertiesQuicSearch.Visible := FALSE;
        AddExceptionsDiskCleanerMenu.Visible := FALSE;
        DelRegKeyDiskCleanerMenu.Visible := FALSE;
        DeleteFolderQuicSearch.Visible := FALSE;
        DeleteFileQuicSearch.Visible := FALSE;
      end;

      if ListViewQuicSearch.Selected.SubItems.Strings[3] = 'Registry' then
      begin
        AddExceptionsDiskCleanerMenu.Visible := true;
        DelRegKeyDiskCleanerMenu.Visible := true;
        OpenFolderQuicSearch.Visible := FALSE;
        PropertiesQuicSearch.Visible := FALSE;
        DeleteFolderQuicSearch.Visible := FALSE;
        DeleteFileQuicSearch.Visible := FALSE;
      end;
    end;
  except
  end;
end;

procedure TForm1.TabSheet3Show(Sender: TObject);
begin
  Form1.StatusBar4.Panels[0].Text := 'Всего фильтров: ' + IntToStr(Form1.ListViewFilter.Items.Count);
end;

procedure TForm1.TabSheet4Show(Sender: TObject);
begin
  Form1.StatusBar4.Panels[0].Text := 'Всего исключений: ' + IntToStr(Form1.ListViewExclusion.Items.Count);
end;

procedure TForm1.TabSheet6Show(Sender: TObject);
begin
  globLoad;
end;

// Анализ ключей реестра
procedure TForm1.cleanReg;
var
  ShInfo: TSHFileInfo;
  KeyInfo: TRegKeyInfo;
  i: Integer;
  CurrentKey: string;
  KeyParts: TStringList;
  IniLines: TStringList;
  FullRegPath, KeyType: string;
  regKey: HKEY;
  KeyPathForCheck, ValueName: string;
  KeyPathOnly: string;
  PipePos: Integer;
  DetectPath: string;
  CheckDetectOnly: Boolean;
  CurrentSection: string;
begin
  // Обнуляем счетчик перед началом поиска
  RegKeyCount := 0;

  SHGetFileInfo(pchar(GetSpecialFolderPath(CSIDL_WINDOWS) + '\regedit.exe'), 0, ShInfo, sizeof(ShInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX);
  CheckDetectOnly := False;
  CurrentSection := '';
  IniLines := TStringList.Create;
  KeyParts := TStringList.Create;
  try
    IniLines.LoadFromFile(PortablePathregclean);
    ProgressBarQuickClean.Min := 0;
    ProgressBarQuickClean.Max := IniLines.Count;
    ProgressBarQuickClean.Position := 0;

    reg := TRegistry.Create;
    try
      reg.Access := KEY_WOW64_64KEY or KEY_ALL_ACCESS;

      for i := 0 to IniLines.Count - 1 do
      begin
        if stop then
          Break;
        ProgressBarQuickClean.Position := i + 1;
        Application.ProcessMessages;

        CurrentKey := Trim(IniLines.Strings[i]);
        if (CurrentKey = '') or (Pos(';', CurrentKey) = 1) then
          continue;

        if stop then
          Break;
        if Pos('[', CurrentKey) = 1 then
        begin
          CurrentSection := Copy(CurrentKey, 2, Length(CurrentKey) - 2);
          CheckDetectOnly := False;
          DetectPath := '';
          continue;
        end;

        if Pos('Detect=', CurrentKey) = 1 then
        begin
          DetectPath := Trim(Copy(CurrentKey, Length('Detect=') + 1));
          CheckDetectOnly := True;
          continue;
        end;

        if stop then
          Break;

        if (Pos('RegKey', CurrentKey) > 0) and (Pos('=', CurrentKey) > 0) then
        begin
          if CheckDetectOnly and (DetectPath <> '') then
          begin
            if Pos('HKCU\', UpperCase(DetectPath)) = 1 then
              regKey := HKEY_CURRENT_USER
            else if Pos('HKLM\', UpperCase(DetectPath)) = 1 then
              regKey := HKEY_LOCAL_MACHINE
            else
              regKey := 0;

            if regKey <> 0 then
            begin
              reg.RootKey := regKey;

              KeyPathForCheck := DetectPath;
              KeyPathForCheck := StringReplace(KeyPathForCheck, 'HKCU\', '', [rfIgnoreCase]);
              KeyPathForCheck := StringReplace(KeyPathForCheck, 'HKLM\', '', [rfIgnoreCase]);

              if not reg.KeyExists(KeyPathForCheck) then
              begin
                CheckDetectOnly := False;
                DetectPath := '';
                continue;
              end;
            end;
          end;

          if stop then
            Break;

          FullRegPath := Trim(Copy(CurrentKey, Pos('=', CurrentKey) + 1));

          if Pos('HKCU\', UpperCase(FullRegPath)) = 1 then
          begin
            regKey := HKEY_CURRENT_USER;
            KeyType := 'HKEY_CURRENT_USER';
          end
          else if Pos('HKLM\', UpperCase(FullRegPath)) = 1 then
          begin
            regKey := HKEY_LOCAL_MACHINE;
            KeyType := 'HKEY_LOCAL_MACHINE';
          end
          else
          begin
            // Неизвестный тип ключа, пропускаем
            continue;
          end;

          if stop then
            Break;

          FullRegPath := StringReplace(FullRegPath, 'HKCU', 'HKEY_CURRENT_USER', [rfReplaceAll, rfIgnoreCase]);
          FullRegPath := StringReplace(FullRegPath, 'HKLM', 'HKEY_LOCAL_MACHINE', [rfReplaceAll, rfIgnoreCase]);

          ValueName := '';
          KeyPathOnly := FullRegPath;

          PipePos := Pos('|', FullRegPath);
          if PipePos > 0 then
          begin
            KeyPathOnly := Copy(FullRegPath, 1, PipePos - 1);
            ValueName := Trim(Copy(FullRegPath, PipePos + 1, Length(FullRegPath)));
          end;

          KeyPathOnly := Trim(KeyPathOnly);

          if stop then
            Break;

          if (regKey = HKEY_CURRENT_USER) and ExlPathReg(KeyPathOnly) then
            continue;

          reg.RootKey := regKey;

          KeyPathForCheck := KeyPathOnly;
          KeyPathForCheck := StringReplace(KeyPathForCheck, 'HKEY_CURRENT_USER\', '', [rfIgnoreCase]);
          KeyPathForCheck := StringReplace(KeyPathForCheck, 'HKEY_LOCAL_MACHINE\', '', [rfIgnoreCase]);

          if stop then
            Break;

          if not reg.KeyExists(KeyPathForCheck) then
            continue;

          if ValueName <> '' then
          begin
            if reg.OpenKey(KeyPathForCheck, FALSE) then
            begin
              if not reg.ValueExists(ValueName) then
              begin
                reg.CloseKey;
                continue;
              end;
              reg.CloseKey;
            end
            else
            begin
              continue;
            end;
          end;

          if stop then
            Break;

          with ListViewQuicSearch.Items.Add do
          begin
            Caption := KeyType;
            SubItems.Add('\' + Copy(FullRegPath, Length(KeyType) + 2, Length(FullRegPath)));
            SubItems.Add(CurrentSection);
            if ValueName <> '' then
              SubItems.Add('Value')
            else
              SubItems.Add('Key');
            SubItems.Add('Registry');
            Checked := True;
            ImageIndex := ShInfo.iIcon;
          end;

          // Увеличиваем счетчик найденных ключей реестра
          Inc(RegKeyCount);
          Form1.StatusBar2.Panels[0].Text := GetNormalSize(full) + ' ' + LangRegKey.Caption + ' ' + inttostr(RegKeyCount);
          Application.ProcessMessages;
        end;
      end;
    finally
      reg.Free;
    end;
  finally
    IniLines.Free;
    KeyParts.Free;
    ProgressBarQuickClean.Position := 0;
  end;
end;

procedure TForm1.Listview_quickCleanEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
begin
  AllowEdit := FALSE;
end;

function TForm1.ForceDeleteFileAPI(const FileName: string): Boolean;
var
  OldAttr: DWORD;
begin
  Result := False;

  // Получаем атрибуты через Windows API
  OldAttr := GetFileAttributes(PChar(FileName));

  if OldAttr <> INVALID_FILE_ATTRIBUTES then
  begin
    // Сбрасываем атрибуты
    SetFileAttributes(PChar(FileName), FILE_ATTRIBUTE_NORMAL);

    // Удаляем файл
    Result := DeleteFile(PChar(FileName));

    // Если не удалось, восстанавливаем атрибуты
    if not Result then
      SetFileAttributes(PChar(FileName), OldAttr);
  end;
end;

procedure DeleteKeyRecursive(reg: TRegistry; const KeyPath: string);
var
  sl: TStringList;
  i: Integer;
  SavedRootKey: HKEY;
  SavedAccess: LongWord;
  NormalizedKeyPath: string;
begin
  // Нормализуем путь: убираем начальный обратный слэш, если он есть
  if (KeyPath <> '') and (KeyPath[1] = '\') then
    NormalizedKeyPath := Copy(KeyPath, 2, Length(KeyPath))
  else
    NormalizedKeyPath := KeyPath;

  // Сохраняем текущие настройки реестра
  SavedRootKey := reg.RootKey;
  SavedAccess := reg.Access;

  try
    if reg.OpenKey(NormalizedKeyPath, False) then
    begin
      sl := TStringList.Create;
      try
        // Получаем список подразделов
        reg.GetKeyNames(sl);
        for i := 0 to sl.Count - 1 do
        begin
          // Рекурсивно удаляем каждый подраздел
          DeleteKeyRecursive(reg, NormalizedKeyPath + '\' + sl[i]);
        end;
      finally
        sl.Free;
      end;
      reg.CloseKey;
    end;

    // После удаления всех подразделов удаляем сам ключ
    if NormalizedKeyPath <> '' then
      reg.DeleteKey(NormalizedKeyPath);

  finally
    // Восстанавливаем настройки
    reg.RootKey := SavedRootKey;
    reg.Access := SavedAccess;
  end;
end;

procedure TForm1.ClearSelected;
var
  FullPath, KeyPath, ValueName: string;
  reg: TRegistry;
  ProcessedItems: Integer;
  TotalItems: Integer;
  Item: TListItem;
begin
  TotalItems := 0; // Инициализация переменной в начале
  ProcessedItems := 0;

  try
    ProgressBarQuickClean.Position := 0;
    Form1.Taskbar1.ProgressValue := ProgressBarQuickClean.Position;

    // Устанавливаем общее количество элементов
    TotalItems := Form1.ListViewQuicSearch.Items.Count;

    Form1.ProgressBarQuickClean.Max := TotalItems;
    Form1.Taskbar1.ProgressMaxValue := TotalItems;

    while ListViewQuicSearch.Items.Count > 0 do
    begin
      // Делаем элемент видимым перед обработкой
      if ListViewQuicSearch.Items.Count > 0 then
      begin
        ListViewQuicSearch.Items[0].MakeVisible(True);
      end;

      application.ProcessMessages; // Даем интерфейсу обновиться

      Item := ListViewQuicSearch.Items[0];

      if not Item.Checked then
      begin
        // Просто удаляем неснятый элемент
        ListViewQuicSearch.Items.Delete(0);
        Inc(ProcessedItems);
        ProgressBarQuickClean.Position := ProcessedItems;
        Form1.Taskbar1.ProgressValue := ProcessedItems;
        application.ProcessMessages; // Обновляем прогресс
        Continue;
      end;

      // Обработка директорий
      if Item.SubItems[3] = 'Dir' then
      begin
        try
          FullRemoveDir(Item.Caption);
        except
          // Без сообщений об ошибках
        end;
      end
      // Обработка файлов
      else if Item.SubItems[3] = 'File' then
      begin
        try
          ForceDeleteFileAPI(Item.Caption);
        except
          // Без сообщений об ошибках
        end;
      end
      // Обработка буфера обмена
      else if Item.SubItems[3] = 'clipbrd' then
      begin
        try
          Clipboard.Open;
          EmptyClipboard;
          Clipboard.Clear;
          Clipboard.Close;
        except
          // Без сообщений об ошибках
        end;
      end
      // Обработка корзины
      else if Item.SubItems[3] = 'Recycle' then
      begin
        try
          EmptyRecycleBin;
        except
          // Без сообщений об ошибках
        end;
      end
      // Обработка реестра
      else if Item.SubItems[3] = 'Registry' then
      begin
        try
          reg := TRegistry.Create;
          try
            // Устанавливаем права доступа
            reg.Access := KEY_WOW64_64KEY or KEY_ALL_ACCESS;

            // Определяем корневой ключ
            if Item.Caption = 'HKEY_LOCAL_MACHINE' then
              reg.RootKey := HKEY_LOCAL_MACHINE
            else if Item.Caption = 'HKEY_CLASSES_ROOT' then
              reg.RootKey := HKEY_CLASSES_ROOT
            else if Item.Caption = 'HKEY_CURRENT_USER' then
              reg.RootKey := HKEY_CURRENT_USER
            else
            begin
              ListViewQuicSearch.Items.Delete(0);
              Inc(ProcessedItems);
              ProgressBarQuickClean.Position := ProcessedItems;
              Form1.Taskbar1.ProgressValue := ProcessedItems;
              application.ProcessMessages;
              Continue;
            end;

            // Получаем путь к ключу из ListView
            FullPath := Item.SubItems.Strings[0];

            // Проверяем есть ли символ | в пути
            if Pos('|', FullPath) > 0 then
            begin
              // Есть символ | - значит нужно удалить значение ключа, но НЕ сам ключ
              KeyPath := Trim(Copy(FullPath, 1, Pos('|', FullPath) - 1));
              ValueName := Trim(Copy(FullPath, Pos('|', FullPath) + 1, Length(FullPath)));

              // Открываем ключ для записи
              if reg.OpenKey(KeyPath, False) then
              begin
                // Проверяем существует ли значение
                if reg.ValueExists(ValueName) then
                begin
                  reg.DeleteValue(ValueName);
                end;
                reg.CloseKey;
              end;
            end
            else
            begin
              // Нет символа | - удаляем ВЕСЬ ключ полностью
              KeyPath := FullPath;

              // Проверяем существует ли ключ
              if reg.KeyExists(KeyPath) then
              begin
                // Удаляем ключ полностью
                try
                  reg.DeleteKey(KeyPath);
                except
                  DeleteKeyRecursive(reg, KeyPath);
                end;
              end;
            end;
          finally
            reg.Free;
          end;
        except
          // Без сообщений об ошибках
        end;
      end;

      // Удаляем обработанный элемент (всегда 0-й элемент)
      ListViewQuicSearch.Items.Delete(0);

      // Обновление прогресса
      Inc(ProcessedItems);
      ProgressBarQuickClean.Position := ProcessedItems;
      Form1.Taskbar1.ProgressValue := ProcessedItems;

      // Обновляем интерфейс после каждого удаления
      application.ProcessMessages;

      // Небольшая пауза для наглядности (по желанию)
      // Sleep(10);
    end;

  finally
    // Финальное обновление прогресса
    if TotalItems > 0 then
    begin
      ProgressBarQuickClean.Position := TotalItems;
      Form1.Taskbar1.ProgressValue := TotalItems;
    end;

    Form1.StatusBar2.Panels[0].Text := '';

    // Обновляем интерфейс
    application.ProcessMessages;
  end;
end;

procedure TForm1.ButtonQuickDeleteClick(Sender: TObject);
begin
  if Form1.ListViewQuicSearch.Items.Count = 0 then
    Exit;
  ButtonQuickSearch.Enabled := FALSE;
  ButtonQuickDelete.Enabled := FALSE;
  TabControlOption.Enabled := FALSE;
  TabControl8.Enabled := FALSE;
  TabSheet6.Enabled := FALSE;
  SpeedButton_GeneralMenu.Enabled := FALSE;
  ClearSelected;
  ButtonQuickSearch.Enabled := true;
  ButtonQuickDelete.Enabled := true;
  TabControlOption.Enabled := true;
  TabControl8.Enabled := true;
  TabSheet6.Enabled := true;
  SpeedButton_GeneralMenu.Enabled := true;
end;

procedure TForm1.SelectAllQuicSearchClick(Sender: TObject);
begin
  CheckAll2(true);
end;

procedure TForm1.ExcludeAllQuicSearchClick(Sender: TObject);
begin
  CheckAll2(FALSE);
end;

procedure TForm1.TabSheet2Show(Sender: TObject);
begin
  try
    if (ButtonQuickSearch.Enabled = FALSE) or (ButtonQuickSearch.Visible = FALSE) then
      Exit;
    if (ButtonQuickSearch.Enabled = true) or (ButtonQuickSearch.Visible = true) then
      ButtonQuickSearch.SetFocus;
  except
  end;
end;

procedure TForm1.TabSheet1Show(Sender: TObject);
begin
  try
    if (ButtonSearch.Enabled = FALSE) or (ButtonSearch.Visible = FALSE) then
      Exit;
    if (ButtonSearch.Enabled = true) or (ButtonSearch.Visible = true) then
      ButtonSearch.SetFocus;
  except
  end;
end;

procedure TForm1.ListViewExclusionRegEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
begin
  AllowEdit := FALSE;
end;

procedure TForm1.ListViewExclusionRegChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  ButtonSaveOption.Enabled := true;
end;

procedure TForm1.SelectAllExclusionRegClick(Sender: TObject);
begin
  CheckAll7(true);
end;

procedure TForm1.ExcludeAllExclusionRegClick(Sender: TObject);
begin
  CheckAll7(FALSE);
end;

procedure TForm1.CaveExclusionRegClick(Sender: TObject);
begin
  SaveSearchFilter;
end;

procedure TForm1.DeleteExclusionRegClick(Sender: TObject);
begin
  if ListViewExclusionReg.ItemIndex = -1 then
    Exit;
  Msg := messagebox(application.MainForm.Handle, pchar(LangDelExclusion.Caption + ' [' + ListViewExclusionReg.Selected.Caption + '] ?'), pchar(LangAttention.Caption), mb_iconquestion or mb_yesno);
  if Msg = idyes then
    if Form1.ListViewExclusionReg.Selected <> nil then
      Form1.ListViewExclusionReg.DeleteSelected;
  Form1.StatusBar4.Panels[0].Text := IntToStr(Form1.ListViewExclusionReg.Items.Count);
end;

procedure TForm1.TabSheet7Show(Sender: TObject);
begin
  Form1.StatusBar4.Panels[0].Text := IntToStr(Form1.ListViewExclusionReg.Items.Count);
end;

procedure TForm1.TreeViewOptionClick(Sender: TObject);
begin
  if TreeViewOption.Selected.Index = 0 then
  begin
    ListViewFilter.Visible := true;
    ListViewExclusion.Visible := FALSE;
    ListViewExclusionReg.Visible := FALSE;
  end;

  if TreeViewOption.Selected.Index = 1 then
  begin
    ListViewFilter.Visible := FALSE;
    ListViewExclusion.Visible := true;
    ListViewExclusionReg.Visible := FALSE;
  end;

  if TreeViewOption.Selected.Index = 2 then
  begin
    ListViewFilter.Visible := FALSE;
    ListViewExclusion.Visible := FALSE;
    ListViewExclusionReg.Visible := true;
  end;
end;

procedure TForm1.ListViewExclusionEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
begin
  AllowEdit := FALSE;
end;

procedure TForm1.ListViewFilterEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
begin
  AllowEdit := FALSE;
end;

procedure TForm1.ListViewQuicSearchClick(Sender: TObject);
begin
  try
    if ListViewQuicSearch.ItemIndex = -1 then
      PopupMenuquicSearch.AutoPopup := FALSE;

    if ListViewQuicSearch.Selected.SubItems.Strings[3] <> '' then
    begin
      PopupMenuquicSearch.AutoPopup := true;
      if ListViewQuicSearch.Selected.SubItems.Strings[3] = 'Dir' then
      begin
        OpenFolderQuicSearch.Visible := true;
        PropertiesQuicSearch.Visible := true;
        DeleteFolderQuicSearch.Visible := true;
        DeleteFileQuicSearch.Visible := FALSE;
        AddExceptionsDiskCleanerMenu.Visible := FALSE;
        DelRegKeyDiskCleanerMenu.Visible := FALSE;
      end;

      if ListViewQuicSearch.Selected.SubItems.Strings[3] = 'File' then
      begin
        OpenFolderQuicSearch.Visible := true;
        PropertiesQuicSearch.Visible := true;
        DeleteFolderQuicSearch.Visible := FALSE;
        DeleteFileQuicSearch.Visible := true;
        AddExceptionsDiskCleanerMenu.Visible := FALSE;
        DelRegKeyDiskCleanerMenu.Visible := FALSE;
      end;

      if ListViewQuicSearch.Selected.SubItems.Strings[3] = 'clipbrd' then
      begin
        OpenFolderQuicSearch.Visible := FALSE;
        PropertiesQuicSearch.Visible := FALSE;
        AddExceptionsDiskCleanerMenu.Visible := FALSE;
        DelRegKeyDiskCleanerMenu.Visible := FALSE;
        DeleteFolderQuicSearch.Visible := FALSE;
        DeleteFileQuicSearch.Visible := FALSE;
      end;

      if ListViewQuicSearch.Selected.SubItems.Strings[3] = 'Registry' then
      begin
        AddExceptionsDiskCleanerMenu.Visible := true;
        DelRegKeyDiskCleanerMenu.Visible := true;
        OpenFolderQuicSearch.Visible := FALSE;
        PropertiesQuicSearch.Visible := FALSE;
        DeleteFolderQuicSearch.Visible := FALSE;
        DeleteFileQuicSearch.Visible := FALSE;
      end;
    end;
  except
  end;
end;

procedure TForm1.ListViewQuicSearchEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
begin
  AllowEdit := FALSE;
end;

procedure TForm1.ListViewDiskCleanerEditing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
begin
  AllowEdit := FALSE;
end;

procedure TForm1.ListView5Editing(Sender: TObject; Item: TListItem; var AllowEdit: boolean);
begin
  AllowEdit := FALSE;
end;

procedure TForm1.AddExclusionRegClick(Sender: TObject);
begin
  Form4.EditRegKey.Text := '';
  Form4.ButtonAddReg.Enabled := FALSE;
  Form4.ButtonAddReg.Visible := true;
  Form4.ButtonChangeReg.Visible := FALSE;
  Form4.ShowModal;
end;

function TForm1.GetDriveVolume(drive: string): string;
var
  _VolumeName, _FileSystemName: array[0..MAX_PATH - 1] of char;
  _VolumeSerialNo, _MaxComponentLength, _FileSystemFlags: LongWord;
begin
  Result := '';
  if GetVolumeInformation(pchar(drive + ':\'), _VolumeName, MAX_PATH, @_VolumeSerialNo, _MaxComponentLength, _FileSystemFlags, _FileSystemName, MAX_PATH) then
    Result := _VolumeName;
end;

procedure TForm1.getDrive;
var
  drive: char;
begin
  Form1.ComboBoxDrive.Clear;
  for drive := 'a' to 'z' do
  begin
    case GetDriveType(pchar(drive + ':\')) of
      DRIVE_REMOVABLE:
        begin
          Form1.ComboBoxDrive.Items.Add(UpperCase(drive) + ':\ [' + GetDriveVolume(drive) + ' ]');
        end;
      DRIVE_FIXED:
        begin
          Form1.ComboBoxDrive.Items.Add(UpperCase(drive) + ':\ [' + GetDriveVolume(drive) + ' ]');
        end;
      { DRIVE_CDROM:
        begin
        Form1.ComboBox1.Items.Add(AnsiUpperCase(Drive) + ':\ [' +
        GetDriveVolume(Drive) + ' ]');
        end; }
      { DRIVE_REMOTE:
        begin
        Form1.ComboBox1.Items.Add(UpperCase(drive) + ':\ [' +
        GetDriveVolume(drive) + ' ]');
        application.ProcessMessages;
        end; }
      { DRIVE_RAMDISK:
        begin
        Form1.ComboBox1.Items.Add(UpperCase(Drive) + ':\ [' +
        GetDriveVolume(Drive) + ' ]');
        end; }
    end;
  end;
  Form1.ComboBoxDrive.ItemIndex := 0;
end;

end.

