import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  print(n > 3 ? n * (n - 3) ~/ 2 : 0);
  exit(0);
}
