import 'dart:html';

sort(int a, int b) {
  if (a < b) {
    print(a);
    sort(a + 1, b);
  } else if (a > b) {
    print(a);
    sort(a - 1, b);
  }
}

class Student {
  String? firstName, lastName, group;
  double? averageMark;
  Student(this.firstName, this.lastName, this.group, this.averageMark);
  double getScholarShip() => averageMark == 5 ? 100 : 80;
}

class Aspirant extends Student {
  Aspirant(firstName, lastName, group, averageMark)
      : super(firstName, lastName, group, averageMark);
  @override
  double getScholarShip() => averageMark == 5 ? 200 : 180;
}

class Animal {
  String? food, location;
  makeNoise() => print("Такое-то животное спит");
  eat(){}
  sleep(){}
}
class Dog extends Animal {
  
}
class Cat extends Animal {
  
}
class Horse extends Animal {
  
}
class Veterinar {
  void treatAnimal(Animal animal){

  }
  
}
class Car {
  String? marka;
  Driver? driver;
  Engine? motor;
  Car(this.marka, this.driver, this.motor);

  start() => print("Поехали");
  stop() => print("Останавливаемся");
  turnRight() => print("Поворот направо");
  turnLeftt() => print("Поворот налево");
}

class Person {
  String? fullName;
  int? age;
  Person(this.fullName, this.age);
}

class Driver extends Person {
  int? experience;
  Driver(int experience, String fullName, int age) : super(fullName, age) {
    this.experience = experience;
  }
}

class Engine {
  int? power;
  String? company;
  Engine(this.power, this.company);
}

void main(List<String> args) {
  Driver a = Driver(5);
  print(a.experience);
}
