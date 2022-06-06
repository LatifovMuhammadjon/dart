import 'dart:math';

import 'actions.dart';
import 'fish_action.dart';

enum FishType { M, F }

class Fish implements FishAction {
  FishType type;
  String _name;
  int? liveTime, birthDate, age = 0;

  Fish(this.type, this._name, Actions action) {
    // if (name == null) onGenerate(fatherName, motherName);
  }
  @override
  onChoose() {
    // TODO: implement onChoose
    throw UnimplementedError();
  }

  @override
  onDead() {
    // TODO: implement onDead
    throw UnimplementedError();
  }

  @override
  onGenerate(String fatherName, String motherName) {
    this._name =
        fatherName.substring(fatherName.length - fatherName.length ~/ 3) +
            motherName.substring(motherName.length - motherName.length ~/ 3) +
            String.fromCharCodes(List.filled(
                (motherName.length + fatherName.length) ~/ 6,
                Random().nextInt(26) + 97));
  }

  @override
  onLive() {
    // TODO: implement onLive
    throw UnimplementedError();
  }

  @override
  onWill() {}

  @override
  String get name => this._name;

  @override
  String toString() {
    return "Fish{gender: $type, name: $_name, age: $age}";
  }
}

void main(List<String> args) {
  // var fish = Fish();
  // print(fish.onGenerate("father", "mother"));
}
