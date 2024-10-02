import 'dart:io';

void main() {
  String peringkat = "";
  stdout.write("Masukkan nilai: ");
  String? input = stdin.readLineSync();
  int nilai = int.parse(input!);

  if (nilai > 70) {
    peringkat = "A";
  } else if (nilai > 40 && nilai <= 70) {
    peringkat = "B";
  } else if (nilai <= 40 && nilai >= 0) {
    peringkat = "C";
  } else {
    peringkat = "";
  }
  if (peringkat != "") {
    print("$nilai merupakan Nilai $peringkat");
  } else {
    print("Nilai tidak valid");
  }
}
