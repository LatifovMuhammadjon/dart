import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'currency.dart';
import 'modelCurrency.dart';
import 'modelWeather.dart';
import 'weather.dart';

main(List<String> arguments) async {
  Hive.init("e:/coding/dart/hive_app/db");
  Hive.registerAdapter<WeatherModel>(WeatherModelAdapter());
  openCurrencyHive();
}

const String currencyBox = "currency_box";
String weatherBox =
    '${WeatherModel.country}_${WeatherModel.city}_${WeatherModel.year}_${monthToString(WeatherModel.month)}';

Future openWeatherHive() async {
  var boxWeather = await Hive.openBox<WeatherModel>(weatherBox);
  var weather = Weather();
  await weather.loadData();
  print(weather.listModel.length);
  for (var i = 0; i < weather.listModel.length; i++) {
    WeatherModel model = weather.listModel[i];
    boxWeather.put(model.day, model);
  }
  WeatherModel? model = boxWeather.get(30);
  print(model);
}

Future openCurrencyHive() async {
  var boxCurrency = await Hive.openBox<String>(currencyBox);
  var currency = Currency();
  await currency.loadData();

  print(currency.listModel.length);
  for (var i = 0; i < currency.listModel.length; i++) {
    var jsonModel = currency.listModel[i].toJson();
    print(currency.listModel[i]);
    await boxCurrency.put(jsonModel["name"], jsonEncode(jsonModel));
  }

  CurrencyModel? model =
      CurrencyModel.fromJson(jsonDecode(boxCurrency.get("DASH")!));
  print(model);
}
