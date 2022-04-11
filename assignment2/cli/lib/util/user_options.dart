import 'package:cli/models/course.dart';
import 'package:cli/util/newuser_input.dart';
import 'package:cli/models/users.dart';
import 'package:cli/util/display_details.dart';
import 'package:cli/exceptions/exceptions.dart';
import 'dart:io';
import 'dart:convert';

class UserOptions {
  var allUsers = <Users>[];
  late File file;
  void generateUserList() {
    try {
      file = File('lib/data/data.json');
    } catch (e) {
      print(e);
    }
    late var contents = "";
    try {
      contents = file.readAsStringSync();
      if (contents == "") throw NullException();
    } on NullException {
      print("No users exists in disk");
    }
    try {
      var userMap = jsonDecode(contents);
      for (var p in userMap) {
        var data = p["enrolledCourses"];
        data = data.substring(1, data.length - 1).toString().split(', ');
        var userCourses = <Courses>[];
        for (var i in data) {
          if (i == "Courses.A") userCourses.add(Courses.A);
          if (i == "Courses.B") userCourses.add(Courses.B);
          if (i == "Courses.C") userCourses.add(Courses.C);
          if (i == "Courses.D") userCourses.add(Courses.D);
          if (i == "Courses.E") userCourses.add(Courses.E);
          if (i == "Courses.F") userCourses.add(Courses.F);
        }
        Users user = Users(
            p['name'], p['age'], p['address'], p['rollNumber'], userCourses);
        allUsers.add(user);
      }
    } catch (e) {
      print(e);
    }
  }

  List<Users> getAllUsers() {
    return allUsers;
  }

  void getNewUser() {
    print("Enter new user details!");
    String? name = NewUser.getName();
    int age = NewUser.getAge();
    String? address = NewUser.getAddress();
    int rollNumber = NewUser.getRollNumber(allUsers);
    var enrolledCourses = NewUser.getEnrolledCourses();
    Users newUser = Users(name, age, address, rollNumber, enrolledCourses);
    allUsers.add(newUser);
    try {
      allUsers.sort();
    } catch (e) {
      print(e);
    }
  }

  void deleteUserByRollNumber() {
    print("Enter user Roll Number to delete:");
    int rollNumber = int.parse(stdin.readLineSync()!);
    final userIndex =
        allUsers.indexWhere((user) => user.rollNumber == rollNumber);
    if (userIndex != -1) {
      allUsers.removeAt(userIndex);
      print('Delete user with rollNumber ${rollNumber.toString()}');
    } else {
      print("No user exists with this roll number");
    }
  }

  void dispalyUserDetails() {
    DisplayDetails.displayFormat();
    for (var element in allUsers) {
      element.display();
    }

    print("\nWant to sort the user details[y/n]");
    String? sortChoice = stdin.readLineSync();
    while (sortChoice == "y") {
      int choice = DisplayDetails.choiceOfSorting();
      int order = DisplayDetails.choiceForSortingOrder();
      DisplayDetails.displayFormat();
      DisplayDetails.sortAndDisplay(allUsers, choice, order);
      print("Want to sort the user details[y/n]");
      sortChoice = stdin.readLineSync();
    }
  }

  void saveToDisk() {
    allUsers.sort();
    try {
      String json = jsonEncode(allUsers);
      file.writeAsStringSync(json);
      print("details saved!");
    } on EncodingException {
      print("Can not encode user list");
    } catch (e) {
      print(e);
    }
  }

  void promptForSavingChanges() {
    print("Do you wish to save changes before exit ? (y/n)");
    String? choice = stdin.readLineSync();
    if ("y" == choice) {
      saveToDisk();
    }
    exit(0);
  }
}
