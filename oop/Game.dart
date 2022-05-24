import 'dart:io';
import 'dart:core';

List<String> values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
List<String> win_ways = [
  '012',
  '048',
  '036',
  '147',
  '246',
  '258',
  '345',
  '678'
];
int counter = 0;
bool winner = false;
bool isXturn = true;

void main(List<String> args) {
  newGame();
  nextPlayer();
}

void newGame() {
  print('   |   |   ');
  print(' ${values[0]} | ${values[1]} | ${values[2]} ');
  print('___|___|___');
  print('   |   |   ');
  print(' ${values[3]} | ${values[4]} | ${values[5]} ');
  print('___|___|___');
  print('   |   |   ');
  print(' ${values[6]} | ${values[7]} | ${values[8]} ');
  print('   |   |   ');
}

void nextPlayer() {
  print('Choose Number for ${isXturn == true ? "X" : "0"}');
  int value = int.parse(stdin.readLineSync()!);
  values[value - 1] = isXturn ? 'X' : '0';
  isXturn = !isXturn;
  counter++;
  if (counter == 9) {
    winner = true;
    print('DRAW!');
  } else {
    clearScreen();
    newGame();
  }
  checkWinner('X');
  checkWinner('0');

  if (winner == false) nextPlayer();
}

void checkWinner(player) {
  for (final item in win_ways) {
    bool combinationValidity = checkCombination(item, player);
    if (combinationValidity == true) {
      print('$player WON!');
      winner = true;
      break;
    }
  }
}

bool checkCombination(String combination, String checkFor) {
  List<int> numbers = combination.split('').map((item) {
    return int.parse(item);
  }).toList();
  bool match = false;
  for (final item in numbers) {
    if (values[item] == checkFor) {
      match = true;
    } else {
      match = false;
      break;
    }
  }
  return match;
}

void clearScreen() {
  print(Process.runSync("clear", [], runInShell: true).stdout);
}