import 'package:cli/util/newuser_input.dart';
import 'package:cli/models/users.dart';
import 'dart:io';
import 'dart:convert';
class UserOptions{
  var allUsers = <Users>[]; 
  late File file; 
  UserOptions()  {
    file = File('D:/Sadi/../vault.json'); 
    Future<String> contents = file.readAsString();
    var userMap = jsonDecode(contents.toString());
    for(var p in userMap){
        Users user = Users(p['name'],p['age'],p['address'],p['rollNumber'],p['enrolledCourses']);
        allUsers.add(user);
    }
  }
  List<Users> getAllUsers(){
    return allUsers;
  }   
   void getNewUser() {
    print("Enter new user details!");
    String? name = NewUser.getName();
    int age = NewUser.getAge();
    String? address = NewUser.getAddress();
    int rollNumber= NewUser.getRollNumber();
    List<String> enrolledCourses = NewUser.getEnrolledCourses();
    Users newUser= Users(name, age, address, rollNumber, enrolledCourses);
    allUsers.add(newUser);
  }
  void deleteUserByRollNumber(){
   int rollNuumber = NewUser.getRollNumber();
   final userIndex = this.allUsers.indexWhere((user) => user.rollNumber ==rollNuumber);
   if (userIndex != -1) {
      this.allUsers.removeAt(userIndex);
      print('removed teacher => ${rollNuumber.toString()}');
   } else {
      print("No user exists with this roll number");
   }
  }
  void dispalyUserDetails(){
    
    print('this is what i wanted to say');
    
  }
  void saveToDisk(){
    String json = jsonEncode(allUsers);
    file.writeAsStringSync(json);

  }
  void promptForSavingChanges(){
    print('need to implement this');
  }
}
