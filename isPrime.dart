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
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);
  List<int> array = [];
  // This is swap method without another variables
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
