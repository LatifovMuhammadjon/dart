import 'dart:io';

void main(List<String> args) {
  Iterable<int> nums =
      stdin.readLineSync()!.split(" ").map((e) => int.parse(e));
  int n = nums.elementAt(0);
  int k = nums.elementAt(1);
  print(k ~/ n);
  exit(0);
}
