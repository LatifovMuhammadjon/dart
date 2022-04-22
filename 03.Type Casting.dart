void main(List<String> args) {
  bool a = false;
  String b = a.toString();
  String num1 = "22";
  num num2 = num.parse(num1);
  double num3 = double.parse(num1);
  int? int1 = null;
  int num4 = num2.toInt();
  String num5 = num4.toString();
  int num6 = num3.toInt();
  double num7 = num6.toDouble();
  print(num2.runtimeType);
  // single-line comment
  /* multi-line comment */
}
