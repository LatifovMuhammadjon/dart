import 'actions.dart';
import 'aquarium.dart';
import 'fish.dart';
import 'functions.dart';

class Shark {
  eat(Aquarium action) {
    if (action.getSizeFish() > 20 &&
        action.date % (100 ~/ action.getSizeFish()) == 0) {
      Fish? fish;
      String? fishName;
      if ((action.getSizeFishA() - action.getSizeFishB()).abs() <= 10)
        var fishName =
            action.listFish.keys.elementAt(randInt(action.getSizeFish()));
      else if (action.getSizeFishA() < action.getSizeFishB()) {
        fishName = action.listFishB[randInt(action.getSizeFishB())];
      } else {
        fishName = action.listFishA[randInt(action.getSizeFishA())];
      }
      fish = action.listFish[fishName];

      print("shark eat ${fish?.name}");
      fish?.liveTime = fish.age;
    }
  }
}
