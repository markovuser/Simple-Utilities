Program SULauncher;

uses
  Forms,
  windows,
  Unit_Base in 'Unit_Base\Unit_Base.pas' {Form1},
  Unit_About in 'Unit_About\Unit_About.pas' {Form8},
  Vcl.Themes,
  Vcl.Styles,
  WindowsDarkMode in 'Units\WindowsDarkMode\WindowsDarkMode.pas',
  Translation in 'Units\Translation\Translation.pas',
  Unit_Update in 'Unit_Update\Unit_Update.pas' {Form10},
  FileInfoUtils in 'Units\FileInfoUtils\FileInfoUtils.pas';

{$R *.res}

Var
  HM: THandle;

Function Check: boolean;
Begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'Simple Utilities');
  Result := (HM <> 0);
  If HM = 0 Then
    HM := CreateMutex(Nil, false, 'Simple Utilities');
End;

Begin
  // Проверка на запуск второй копии программы
  If Check Then
    exit;
  SetThreadLocale(1049);
  Application.Initialize;
  Application.Title := 'Simple Utilities';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm10, Form10);
  Form1.LoadLanguage;
  Form1.CleanTranslationsLikeGlobload;
  Form1.Globload;
  Form1.LoadNastr;
  If Not Form1.IsWindows10Or11 Then
  Begin
    MessageBox(0, Pchar(Form1.LangOnlyWindows.Caption), Pchar(Form1.LangError.Caption), MB_ICONERROR);
    exit;
  End;
  Application.Run;

End.

