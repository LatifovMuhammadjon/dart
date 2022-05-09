import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  if (n >= 38 && n % 5 >= 3) {
    n += 5 - n % 5;
  }
  print(n);
  exit(0);
}
