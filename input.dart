import 'dart:io';

String input(String s) {
  stdout.write(s);
  return stdin.readLineSync()!;
}
