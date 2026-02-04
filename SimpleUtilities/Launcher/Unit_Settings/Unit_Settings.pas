Unit Unit_Settings;

Interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, ShellApi, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, WindowsDarkMode, IniFiles, Registry,
  Vcl.Samples.Spin, Vcl.Grids, Vcl.Buttons, Vcl.Menus, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.Win.TaskbarCore,
  Vcl.Taskbar, IdSSLOpenSSL, Translation, Math, IdAuthentication;

Type
  TForm2 = Class(TForm)
    TabControlButtons: TTabControl;
    ButtonSave: TButton;
    TabControlTitle: TTabControl;
    Image1: TImage;
    TabControlBodyLeft: TTabControl;
    TreeViewOptions: TTreeView;
    TabControlBody: TTabControl;
    PageControlOptions: TPageControl;
    A0: TTabSheet;
    LabelInfo: TLabel;
    GroupBox2: TGroupBox;
    WindowCenter: TCheckBox;
    Procedure FormCreate(Sender: TObject);
    Procedure ButtonSaveClick(Sender: TObject);
    Procedure LoadNastr;
    Procedure SaveNastr;
    Procedure ListFileDir(Path, Ext: String; aCombobox: TComboBox);
    Procedure TreeViewOptionsClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);

  Private
    { Private declarations }
  Public
    { Public declarations }
  Protected
    Procedure CreateParams(Var Params: TCreateParams); Override;
  End;

Var
  Form2: TForm2;
  i: Int64;
  ThemeName: String;

Implementation

{$R *.dfm}

Uses
  Unit_Base;

Function ExtractOnlyFileName(Const FileName: String): String;
Begin
  Try
    Result := StringReplace(ExtractFileName(FileName), ExtractFileExt(FileName), '', []);
  Except
  End;
End;

Procedure TForm2.CreateParams(Var Params: TCreateParams);
Begin
  Inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle Or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
End;

Procedure TForm2.ButtonSaveClick(Sender: TObject);
Begin
  Form1.SaveNastr;
  application.ProcessMessages;
  Form2.Close;
  Try
    If WindowCenter.Checked = TRUE Then
    Begin
      Form1.Position := poDesktopCenter;
    End;
    If WindowCenter.Checked = false Then
    Begin
      Form1.Position := poDesigned;
    End;
    application.ProcessMessages;
  Except
  End;
End;

Procedure TForm2.LoadNastr;
Var
  Ini: TMemIniFile;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);
  Form2.WindowCenter.Checked := Ini.ReadBool('Position', Form2.WindowCenter.Name, false);
  Ini.Free;
End;

Procedure TForm2.SaveNastr;
Var
  Ini: TMemIniFile;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);
  Ini.WriteBool('Position', Form2.WindowCenter.Name, Form2.WindowCenter.Checked);
  Ini.UpdateFile;
  Ini.Free;
End;

Procedure TForm2.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  SaveNastr;
End;

Procedure TForm2.FormCreate(Sender: TObject);
Begin
  Try
    Image1.Picture := Form1.ImageTitle.Picture;
  Except
  End;
  TreeViewOptions.FullExpand;
  application.ProcessMessages;
  A0.TabVisible := false;
  PageControlOptions.ActivePageIndex := 0;
  TreeViewOptions.Selected := TreeViewOptions.Items[PageControlOptions.ActivePageIndex];
  LabelInfo.Caption := '';
  LabelInfo.Caption := TreeViewOptions.Selected.Text;
  Try
    TreeViewOptions.SetFocus;
  Except
  End;
  Form1.Globload;

  LoadNastr;
  //
End;

Procedure TForm2.FormShow(Sender: TObject);
Begin
  Try
    { SetWindowPos(Handle, HWND_TOPMOST, left, top, Width, Height,
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE); }
    Form2.TreeViewOptions.SetFocus;
    TreeViewOptionsClick(Sender);
    application.ProcessMessages;
  Except
  End;
End;

Procedure TForm2.TreeViewOptionsClick(Sender: TObject);
Begin
  PageControlOptions.ActivePageIndex := TreeViewOptions.Selected.AbsoluteIndex;
  LabelInfo.Caption := '';
  LabelInfo.Caption := TreeViewOptions.Selected.Text;
  application.ProcessMessages;
End;

Procedure TForm2.ListFileDir(Path, Ext: String; aCombobox: TComboBox);
Var
  SR: TSearchRec;
  Ini: TMemIniFile;
  LangName: String;
Begin
  If FindFirst(Path + Ext, faAnyFile, SR) = 0 Then
  Begin
    Repeat
      If (SR.Attr <> faDirectory) Then
      Begin
        Ini := TMemIniFile.Create(Path + SR.Name);
        LangName := Ini.ReadString('Language information', 'LANGNAME', '');
        aCombobox.Items.Add(ExtractOnlyFileName(SR.Name) + ' (' + LangName + ')');
        application.ProcessMessages;
        Ini.Free;
      End;
    Until FindNext(SR) <> 0;
    FindClose(SR);
    application.ProcessMessages;

  End;
End;



Function RemoveAfterChar(Const S: String; Ch: Char): String;
Var
  Index: Integer;
Begin
  Index := Pos(Ch, S);
  If Index = 0 Then
    Result := S
  Else
    Result := TrimRight(Copy(S, 1, Index - 1));
End;



End.

