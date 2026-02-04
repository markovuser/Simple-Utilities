unit Translation;

interface

uses
  Classes,
  ActnMan,
  ComCtrls,
  DBCtrls,
  ExtCtrls,
  Forms,
  SysUtils,
  TypInfo,
  StdCtrls,
  Buttons,
  Dialogs,
  Controls,
  IniFiles,
  Windows,
  checklst,
  fileCtrl;

type
  TTranslation = object
  private
    FForm: TForm;
    Translated: TStringList;
    NotTranslated: TStringList;
    FSectionName: string; // Добавлено поле для хранения имени секции
  public
    procedure Execute(Form: TForm; const SectionName: string); // Добавлен параметр SectionName
    procedure CheckAndSetComponentPropertyString(var s: string;
      const PropName: string); overload;
    procedure CheckAndSetComponentPropertyString(const prop: string;
      var cm: TObject); overload;
    procedure CheckAndSetComponentPropertyStrings(prop: TStrings;
      const PropName: string);
    function GetString(const CompName, Value: string): string;
  end;

implementation

uses Unit_Base;

procedure TTranslation.CheckAndSetComponentPropertyString(var s: string;
  const PropName: string);
var
  TempInt: integer;
  strValue: string;
begin
  if (s <> '') and (s <> '-') and not TryStrToInt(s, TempInt) then
  begin
    strValue := GetString(PropName, s);
    Application.ProcessMessages;
    if strValue <> '' then
      s := strValue;
    Application.ProcessMessages;
  end;
end;

procedure TTranslation.CheckAndSetComponentPropertyString(const prop: string;
  var cm: TObject);
var
  TempInt: integer;
  strValue: string;
begin
  if assigned(GetPropInfo(cm, prop)) then
  begin
    strValue := GetPropValue(cm, prop);
    Application.ProcessMessages;
    if (strValue <> '') and (strValue <> '-') and
      not TryStrToInt(strValue, TempInt) then
    begin
      strValue := GetString(FForm.Name + '.' + (cm as TComponent).Name + '.' +
        prop, strValue);
      Application.ProcessMessages;
      if strValue <> '' then
        SetPropValue(cm, prop, strValue);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TTranslation.CheckAndSetComponentPropertyStrings(prop: TStrings;
  const PropName: string);
var
  i: integer;
  TempInt: integer;
  Strings: TStringList;
  strValue: string;
begin
  Strings := TStringList.Create;
  Application.ProcessMessages;
  try
    Strings.Assign(prop);
    Application.ProcessMessages;
    for i := 0 to Strings.Count - 1 do
    begin
      strValue := Strings[i];
      Application.ProcessMessages;
      if (strValue <> '') and (strValue <> '-') and
        not TryStrToInt(strValue, TempInt) then
      begin
        strValue := GetString(Format('%s[%d]', [PropName, i]), strValue);
        if strValue <> '' then
          prop[i] := strValue;
        Application.ProcessMessages;
      end;
    end;
  finally
    Strings.Free;
  end;
end;

procedure TTranslation.Execute(Form: TForm; const SectionName: string); // Измененная сигнатура
var
  lang_file, log_File: string;
  i, j, k, Tree: integer;
  cm: TObject;
  strValue: string;
  s, S_Tree, lang, Path: string;
  Ini: TMemIniFile;
