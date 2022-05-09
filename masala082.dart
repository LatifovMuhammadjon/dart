import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  print("${n.isEven ? "Second" : "First"} player");
  exit(0);
}
