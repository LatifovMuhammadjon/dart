import 'dart:math';

import 'sort_algorithms.dart';
import 'sort_utils.dart';

class BubbleSortRecursion with SortUtils implements SortAlgorithm {
  @override
  List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
    bubbleSort(unsorted, unsorted.length);
    return unsorted;
  }

  void bubbleSort<T extends Comparable<T>>(List<T> unsorted, int len) {
    bool swapped = false;
    /* flag to check if array is sorted or not */
    for (int i = 0; i < len - 1; ++i) {
      if (greater(unsorted[i], unsorted[i + 1])) {
        swapped = swap(unsorted, i, i + 1);
      }
    }
    if (swapped) {
      bubbleSort(unsorted, len - 1);
    }
  }
}

void main() {
  List<int> arr = List.filled(10, 0);

  /* generate 10 random numbers from -50 to 49 */
  Random random = new Random();
  for (int i = 0; i < arr.length; ++i) {
    arr[i] = random.nextInt(100) - 50;
  }
  BubbleSortRecursion b = BubbleSortRecursion();
  print(b.sort<num>(arr));

  /* check array is sorted or not */
  for (int i = 0, limit = arr.length - 1; i < limit; ++i) {
    print(arr[i] <= arr[i + 1]);
  }
}
