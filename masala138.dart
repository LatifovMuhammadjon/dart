import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  num n = num.parse(stdin.readLineSync()!);
  print((pow(n, 5) + 8 * pow(n, 4) - 5 * pow(n, 3) + 3 * pow(n, 2) + n - 12).toInt());
  exit(0);
}
