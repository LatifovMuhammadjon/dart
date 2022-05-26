import 'flags.dart';

void main(List<String> args) async {
  Flag flag = Flag();
  await flag.loadData("https://pokur.su/");
  await flag.loadFlags();
  await flag.loadCountryNames();
}
