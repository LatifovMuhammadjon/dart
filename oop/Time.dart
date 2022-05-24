class Time {
  int hour, minute, second;
  Time(this.hour, this.minute, this.second);
  int getHour() => hour;
  int getMinute() => minute;
  int getSecond() => second;
  setHour(hour) => this.hour = hour;
  setMinute(minute) => this.minute = minute;
  setSecond(second) => this.second = second;
  setTime(hour, minute, second) {
    this.hour = hour;
    this.minute = minute;
    this.second = second;
  }

  nextSecond() {
    var timeInSecond = hour * 3600 + minute * 60 + second;

    hour = (timeInSecond + 1) ~/ 3600;
    minute = (timeInSecond + 1) ~/ 60 % 60;
    second = (timeInSecond + 1) % 60;
  }

  previousSecond() {
    var timeInSecond = hour * 3600 + minute * 60 + second;

    hour = (timeInSecond - 1) ~/ 3600;
    minute = (timeInSecond - 1) ~/ 60 % 60;
    second = (timeInSecond - 1) % 60;
  }

  @override
  String toString() {
    return "${hour < 9 ? "0$hour" : hour}";
  }
}
