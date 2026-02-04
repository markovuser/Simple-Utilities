unit Unit_Filter;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  StdCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    TabControl1: TTabControl;
    ButtonCancelFilter: TButton;
    ButtonAddFilter: TButton;
    ButtonChangeFilter: TButton;
    TabControl2: TTabControl;
    EditFilter: TEdit;
    LabelFilter: TLabel;
    procedure ButtonCancelFilterClick(Sender: TObject);
    procedure ButtonChangeFilterClick(Sender: TObject);
    procedure EditFilterChange(Sender: TObject);
    procedure ButtonAddFilterClick(Sender: TObject);
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
  Form3: TForm3;

implementation

uses Unit_Base;
{$R *.dfm}

procedure TForm3.ButtonCancelFilterClick(Sender: TObject);
begin
  Form3.Close;
end;

procedure TForm3.ButtonChangeFilterClick(Sender: TObject);
begin
  Form1.ListViewFilter.Selected.Caption := Form3.EditFilter.Text;
  Form3.Close;
end;

procedure TForm3.EditFilterChange(Sender: TObject);
begin
  if Form3.EditFilter.Text = '' then
    Form3.ButtonAddFilter.Enabled := false;
  if Form3.EditFilter.Text <> '' then
    Form3.ButtonAddFilter.Enabled := true;
  if Form3.EditFilter.Text = '' then
    Form3.ButtonChangeFilter.Enabled := false;
  if Form3.EditFilter.Text <> '' then
    Form3.ButtonChangeFilter.Enabled := true;
end;

procedure TForm3.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
end;

procedure TForm3.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
end;

procedure TForm3.TabControl1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
end;

procedure TForm3.TabControl2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
end;

procedure TForm3.ButtonAddFilterClick(Sender: TObject);
begin
  Form1.AddExt(Form3.EditFilter.Text, true, Form1.ListViewFilter);
  Form3.Close;
  Form1.StatusBar4.Panels[0].Text :=Form1.LangTotalFilters.caption+ ' ' +
    IntToStr(Form1.ListViewFilter.Items.Count);
end;

end.
