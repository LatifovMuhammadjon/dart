import 'dart:io';

import 'package:html/parser.dart';
import 'package:http/http.dart';

class Network {
  Future<List<MapEntry<String, String>>?> getCountryBase() async {
    try {
      var response = await get(Uri.parse('https://world-weather.ru/pogoda/'));
      if (response.statusCode == 200) {
        List<MapEntry<String, String>> mapData = [];
        parse(response.body).querySelectorAll('a').forEach((e) {
          mapData.add(MapEntry(
              e.attributes['href']!
                  .replaceAll('http://world-weather.ru/pogoda/', '')
                  .replaceAll('/', ''),
              e.text));
        });
        return mapData;
      }
    } on SocketException {
      print('Error with connection internet');
    } catch (e) {
      print('getCountryBase: $e');
    }
    return null;
  }

  Future<List<MapEntry<String, String>>?> getRegionBase(String country) async {
    try {
      var response =
          await get(Uri.parse("https://world-weather.ru/pogoda/$country/"));
      if (response.statusCode == 200) {
        List<MapEntry<String, String>> mapData = [];
        parse(response.body).querySelectorAll('a').forEach((e) {
          mapData.add(MapEntry(
              e.attributes['href']!
                  .replaceAll('//world-weather.ru/pogoda/$country/', '')
                  .replaceAll('/', ''),
              e.text));
        });
        return mapData;
      }
    } on SocketException {
      print('Error with connection internet');
    } catch (e) {
      print('getCountryBase: $e');
    }
    return null;
  }
}
