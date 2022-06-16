import 'dart:math';

class BucketSort {

    

    /**
     * BucketSort algorithms implements
     *
     * @param arr the array contains elements
     */
    void _bucketSort(List<int> arr) {
        /* get max value of arr */
        int max = arr[0], min = arr[0];

        /* get min value of arr */
        for (var i = 0; i < arr.length; i++) {
          if (max<arr[i]) {
            max = arr[i];
          }
          if (min>arr[i]) {
            min = arr[i];
          }
        }

        /* number of buckets */
        int numberOfBuckets = max - min + 1;

        List<List<int>> buckets = [];

        /* init buckets */
        for (int i = 0; i < numberOfBuckets; ++i) {
            buckets.add([]);
        }

        /* store elements to buckets */
        for (int value in arr) {
            int hash = this.hash(value, min, numberOfBuckets);
            buckets[hash].add(value);
        }

        /* sort individual bucket */
        for (List<int> bucket in buckets) {
            bucket.sort();
        }

        /* concatenate buckets to origin array */
        int index = 0;
        for (List<int> bucket in buckets) {
            for (int value in bucket) {
                arr[index++] = value;
            }
        }
    }

    int hash(int elem, int min, int numberOfBucket) {
        return (elem - min) ~/ numberOfBucket;
    }

}
void main() {
        List<int> arr = List.filled(10, 0);

        /* generate 10 random numbers from -50 to 49 */
        Random random = new Random();
        for (int i = 0; i < arr.length; ++i) {
            arr[i] = random.nextInt(100) - 50;
        }
        BucketSort b = BucketSort();
        b._bucketSort(arr);

        /* check array is sorted or not */
        for (int i = 0, limit = arr.length - 1; i < limit; ++i) {
            print(arr[i] <= arr[i + 1]);
        }
    }