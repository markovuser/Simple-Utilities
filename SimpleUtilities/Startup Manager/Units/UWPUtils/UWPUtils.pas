Unit UWPUtils;

Interface

Uses
  SysUtils, Classes, Registry, Windows, ShlObj, ShellAPI, StrUtils, Variants,
  ActiveX, MSXML;

Type
  TUWPAppInfo = Record
    PackageName: String;
    DisplayName: String;
    ExecutablePath: String;
    InstallFolder: String;
    IsEnabled: Boolean;
    TaskName: String;
    IconIndex: Integer;
  End;

Function GetWindowsAppsPath: String;

Function GetUWPAppName(Const PackageName: String): String;

Function GetUWPAppDisplayName(Const PackageName: String): String;

Function GetUWPAppInstallFolder(Const PackageName: String): String;

Function GetUWPPackageFullName(Const PackageName: String): String;

Function GetUWPAppExecutableByPackageFullName(Const PackageName: String): String;

Function GetUWPAppPath(Const PackageName: String): String;

Function GetUWPAppIconIndex(Const PackageName: String): Integer;

Procedure SetUWPStartupState(Const PackageName, TaskName: String; Enabled: Boolean);

Implementation

Function IsVersionNumber(Const Str: String): Boolean; Forward;

Function ExtractBasePackageNameFromFolder(Const FolderName: String): String; Forward;

Function IsValidPackageFolder(Const FolderName, PackageName: String): Boolean; Forward;

Function FindPackageFullName(Const PackageName: String): String; Forward;

Function GetWindowsAppsPath: String;
Begin
  Result := GetEnvironmentVariable('ProgramW6432') + '\WindowsApps\';
  If DirectoryExists(Result) Then
    Exit;

  Result := GetEnvironmentVariable('ProgramFiles') + '\WindowsApps\';
  If DirectoryExists(Result) Then
    Exit;

  Result := '';
End;

function GetUWPAppName(const PackageName: string): string;
var
  i:Integer;
begin
  Result := '';
  // Если не нашли в реестре, извлекаем из имени пакета
  if Result = '' then
  begin
    Result := PackageName;

    // Ищем первую точку и удаляем все до нее включительно
    i := Pos('.', Result);
    if i > 0 then
      Delete(Result, 1, i);

    // Ищем первое подчеркивание и обрезаем все после него
    i := Pos('_', Result);
    if i > 0 then
      SetLength(Result, i - 1);
  end;
end;

Function GetUWPAppInstallFolder(Const PackageName: String): String;
Var
  reg: TRegistry;
  searchPath: String;
  sr: TSearchRec;
  FindResult: Integer;
