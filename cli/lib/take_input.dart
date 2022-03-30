import "dart:io";
import 'package:cli/models/items.dart';
import 'package:cli/util/validate_input.dart';
import 'package:cli/models/raw_item.dart';
import 'package:cli/models/manufactured_item.dart';
import 'package:cli/models/imported_item.dart';

void takingInput() {
  bool isAddingItem = true;
  while (isAddingItem) {
    print("Enter the details of the item");
    print("Enter name of item :");
    String? itemName = "";
    while (true) {
      try {
        itemName = stdin.readLineSync();
        ValidateUtil.validateName(itemName);
        break;
      } catch (e) {
        print(e);
        print("Enter a valid name :");
      }
    }
    print("Enter type of item :");
    String? itemType = "";
    while (true) {
      try {
        itemType = stdin.readLineSync();
        itemType = itemType?.toLowerCase();
        ValidateUtil.validateType(itemType);
        break;
      } catch (e) {
        print(e);
        print("Enter a valid type :");
      }
    }

    print("Enter quantity of item :");
    int itemQuantity = 0;
    while (true) {
      try {
        itemQuantity = int.parse(stdin.readLineSync()!);
        ValidateUtil.validateQuantity(itemQuantity);
        break;
      } on FormatException {
        print("Can't convert to a numerical value");
        print("Enter a valid quantity :");
      } catch (e) {
        print(e);
        print("Enter a valid quantity :");
      }
    }

    print("Enter the price of item :");
    double itemPrice = 0.0;
    while (true) {
      try {
        itemPrice = double.parse(stdin.readLineSync()!);
        ValidateUtil.validatePrice(itemPrice);
        break;
      } on FormatException {
        print("Can't convert to a numerical value");
      } catch (e) {
        print(e);
        print("Enter a valid price :");
      }
    }
    Items newItem;
    switch (itemType) {
      case "raw":
        {
          newItem = RawItem(itemName, itemType, itemQuantity, itemPrice);
        }
        break;
      case "manufactured":
        {
          newItem =
              ManufacturedItem(itemName, itemType, itemQuantity, itemPrice);
        }
        break;
      case "imported":
        {
          newItem = ImportedItem(itemName, itemType, itemQuantity, itemPrice);
        }
        break;
      default:
        {
          newItem = RawItem(itemName, itemType, itemQuantity, itemPrice);
        }
        break;
    }
    newItem.display();
    print("Tax on the item is     : ${newItem.calculateTax()}");
    print("Final Price of item is : ${newItem.calculatePrice()}");
    print('__________________________________');
    print("Do you want to enter details of any other item [y/n]");
    String? choice = stdin.readLineSync();
    if (choice == "n") isAddingItem = false;
  }
  print("All items added ...Thank you!");
}
