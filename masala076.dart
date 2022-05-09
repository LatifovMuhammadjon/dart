import 'dart:io';

void main(List<String> args) {
  List<int> a = stdin.readLineSync()!.split(" ").map((e) => int.parse(e)).toList();
  int s = int.parse(stdin.readLineSync()!);
  for (var i = 0; i < a.length; i++) {
    s -= a[i];
  }
  print(s>0?s:0);
  exit(0);
}
