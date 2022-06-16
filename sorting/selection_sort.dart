import 'sort_algorithms.dart';
import 'sort_utils.dart';

class SelectionSort with SortUtils implements SortAlgorithm {
  @override
  List<T> sort<T extends Comparable<T>>(List<T> arr) {
    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      int minIndex = i;
      for (int j = i + 1; j < n; j++) {
        if (arr[minIndex].compareTo(arr[j]) > 0) {
          minIndex = j;
        }
      }
      if (minIndex != i) {
        T temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;
      }
    }
    return arr;
  }
}

void main() {
  List<int> arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  SelectionSort selectionSort = SelectionSort();
  print(selectionSort.sort<num>(arr));

  List<String> strings = ["c", "a", "e", "b", "d"];
  print(selectionSort.sort(strings));
}
