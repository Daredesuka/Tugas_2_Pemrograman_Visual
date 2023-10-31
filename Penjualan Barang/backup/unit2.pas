unit unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    btnUlang: TButton;
    btnKeluar: TButton;
    cbKodeBarang: TComboBox;
    edtQuantity: TEdit;
    edtNamaBarang: TEdit;
    edtHargaBarang: TEdit;
    edtSubTotal: TEdit;
    edtDiskon: TEdit;
    edtTotalBayar: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure btnHitungClick(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure btnUlangClick(Sender: TObject);
    procedure cbKodeBarangChange(Sender: TObject);
    procedure edtQuantityChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnHitungClick(Sender: TObject);
var
  subTotal: Real;
begin
  subTotal := StrToFloat(edtSubTotal.Text);
   if subTotal >= 100000 then
       begin
         edtDiskon.Text := '15';
         edtTotalBayar.Text := CurrToStr(0.15 * subTotal);
       end
    else
    if subTotal >= 50000 then
       begin
         edtDiskon.Text := '10';
         edtTotalBayar.Text := CurrToStr(0.10 * subTotal);
       end
    else
    if subTotal >= 50000 then
       begin
         edtDiskon.Text := '10';
         edtTotalBayar.Text := CurrToStr(0.10 * subTotal);
       end
    else
    if subTotal >= 25000 then
       begin
         edtDiskon.Text := '5';
         edtTotalBayar.Text := CurrToStr(0.5 * subTotal);
       end
    else
    begin
      edtDiskon.Text := '0';
      edtTotalBayar.Text := CurrToStr(subTotal);
    end;
end;

procedure TForm1.btnKeluarClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.btnUlangClick(Sender: TObject);
begin
  cbKodeBarang.Text := 'Pilih kode barang';
  edtQuantity.Text := '';
  edtNamaBarang.Text := '';
  edtHargaBarang.Text := '0';
  edtSubTotal.Text := '0';
  edtDiskon.Text := '0';
  edtTotalBayar.Text := '0';
end;

procedure TForm1.cbKodeBarangChange(Sender: TObject);
var
  kodeBarang: String;
begin
  kodeBarang := cbKodeBarang.Text;
  case kodeBarang of
  'A01':
  begin
    edtNamaBarang.Text := 'Speaker';
    edtHargaBarang.Text := '50000';
  end;
  'B02':
  begin
    edtNamaBarang.Text := 'Mouse';
    edtHargaBarang.Text := '25000';
  end;
  'C03':
  begin
    edtNamaBarang.Text := 'Hardisk';
    edtHargaBarang.Text := '750000';
  end;
  'D04':
  begin
    edtNamaBarang.Text := 'Mouse Pad';
    edtHargaBarang.Text := '5000';
  end;
  else
  begin
    // Handle the case where kodeBarang doesn't match any of the specified values
  end;
end;
end;

procedure TForm1.edtQuantityChange(Sender: TObject);
  var
    quantity: Integer;
    subTotal, hargaSatuan: Real;
  begin
    try
      if edtQuantity.Text = '' then
      else
        quantity := StrToInt(edtQuantity.Text);

      if (quantity > 10) or (quantity < 1) then
      begin
        raise Exception.Create('Quantity tidak boleh lebih dari 10 atau kurang dari 1');
      end;

      hargaSatuan := StrToFloat(edtHargaBarang.Text);
      subTotal := quantity * hargaSatuan;
      edtSubTotal.Text := CurrToStr(subTotal);
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
end;

end.

