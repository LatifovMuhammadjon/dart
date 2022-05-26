import 'dart:io';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart';

class Flag {
  List urlList = [];
  List fileNameList = [];
  List countryNameList = [];

  loadData(url) async {
    var response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parse(response.body);

      var flags = document
          .querySelectorAll('.country-currencies-table img[src^="/flags/"]');
      for (var i = 0; i < flags.length; i++) {
        fileNameList.add(flags[i].attributes["src"].toString().substring(1));
        countryNameList.add(flags[i].attributes["alt"].toString());
        urlList.add(url + fileNameList[i]);
      }
    }
  }

  loadFlags() async {
    for (var i = 0; i < urlList.length; i++) {
      var response = await get(Uri.parse(urlList[i]));
      if (response.statusCode == 200) {
        var document = parse(response.body);
        var file =
            new File("E:/coding/dart/dart_flags/${fileNameList[i]}").create();
        file.then((value) => value.writeAsString(response.body));
      }
    }
  }

  loadCountryNames() {
    var str = countryNameList.join("\n");
    var file = new File("E:/coding/dart/dart_flags/country_list.txt").create();
    file.then((value) => value.writeAsString(str));
  }
}
