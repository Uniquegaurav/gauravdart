import 'dart:io';
import 'package:cli/util/user_options.dart';
import 'package:cli/exceptions/exceptions.dart';

class UserManager {
  int inputMainMenu() {
    int userChoice = 5;
    print("\n1.Add User details");
    print("2.Display User details");
    print("3.Delete User details");
    print("4.Save User details");
    print("5.Exit\n");
    print("Enter choice : ");
    try {
      userChoice = int.parse(stdin.readLineSync()!);
      if (userChoice > 5) throw InvalidChoiceException();
    } on FormatException {
      print("Can't convert to a numerical value");
    } on InvalidChoiceException {
      print("Enter a valid choice (1,2,3,4,5)");
    }
    return userChoice;
  }

  void startManager() {
    int choice = inputMainMenu();
    UserOptions options = UserOptions();
    options.generateUserList();
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
