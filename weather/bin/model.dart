String monthToString(int n) {
  switch (n) {
    case 1:
      return "january";
    case 2:
      return "february";
    case 3:
      return "march";
    case 4:
      return "april";
    case 5:
      return "may";
    case 6:
      return "june";
    case 7:
      return "july";
    case 8:
      return "august";
    case 9:
      return "september";
    case 10:
      return "october";
    case 11:
      return "november";
    case 12:
      return "december";
    default:
      return n.toString();
  }
}

class WeatherModel {
  static String country = "uzbekistan", city = "farghona";
  String? tempDay, tempNight, title;
  int? day = DateTime.now().day;
  static int year = DateTime.now().year, month = DateTime.now().month, update = DateTime.now().microsecondsSinceEpoch;
  WeatherModel({this.title, this.day, this.tempDay, this.tempNight});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      day: json["day"],
      title: json["title"],
      tempDay: json["tempDay"],
      tempNight: json["tempNight"]);

  Map<String, dynamic> toJson() => <String, dynamic>{
        "day": day,
        "title": title,
        "tempDay": tempDay,
        "tempNight": tempNight
      };
  @override
  String toString() => "{$day, $title, $tempDay, $tempNight}";
}
