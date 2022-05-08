import 'dart:io';

void main(List<String> args) {
  num n = num.parse(stdin.readLineSync()!);
  print(n*n);
  exit(0);
}