begin
  try
    FSectionName := SectionName; // Сохраняем имя секции
    Ini := TMemIniFile.Create(Form1.PortablePath);
    lang := Ini.ReadString('Language', 'Language', '');
    lang_file := ExtractFilePath(ParamStr(0)) + 'Language\' + lang + '.ini';
    Path := ExtractFilePath(ParamStr(0));
    Path := ExtractFilePath(ExcludeTrailingPathDelimiter(Path));
    log_File := Path + Application.Title + '.log';
    if not FileExists(lang_file) then
      Exit;
    Translated := TStringList.Create;
    NotTranslated := TStringList.Create;

    // Загружаем только указанную секцию
    Ini.Free;
    Ini := TMemIniFile.Create(lang_file);
    Ini.CaseSensitive := False;
    Ini.ReadSectionValues(FSectionName, Translated); // Читаем только нужную секцию

    if FileExists(log_File) then
    begin
      NotTranslated.LoadFromFile(log_File);
    end;
    FForm := Form;
    if FForm <> Form1 then
      Form.Caption := GetString(FForm.Name + '.Caption', Form.Caption);
    for i := 0 to Form.ComponentCount - 1 do
    begin
      cm := Form.Components[i];
      if cm is TComboBox then
        continue;
      if cm is TStatusBar then
        continue;
      if (cm is TTrayIcon) then
       continue;

      CheckAndSetComponentPropertyString('Caption', cm);
      CheckAndSetComponentPropertyString('Hint', cm);
      CheckAndSetComponentPropertyString('Title', cm);
      CheckAndSetComponentPropertyString('Text', cm);
      CheckAndSetComponentPropertyString('TextHint', cm);
      Application.ProcessMessages;
      // TLabeledEdit
      if cm is TLabeledEdit then
      begin
        strValue := (cm as TLabeledEdit).EditLabel.Caption;
        if (strValue <> '') and (strValue <> '-') then
        begin
          strValue := GetString(FForm.Name + '.' + (cm as TComponent).Name +
            '.Caption', strValue);
          Application.ProcessMessages;
          if strValue <> '' then
          begin
            (cm as TLabeledEdit).EditLabel.Caption := strValue
          end;
        end;
      end;
      // TActionManager
      if cm is TActionManager then
      begin
        for j := 0 to TActionManager(cm).ActionBars.Count - 1 do
          for k := 0 to TActionManager(cm).ActionBars[j].Items.Count - 1 do
          begin
            cm := TActionManager(cm).ActionBars[j].Items[k];
            Application.ProcessMessages;
          end;
      end;
      // TOpenDialog
      if cm is TOpenDialog then
      begin
        CheckAndSetComponentPropertyString('Filter', cm);
        Application.ProcessMessages;
      end;
      // TSaveDialog
      if cm is TSaveDialog then
      begin
        CheckAndSetComponentPropertyString('Filter', cm);
        Application.ProcessMessages;
      end;
      // TLabeledEdit
      if cm is TLabeledEdit then
      begin
        cm := TLabeledEdit(cm).EditLabel;
        CheckAndSetComponentPropertyString('Caption', cm);
        Application.ProcessMessages;
      end;
      // TTreeView
      if cm is TTreeView then
      begin
        for Tree := 0 to TTreeView(cm).Items.Count - 1 do
        begin
          S_Tree := TTreeView(cm).Items.Item[Tree].Text;
          CheckAndSetComponentPropertyString(S_Tree,
            FForm.Name + '.' + (cm as TComponent).Name + '.Items.Item[' +
            inttostr(Tree) + '].Text');
          TTreeView(cm).Items.Item[Tree].Text := S_Tree;
          Application.ProcessMessages;
        end;
      end;

      // TListView  Columns
      if cm is TListView then
      begin
        for j := 0 to TListView(cm).Columns.Count - 1 do
        begin
          s := TListView(cm).Columns[j].Caption;
          CheckAndSetComponentPropertyString(s,
            FForm.Name + '.' + (cm as TComponent).Name + '.Columns[' +
            inttostr(j) + '].Caption');
          TListView(cm).Columns[j].Caption := s;
          Application.ProcessMessages;
        end;
      end;
      // TListView  Groups
      {if cm is TListView then
      begin
        for j := 0 to TListView(cm).Groups.Count - 1 do
        begin
          s := TListView(cm).Groups[j].Header;
          CheckAndSetComponentPropertyString(s,
            FForm.Name + '.' + (cm as TComponent).Name + '.Groups[' +
            inttostr(j) + '].Header');
          TListView(cm).Groups[j].Header := s;
          Application.ProcessMessages;
        end;
      end;}
      // TListView  items
     { if cm is TListView then
      begin
        for j := 0 to TListView(cm).Items.Count - 1 do
        begin
          s := TListView(cm).Items[j].Caption;
          CheckAndSetComponentPropertyString(s,
            FForm.Name + '.' + (cm as TComponent).Name + '.items[' + inttostr(j)
            + '].Caption');
          TListView(cm).Items[j].Caption := s;
          Application.ProcessMessages;
        end;
      end;}
      // TFilterComboBox
      if cm is TFilterComboBox then
      begin
        CheckAndSetComponentPropertyString('Filter', cm);
        Application.ProcessMessages;
      end;
      // TTabControl
      if cm is TTabControl then
      begin
        CheckAndSetComponentPropertyStrings((cm as TTabControl).Tabs,
          FForm.Name + '.' + (cm as TComponent).Name + '.Tabs ');
        Application.ProcessMessages;
      end;
      // TCheckListBox
      if cm is TCheckListBox then
      begin
        CheckAndSetComponentPropertyStrings((cm as TCheckListBox).Items,
          FForm.Name + '.' + (cm as TComponent).Name + '.Items ');
        Application.ProcessMessages;
      end;
      // THeaderControl
      if cm is THeaderControl then
      begin
        for j := 0 to THeaderControl(cm).sections.Count - 1 do
        begin
          s := THeaderControl(cm).sections[j].Text;
          CheckAndSetComponentPropertyString(s,
            FForm.Name + '.' + (cm as TComponent).Name + '.Text');
          THeaderControl(cm).sections[j].Text := s;
          Application.ProcessMessages;
        end;
      end;
    end;

    Translated.Free;
    Application.ProcessMessages;
    if FileExists(log_File) = true then
    begin
      if NotTranslated.Count > 0 then
      begin
        NotTranslated.SaveToFile(log_File, TEncoding.Unicode);
      end;
    end;
    NotTranslated.Free;
    Application.ProcessMessages;
  except
  end;
end;

function TTranslation.GetString(const CompName, Value: string): string;
var
  i: integer;
  function IndexOf(const Value: string): integer;
  var
    i: integer;
  begin
    Result := -1;
    for i := 0 to Translated.Count - 1 do
      if AnsiSameText(Copy(Translated[i], 1, Pos('=', Translated[i]) - 1), Value) then
      begin
        Result := i;
        Break;
      end;
  end;

begin
  i := IndexOf(CompName);
  if i = -1 then
  begin
    NotTranslated.Add(CompName + '=' + Value);
    Application.ProcessMessages;
    Result := Value;
  end
  else
  begin
    Result := Copy(Translated[i], Length(CompName) + 2, MaxInt);
    Translated.Delete(i);
    Application.ProcessMessages;
  end;
end;

end.
