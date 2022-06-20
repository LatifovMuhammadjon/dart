import 'dart:collection';
import 'sort_algorithms.dart';

/**
 * @author Youssef Ali (https://github.com/youssefAli11997)
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 */
class CountingSort implements SortAlgorithm {
  @override
  List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
    return _sort(unsorted);
  }

  List<T> _sort<T extends Comparable<T>>(List<T> list) {
    SplayTreeMap<T, int> frequency = SplayTreeMap();
    // The final output array
    List<T> sortedArray = [];

    // Counting the frequency of @param array elements
    for (var el in list) {
      frequency[el] = frequency.putIfAbsent(el, () => 0) + 1;
    }

    // Filling the sortedArray
    for (MapEntry<T, int> element in frequency.entries) {
      for (int j = 0; j < element.value; j++) {
        sortedArray.add(element.key);
      }
    }

    return sortedArray;
  }

  List<T> _streamSort<T extends Comparable<T>>(List<T> list) {
    return SplayTreeMap.fromIterable(list,
            key: (element) => element,
            value: (element) => list.where((el) => el == element))
        .entries.expand((element) => element.value).toList();
  }
}

void main() {
  // Integer Input
  List<int> unsortedInts = [4, 23, 6, 78, 1, 54, 23, 1, 9, 231, 9, 12];
  CountingSort countingSort = CountingSort();

  print("Before Sorting:");
  print(unsortedInts);

  // Output => 1 1 4 6 9 9 12 23 23 54 78 231
  print("After Sorting:");
  print(countingSort.sort<num>(unsortedInts));
  print(countingSort._streamSort<num>(unsortedInts));

  print("\n------------------------------\n");

  // String Input
  List<String> unsortedStrings = ["c", "a", "e", "b", "d", "a", "f", "g", "c"];

  print("Before Sorting:");
  print(unsortedStrings);

  // Output => a a b c c d e f g
  print("After Sorting:");
  print(countingSort.sort(unsortedStrings));

  ("After Sorting By Streams:");
  print(countingSort._streamSort(unsortedStrings));
}
