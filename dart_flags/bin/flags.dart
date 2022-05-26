import 'dart:io';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart';

class CurrencyModel {
  String name, fullName, pathIcon;
  double price;
  CurrencyModel(this.name, this.fullName, this.price, this.pathIcon);

  @override
  String toString() {
    return "{$name, $fullName, $price, $pathIcon}";
  }
}

class Flag {
  List<CurrencyModel> listModel = [];

  parseModel() async {
    var response = await get(Uri.parse("https://pokur.su/usd"));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var table = document.querySelector("#w0");
      var tbody = table?.children[1];
      var list = tbody?.children;
      for (var i = 0; i < list!.length; i++) {
        var tr = tbody?.children[i];
        var pathIcon = tr?.children[0].children[0].attributes["src"]
            .toString()
            .substring(7);
        var fullName = tr?.children[1].children[0].innerHtml;
        var shortName = tr?.children[2].innerHtml;
        var price =
            double.parse((tr?.children[3].attributes["data-sort"]).toString());

        listModel.add(CurrencyModel(shortName!, fullName!, price, pathIcon!));
      }

      // for (var i = 0; i < flags.length; i++) {
      //   // var model = CurrencyModel();
      //   var pathIcon = flags[i].attributes["src"].toString().substring(6);
      // countryNameList.add(flags[i].attributes["alt"].toString());
      // urlList.add(url + fileNameList[i]);
      // print(pathIcon);
    }
  }
}

// loadFlags() async {
//   for (var i = 0; i < urlList.length; i++) {
//     var response = await get(Uri.parse(urlList[i]));
//     if (response.statusCode == 200) {
//       var document = parse(response.body);
//       var file =
//           new File("E:/coding/dart/dart_flags/${fileNameList[i]}").create();
//       file.then((value) => value.writeAsString(response.body));
//     }
//   }
// }

// loadCountryNames() {
//   var str = countryNameList.join("\n");
//   var file = new File("E:/coding/dart/dart_flags/country_list.txt").create();
//   file.then((value) => value.writeAsString(str));
// }

// void main(List<String> args) async {
//   var flag = Flag();
//   await flag.parseModel();
// }
