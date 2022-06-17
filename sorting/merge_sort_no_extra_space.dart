class MergeSortNoExtraSpace {
  void call_merge_sort(List<int> a) {
    int n = a.length;
    int maxele = _max(a) + 1;
    merge_sort(a, 0, n - 1, maxele);
  }

  void merge_sort(List<int> a, int start, int end, int maxele) {
    //this function divides the array into 2 halves

    if (start < end) {
      int mid = (start + end) ~/ 2;
      merge_sort(a, start, mid, maxele);
      merge_sort(a, mid + 1, end, maxele);
      implement_merge_sort(a, start, mid, end, maxele);
    }
  }

  int _max(List<int> a) {
    int max = a[0];
    for (var i = 0; i < a.length; i++) {
      if (max < a[i]) {
        max = a[i];
      }
    }
    return max;
  }

  void implement_merge_sort(
      List<int> a, int start, int mid, int end, int maxele) {
    //implementation of mergesort
    int i = start;
    int j = mid + 1;
    int k = start;
    while (i <= mid && j <= end) {
      if (a[i] % maxele <= a[j] % maxele) {
        a[k] = a[k] + (a[i] % maxele) * maxele;
        k++;
        i++;
      } else {
        a[k] = a[k] + (a[j] % maxele) * maxele;
        k++;
        j++;
      }
    }
    while (i <= mid) {
      a[k] = a[k] + (a[i] % maxele) * maxele;
      k++;
      i++;
    }
    while (j <= end) {
      a[k] = a[k] + (a[j] % maxele) * maxele;
      k++;
      j++;
    }
    for (i = start; i <= end; i++) {
      a[i] = a[i] ~/ maxele;
    }
  }
}

void main() {
  List<int> integers = [4, 23, 6, 78, 1, 26, 11, 23, 0, -6, 3, 54, 231, 9, 12];
  var sort = MergeSortNoExtraSpace();
  sort.call_merge_sort(integers);
  print(integers);
}
