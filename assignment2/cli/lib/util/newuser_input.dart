import 'dart:io';
import 'package:cli/models/course.dart';
import 'package:cli/exceptions/exceptions.dart';
import 'package:cli/models/users.dart';

class NewUser {
  static String? getName() {
    print("Enter user name :");
    String? name = "";
    while (true) {
      try {
        name = stdin.readLineSync();
        if (name == null) throw NullException();
        if (name.split(' ').length < 2) throw NameException();
        return name;
      } on NullException {
        print("Name Can not be a null value");
      } on NameException {
        print("Enter first name and last name");
        print("Enter a valid name :");
      }
    }
  }

  static int getAge() {
    print("Enter user age :");
    while (true) {
      try {
        int userAge = int.parse(stdin.readLineSync()!);
        if (userAge < 0 || userAge > 120) throw AgeException();
        return userAge;
      } on FormatException {
        print("Age can only be integer value");
        print("Enter user age :");
      } on AgeException {
        print("Age value is only accepted between 0 to 120");
        print("Enter user age :");
      }
    }
  }

  static int getRollNumber(var allUsers) {
    print("Enter user Roll Number :");
    while (true) {
      try {
        int rollNumber = int.parse(stdin.readLineSync()!);
        for (Users user in allUsers) {
          if (user.getRollNumber() == rollNumber) throw RollNumberException();
        }
        return rollNumber;
      } on FormatException {
        print("RollNumber can only be integer value");
        print("Enter user Roll Number :");
      } on RollNumberException {
        print("User with this roll number already exists");
        print("Enter user Roll Number :");
      }
    }
  }

  static String? getAddress() {
    print("Enter user address :");
    String? userAddress = stdin.readLineSync();
    return userAddress;
  }

  static List<Courses> getEnrolledCourses() {
    print("Enter user courses (seperated with a comma) : ");
    while (true) {
      try {
        var data = stdin.readLineSync()!;
        var userCourses = <Courses>[];
        for (var asciiCourse in data.codeUnits) {
          if (asciiCourse == 44) continue;
          if (asciiCourse < 65 || asciiCourse > 70) throw CourseException();
          int idx = asciiCourse - 'A'.codeUnitAt(0);
          userCourses.add(Courses.values[idx]);
        }
        if (userCourses.length < 4) throw CourseException();
        return userCourses;
      } on CourseException {
        print("Course should be minimum 4 from set [A,B,C,D,E,F]");
        print("Enter user courses (seperated with a comma) : ");
      }
    }
  }
}
