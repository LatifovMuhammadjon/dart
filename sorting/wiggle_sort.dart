import 'sort_algorithms.dart';
import 'sort_utils.dart';
import '../searches/quick_select.dart';

class WiggleSort with SortUtils implements SortAlgorithm {
  @override
  List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
    return _wiggleSort(unsorted);
  }

  int _mapIndex(int index, int n) {
    return ((2 * index + 1) % (n | 1));
  }

  /**
     * Modified Dutch National Flag Sort. See also: sorts/DutchNationalFlagSort
     *
     * @param sortThis array to sort into group "greater", "equal" and "smaller" than median
     * @param median   defines the groups
     * @param <T>      extends interface Comparable
     */
  void _triColorSort<T extends Comparable<T>>(List<T> sortThis, T median) {
    int n = sortThis.length;
    int i = 0;
    int j = 0;
    int k = n - 1;
    while (j <= k) {
      if (0 < sortThis[_mapIndex(j, n)].compareTo(median)) {
        swap(sortThis, _mapIndex(j, n), _mapIndex(i, n));
        i++;
        j++;
      } else if (greater(sortThis[_mapIndex(j, n)], median)) {
        swap(sortThis, _mapIndex(j, n), _mapIndex(k, n));
        k--;
      } else {
        j++;
      }
    }
  }

  List<T> _wiggleSort<T extends Comparable<T>>(List<T> sortThis) {
    // find the median using quickSelect (if the result isn't in the array, use the next greater value)
    T median;
    var select = QuickSelect().select;
    median = select(sortThis, (sortThis.length / 2.0).floor());

    int numMedians = 0;

    for (T sortThi in sortThis) {
      if (0 == sortThi.compareTo(median)) {
        numMedians++;
      }
    }
    // added condition preventing off-by-one errors for odd arrays.
    // https://cs.stackexchange.com/questions/150886/how-to-find-wiggle-sortable-arrays-did-i-misunderstand-john-l-s-answer?noredirect=1&lq=1
    if (sortThis.length % 2 == 1 &&
        numMedians == (sortThis.length / 2.0).ceil()) {
      T smallestValue = select(sortThis, 0);
      if (!(0 == smallestValue.compareTo(median))) {
        throw ArgumentError(
            "For odd Arrays if the median appears ceil(n/2) times, " +
                "the median has to be the smallest values in the array.");
      }
    }
    if (numMedians > (sortThis.length / 2.0).ceil()) {
      throw ArgumentError(
          "No more than half the number of values may be the same.");
    }

    _triColorSort(sortThis, median);
    return sortThis;
  }
}

void main() {
  // Integer Input

  var sort = WiggleSort();
  List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  // print a sorted array
  print(sort.sort<num>(integers));
  // String Input
  List<String> strings = ["c", "a", "e", "b", "d"];

  print(sort.sort(strings));
}
