import 'dart:io';

void main(List<String> args) {
  Iterable<int> n = stdin.readLineSync()!.split(" ").map((e) => int.parse(e));
  int a = n.elementAt(0);
  int b = n.elementAt(1);
  int c = n.elementAt(2);
  int max = a > b
          ? a > c
              ? a
              : c
          : b > c
              ? b
              : c,
      min = a < b
          ? a < c
              ? a
              : c
          : b < c
              ? b
              : c;
  print(max - min);
  exit(0);
}
