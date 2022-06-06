import 'package:hive/hive.dart';

mixin HiveUtil {
  Future addAllBox<T>(String boxName, Iterable<T> value) async {
    Box<T> box = await isCheckOpenBox<T>(boxName);
    await box.addAll(value);
  }

  Future readBoxAll<T>(String boxName) async {
    Box<T> box = await isCheckOpenBox<T>(boxName);
    var list = box.values.toList();
    list.forEach((element) => print(element));
  }

  Future oneBox<T>(String boxName, int day) async {
    Box<T> box = await isCheckOpenBox<T>(boxName);
    var list = box.values.toList();
    print(list[day - 1]);
  }

  Future<Box<T>> getAllBox<T>(String boxName) async {
    Box<T> box = await isCheckOpenBox<T>(boxName);
    return Future<Box<T>>.value(box);
  }

  Future<Box<T>> isCheckOpenBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    } else {
      return Future.value(Hive.openBox<T>(boxName));
    }
  }

  Future<bool> isEmptyBox<T>(String boxName) async {
    Box<T> box = await isCheckOpenBox<T>(boxName);
    return Future<bool>.value(box.isEmpty);
  }
}
