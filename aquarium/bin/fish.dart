import 'dart:math';
import 'actions.dart';
import 'aquarium.dart';
import 'fish_action.dart';

enum FishType { M, F }

class Fish implements FishAction {
  FishType type;
  String _name;
  late int liveTime, birthDate, countChoose;
  int age = 0;
  List<int> chooseTimes = [];

  Fish(this.type, this._name, Aquarium action) {
    if (type == FishType.M)
      action.listFishA.add(name);
    else
      action.listFishB.add(name);
    birthDate = action.date;
    countChoose = 1 + Random().nextInt(action.getSizeFish() <= 20 ? 3 : 2);
    liveTime = 10 + Random().nextInt(action.getSizeFish() <= 20 ? 40 : 20);
    for (var i = 0; i < countChoose; i++) {
      var chooseTime = Random().nextInt(liveTime);
      if (chooseTimes.contains(chooseTime)) {
        i--;
        continue;
      } else {
        chooseTimes.add(chooseTime);
      }
    }
    action.listFish[name] = this;
  }

  @override
  bool onDead() => age == liveTime;
  @override
  onChoose() {
    //  / TODO: implement onChoose
    throw UnimplementedError();
  }

  @override
  onLive() {
    // TODO: implement onLive
    throw UnimplementedError();
  }

  @override
  bool onWill() => Random().nextBool();

  @override
  String get name => this._name;

  @override
  String toString() {
    return "Fish{gender: $type, name: $_name, age: $age}";
  }
}

onGenerate(String fatherName, String motherName) =>
    fatherName.substring(fatherName.length - fatherName.length ~/ 3) +
    motherName.substring(motherName.length - motherName.length ~/ 3) +
    String.fromCharCodes(List.generate(
        (motherName.length + fatherName.length) ~/ 6,
        (index) => Random().nextInt(26) + 97));

void main(List<String> args) {
  // var fish = Fish();
  // print(fish.onGenerate("father", "mother"));
}
