// class SpecialString extends String{
//   String _value = "";

//   SpecialString operator *(int other) {
//     var str = this._value;
//     for (var i = 1; i < other; i++) {
//       this._value += str;
//     }
//     return SpecialString(this._value);
//   }
//   SpecialString operator -(dynamic other) {
//     if (other is String or other is Spe)
//     var str = this._value;
//     for (var i = 1; i < other; i++) {
//       this._value += str;
//     }
//     return SpecialString(this._value);
//   }
//   @override
//   String toString() {
//     return this._value;
//   }
// }

import 'dart:async';
import 'dart:collection';
import 'dart:io';

// part of 'operator.dart';

void main(List<String> args) async {
  function().timeout(Duration(seconds: 3), onTimeout: () => ,).then((value) => print(value));
  var stream = sequence().listen((event) {});
}

Stream sequence() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

FutureOr<void> func(value) {
  print(value);
}

Future function() async {
  await Future.delayed(Duration(seconds: 4));
  return 1;
}

Stream func2() async* {
  Future.delayed(Duration(seconds: 1));
  yield "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
}
