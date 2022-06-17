import 'sort_algorithms.dart';
import 'sort_utils.dart';

class SimpleSort with SortUtils implements SortAlgorithm {
  @override
  List<T> sort<T extends Comparable<T>>(List<T> array) {
    final int len = array.length;

    for (int i = 0; i < len; i++) {
      for (int j = i + 1; j < len; j++) {
        if (less(array[j], array[i])) {
          swap(array, i, j);
        }
      }
    }

    return array;
  }
}
