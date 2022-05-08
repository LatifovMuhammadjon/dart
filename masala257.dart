import 'dart:io';
void main(List<String> args) {
  List<int> str = stdin.readLineSync()!.split("").map((e) => int.parse(e)).toList();
  bool isStart = false, isEnd = false;
  String s = "NO";
  for (int i = 0; i < str.length; i++) {
    if (isEnd && str[i] == 1) {
      s = "NO";
      break;
    }
    if (isStart && str[i] == 0) {
      isEnd = true;
    }
    if (str[i] == 1) {
      isStart = true;
      s = "YES";
    }
    
  }
  print(s);
  exit(0);
}
