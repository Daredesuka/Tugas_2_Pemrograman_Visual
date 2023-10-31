unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnTotal: TButton;
    btnIsiDataLagi: TButton;
    btnKeluar: TButton;
    cbJabatan: TComboBox;
    edtNamaPegawai: TEdit;
    edtGajiPokok: TEdit;
    edtStatusTunjangan: TEdit;
    edtGajiBersih: TEdit;
    gbStatus: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rbTetap: TRadioButton;
    rbHonorer: TRadioButton;
    procedure btnIsiDataLagiClick(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure cbJabatanClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure rbHonorerChange(Sender: TObject);
    procedure rbTetapChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.cbJabatanClick(Sender: TObject);
begin
  if cbJabatan.Text = 'Direktur' then
  edtGajiPokok.Text := '5000000'
  else if cbJabatan.Text = 'Manajer' then
  edtGajiPokok.Text := '3000000'
  else if cbJabatan.Text = 'Karyawan' then
  edtGajiPokok.Text := '2000000'
  else edtGajiPokok.Text := '0'
end;

procedure TForm1.btnTotalClick(Sender: TObject);
var a,b,c:integer;
begin
  a := StrToInt(edtGajiPokok.Text);
  b := StrToInt(edtStatusTunjangan.Text);
  c := a+b;
  edtGajiBersih.Text := IntToStr(c);

end;

procedure TForm1.btnIsiDataLagiClick(Sender: TObject);
begin
  cbJabatan.Text := 'Jabatan';
  edtNamaPegawai.Text := ' ';
  edtGajiBersih.Text := '0';
  edtStatusTunjangan.Text := '0';
  edtGajiPokok.Text := '0';
  rbHonorer.Checked := false;
  rbTetap.Checked := false;
end;

procedure TForm1.btnKeluarClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.rbHonorerChange(Sender: TObject);
begin
  if rbHonorer.Checked = true then
   edtStatusTunjangan.Text :='500000';
end;

procedure TForm1.rbTetapChange(Sender: TObject);
begin
  if rbTetap.Checked = true then
  edtStatusTunjangan.Text :='1500000';
end;

end.

