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
        if (getSizeFish() > 20) {
          fishA.liveTime = 10 + Random().nextInt(40);
          fishB.liveTime = 10 + Random().nextInt(40);
        } else {
          fishA.liveTime = 20 + Random().nextInt(80);
          fishB.liveTime = 20 + Random().nextInt(80);
        }
        listFish[fishA.name] = fishA;
        listFish[fishB.name] = fishB;
        listFishA.add(fishA.name);
        listFishB.add(fishB.name);
        fishA.birthDate = date;
        fishB.birthDate = date;
        onStart();
      } else if (listFishA.isEmpty || listFishB.isEmpty) {
        print(
            "Akvariumda${listFish.isEmpty ? "" : listFishA.isEmpty ? " A" : " B"} baliq qolmadi");
      } else {
        print(listFish);
        print(listFishA);
        print(listFishB);
        for (var i = 0; i < listFish.length; i++) {
          var key = listFish.entries.elementAt(i);
          var value = listFish.values.elementAt(i);
          value.age = date - value.birthDate!;
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
  onChosenFish(FishType type, String name) {}

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
