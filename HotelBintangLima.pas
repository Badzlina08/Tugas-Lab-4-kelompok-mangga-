program HotelBintangLima;
uses crt;

type
  // Record untuk menyimpan data pemesanan hotel
  TPemesanan = record
    namaPemesan: string;
    nomorHP: string;
    jenisKamar: string;
    hargaPerMalam: longint;
    lamaMenginap: integer;
    totalHarga: longint;
  end;

const
  // Array untuk menyimpan jenis kamar dan harga per malam
  JENIS_KAMAR: array[1..3] of string = ('Single', 'Double', 'Suite');
  HARGA_KAMAR: array[1..3] of longint = (500000, 750000, 1000000); // Harga per malam

//procedure untuk meminta input nama dan nomor HP
procedure InputNamadanNomorHPPemesan(var pemesanan: Tpemesanan);
begin
    write('Masukkan nama anda: ');
    readln(pemesanan.namaPemesan);
    write('Masukkan nomor HP: ');
    readln(pemesanan.nomorHP);
end;

// Procedure untuk memilih kamar
procedure PilihKamar(var pemesanan: TPemesanan);
var
  pilihanKamar: integer;
begin
  writeln('Pilih Jenis Kamar:');
  writeln('1. Single');
  writeln('2. Double');
  writeln('3. Suite');
  write('Masukkan pilihan (1-3): ');
  readln(pilihanKamar);

  case pilihanKamar of
    1: begin
         pemesanan.jenisKamar := JENIS_KAMAR[1];
         pemesanan.hargaPerMalam := HARGA_KAMAR[1];
       end;
    2: begin
         pemesanan.jenisKamar := JENIS_KAMAR[2];
         pemesanan.hargaPerMalam := HARGA_KAMAR[2];
       end;
    3: begin
         pemesanan.jenisKamar := JENIS_KAMAR[3];
         pemesanan.hargaPerMalam := HARGA_KAMAR[3];
       end;
  else
    writeln('Pilihan tidak valid, kamar Single dipilih secara default.');
    pemesanan.jenisKamar := JENIS_KAMAR[1];
    pemesanan.hargaPerMalam := HARGA_KAMAR[1];
  end;
end;

// Function untuk menghitung total harga
function HitungTotalHarga(hargaPerMalam, lamaMenginap: longint): longint;
begin
  HitungTotalHarga := hargaPerMalam * lamaMenginap;
end;

// Procedure untuk menampilkan detail pemesanan
procedure TampilkanPemesanan(pemesanan: TPemesanan);
begin
  writeln('==============================');
  writeln('Halloo....',pemesanan.namaPemesan);
  writeln('Nomor HP:',pemesanan.nomorHP);
  writeln('Kamu memesan jenis kamar ', pemesanan.jenisKamar);
  writeln('Harga per Malam: Rp.', pemesanan.hargaPerMalam);
  writeln('Lama Menginap: ', pemesanan.lamaMenginap, ' malam');
  writeln('Total Harga: Rp.', pemesanan.totalHarga);
  writeln('==============================');
end;

// Procedure untuk meminta input lama menginap
procedure InputLamaMenginap(var lamaMenginap: integer);
begin
  repeat
    write('Berapa lama Anda menginap ? ');
    readln(lamaMenginap);
    if lamaMenginap <= 0 then
      writeln('Lama menginap tidak valid, coba lagi.');
  until lamaMenginap > 0;
end;

var
  pemesanan: TPemesanan;
  lamaMenginap: integer;
  ulang: char;

begin
  clrscr;
  writeln('Selamat datang di hotel bintang lima!');

  // Perulangan untuk pemesanan ulang jika mau memesan lagi
  repeat
    InputNamadanNomorHPPemesan(pemesanan);
    PilihKamar(pemesanan);
    InputLamaMenginap(lamaMenginap);
    pemesanan.lamaMenginap := lamaMenginap;
    pemesanan.totalHarga := HitungTotalHarga(pemesanan.hargaPerMalam, pemesanan.lamaMenginap);
    TampilkanPemesanan(pemesanan);
    write('Apakah Anda ingin memesan lagi? (Y/T): ');
    readln(ulang);
    ulang := UpCase(ulang);  

  until ulang <> 'Y'; 
  writeln('Terima kasih telah menggunakan layanan hotel kamii!');
  readln;
end.
