import 'dart:io';
void main() {
  List<String> matkul = <String>[];

  print("Siapa nama anda?");
  String? nama = stdin.readLineSync();
  print("Hallo $nama");
  print("");
  print("Masukan jumlah mata kuliah : ");
  String? jumlah = stdin.readLineSync();
  var jumlahInt = int.parse(jumlah!);

  for (var i = 1; i <= jumlahInt; i++) {
    print("Mata Kuliah $i = ");
    matkul.add(stdin.readLineSync()!);
  }

  print("");
  print("Data Mata Kuliah Anda");
  for (var m in matkul) {
    print("$m");
  }
}
