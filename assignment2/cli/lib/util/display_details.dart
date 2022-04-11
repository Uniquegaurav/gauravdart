import 'dart:io';
import 'package:cli/models/users.dart';

class DisplayDetails {
  static int choiceOfSorting() {
    print("1. Sort on basis of Name");
    print("2. Sort on basis of RollNumber");
    print("3. Sort on basis of Age");
    print("4. Sort on basis of Address");
    int choice = int.parse(stdin.readLineSync()!);
    return choice;
  }

  static int choiceForSortingOrder() {
    print("1. Ascending order ");
    print("2. Descending order");
    print("Enter choice : ");
    int order = int.parse(stdin.readLineSync()!);
    return order;
  }

  static void displayFormat() {
    print(
        "---------------------------------------------------------------------");
    print("Name       \tRoll Number\tAge\t  Address\t   Courses");
    print(
        "--------------------------------------------------------------------");
  }

  static void sortAndDisplay(var allUsers, int choice, int order) {
    allUsers.sort((a, b) {
      int result = 0;
      switch (choice) {
        case 1:
          result = a.getName().compareTo(b.getName());
          break;
        case 2:
          result = a.getRollNumber() - b.getRollNumber();
          break;
        case 3:
          result = a.getAge() - b.getAge();
          break;
        case 4:
          result = a.getAddress().compareTo(b.getAddress());
          break;
      }
      if (order == 2) result = -result;
      return result;
    });
    for (Users p in allUsers) {
      p.display();
    }
  }
}
