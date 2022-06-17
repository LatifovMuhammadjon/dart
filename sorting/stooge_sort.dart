import 'sort_algorithms.dart';
import 'sort_utils.dart';

class StoogeSort with SortUtils implements SortAlgorithm {

    @override
     List<T> sort<T extends Comparable<T>>(List<T> unsortedArray) {
        _sort(unsortedArray, 0, unsortedArray.length);
        return unsortedArray;
    }

    List<T> _sort<T extends Comparable<T>>(List<T> unsortedArray, int start, int end) {
        if (less(unsortedArray[end - 1], unsortedArray[start])) {
            swap(unsortedArray, start, end-1);
        }

        int len = end - start;
        if (len > 2) {
            int third = len ~/ 3;
            _sort(unsortedArray, start, end - third);
            _sort(unsortedArray, start + third, end);
            _sort(unsortedArray, start, end - third);
        }
        return unsortedArray;
    }

    
}
void main() {
        StoogeSort stoogeSort = new StoogeSort();

        List<int> integerArray = [8, 84, 53, 953, 64, 2, 202];
        // Print integerArray unsorted
        print(integerArray);

        stoogeSort.sort<num>(integerArray);
        // Print integerArray sorted
        print(integerArray);

        List<String> stringArray = ["g", "d", "a", "b", "f", "c", "e"];
        // Print stringArray unsorted
        print(stringArray);

        stoogeSort.sort(stringArray);
        // Print stringArray sorted
        print(stringArray);
    }