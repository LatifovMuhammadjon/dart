import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  print(n ~/ 2 + 1);
  exit(0);
}
