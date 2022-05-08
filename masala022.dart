import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  print(n % 100 ~/ 10);
  exit(0);
}
