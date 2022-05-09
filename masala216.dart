import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  print(n ~/ 10 * 2 + (n % 10 + 1) ~/ 4);
  exit(0);
}
