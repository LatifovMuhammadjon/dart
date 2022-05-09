import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  print("${n-50-n%100~/2} ${n-n%100~/2}");
  exit(0);
}