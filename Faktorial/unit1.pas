unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    edtJumlah: TEdit;
    edtFaktorial: TEdit;
    edtN: TEdit;
    gbHasil: TGroupBox;
    lbJumlah: TLabel;
    lbFaktorial: TLabel;
    lbN: TLabel;
    procedure btnHitungClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function HitungFaktorial(N: Integer): Integer;
begin
  if N <= 1 then
    Result := 1
  else
    Result := N * HitungFaktorial(N - 1);
end;

procedure TForm1.btnHitungClick(Sender: TObject);
var
  N, i, Faktorial, jumlah: Integer;
begin
  N := StrToIntDef(edtN.Text, 0);

  if N < 0 then
  begin
    ShowMessage('Masukkan bilangan bulat non-negatif.');
    Exit;
  end;

  Faktorial := HitungFaktorial(N);
  edtFaktorial.Text := IntToStr(Faktorial);

  Jumlah := 0;
  for i := 1 to N do
      Jumlah := Jumlah + i;

  edtJumlah.Text := IntToStr(Jumlah);
end;

end.

