program UninstallManager;

uses
  Forms,
  windows,
  Unit_Base in 'Unit_Base\Unit_Base.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  WindowsDarkMode in 'Units\WindowsDarkMode\WindowsDarkMode.pas',
  Translation in 'Units\Translation\Translation.pas',
  FileInfoUtils in 'Units\FileInfoUtils\FileInfoUtils.pas';

{$R *.res}

Var
  HM: THandle;

function Check: boolean;
begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false,
    'Simple Utilities Uninstall Manager');
  Result := (HM <> 0);
  if HM = 0 then
    HM := CreateMutex(nil, false, 'Simple Utilities Uninstall Manager');
end;

begin
  // Проверка на запуск второй копии программы
  If Check then
    exit;
  SetThreadLocale(1049);
  Application.Initialize;
  Application.Title := 'Uninstall Manager';
  Application.CreateForm(TForm1, Form1);
  Form1.LoadNastr;
  Form1.CleanTranslationsLikeGlobload;
  Form1.globLoad;
  if not Form1.IsWindows10Or11 then
  begin
    MessageBox(0, Pchar(Form1.LangOnlyWindows.Caption),
      Pchar(Form1.LangError.Caption), MB_ICONERROR);
    exit;
  end;

  Application.Run;

end.
