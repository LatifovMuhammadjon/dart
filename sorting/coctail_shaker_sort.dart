import 'sort_algorithms.dart';
import 'sort_utils.dart';

class CocktailShakerSort with SortUtils implements SortAlgorithm {

    /**
     * This method implements the Generic Cocktail Shaker Sort
     *
     * @param array The array to be sorted Sorts the array in increasing order
     */
    @override
     List<T> sort<T extends Comparable<T>>(List<T> array) {

        int length = array.length;
        int left = 0;
        int right = length - 1;
        int swappedLeft, swappedRight;
        while (left < right) {
            // front
            swappedRight = 0;
            for (int i = left; i < right; i++) {
                if (less(array[i + 1], array[i])) {
                    swap(array, i, i + 1);
                    swappedRight = i;
                }
            }
            // back
            right = swappedRight;
            swappedLeft = length - 1;
            for (int j = right; j > left; j--) {
                if (less(array[j], array[j - 1])) {
                    swap(array, j - 1, j);
                    swappedLeft = j;
                }
            }
            left = swappedLeft;
        }
        return array;
    }

    // Driver Program
    
}
void main() {
        // Integer Input
        List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
        CocktailShakerSort shakerSort = new CocktailShakerSort();

        // Output => 1 4 6 9 12 23 54 78 231
        print(shakerSort.sort<num>(integers));

        // String Input
        List<String> strings = ["c", "a", "e", "b", "d"];
        print(shakerSort.sort(strings));
    }