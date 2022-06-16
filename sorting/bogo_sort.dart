import 'dart:math';

import 'sort_algorithms.dart';
import 'sort_utils.dart';

class BogoSort with SortUtils implements SortAlgorithm {
  final Random _random = new Random();

  bool isSorted<T extends Comparable<T>>(List<T> array) {
    for (int i = 0; i < array.length - 1; i++) {
      if (less(array[i + 1], array[i])) {
      return false;
      }
    }
    return true;
  }

  // Randomly shuffles the array
  void _nextPermutation<T extends Comparable<T>>(List<T> array) {
    int length = array.length;

    for (int i = 0; i < array.length; i++) {
      int randomIndex = i + _random.nextInt(length - i);
      swap(array, randomIndex, i);
    }
  }

  List<T> sort<T extends Comparable<T>>(List<T> array) {
    while (!isSorted(array)) {
      _nextPermutation(array);
    }
    return array;
  }

  // Driver Program

}

void main() {
  // Integer Input

  BogoSort bogoSort = BogoSort();
  List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  // print a sorted array
  print(bogoSort.sort<num>(integers));
  // String Input
  List<String> strings = ["c", "a", "e", "b", "d"];

  print(bogoSort.sort(strings));
}
