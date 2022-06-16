import 'sort_algorithms.dart';
import 'sort_utils.dart';

class CycleSort with SortUtils implements SortAlgorithm {
  @override
  List<T> sort<T extends Comparable<T>>(List<T> arr) {
    int n = arr.length;

    // traverse array elements
    for (int j = 0; j <= n - 2; j++) {
      // initialize item as starting point
      T item = arr[j];

      // Find position where we put the item.
      int pos = j;
      for (int i = j + 1; i < n; i++) {
        if (less(arr[i], item)) {
          pos++;
        }
      }

      // If item is already in correct position
      if (pos == j) {
        continue;
      }

      // ignore all duplicate elements
      while (item.compareTo(arr[pos]) == 0) {
        pos += 1;
      }

      // put the item to it's right position
      if (pos != j) {
        item = _replace(arr, pos, item);
      }

      // Rotate rest of the cycle
      while (pos != j) {
        pos = j;

        // Find position where we put the element
        for (int i = j + 1; i < n; i++) {
          if (less(arr[i], item)) {
            pos += 1;
          }
        }

        // ignore all duplicate elements
        while (item.compareTo(arr[pos]) == 0) {
          pos += 1;
        }

        // put the item to it's right position
        if (item != arr[pos]) {
          item = _replace(arr, pos, item);
        }
      }
    }

    return arr;
  }

  _replace<T extends Comparable<T>>(List<T> arr, int pos, T item) {
    T temp = item;
    item = arr[pos];
    arr[pos] = temp;
    return item;
  }
}

void main() {
  List<int> arr = [4, 23, 6, 78, 1, 26, 11, 23, 0, -6, 3, 54, 231, 9, 12];
  CycleSort cycleSort = new CycleSort();
  cycleSort.sort<num>(arr);
  print(arr);
}
