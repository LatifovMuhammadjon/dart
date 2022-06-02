import 'package:hive/hive.dart';
part 'modelCurrency.g.dart';
@HiveType(typeId: 0)
class CurrencyModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? fullName;
  @HiveField(3)
  String? pathIcon;
  @HiveField(2)
  double? price;
  CurrencyModel({this.name, this.fullName, this.price, this.pathIcon});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
      name: json["name"],
      fullName: json["fullName"],
      price: json["price"],
      pathIcon: json["pathIcon"]);

  Map<String, dynamic> toJson() => <String, dynamic>{
        "name": name,
        "fullName": fullName,
        "price": price,
        "pathIcon": pathIcon
      };
  @override
  String toString() {
    return "CurrencyModel{name: $name, fullName: $fullName, price: $price, pathIcon: $pathIcon}";
  }
}
