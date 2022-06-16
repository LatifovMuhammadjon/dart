class BitonicSort {
    void compAndSwap(List<int> a, int i, int j, int dir) {
        if ((a[i] > a[j] && dir == 1) || (a[i] < a[j] && dir == 0)) {
            // Swapping elements
            int temp = a[i];
            a[i] = a[j];
            a[j] = temp;
        }
    }

    void bitonicMerge(List<int> a, int low, int cnt, int dir) {
        if (cnt > 1) {
            int k = cnt ~/ 2;
            for (int i = low; i < low + k; i++) {
                compAndSwap(a, i, i + k, dir);
            }
            bitonicMerge(a, low, k, dir);
            bitonicMerge(a, low + k, k, dir);
        }
    }

    void bitonicSort(List<int> a, int low, int cnt, int dir) {
        if (cnt > 1) {
            int k = cnt ~/ 2;

            // sort in ascending order since dir here is 1
            bitonicSort(a, low, k, 1);

            // sort in descending order since dir here is 0
            bitonicSort(a, low + k, k, 0);

            // Will merge whole sequence in ascending order
            // since dir=1.
            bitonicMerge(a, low, cnt, dir);
        }
    }

    /*Caller of bitonicSort for sorting the entire array
  of length N in ASCENDING order */
    void sort(List<int> a, int N, int up) {
        bitonicSort(a, 0, N, up);
    }

    /* A utility function to print array of size n */
    static void printArray(List<int> arr) {
        int n = arr.length;
        String s = "";
        for (int i = 0; i < n; ++i) {
            s += "${arr[i]} ";
        }
        print(s);
    }

    
}
void main() {
        List<int> a = [3, 7, 4, 8, 6, 2, 1, 5];
        int up = 1;
        BitonicSort ob = new BitonicSort();
        ob.sort(a, a.length, up);
        print("\nSorted array");
        BitonicSort.printArray(a);
    }