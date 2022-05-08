import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  print(n * (n + 1) ~/ 2);
  exit(0);
}
