class DNFSort {
  // Sort the input array, the array is assumed to
  // have values in {0, 1, 2}
  void sort012(List<int> a) {
    int arr_size = a.length;
    int low = 0;
    int high = arr_size - 1;
    int mid = 0, temp = 0;
    while (mid <= high) {
      switch (a[mid]) {
        case 0:
          {
            temp = a[low];
            a[low] = a[mid];
            a[mid] = temp;
            low++;
            mid++;
            break;
          }
        case 1:
          mid++;
          break;
        case 2:
          {
            temp = a[mid];
            a[mid] = a[high];
            a[high] = temp;
            high--;
            break;
          }
      }
    }
  }

  /* Utility function to print array arr[] */

  /*Driver function to check for above functions*/

}

void main() {
  List<int> arr = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1];
  var sort = DNFSort();
  sort.sort012(arr);
  print(arr);
}
