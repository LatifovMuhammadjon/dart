import 'dart:convert';
import 'dart:io';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

import 'model.dart';

class Weather {
  List<WeatherModel> listModel = [];
  parseData() async {
    var weather = WeatherModel();
    var year = DateTime.now();
    var response = await get(Uri.parse(
        "https://world-weather.ru/pogoda/${WeatherModel.country}/${WeatherModel.city}/${monthToString(WeatherModel.month)}-${WeatherModel.year}"));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      String selector = "ul li a";
      var titleList = document.querySelectorAll("$selector i");
      var tempDayList = document.querySelectorAll("$selector span");
      var tempNightList = document.querySelectorAll("$selector p");
      var dayList = document.querySelectorAll("$selector div");
      for (var i = 0; i < titleList.length; i++) {
        var tempDay = tempDayList[i].innerHtml;
        var title = titleList[i].attributes["title"];
        var tempNight = tempNightList[i].innerHtml;
        var day = int.parse(dayList[i].innerHtml);
        listModel.add(WeatherModel(
            tempDay: tempDay, tempNight: tempNight, title: title, day: day));
      }
    }
  }

  joinJson() {
    var createJson = {
      "update": DateTime.now().microsecondsSinceEpoch,
      "country": WeatherModel.country,
      "city": WeatherModel.city,
      "year": WeatherModel.year,
      "month": WeatherModel.month,
      "days": listModel.map((e) => e.toJson()).toList()
    };
    var file = File("E:/coding/dart/weather/weather.json").create();
    file.then((value) => value.writeAsString(jsonEncode(createJson)));
  }

  getJson() {
    var file = File("E:/coding/dart/weather/weather.json").readAsStringSync();
    Map<String, dynamic> json = jsonDecode(file);
    WeatherModel.update = json["update"];
    WeatherModel.country = json["country"];
    WeatherModel.city = json["city"];
    WeatherModel.year = json["year"];
    WeatherModel.month = json["month"];
    List list = json["days"];
    list.forEach((element) {
      jsonDecode(element);
    });
    return list;
  }
}
