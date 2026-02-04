Program StartupManager;

uses
  Forms,
  windows,
  Unit_Base in 'Unit_Base\Unit_Base.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  WindowsDarkMode in 'Units\WindowsDarkMode\WindowsDarkMode.pas',
  WinTask in 'Units\WinTask\WinTask.pas',
  TaskSchedApi in 'Units\WinTask\TaskSchedApi.pas',
  WinTaskConsts in 'Units\WinTask\WinTaskConsts.pas',
  Translation in 'Units\Translation\Translation.pas',
  FileInfoUtils in 'Units\FileInfoUtils\FileInfoUtils.pas',
  UWPUtils in 'Units\UWPUtils\UWPUtils.pas',
  TaskScheduler_TLB in 'Units\WinTask\TaskScheduler_TLB.pas';

{$R *.res}

Var
  HM: THandle;

Function Check: boolean;
Begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'Simple Utilities Startup Manager');
  Result := (HM <> 0);
  If HM = 0 Then
    HM := CreateMutex(Nil, false, 'Simple Utilities Startup Manager');
End;

Begin
  // Проверка на запуск второй копии программы
  If Check Then
    exit;
  SetThreadLocale(1049);
  Application.Initialize;
  Application.Title := 'Startup Manager';
  Application.CreateForm(TForm1, Form1);
  form1.CleanTranslationsLikeGlobload;
  form1.Globload;
  If Not form1.IsWindows10Or11 Then
  Begin
    MessageBox(0, Pchar(form1.LangOnlyWindows.Caption), Pchar(form1.LangError.Caption), MB_ICONERROR);
    exit;
  End;
  Application.Run;

End.

