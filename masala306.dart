import 'dart:io';

void main(List<String> args) {
  int person = int.parse(stdin.readLineSync()!);
  List<int> people =
      stdin.readLineSync()!.split(" ").map((e) => int.parse(e)).toList();
  int virus = int.parse(stdin.readLineSync()!);
  int count = 0;
  for (int i = 0; i < virus; i++) {
    int viruses = int.parse(stdin.readLineSync()!);
    int count = 0;
    for (int j = 0; j < person; j++) {
      if (viruses >= people[j]) count++;
    }
    print(count);
  }
  exit(0);
}