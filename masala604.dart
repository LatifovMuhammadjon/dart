import 'dart:io';

void main(List<String> args) {
  String s = stdin.readLineSync()!;
  print(s.codeUnitAt(0));
  exit(0);
}
