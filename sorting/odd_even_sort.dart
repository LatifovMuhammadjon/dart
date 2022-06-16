import 'dart:math';
import 'sort_utils.dart';

class OddEvenSort with SortUtils {
  void oddEvenSort(List<int> arr) {
    bool sorted = false;
    while (!sorted) {
      sorted = true;

      for (int i = 1; i < arr.length - 1; i += 2) {
        if (arr[i] > arr[i + 1]) {
          sorted = !swap(arr, i, i + 1);
        }
      }

      for (int i = 0; i < arr.length - 1; i += 2) {
        if (arr[i] > arr[i + 1]) {
          sorted = !swap(arr, i, i + 1);
        }
      }
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
  OddEvenSort sort = OddEvenSort();
  sort.oddEvenSort(arr);
  print(arr);
}
