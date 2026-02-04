Program RegistryCleaner;

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

Function Check: boolean;
Begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'Simple Utilities Registry Cleaner');
  Result := (HM <> 0);
  If HM = 0 Then
    HM := CreateMutex(Nil, false, 'Simple Utilities Registry Cleaner');
End;

Begin
  // Проверка на запуск второй копии программы
  If Check Then
    exit;
  SetThreadLocale(1049);
  Application.Initialize;
  Application.Title := 'Registry Cleaner';
  Application.CreateForm(TForm1, Form1);
  Form1.CleanTranslationsLikeGlobload;
  Form1.globload;
  If Not Form1.IsWindows10Or11 Then
  Begin
    MessageBox(0, Pchar(Form1.LangOnlyWindows.Caption), Pchar(Form1.LangError.Caption), MB_ICONERROR);
    exit;
  End;
  Application.Run;

End.

