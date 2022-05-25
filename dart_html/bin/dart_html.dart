import 'dart:io';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:http/http.dart';
import 'currencies.dart';

void main(List<String> arguments) async {
  var curr = Currencies();
  curr.homePage();
}
