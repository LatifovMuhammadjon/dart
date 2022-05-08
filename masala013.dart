import 'dart:io';
void main(List<String> args) {
  Iterable<num> nums =
      stdin.readLineSync()!.split(" ").map((e) => num.parse(e));
  num n = nums.elementAt(0);
  num k = nums.elementAt(1);
  if (n == 0) {
    print(1);
  } else {
    print(k + 1);
  }
  exit(0);
}
