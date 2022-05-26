import 'dart:io';

import 'package:html/parser.dart';
import 'package:http/http.dart';

class Currencies {
  List<String> currencies = ["uzs", "rub", "usd", "eur"];
  Map<String, double> valueFromCurrencies = {};
  List<String> menuLabels = [];
  Future loadData() async {
    var response = await get(Uri.parse("https://pokur.su/usd"));
    if (response.statusCode == 200) {
      var htmlParse = parse(response.body);

      for (var i = 0; i < currencies.length; i++) {
        var selector = htmlParse.querySelectorAll(
            'td.rate-col>a[href="/usd/${currencies[i]}/1/"]')[0];
        var value = double.parse(
            selector.innerHtml.replaceFirst(",", ".").replaceFirst(" ", ""));
        valueFromCurrencies.addAll({currencies[i]: value});
      }
    }
  }

  createMenu() {
    print("Menyuni tanlang");
    for (var i = 0; i < menuLabels.length; i++) {
      print("${i + 1}. ${menuLabels[i]}");
    }
    print("${menuLabels.length + 1}. Chiqish (exit)");
  }

  homePage() async {
    await loadData();
    menuLabels = ["Valyutalar kursi", "Valyutalar nisbati"];
    while (true) {
      createMenu();
      var command1 = stdin.readLineSync()!;
      if (command1 == "exit" || command1 == "${menuLabels.length + 1}") {
        break;
      } else if (command1 == "1") {
        while (true) {
          print("Valyutani kiriting");
          print("0. Orqaga");
          print("1. Chiqish (exit)");
          var command2 = stdin.readLineSync()!;
          if (command2 == "0") {
            break;
          } else if (command2 == "exit" || command2 == "1") {
            exit(0);
          } else if (command2 == "all") {
            for (var i = 0; i < valueFromCurrencies.length; i++) {
              print(
                  "1 ${valueFromCurrencies.keys.elementAt(i).toUpperCase()} ${valueFromCurrencies["uzs"]! / valueFromCurrencies.values.elementAt(i)} UZS");
            }
          } else if (currencies.contains(command2.toLowerCase())) {
            print(
                "1 ${command2.toUpperCase()} = ${valueFromCurrencies["uzs"]! / valueFromCurrencies[command2.toLowerCase()]!} UZS");
          }
          print("0. Orqaga");
          print("1. Chiqish (exit)");
          var command3 = stdin.readLineSync()!;
          if (command3 == "0") {
            break;
          } else if (command3 == "exit" || command3 == "1") {
            exit(0);
          }
        }
      } else if (command1 == "2") {
        while (true) {
          print("1-valyutani kiriting");
          print("0. Orqaga");
          print("1. Chiqish (exit)");
          var cur1 = stdin.readLineSync()!;
          if (cur1 == "0") {
            break;
          } else if (cur1 == "exit" || cur1 == "1") {
            exit(0);
          }
          print("0. Orqaga");
          print("1. Chiqish (exit)");
          print("2-valyutani kiriting");
          var cur2 = stdin.readLineSync()!;
          if (cur2 == "0") {
            break;
          } else if (cur2 == "exit" || cur2 == "1") {
            exit(0);
          }
          print("0. Orqaga");
          print("1. Chiqish (exit)");
          print("valyuta qiymatini kiriting");
          String n = stdin.readLineSync()!;
          double a;
          if (n == "0") {
            break;
          } else if (n == "exit" || n == "1") {
            exit(0);
          } else if (int.tryParse(n) != null) {
            a = int.parse(n).toDouble();
            print(
                "$a $cur1 = ${a * valueFromCurrencies[cur2.toLowerCase()]! / valueFromCurrencies[cur1.toLowerCase()]!} $cur2");
          } else if (double.tryParse(n) != null) {
            a = double.parse(n);
            print(
                "$a $cur1 = ${a * valueFromCurrencies[cur2.toLowerCase()]! / valueFromCurrencies[cur1.toLowerCase()]!} $cur2");
          }
          print("0. Orqaga");
          print("1. Chiqish (exit)");
          var command3 = stdin.readLineSync()!;
          if (command3 == "0") {
            break;
          } else if (command3 == "exit" || command3 == "1") {
            exit(0);
          }
        }
      }
    }
  }
}
