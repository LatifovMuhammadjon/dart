import 'weatherParse.dart';

main(List<String> arguments) async {
  var wet = Weather();
  // await wet.parseData();
  print(wet.getJson());
}
