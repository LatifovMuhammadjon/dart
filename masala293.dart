import 'dart:io';

void main(List<String> args) {
  List<int> nums =
      stdin.readLineSync()!.split("").map((e) => e.codeUnitAt(0)).toList();
  int n = nums.length;
  print(n);
  for (var i = 0; i < n; i++) {
    String s = "";
    int dec = nums[i];
    while (dec > 0) {
      s = "${dec % 2}$s";
      dec ~/= 2;
    }
    print(s);
  }
  exit(0);
}
