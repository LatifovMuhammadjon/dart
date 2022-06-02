import 'package:hive/hive.dart';
import 'currency.dart';

const String currencyBox = "currency_box";

class DartHive {
  var boxCurrency;
  DartHive() {
    
  }

  Future openHive() async {
    boxCurrency = await Hive.openBox(currencyBox);
  }

  Future writeHive() async {
    var currency = Currency();
    await currency.loadData();
    boxCurrency.putAll(currency.map);
  }

  Future readHive() async {
    for (var i = 0; i < boxCurrency.length; i++) {
      print(
          "${boxCurrency.keys.elementAt(i)}:${boxCurrency.values.elementAt(i)}");
    }
  }

  Future searchHive(String currency) async {
    currency = currency.toUpperCase();
    print("1 USD = ${boxCurrency.get(currency)} $currency");
  }

  // Future closeHive() async {
  //   await boxCurrency.close();
  // }
}

