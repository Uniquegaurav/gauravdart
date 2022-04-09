import 'dart:io';
class NewUser{

    static String? getName(){
      print("Enter user name :");
      String? userName = stdin.readLineSync();
      return userName;
    }
    static int getAge(){
      print("Enter user age :");
      int userAge = int.parse(stdin.readLineSync()!);
      return userAge;
    }
    static int getRollNumber(){
      print("Enter user age :");
      int userRollNumber = int.parse(stdin.readLineSync()!);
      return userRollNumber;
    }
    static String? getAddress(){
      print("Enter user address :");
      String? userAddress = stdin.readLineSync();
      return userAddress;
    }
    static  List<String> getEnrolledCourses(){
      print("Enter user courses (seperated with a space) : ");
      List<String> userCourses= stdin.readLineSync()!.split(" ");
      return userCourses;
    }
    
}