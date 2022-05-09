import 'dart:io';

void main(List<String> args) {
  List<int> nums =
      stdin.readLineSync()!.split(" ").map((e) => int.parse(e)).toList();
  int a = nums[0];
  int b = nums[1];
  print(a == b ? "=" : ">");
  exit(0);
}
