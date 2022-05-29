import 'dart:io';
import 'model.dart';
import 'weatherParse.dart';

main(List<String> arguments) async {
  var weather = Weather();
  weather.getData();
}
