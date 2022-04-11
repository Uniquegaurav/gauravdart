import 'package:cli/models/course.dart';
class Users implements Comparable<Users>{
  String? name;
  int age =22;
  String? address;
  int rollNumber= 1;
  List<Courses>? enrolledCourses;
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
        'enrolledCourses' : enrolledCourses.toString()
  };
  @override
  int compareTo(other) {
    var comparison = name!.compareTo(other.name!);
    if (comparison == 0) {
      return rollNumber.compareTo(other.age);
    }
    return comparison;
  }
  void display() {
        print("$name  \t$rollNumber \t$age   \t$address  \t$enrolledCourses");
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

  List<Courses>? getEnrolledCourses() {
        return enrolledCourses;
    }
}