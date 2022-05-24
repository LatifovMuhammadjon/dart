import 'dart:math';
import 'dart:io';

import '../bubbleSort.dart';

Future printWithClear(String s) async {
  await Future.delayed(Duration(seconds: 2), () {
    print(Process.runSync("cmd", ['C "cls"'], runInShell: true).stdout);
    print(s);
  });
}

Future printWithoutClear(String s) async {
  await Future.delayed(Duration(seconds: 2), () {
    print(s);
  });
}

class Game {
  final String defaultValue = "     \n* * *\n     ";
  String field = "     \n* * *\n     ";
  int _position = new Random().nextInt(3) + 1;

  _moveUp(int n) {
    field = field.replaceRange(2 * n - 2, 2 * n - 1, "*");
    field = field.replaceRange(2 * n + 4, 2 * n + 5, " ");
  }

  _moveDown(int n) {
    field = field.replaceRange(2 * n + 4, 2 * n + 5, " ");
    field = field.replaceRange(2 * n + 10, 2 * n + 11, "*");
  }

  _moveRight(int n) {
    field = field.replaceRange(2 * n + 10, 2 * n + 11, " ");
    field = field.replaceRange(2 * n + 12, 2 * n + 13, "*");
  }

  _moveLeft(int n) {
    field = field.replaceRange(2 * n - 2, 2 * n - 1, " ");
    field = field.replaceRange(2 * n - 4, 2 * n - 3, "*");
  }

  begin() {
    field = field.replaceRange(2 * _position + 4, 2 * _position + 5, "O");
    printWithClear(field);
    field = defaultValue;
    printWithClear(field);
  }

  swap(int a, int b) {
    if (a == _position) {
      _position = b;
    } else if (b == _position) {
      _position = a;
    }
    if (b < a) {
      swap(a, b);
    }
    _moveDown(a);
    _moveUp(b);
    printWithClear(field);
    for (int i = 0; i < b - a; i++) {
      _moveRight(a + i);
      _moveLeft(b - i);
      printWithClear(field);
    }
    field = defaultValue;
    printWithClear(field);
  }

  check(int n) {
    field = field.replaceRange(2 * _position + 4, 2 * _position + 5, "O");
    printWithClear(field);
    printWithoutClear(n == _position ? "You Win" : "You Lose");
  }
}

void main(List<String> args) {
  Game game = new Game();
  List<int> indexes = [1, 2, 3];

  int countSwap = 3 + Random().nextInt(2);
  int random1, random2;

  game.begin();
  game.swap(1, 3);
  for (int i = 0; i < 1; i++) {
    int i1 = Random().nextInt(3);
    swap(indexes[i1], indexes[2]);
    int i2 = Random().nextInt(2);
    swap(indexes[i2], indexes[1]);
    random1 = indexes[1];
    random2 = indexes[2];
    game.swap(random1, random2);
  }
  stdout.write("Enter one of the numbers 1, 2, 3: ");
  int number = int.parse(stdin.readLineSync()!);
  if (number > 0 && number < 4) {
    game.check(number);
  }
}
