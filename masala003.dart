import 'dart:io';

String reverse(String str) {
  String s = "";
  for (int i = 1; i <= str.length; i++) {
    s += str[str.length - i];
  }
  str = s;
  return str;
}

void main(List<String> args) {
  String a = stdin.readLineSync()!;
  String b = stdin.readLineSync()!;
  reverse(a);
  reverse(b);
  int max = a.length > b.length ? a.length : b.length;
  int min = a.length == max ? b.length : a.length;
  String s = "";
  int dil = 0;
  for (int i = 0; i <= min; i++) {
    if (i < min) {
      s += ((int.parse(a[i]) + int.parse(b[i]) + dil) % 10).toString();
      dil = (int.parse(a[i]) + int.parse(b[i]) + dil) ~/ 10;
    } else if (a.length > b.length) {
      s += (int.parse(a[i]) + dil).toString();
      s += a.substring(i);
    } else if (a.length < b.length) {
      s += (int.parse(b[i]) + dil).toString();
      s += b.substring(i);
    } else {
      if (dil > 0) {
        s += dil.toString();
      }
      ;
    }
  }
  print(reverse(s));
  exit(0);
}
