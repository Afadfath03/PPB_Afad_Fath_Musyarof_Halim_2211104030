import 'dart:io';

void main() {
  stdout.write("Masukkan nilai: ");
  String? input = stdin.readLineSync();
  int nilai = int.parse(input!);

  String predikat = peringkat(nilai);

  if (predikat != "") {
    print("$nilai merupakan Nilai $predikat");
  } else {
    print("Nilai tidak valid");
  }
}

String peringkat(int nilai) {
  if (nilai > 70)
    return "A";
  else if (nilai > 40 && nilai <= 70)
    return "B";
  else if (nilai <= 40 && nilai >= 0)
    return "C";
  else
    return "";
}
