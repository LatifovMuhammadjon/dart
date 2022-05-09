import 'dart:io';

void main(List<String> args) {
  List<int> nums = stdin.readLineSync()!.split(" ").map((e) => int.parse(e)).toList();
  int x1 = nums[0];
  int v1 = nums[1];
  int x2 = nums[2];
  int v2 = nums[3];
  String s = "";
  if (v1 == v2) {
    s = x2 == x1 ? "YES" : "NO";
  } else {
    s = (x2-x1)%(v1 - v2) == 0 && (x2-x1)/(v1-v2) >0 ? "YES" : "NO";
  }
  print(s);
  exit(0);
}
