import 'dart:math';
import 'actions.dart';
import 'aquarium.dart';
import 'fish_action.dart';
import 'functions.dart';

enum FishType { M, F }

class Fish implements FishAction {
  /// [variables]
  FishType type;
  String _name;
  late int liveTime, birthDate, countChoose;
  int age = 0;
  List<int> chooseTimes = [];

  /// [constructor]
  Fish(this.type, this._name, Aquarium action) {
    print("$_name is born");
    if (type == FishType.M)
      action.listFishA.add(name);
    else
      action.listFishB.add(name);
    birthDate = action.date;
    countChoose = 1 + randInt(action.getSizeFish() <= 20 ? 4 : 3);
    liveTime = 10 + randInt(action.getSizeFish() <= 20 ? 20 : 10);
    onChoose();
    action.listFish[name] = this;
    action.showInfo();
  }

  /// [methods]
  @override
  bool onDead() => age == liveTime;

  @override
  onChoose() {
    for (var i = 0; i < countChoose; i++) {
      var chooseTime = randInt(liveTime);
      if (chooseTimes.contains(chooseTime)) {
        i--;
        continue;
      } else {
        chooseTimes.add(chooseTime);
      }
    }
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
}

void main(List<String> args) {
  // var fish = Fish();
  // print(fish.onGenerate("father", "mother"));
}
