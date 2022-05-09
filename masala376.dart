import 'dart:io';

void main(List<String> args) {
  num n = num.parse(stdin.readLineSync()!);
  if (n <= 12) {
    n = n % 12 ~/ 3;
    switch (n) {
      case 0:
        print("Winter");
        break;
      case 1:
        print("Spring");
        break;
      case 2:
        print("Summer");
        break;
      case 3:
        print("Autumn");
        break;
    }
  } else {
    print("Error");
  }
  exit(0);
}
