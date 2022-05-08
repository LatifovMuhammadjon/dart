import 'dart:io';

void main(List<String> args) {
  num n = num.parse(stdin.readLineSync()!);
  print(n%100==0?n~/100:n/100);
  exit(0);
}
