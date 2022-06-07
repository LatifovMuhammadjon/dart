import 'dart:math';

import 'actions.dart';
import 'fish.dart';

class Aquarium implements Actions {
  int date = 0;
  Map<String, Fish> listFish = {};
  List<String> listFishA = [];
  List<String> listFishB = [];
  int countDead = 0;
  onStart() {
    Future.delayed(Duration(seconds: 1), () {
      date++;
      if (listFish.isEmpty && countDead == 0) {
        Fish fishA = Fish(FishType.M, "father", this);
        Fish fishB = Fish(FishType.F, "mother", this);
        onStart();
      } else if (listFishA.isEmpty || listFishB.isEmpty) {
        print(
            "Akvariumda${listFish.isEmpty ? "" : listFishA.isEmpty ? " A" : " B"} baliq qolmadi");
      } else {
        print(listFish);
        print(listFishA);
        print(listFishB);
        print(countDead);
        for (var i = 0; i < getSizeFish(); i++) {
          var key = listFish.entries.elementAt(i);
          var value = listFish.values.elementAt(i);
          value.age = date - value.birthDate;
          if (value.chooseTimes.contains(value.age) &&
              (getSizeFishA() == 1 || getSizeFishB() == 1 || value.onWill()))
            onChosenFish(value.type, value.name);
          if (value.onDead()) {
            if (listFishA.contains(value.name))
              listFishA.remove(value.name);
            else
              listFishB.remove(value.name);
            listFish.remove(value.name);
          }
        }

        onStart();
      }
    });
  }

  @override
  int getSizeFish() => listFish.length;

  @override
  int getSizeFishA() => listFishA.length;

  @override
  int getSizeFishB() => listFishB.length;

  @override
  onChosenFish(FishType type, String name) {
    if (type == FishType.M) {
      Fish choosenFish = listFish[listFishB[Random().nextInt(getSizeFishB())]]!;
      Fish(FishType.values[Random().nextInt(2)],
          onGenerate(name, choosenFish.name), this);
    } else {
      Fish choosenFish = listFish[listFishA[Random().nextInt(getSizeFishA())]]!;
      Fish(FishType.values[Random().nextInt(2)],
          onGenerate(choosenFish.name, name), this);
    }
  }

  @override
  onDead({String? name}) {
    if (listFish[name]!.type == FishType.M) {
      listFishA.remove(name);
    } else if (listFish[name]!.type == FishType.F) {
      listFishA.remove(name);
    }
    listFish.remove(name);
    countDead++;
  }

  @override
  showInfo() {
    // TODO: implement showInfo
    throw UnimplementedError();
  }
}
