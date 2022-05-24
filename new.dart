String createPhoneNumber(List<int> numbers) {
  String s = "(";
  for (int i = 0; i < 10; i++) {
    s += i.toString();
    if (i == 2) s += ') ';
    if (i == 5) s += " ";
  }
  return s;
}

void main(List<String> args) {
  print(createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]));
}
