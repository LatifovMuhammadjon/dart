import 'dart:convert';
import 'dart:io';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

import 'model.dart';

class Weather {
  List<WeatherModel> listModel = [];
  getData() async {
    stdout.write("Mamlakatni kiriting:");
    var country = stdin.readLineSync();
    if (country != "") WeatherModel.country = country!;
    stdout.write("Shaharni kiriting:");
    var city = stdin.readLineSync();
    if (city != "") WeatherModel.city = city!;
    stdout.write("Yilni kiriting:");
    var year = stdin.readLineSync();
    if (year != "") WeatherModel.year = int.parse(year!);
    stdout.write("Oyni kiriting:");
    var month = stdin.readLineSync();
    stdout.write("Kunni kiriting:");
    dynamic day = stdin.readLineSync();
    day = day == "" ? DateTime.now().day : int.parse(day);
    if (month != "") WeatherModel.month = int.parse(month!);
    if (jsonExists()) {
      getJson();
    } else {
      await parseData();
      joinJson();
    }
    print(listModel[day - 1]);
  }

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
    var file = File(
            "E:/coding/dart/weather/jsons/${WeatherModel.country}_${WeatherModel.city}_${WeatherModel.year}_${monthToString(WeatherModel.month)}.json")
        .create();
    file.then((value) => value.writeAsString(jsonEncode(createJson)));
  }

  getJson() {
    var file = File(
            "E:/coding/dart/weather/jsons/${WeatherModel.country}_${WeatherModel.city}_${WeatherModel.year}_${monthToString(WeatherModel.month)}.json")
        .readAsStringSync();
    Map<String, dynamic> json = jsonDecode(file);
    WeatherModel.update = json["update"];
    WeatherModel.country = json["country"];
    WeatherModel.city = json["city"];
    WeatherModel.year = json["year"];
    WeatherModel.month = json["month"];
    // List list;
    json["days"].forEach((element) {
      listModel.add(WeatherModel.fromJson(element));
    });
  }

  bool jsonExists() {
    var file = File(
        "E:/coding/dart/weather/jsons/${WeatherModel.country}_${WeatherModel.city}_${WeatherModel.year}_${monthToString(WeatherModel.month)}.json");
    return file.existsSync();
  }

  hour24() async {
    var response = await get(Uri.parse(
        "https://world-weather.ru/pogoda/${WeatherModel.country}/${WeatherModel.city}/24hours"));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var captions = [
        "Soatlar",
        "Harorat",
        "Havo harorati",
        "Yog'ingarchilik ehtimoli",
        "Bosim",
        "Shamol tezligi",
        "Havo namligi"
      ];
      var columns = [];
      columns.add(document.getElementsByClassName("weather-day"));
      columns.add(document.querySelectorAll(".weather-temperature span"));
      columns.add(document.getElementsByClassName("weather-feeling"));
      columns.add(document.getElementsByClassName("weather-probability"));
      columns.add(document.getElementsByClassName("weather-pressure"));
      columns.add(document.querySelectorAll(".weather-wind span~span"));
      columns.add(document.getElementsByClassName("weather-humidity"));
      for (var i = 0; i < captions.length; i++) {
        stdout.write("${captions[i]}\t");
      }
      print("");
      for (var i = 0; i < columns[0].length; i++) {
        for (var j = 0; j < columns.length; j++) {
          stdout.write("${columns[j][i].innerHtml}\t");
          stdout.write("${j==2||j==5?"\t":""}");
          stdout.write("${j==3?"\t\t\t":""}");

        }
        print("");
      }
    }
  }
}
