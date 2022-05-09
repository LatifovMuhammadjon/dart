import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  if (n % 400 == 0 || (n % 100 != 0 && n % 4 == 0)) {
    print("Kabisa yili");
  } else {
    print("Kabisa yili emas");
  }
  exit(0);
}
