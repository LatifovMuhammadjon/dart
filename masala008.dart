import 'dart:io';

void main(List<String> args) {
  Iterable<int> n = stdin.readLineSync()!.split(" ").map((e) => int.parse(e));
  int max = n.elementAt(0), min = n.elementAt(0), s = 0;
  for (int i = 0; i < n.length; i++) {
    max = max < n.elementAt(i) ? n.elementAt(i) : max;
    min = min > n.elementAt(i) ? n.elementAt(i) : min;
    s += n.elementAt(i);
  }
  print("${s - max} ${s - min}");
  exit(0);
}
