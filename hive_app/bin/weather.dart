import 'dart:convert';
import 'dart:io';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

import 'modelWeather.dart';

class Weather {
  List<WeatherModel> _listModel = [];

  loadData() async {
    var weather = WeatherModel();
    var year = DateTime.now();
    var response = await get(Uri.parse(
        "https://world-weather.ru/pogoda/${WeatherModel.country}/${WeatherModel.city}/${monthToString(WeatherModel.month)}-${WeatherModel.year}"));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      String selector = "ul li";
      var titleList = document.querySelectorAll("$selector i");
      var tempDayList = document.querySelectorAll("$selector span");
      var tempNightList = document.querySelectorAll("$selector p");
      var dayList = document.querySelectorAll("$selector div");
      for (var i = 0; i < titleList.length; i++) {
        var tempDay = tempDayList[i].innerHtml;
        var title = titleList[i].attributes["title"];
        var tempNight = tempNightList[i].innerHtml;
        var day = int.parse(dayList[i].innerHtml);
        _listModel.add(WeatherModel(
            tempDay: tempDay, tempNight: tempNight, title: title, day: day));
      }
    }
  }
}

