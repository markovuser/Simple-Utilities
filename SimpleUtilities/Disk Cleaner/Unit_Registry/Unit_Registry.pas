unit Unit_Registry;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  StdCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    TabControl1: TTabControl;
    ButtonCancelReg: TButton;
    ButtonAddReg: TButton;
    ButtonChangeReg: TButton;
    TabControl2: TTabControl;
    EditRegKey: TEdit;
    LabelRegKey: TLabel;
    procedure ButtonCancelRegClick(Sender: TObject);
    procedure ButtonChangeRegClick(Sender: TObject);
    procedure EditRegKeyChange(Sender: TObject);
    procedure ButtonAddRegClick(Sender: TObject);
    procedure TabControl2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit_Base;
{$R *.dfm}

procedure TForm4.ButtonCancelRegClick(Sender: TObject);
begin
  Form4.Close;
end;

procedure TForm4.ButtonChangeRegClick(Sender: TObject);
begin
  Form1.ListViewExclusionReg.Selected.Caption := Form4.EditRegKey.Text;
  Application.ProcessMessages;
  Form4.Close;
end;

procedure TForm4.EditRegKeyChange(Sender: TObject);
begin
  if Form4.EditRegKey.Text = '' then
    Form4.ButtonAddReg.Enabled := FALSE;
  if Form4.EditRegKey.Text <> '' then
    Form4.ButtonAddReg.Enabled := true;
  if Form4.EditRegKey.Text = '' then
    Form4.ButtonChangeReg.Enabled := FALSE;
  if Form4.EditRegKey.Text <> '' then
    Form4.ButtonChangeReg.Enabled := true;
end;

procedure TForm4.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
end;

procedure TForm4.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
end;

procedure TForm4.TabControl1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
end;

procedure TForm4.TabControl2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
end;

procedure TForm4.ButtonAddRegClick(Sender: TObject);
begin
  with Form1.ListViewExclusionReg.Items.Add do
  begin
    Caption := Form4.EditRegKey.Text;;
    SubItems.Add('');
    Checked := true;
    Application.ProcessMessages;
  end;
end;

end.
