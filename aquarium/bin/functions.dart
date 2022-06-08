import 'dart:math';

int randInt(int n) => Random().nextInt(n);

onGenerate(String fatherName, String motherName) =>
    fatherName.substring(fatherName.length - fatherName.length ~/ 3) +
    motherName.substring(motherName.length - motherName.length ~/ 3) +
    String.fromCharCodes(List.generate(
        (motherName.length + fatherName.length) ~/ 6,
        (index) => randInt(26) + 97));
