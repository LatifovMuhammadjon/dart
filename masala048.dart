import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  String s = "";
  for (var i = 1; i <= n * (n + 1) ~/ 2; i++) {
    s += "$i ";
    for (var j = 1; j <= n; j++) {
      if (j * (j + 1) == 2 * i) {
        s += "\n"; 
      }
    }
  }
  print(s);
  exit(0);
}
