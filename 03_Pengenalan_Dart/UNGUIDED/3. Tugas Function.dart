import 'dart:io';

void main() {
  stdout.write("Masukkan angka: ");
  String? input = stdin.readLineSync();
  int angka = int.parse(input!);

  if (isPrima(angka)) {
    print("Bilangan prima");
  } else {
    print("Bukan bilangan prima");
  }
}

bool isPrima(int nilai) {
  if (nilai <= 1) return false;

  for (int i = 2; i <= nilai / 2; i++) {
    if (nilai % i == 0) return false;
  }

  return true;
}
