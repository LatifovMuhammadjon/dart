import 'dart:math';

class TimSort {
  late List<int> array;
  late int array_length;
  int RUN = 32;

  /**
     * @brief A constructor which takes in the array specified by the user.
     * @param array : Array given by the user.
     */
  TimSort.fromList(List<int> array) {
    this.array = array;
    array_length = array.length;
  }

  /**
     * @brief A constructor which takes in an array length and randomly
     * initializes an array.
     * @param array_length length given by the user.
     */
  TimSort([array_length = 100]) {
    Random rand = new Random();

    this.array_length = array_length;
    this.array = List.generate(array_length, (index) => rand.nextInt(1000));
  }

  /**
     * @brief A method to change the size of the run.
     * @param run : Value specified by the user to change the run.
     */
  void set change_run(int run) => this.RUN = run;

  /**
     * @brief A default constructor when no parameters are given. Initializes
     * the array length to be 100. Generates a random number array of size 100.
     */

  /**
     * @brief Performs Insertion Sort Algorithm on given array with bounded
     * indices.
     * @param array: The array on which the algorithm is to be performed.
     * @param start_idx: The starting index from which the algorithm is to be
     * performed.
     * @param end_idx: The ending index at which the algorithm needs to stop
     * sorting.
     */
  void insertion_sort(List<int> array, int start_idx, int end_idx) {
    for (int i = start_idx; i <= end_idx; i++) {
      int current_element = array[i];
      int j = i - 1;
      while (j >= start_idx && array[j] > current_element) {
        array[j + 1] = array[j];
        j--;
      }
      array[j + 1] = current_element;
    }
  }

  /**
     * @brief A method to merge two runs(chunks of array).
     * @param array: The origin array which is to be sorted.
     * @param start: Starting index of the first run(chunk).
     * @param mid: The ending index of the first run(chunk).
     * @param end: Ending index of the second run(chunk).
     */
  void merge_runs(List<int> array, int start, int mid, int end) {
    int first_array_size = mid - start + 1, second_array_size = end - mid;
    List<int> array1 = List.filled(first_array_size, 0),
        array2 = List.filled(second_array_size, 0);
    int i = 0, j = 0, k = 0;

    // Building the two sub arrays from the array to merge later
    for (i = 0; i < first_array_size; i++) {
      array1[i] = array[start + i];
    }
    for (i = 0; i < second_array_size; i++) {
      array2[i] = array[mid + 1 + i];
    }

    i = 0;
    j = 0;
    k = start;

    while (i < first_array_size && j < second_array_size) {
      if (array1[i] <= array2[j]) {
        array[k] = array1[i];
        i++;
      } else {
        array[k] = array2[j];
        j++;
      }
      k++;
    }

    while (i < first_array_size) {
      array[k] = array1[i];
      k++;
      i++;
    }

    while (j < second_array_size) {
      array[k] = array2[j];
      k++;
      j++;
    }
  }

  /**
     * @brief Tim Sort Algorithm method.
     */
  void algorithm() {
    // Before Sorting
    print("Before sorting the array: ");
    this.showArrayElements();

    // Applying insertion sort on RUNS.
    for (int i = 0; i < this.array_length; i += this.RUN) {
      this.insertion_sort(
          this.array, i, min(i + this.RUN, (this.array_length - 1)));
    }

    for (int split = this.RUN; split < this.array_length; split = 2 * split) {
      for (int start_idx = 0;
          start_idx < this.array_length;
          start_idx += 2 * split) {
        int mid = start_idx + split - 1;
        int end_idx = min((start_idx + 2 * split - 1), (this.array_length - 1));

        this.merge_runs(this.array, start_idx, mid, end_idx);
      }
    }
    // After sorting
    print("After sorting the array: ");
    this.showArrayElements();
  }

  /**
     * @brief A method to show the elements inside the array.
     */
  void showArrayElements() {
    String s = "";
    for (int i = 0; i < this.array.length; i++) {
      s = "$s${array[i]} ";
    }
    print(s);
  }

  /**
     * @brief A method to test the sorting algorithm
     */
  static void test() {
    List<int> array = [4, 1, 3, 17, 12, 11, 8];
    TimSort sorterObj1 = new TimSort();
    TimSort sorterObj2 = new TimSort(50);
    TimSort sorterObj3 = new TimSort.fromList(array);

    sorterObj1.algorithm();
    sorterObj2.algorithm();
    sorterObj3.algorithm();

    // Testing the first array
  }
}

void main(List<String> args) {
  
  TimSort.test();
}
