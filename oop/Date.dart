class Date {
  int? day, month, year;
  Date(int day, int month, int year) {
    try {
      if (day >= 1 && day <= 31) {
        this.day = day;
      } else {
        throw FormatException();
      }
    } on FormatException {
      print("No input validation needed");
    }
    try {
      if (month >= 1 && month <= 12) {
        this.month = month;
      } else {
        throw FormatException();
      }
    } on FormatException {
      print("No input validation needed");
    }
    try {
      if (year >= 1900 && year <= 9999) {
        this.year = year;
      } else {
        throw FormatException();
      }
    } on FormatException {
      print("No input validation needed");
    }
  }
  int getDay() => day ?? 1;
  int getMonth() => month ?? 1;
  int getYear() => year ?? 1900;
  void setDay(int day) => this.day = day;
  void setMonth(int month) => this.month = month;
  void setYear(int year) => this.year = year;
  void setDate(int day, int month, int year) {
    try {
      if (day >= 1 && day <= 31) {
        this.day = day;
      } else {
        throw FormatException();
      }
    } on FormatException {
      print("No input validation needed");
    }
    try {
      if (month >= 1 && month <= 12) {
        this.month = month;
      } else {
        throw FormatException();
      }
    } on FormatException {
      print("No input validation needed");
    }
    try {
      if (year >= 1900 && year <= 9999) {
        this.year = year;
      } else {
        throw FormatException();
      }
    } on FormatException {
      print("No input validation needed");
    }
  }

  @override
  String toString() {
    return "${day! > 9 ? day : "0$day"}/${month! > 9 ? month : "0$month"}/${year!.toStringAsPrecision(4)}";
  }
}

void main(List<String> args) {
  var a = new Date(0, 10, 2000);

  // print(a);
}
