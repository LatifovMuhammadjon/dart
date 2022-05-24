import 'dart:io';

swap(int a, int b) {
  a += b;
  b = a - b;
  a -= b;
}

void main(List<String> args) {
  List<int> a = [1, 5, 3, 4, 2, 9, 8];
  int max = a[0];
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < a.length - i - 1; j++) {
      if (a[j] > a[j + 1]) {
        a[j] += a[j + 1];
        a[j + 1] = a[j] - a[j + 1];
        a[j] -= a[j + 1];
      }
    }
  }
  print(a);
}
