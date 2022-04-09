import 'dart:io';
import 'package:cli/util/user_options.dart';

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
    UserOptions options = UserOptions();
    while (true) {
      switch (choice) {
        case 1:
        options.getNewUser();
          break;
        case 2:
        options.dispalyUserDetails();
          break;
        case 3:
        options.deleteUserByRollNumber();
          break;
        case 4:
        options.saveToDisk();
          break;
        default:
        options.promptForSavingChanges();
      }
      choice = inputMainMenu();
    }
  }
}
