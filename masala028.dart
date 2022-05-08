import 'dart:io';

void main(List<String> args) {
  int n = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < n; i++) {
    Iterable<int> nums =
        stdin.readLineSync()!.split(" ").map((e) => int.parse(e));
    print(
        "${nums.elementAt(2) * 2 - nums.elementAt(0)} ${nums.elementAt(3) * 2 - nums.elementAt(1)}");

  }
}