Begin
  Result := '';
  searchPath := GetWindowsAppsPath;
  If searchPath = '' Then
    Exit;

  FindResult := SysUtils.FindFirst(searchPath + PackageName + '*', faDirectory, sr);
  If FindResult = 0 Then
  Begin
    Try
      Repeat
        If (sr.Attr And faDirectory) <> 0 Then
        Begin
          If Pos(PackageName, sr.Name) = 1 Then
          Begin
            Result := searchPath + sr.Name + '\';
            Break;
          End;
        End;
      Until SysUtils.FindNext(sr) <> 0;
    Finally
      SysUtils.FindClose(sr);
    End;
  End;

  If Result = '' Then
  Begin
    reg := TRegistry.Create(KEY_READ);
    Try
      reg.RootKey := HKEY_CLASSES_ROOT;
      If reg.OpenKey('Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages\' + PackageName, False) Then
      Begin
        Result := reg.ReadString('PackageRootFolder');
        reg.CloseKey;
        If (Result <> '') And (Result[Length(Result)] <> '\') Then
          Result := Result + '\';
      End;
    Finally
      reg.Free;
    End;
  End;
End;

Function IsVersionNumber(Const Str: String): Boolean;
Var
  i: Integer;
Begin
  Result := False;
  If Str = '' Then
    Exit;

  For i := 1 To Length(Str) Do
  Begin
    If Not ((Str[i] >= '0') And (Str[i] <= '9') Or (Str[i] = '.')) Then
      Exit;
  End;
  Result := True;
End;

Function ExtractReadableName(Const PackageName: String): String;
Var
  i: Integer;
  parts: TStringList;
  temp: String;
  dotPos, underscorePos: Integer;
Begin
  Result := PackageName;

  // Удаляем все ДО первой точки (включая точку)
  dotPos := Pos('.', Result);
  If dotPos > 0 Then
    Result := Copy(Result, dotPos + 1, Length(Result));

  // Удаляем все ПОСЛЕ первого подчеркивания (включая подчеркивание)
  underscorePos := Pos('_', Result);
  If underscorePos > 0 Then
    Result := Copy(Result, 1, underscorePos - 1);

  parts := TStringList.Create;
  Try
    temp := Result;
    For i := 1 To Length(temp) Do
    Begin
      If (temp[i] = '_') Or (temp[i] = '.') Then
        temp[i] := ' ';
    End;

    parts.Delimiter := ' ';
    parts.DelimitedText := temp;

    // Удаляем пустые строки и версии
    For i := parts.Count - 1 Downto 0 Do
    Begin
      If (parts[i] = '') Or (IsVersionNumber(parts[i])) Then
        parts.Delete(i);
    End;

    Result := '';
    For i := 0 To parts.Count - 1 Do
    Begin
      If Result <> '' Then
        Result := Result + ' ';
      Result := Result + parts[i];
    End;
  Finally
    parts.Free;
  End;

  Result := Trim(Result);
  If Result <> '' Then
    Result[1] := UpCase(Result[1]);

  If Result = '' Then
    Result := PackageName;
End;

Function GetUWPAppDisplayName(Const PackageName: String): String;
Var
  installFolder, manifestPath: String;
  xmlDoc: IXMLDOMDocument;
  node: IXMLDOMNode;
Begin
  Result := '';
  installFolder := GetUWPAppInstallFolder(PackageName);
  If installFolder <> '' Then
  Begin
    manifestPath := installFolder + 'AppxManifest.xml';
    If FileExists(manifestPath) Then
    Begin
      Try
        CoInitialize(Nil);
        Try
          xmlDoc := CoDOMDocument.Create;
          xmlDoc.async := False;
          xmlDoc.load(manifestPath);
          If xmlDoc.parseError.errorCode = 0 Then
          Begin
            node := xmlDoc.selectSingleNode('//Package/Properties/DisplayName');
            If node <> Nil Then
              Result := node.text;
          End;
        Finally
          CoUninitialize;
        End;
      Except
        // Ignore errors
      End;
    End;
  End;

  If Result = '' Then
    Result := ExtractReadableName(PackageName);
End;

Function GetUWPPackageFullName(Const PackageName: String): String;
Var
  reg: TRegistry;
  regPath: String;
Begin
  Result := '';
  reg := TRegistry.Create(KEY_READ);
  Try
    reg.RootKey := HKEY_CURRENT_USER;
    regPath := 'SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\' + PackageName + '\Schemas';
    If reg.OpenKey(regPath, False) Then
    Begin
      Result := reg.ReadString('PackageFullName');
      reg.CloseKey;
    End;
  Finally
    reg.Free;
  End;
End;

Function ExtractBasePackageNameFromFolder(Const FolderName: String): String;
Var
  i, j: Integer;
Begin
  Result := '';
  i := Pos('__', FolderName);
  If i > 0 Then
  Begin
    j := Pos('_', Copy(FolderName, 1, i - 1));
    If j > 0 Then
    Begin
      Result := Copy(FolderName, 1, j) + Copy(FolderName, i + 2, Length(FolderName));
    End;
  End;
End;

Function IsValidPackageFolder(Const FolderName, PackageName: String): Boolean;
Var
  basePackageName: String;
Begin
  basePackageName := ExtractBasePackageNameFromFolder(FolderName);
  Result := SameText(basePackageName, PackageName);
End;

Function FindPackageFullName(Const PackageName: String): String;
Var
  windowsAppsPath, searchPattern: String;
  sr: TSearchRec;
  FindResult: Integer;
Begin
  Result := '';
  windowsAppsPath := GetWindowsAppsPath;
  If windowsAppsPath = '' Then
    Exit;

  searchPattern := windowsAppsPath + '*' + PackageName + '*';
  FindResult := SysUtils.FindFirst(searchPattern, faDirectory, sr);
  If FindResult = 0 Then
  Begin
    Try
      Repeat
        If (sr.Attr And faDirectory) <> 0 Then
        Begin
          If (sr.Name <> '.') And (sr.Name <> '..') Then
          Begin
            If IsValidPackageFolder(sr.Name, PackageName) Then
            Begin
              Result := sr.Name;
              Break;
            End;
          End;
        End;
      Until SysUtils.FindNext(sr) <> 0;
    Finally
      SysUtils.FindClose(sr);
    End;
  End;
End;

// Вспомогательная функция для извлечения текста между разделителями
Function ExtractBetween(const Text, StartDelim, EndDelim: String): String;
var
  startPos, endPos: Integer;
begin
  Result := '';
  startPos := Pos(StartDelim, Text);
  if startPos > 0 then
  begin
    startPos := startPos + Length(StartDelim);
    endPos := Pos(EndDelim, Text, startPos);
    if (endPos > startPos) then
      Result := Copy(Text, startPos, endPos - startPos);
  end;
end;

// Новая версия функции, использующая XML для извлечения имени исполняемого файла
Function GetUWPAppExecutableByPackageFullName(Const PackageName: String): String;
Var
  packageFullName, windowsAppsPath, appFolder, manifestPath, executableName: String;
  manifestContent: TStringList;
  i, j: Integer;
  line: String;
Begin
  Result := '';

  // Получаем полное имя пакета
  packageFullName := GetUWPPackageFullName(PackageName);
  If packageFullName = '' Then
    packageFullName := FindPackageFullName(PackageName);

  If packageFullName = '' Then
    Exit;

  // Получаем путь к WindowsApps
  windowsAppsPath := GetWindowsAppsPath;
  If windowsAppsPath = '' Then
    Exit;

  // Формируем путь к папке приложения
  appFolder := windowsAppsPath + packageFullName + '\';
  If Not DirectoryExists(appFolder) Then
    Exit;

  // Путь к файлу манифеста
  manifestPath := appFolder + 'AppxManifest.xml';
  If Not FileExists(manifestPath) Then
    Exit;

  // Читаем XML файл и ищем Executable
  manifestContent := TStringList.Create;
  Try
    Try
      manifestContent.LoadFromFile(manifestPath, TEncoding.UTF8);

      // Ищем строку с Application элементом
      executableName := '';
      for i := 0 to manifestContent.Count - 1 do
      begin
        line := manifestContent[i];

        // Ищем <Application с атрибутом Executable
        if Pos('<Application', line) > 0 then
        begin
          // Проверяем текущую строку
          if Pos('Executable="', line) > 0 then
          begin
            executableName := ExtractBetween(line, 'Executable="', '"');
            Break;
          end
          else
          begin
            // Проверить следующие несколько строк (атрибуты могут быть на следующей строке)
            for j := i + 1 to i + 3 do
            begin
              if j < manifestContent.Count then
              begin
                if Pos('Executable="', manifestContent[j]) > 0 then
                begin
                  executableName := ExtractBetween(manifestContent[j], 'Executable="', '"');
                  Break;
                end
                else if Pos('>', manifestContent[j]) > 0 then
                begin
                  // Достигли конца тега Application
                  Break;
                end;
              end;
            end;
            if executableName <> '' then
              Break;
          end;
        end;
      end;

      // Если нашли имя исполняемого файла, формируем полный путь
      if executableName <> '' then
      begin
        Result := appFolder + executableName;
      end;

    Except
      on E: Exception do
        Result := ''; // В случае ошибки возвращаем пустую строку
    end;
  Finally
    manifestContent.Free;
  End;
End;

Function GetUWPAppPath(Const PackageName: String): String;
Begin
  Result := GetUWPAppExecutableByPackageFullName(PackageName);
  If Result = '' Then
    Result := GetUWPAppDisplayName(PackageName);
End;

Function GetUWPAppIconIndex(Const PackageName: String): Integer;
Var
  ShInfo: TSHFileInfo;
  exePath: String;
Begin
  Result := -1;
  exePath := GetUWPAppExecutableByPackageFullName(PackageName);

  If FileExists(exePath) Then
  Begin
    If SHGetFileInfo(PChar(exePath), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX) <> 0 Then
      Result := ShInfo.iIcon;
  End
  Else
  Begin
    If SHGetFileInfo(PChar(PackageName + '!App'), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX Or SHGFI_USEFILEATTRIBUTES) <> 0 Then
    Begin
      Result := ShInfo.iIcon;
    End;
  End;
End;

Procedure SetUWPStartupState(Const PackageName, TaskName: String; Enabled: Boolean);
Var
  reg: TRegistry;
  regPath: String;
  stateValue: Integer;
Begin
  reg := TRegistry.Create(KEY_WRITE);
  Try
    reg.RootKey := HKEY_CURRENT_USER;
    regPath := 'SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\' + PackageName + '\' + TaskName;

    If reg.OpenKey(regPath, True) Then
    Begin
      If Enabled Then
        stateValue := 2
      Else
        stateValue := 1;

      reg.WriteInteger('State', stateValue);
      reg.CloseKey;
    End;
  Finally
    reg.Free;
  End;
End;

End.
