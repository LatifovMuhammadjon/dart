import 'dart:convert';
import 'dart:io';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart';
import 'modelCurrency.dart';

class Currency {
  List<CurrencyModel> listModel = [];

  loadData() async {
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
  }
}

void main(List<String> args) async {
  Currency cur = Currency();
  await cur.loadData();
  print(cur.listModel);
}
