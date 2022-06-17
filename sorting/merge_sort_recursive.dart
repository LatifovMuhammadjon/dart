class MergeSortRecursive {

    List<int> arr;

    MergeSortRecursive(this.arr);

    void mergeSort() {
        List<int> arrSorted = _merge(arr);
        print(arrSorted);
    }

    List<int> _merge(List<int> arr) {
        int arrLength = arr.length;
        // base condition
        if (arrLength <= 1) {
            return arr;
        }

        
        int half = arrLength ~/ 2;
        List<int> arrA = arr.sublist(0,half);
        List<int> arrB = arr.sublist(half, arrLength);

        // recursion
        arrA = _merge(arrA);
        arrB = _merge(arrB);

        return _sort(arrA, arrB);
    }

    List<int> _sort(List<int> unsortedA, List<int> unsortedB) {
        if (unsortedA.length <= 0 && unsortedB.length <= 0) {
            return [];
        }
        if (unsortedA.length<= 0) {
            return unsortedB;
        }
        if (unsortedB.length <= 0) {
            return unsortedA;
        }
        List<int> newAl = [];
        if (unsortedA[0] <= unsortedB[0]) {
            newAl.add(unsortedA[0]);
                
            newAl.addAll(_sort(unsortedA.sublist(1, unsortedA.length), unsortedB));
            return newAl;
        } else {
          newAl.add(unsortedB[0]);
            newAl.addAll(_sort(unsortedA, unsortedB.sublist(1, unsortedB.length)));
            return newAl;
        }
    }

}



    void main(List<String> args) {
        MergeSortRecursive sort = new MergeSortRecursive([4, 3, 1, 8, 5, 10, 0, 1, 4, 11, 8, 9]);
        sort.mergeSort();
    }

