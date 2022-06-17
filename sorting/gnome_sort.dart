import 'sort_algorithms.dart';
import 'sort_utils.dart';

class GnomeSort with SortUtils implements SortAlgorithm {

    @override
 List<T> sort<T extends Comparable<T>>(List<T> arr) {
        int i = 1;
        int j = 2;
        while (i < arr.length) {
            if (less(arr[i - 1], arr[i])) {
                i = j++;
            } else {
                swap(arr, i - 1, i);
                if (--i == 0) {
                    i = j++;
                }
            }
        }

        return arr;
    }

    
}
void main() {
        List<int> integers = [4, 23, 6, 78, 1, 26, 11, 23, 0, -6, 3, 54, 231, 9, 12];
        List<String> strings = ["c", "a", "e", "b", "d", "dd", "da", "zz", "AA", "aa", "aB", "Hb", "Z"];
        GnomeSort gnomeSort = GnomeSort();

        gnomeSort.sort<num>(integers);
        gnomeSort.sort(strings);
        print(integers);
        print(strings);
    }