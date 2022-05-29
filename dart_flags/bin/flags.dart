import 'dart:convert';
import 'dart:io';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart';
import 'model.dart';

class Flag {
  List<CurrencyModel> listModel = [];

  parseModel() async {
    var response = await get(Uri.parse("https://pokur.su/usd"));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var flags = document.querySelectorAll("#w0 td img");
      var data = document.querySelectorAll("#w0 tr td a");
      String? fullName, name, path;
      double? price;
      for (var i = 0; i < flags.length; i++) {
        if (i.isEven) {
          fullName = data[i].innerHtml;
          name = data[i]
              .attributes["href"]
              .toString()
              .replaceAll("/", "")
              .toUpperCase();
          path = flags[i ~/ 2].attributes["src"].toString().substring(7);
        } else {
          price = double.parse(data[i]
              .innerHtml
              .toString()
              .replaceAll(" ", "")
              .replaceAll(",", "."));

          listModel.add(CurrencyModel(
              fullName: fullName, name: name, price: price, pathIcon: path));
        }
      }
    }

    // for (var i = 0; i < flags.length; i++) {
    //   // var model = CurrencyModel();
    //   var pathIcon = flags[i].attributes["src"].toString().substring(6);
    // countryNameList.add(flags[i].attributes["alt"].toString());
    // urlList.add(url + fileNameList[i]);
    // print(pathIcon);
  }

  joinFile() async {
    for (var i = 0; i < listModel.length; i++) {
      var path = listModel[i].pathIcon;
      var response = await get(Uri.parse("https://pokur.su/flags/$path"));
      if (response.statusCode == 200) {
        var file = new File("E:/coding/dart/dart_flags/flags/$path").create();
        file.then((value) => value.writeAsString(response.body));
      }
    }
  }

  joinJson() {
    
    var createJson = {
        "update": DateTime.now().microsecondsSinceEpoch,
        "iconPath": listModel.map((e) => e.toJson()["pathIcon"]).toList()
      };
      var file = File("E:/coding/dart/dart_flags/flags.json").create();
        file.then((value) => value.writeAsString(jsonEncode(createJson)));
  }
}



// loadCountryNames() {
//   var str = countryNameList.join("\n");
//   var file = new File("E:/coding/dart/dart_flags/country_list.txt").create();
//   file.then((value) => value.writeAsString(str));
// }

// void main(List<String> args) async {
//   var flag = Flag();
//   await flag.parseModel();
// }
