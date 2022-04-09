import 'dart:convert';

class Users{
  String? name;
  int age =22;
  String? address;
  int rollNumber= 1;
  List<String>? enrolledCourses;
  Users(this.name,this.age,this.address,this.rollNumber,this.enrolledCourses);
  Users.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        address = json['address'],
        rollNumber = json['rollNumber'],
        enrolledCourses = json['enrolledCourses'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age' : age,
        'address' : address,
        'rollNumber' : rollNumber,
        'enrolledCourses' : enrolledCourses
  };
  void display() {
        print("%s\t\t\t\t\t%d\t\t\t\t\t\t\t%d\t\t\t\t\t%s\t\t\t\t\t%s\n\n $name, $rollNumber, $age, $address, $enrolledCourses");
    }
  String? getName() {
        return name;
    }
    
    int getAge() {
        return age;
    }

   String? getAddress() {
        return address;
    }

   int getRollNumber() {
        return rollNumber;
    }

  List<String>? getEnrolledCourses() {
        return enrolledCourses;
    }
}