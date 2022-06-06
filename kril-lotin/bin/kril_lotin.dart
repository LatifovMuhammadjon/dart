import 'dart:io';

void main(List<String> arguments) {
  // print('Hello world!');
  var alphabet = {
    "yo": "ё",
    "ye": "ье",
    " e": " э",
    "a": "а",
    "b": "б",
    "d": "д",
    "e": "е",
    "f": "ф",
    "g": "г",
    "h": "ҳ",
    "i": "и",
    "j": "ж",
    "k": "к",
    "l": "л",
    "m": "м",
    "n": "н",
    "o": "о",
    "p": "п",
    "q": "қ",
    "r": "р",
    "s": "с",
    "t": "т",
    "u": "у",
    "v": "в",
    "x": "х",
    "y": "й",
    "z": "з",
  };
  var s = stdin.readLineSync()!;
  String str = "";
  for (var i = 0; i < s.length; i++) {
    if (alphabet.keys.contains(s[i])) {
      str += alphabet[s[i]]!;
    }
  }
  print(str);
}