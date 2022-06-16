import 'sort_algorithms.dart';
import 'sort_utils.dart';

class CircleSort with SortUtils implements SortAlgorithm {
  /* This method implements the circle sort
    * @param array The array to be sorted 
     */
  @override
  List<T> sort<T extends Comparable<T>>(List<T> array) {
    int n = array.length;
    while (_doSort(array, 0, n - 1));
    return array;
  }

  /* This method implements the cyclic sort recursive version
    * @param array The array to be sorted
    * @param the left boundary of the part currently being sorted
    * @param the right boundary of the part currently being sorted
     */
  bool _doSort<T extends Comparable<T>>(List<T> array, int left, int right) {
    bool swapped = false;

    if (left == right) {
      return false;
    }

    int low = left;
    int high = right;

    while (low < high) {
      if (array[low].compareTo(array[high]) > 0) {
        swap(array, low, high);
        swapped = true;
      }
      low++;
      high--;
    }

    if (low == high && array[low].compareTo(array[high + 1]) > 0) {
      swap(array, low, high + 1);
      swapped = true;
    }

    int mid = left + (right - left) ~/ 2;
    bool leftHalf = _doSort(array, left, mid);
    bool rightHalf = _doSort(array, mid + 1, right);

    return swapped || leftHalf || rightHalf;
  }

  /* Driver code*/

}

void main() {
  CircleSort CSort = CircleSort();

  List<int> arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  print(CSort.sort<num>(arr));

  List<String> stringArray = ["c", "a", "e", "b", "d"];
  print(CSort.sort(stringArray));
}
