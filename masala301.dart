import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  List<int> nums =
      stdin.readLineSync()!.split(" ").map((e) => int.parse(e)).toList();
  String s = "YES";
  for (var i = 0; i < n; i++) {
    if (nums[i] != i + 1) {
      s = "NO";
      break;
    }
  }
  print(s);
  exit(0);
}
