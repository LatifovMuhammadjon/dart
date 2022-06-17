import 'sort_algorithms.dart';
import 'sort_utils.dart';

class DutchNationalFlagSort with SortUtils implements SortAlgorithm {
  @override
  List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
    T intendedMiddle = unsorted[(unsorted.length / 2).ceil() - 1];
    return _dutch_national_flag_sort(unsorted, intendedMiddle);
  }

  List<T> _dutch_national_flag_sort<T extends Comparable<T>>(
      List<T> arr, T intendedMiddle) {
    int i = 0;
    int j = 0;
    int k = arr.length - 1;

    while (j <= k) {
      if (0 > arr[j].compareTo(intendedMiddle)) {
        swap(arr, i, j);
        j++;
        i++;
      } else if (0 < arr[j].compareTo(intendedMiddle)) {
        swap(arr, j, k);
        k--;
      } else {
        j++;
      }
    }
    return arr;
  }
}

void main(List<String> args) {
  var sort = DutchNationalFlagSort();
  List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  // print a sorted array
  print(sort.sort<num>(integers));
  // String Input
  List<String> strings = ["c", "a", "e", "b", "d"];
  sort.sort(strings);
  print(strings);
}
/**
 * arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];
 * length = 9;
 * intendedMiddle = arr[4] = 1
 * 1 < 4
 * arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];
 */