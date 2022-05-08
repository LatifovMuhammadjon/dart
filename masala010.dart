import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  Iterable<int> nums =
      stdin.readLineSync()!.split(" ").map((e) => int.parse(e));
  int a = nums.elementAt(0);
  int b = nums.elementAt(1);
  int c = nums.elementAt(2);
  print((a + b + c) < n ? "No" : "Yes");
  exit(0);
}
