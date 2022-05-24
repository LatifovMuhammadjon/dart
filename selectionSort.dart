import 'dart:io';

void main(List<String> args) {
  List<int> a = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0];
  for (int i = 0; i < a.length; i++) {
    int minIndex = i;
    for (int j = i; j < a.length; j++) {
      if (a[minIndex] > a[j]) {
        minIndex = j;
      }
    }
    int temp = a[i];
    a[i] = a[minIndex];
    a[minIndex] = temp;
  }
  print(a);
}
