import 'actions.dart';
import 'fish.dart';
import 'functions.dart';
import 'shark.dart';

class Aquarium implements Actions {
  /// [variables]
  Shark _shark = Shark();
  int date = 0;
  Map<String, Fish> listFish = {};
  List<String> listFishA = [];
  List<String> listFishB = [];
  int countDead = 0;

  /// [methods]
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
        _shark.eat(this);
        checkFish();
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
    var fishName = type == FishType.M
        ? listFishB[randInt(getSizeFishB())]
        : listFishA[randInt(getSizeFishA())];
    Fish(FishType.values[randInt(2)], onGenerate(name, fishName), this);
  }

  checkFish() {
    for (var i = 0; i < getSizeFish(); i++) {
      var key = listFish.entries.elementAt(i);
      var value = listFish.values.elementAt(i);
      value.age = date - value.birthDate;
      if (value.onDead()) {
        onDead(value.name);
        continue;
      }
      if (value.chooseTimes.contains(value.age) &&
          (getSizeFishA() <= 2 || getSizeFishB() <= 2 || value.onWill()))
        onChosenFish(value.type, value.name);
    }
  }

  @override
  onDead(String? name) {
    (listFish[name]?.type == FishType.M ? listFishA : listFishB).remove(name);
    listFish.remove(name);
    print("$name is dead");
    countDead++;
    showInfo();
  }

  @override
  showInfo() {
    print("Aquarium has ${getSizeFish()} fish");
    print("${countDead} fish are dead");
  }
}
