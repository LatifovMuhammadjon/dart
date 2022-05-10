import 'dart:io';

void main() {
  List<int> sonlar =
      stdin.readLineSync()!.split(" ").map((e) => int.parse(e)).toList();
  List<int> toshlar =
      stdin.readLineSync()!.split(" ").map((e) => int.parse(e)).toList();
  int toshlarSoni = sonlar[0];
  int bolalarSoni = sonlar[1];
  int sanoq = 0;
  while (toshlarSoni > 0 && sanoq < bolalarSoni) {
    sanoq++;
    int max = toshlar[0];
    for (int j = 0; j < toshlar.length; j++) {
      if (max < toshlar[j]) {
        max = toshlar[j];
      }
    }
    toshlarSoni -= max;
    toshlar.remove(max);
  }
  if (toshlarSoni > 0) {
    print(-1);
  } else {
    print(sanoq);
  }
  exit(0);
}
