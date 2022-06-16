import 'sort_algorithms.dart';
import 'sort_utils.dart';

class BubbleSort with SortUtils implements SortAlgorithm{

    @override
     List<T> sort<T extends Comparable<T>>(List<T> array) {
        for (int i = 1, size = array.length; i < size; ++i) {
            bool swapped = false;
            for (int j = 0; j < size - i; ++j) {
                if (greater(array[j], array[j + 1])) {
                    swap(array, j, j + 1);
                    swapped = true;
                }
            }
            if (!swapped) {
                break;
            }
        }
        return array;
    }

    /**
     * Driver Code
     */
    
}
void main() {

        List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
        BubbleSort bubbleSort = new BubbleSort();
        bubbleSort.sort<num>(integers);

        for (int i = 0; i < integers.length - 1; ++i) {
            print(integers[i] <= integers[i + 1]);
        }
        print(integers);
        /* output: [1, 4, 6, 9, 12, 23, 54, 78, 231] */

        List<String> strings = ["c", "a", "e", "b", "d"];
        bubbleSort.sort(strings);
        for (int i = 0; i < strings.length - 1; i++) {
            print(strings[i].compareTo(strings[i + 1]) <= 0);
        }
        print(bubbleSort.sort(strings));
        /* output: [a, b, c, d, e] */
    }