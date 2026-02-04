Program DiskCleaner;

uses
  Forms,
  Windows,
  Unit_Base in 'Unit_Base\Unit_Base.pas' {Form1},
  Unit_Exclusion in 'Unit_Exclusion\Unit_Exclusion.pas' {Form2},
  Unit_Filter in 'Unit_Filter\Unit_Filter.pas' {Form3},
  Unit_Registry in 'Unit_Registry\Unit_Registry.pas' {Form4},
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
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'Simple Utilities Disk Cleaner');
  Result := (HM <> 0);
  If HM = 0 Then
    HM := CreateMutex(Nil, false, 'Simple Utilities Disk Cleaner');
End;

Begin
  // Проверка на запуск второй копии программы
  If Check Then
    exit;
  Application.Initialize;
  Application.Title := 'Disk Cleaner';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Form1.LoadNastr;
  Form1.LoadSearchFilters;
  Form1.CleanTranslationsLikeGlobload;
  Form1.globLoad;
  If Not Form1.IsWindows10Or11 Then
  Begin
    MessageBox(0, Pchar(Form1.LangOnlyWindows.Caption), Pchar(Form1.LangError.Caption), MB_ICONERROR);
    exit;
  End;
  Application.Run;

End.

