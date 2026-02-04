unit Unit_Exclusion;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  StdCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    TabControl1: TTabControl;
    ButtonCancelException: TButton;
    ButtonAddExceptions: TButton;
    ButtonChangeExceptions: TButton;
    TabControl2: TTabControl;
    EditExceptions: TEdit;
    LabelException: TLabel;
    procedure ButtonCancelExceptionClick(Sender: TObject);
    procedure ButtonChangeExceptionsClick(Sender: TObject);
    procedure EditExceptionsChange(Sender: TObject);
    procedure ButtonAddExceptionsClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit_Base;
{$R *.dfm}

procedure TForm2.ButtonCancelExceptionClick(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.ButtonChangeExceptionsClick(Sender: TObject);
begin
  Form1.ListViewExclusion.Selected.Caption := Form2.EditExceptions.Text;
  Form2.Close;
end;

procedure TForm2.EditExceptionsChange(Sender: TObject);
begin
  if Form2.EditExceptions.Text = '' then
    Form2.ButtonChangeExceptions.Enabled := false;
  if Form2.EditExceptions.Text <> '' then
    Form2.ButtonChangeExceptions.Enabled := true;
  if Form2.EditExceptions.Text = '' then
    Form2.ButtonAddExceptions.Enabled := false;
  if Form2.EditExceptions.Text <> '' then
    Form2.ButtonAddExceptions.Enabled := true;
end;

procedure TForm2.ButtonAddExceptionsClick(Sender: TObject);
begin
  Form1.AddExl(Form2.EditExceptions.Text, true, Form1.ListViewExclusion);
  Form2.Close;
  Form1.StatusBar4.Panels[0].Text :=
    IntToStr(Form1.ListViewExclusion.Items.Count);
end;

end.
