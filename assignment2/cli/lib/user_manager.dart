import 'dart:io';
import 'package:cli/util/user_functions.dart';

class UserManager {
  int userChoice = 5;
  int inputMainMenu() {
    print("1.Add User details");
    print("2.Display User details");
    print("3.Delete User details");
    print("4.Save User details");
    print("5.Exit\n");
    print("Enter choice : ");
    try {
      userChoice = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print(e);
    }
    return userChoice;
  }

  void startManager() {
    int choice = inputMainMenu();

    while (true) {
      switch (choice) {
        case 1:
          AllFunctions.getNewUser();
          break;
        case 2:
          AllFunctions.dispalyUserDetails();
          break;
        case 3:
          AllFunctions.deleteUserByRollNumber();
          break;
        case 4:
          AllFunctions.saveToDisk();
          break;
        default:
          AllFunctions.promptForSavingChanges();
      }
      choice = inputMainMenu();
    }
  }
}
