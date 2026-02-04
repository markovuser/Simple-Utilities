Program AttributesManager;

uses
  Forms,
  Windows,
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
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'Simple Utilities Attributes Manager');
  Result := (HM <> 0);
  If HM = 0 Then
    HM := CreateMutex(Nil, false, 'Simple Utilities Attributes Manager');
End;

Begin
  Application.Initialize;
  Application.Title := 'Attributes Manager';
  Application.CreateForm(TForm1, Form1);
  form1.CleanTranslationsLikeGlobload;
  form1.globLoad;
  If Not form1.IsWindows10Or11 Then
  Begin
    MessageBox(0, Pchar(form1.LangOnlyWindows.Caption), Pchar(form1.LangError.Caption), MB_ICONERROR);
    exit;
  End;
  Application.Run;

End.

