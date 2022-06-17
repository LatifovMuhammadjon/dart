import 'sort_algorithms.dart';
import 'sort_utils.dart';

class SwapSort with SortUtils implements SortAlgorithm {

    @override
    List<T> sort<T extends Comparable<T>>(List<T> array) {
        int len = array.length;
        int index = 0;

        while (index < len - 1) {
            int amountSmallerElements = this._getSmallerElementCount(array, index);

            if (amountSmallerElements > 0 && index != amountSmallerElements) {
                T element = array[index];
                array[index] = array[amountSmallerElements];
                array[amountSmallerElements] = element;
            } else {
                index++;
            }
        }

        return array;
    }

     int _getSmallerElementCount<T extends Comparable<T>>(List<T> array, int index) {
        int counter = 0;
        for (int i = 0; i < array.length; i++) {
            if (less(array[i], array[index])) {
                counter++;
            }
        }

        return counter;
    }

    
}
