import 'dart:io';

class Game {
  static List<List<String>> game = [
    [" ", " ", " "],
    [" ", " ", " "],
    [" ", " ", " "]
  ];
  // static bool isEnd();
  static String field(game) => """
  1 2 3
 +-+-+-+
1|${game[0][0]}|${game[0][1]}|${game[0][2]}|
 +-+-+-+
2|${game[1][0]}|${game[1][1]}|${game[1][2]}|
 +-+-+-+
3|${game[2][0]}|${game[2][1]}|${game[2][2]}|
 +-+-+-+
""";
  static String winner(game) {
    if (game[0][0] == game[0][1] &&
        game[0][0] == game[0][2] &&
        game[0][0] != " ") return game[0][0];
    if (game[0][0] == game[1][0] &&
        game[0][0] == game[2][0] &&
        game[0][0] != " ") return game[0][0];
    if (game[1][1] == game[0][1] &&
        game[1][1] == game[2][1] &&
        game[1][1] != " ") return game[1][1];
    if (game[1][1] == game[1][0] &&
        game[1][1] == game[1][2] &&
        game[1][1] != " ") return game[1][1];
    if (game[1][1] == game[0][0] &&
        game[1][1] == game[2][2] &&
        game[1][1] != " ") return game[1][1];
    if (game[1][1] == game[2][0] &&
        game[1][1] == game[0][2] &&
        game[1][1] != " ") return game[1][1];
    if (game[2][2] == game[2][0] &&
        game[1][1] == game[2][1] &&
        game[2][2] != " ") return game[2][2];
    if (game[2][2] == game[0][2] &&
        game[1][1] == game[1][2] &&
        game[2][2] != " ") return game[2][2];
    return " ";
  }

  startGame() {
    print(field(game));
    for (int i = 0; i < 9; i++) {
      Iterable<int> a = (stdin.readLineSync()!).split("").map(int.parse);
      int x = a.elementAt(0);
      int y = a.elementAt(1);
      if (game[x - 1][y - 1] == " ") {
        game[x - 1][y - 1] = i.isEven ? "X" : "O";
      } else {
        i--;
        print(field(game));
        print("This cell is not empty");
        print("Try again");
        continue;
      }
      print(field(game));
      if (winner(game) != " ") {
        print("${winner(game)} is Won");
        break;
      }
    }
    if (winner(game) == " ") {
      print("Game is Draw");
    }
  }
}

void main(List<String> args) {
  Game().startGame();
}