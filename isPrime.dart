import 'dart:io';

bool isPrime(int n) {
  if (n <= 1) {
    return false;
  } else if (n == 2 && n == 3) {
    return true;
  } else {
    for (int i = 2; i < n; i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }
}

void main() {
  stdout.write("a ning qiymatini kiriting:");
  int a = int.parse(stdin.readLineSync()!);
  stdout.write("b ning qiymatini kiriting:");
  int b = int.parse(stdin.readLineSync()!);
  List<int> array = [];
  if (a > b) {
    a += b;
    b = a - b;
    a -= b;
  }
  for (int i = a; i <= b; i++) {
    if (isPrime(i)) {
      array.add(i);
    }
  }
  array.forEach((element) {
    stdout.write("$element ");
  });
}