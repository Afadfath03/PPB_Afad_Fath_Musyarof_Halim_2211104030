import 'dart:io';

void main() {
  stdout.write("Masukkan panjang segitiga: ");
  String? input = stdin.readLineSync();
  int panjang = int.parse(input!);
  segitiga(panjang);
}

void segitiga(int panjang) {
  for (int i = 1; i <= panjang; i++) {
    // Tentukan jumlah spasi
    for (int j = 1; j <= panjang - i; j++) {
      stdout.write(" ");
    }
    // Tentukan jumlah bintang
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }
    // Pindah ke baris baru
    stdout.writeln();
  }
}
