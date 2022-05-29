class CurrencyModel {
  String? name, fullName, pathIcon;
  double? price;
  CurrencyModel({this.name, this.fullName, this.price, this.pathIcon});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
      name: json["name"],
      fullName: json["fullName"],
      price: json["price"],
      pathIcon: json["pathIcon"]);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        "fullName": fullName,
        "price": price,
        "pathIcon": pathIcon
      };
  @override
  String toString() {
    return "{$name, $fullName, $price, $pathIcon}";
  }
}
