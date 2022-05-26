import 'flags.dart';

void main(List<String> args) async {
  Flag flag = Flag();
  await flag.parseModel();
  print(flag.listModel);
}
