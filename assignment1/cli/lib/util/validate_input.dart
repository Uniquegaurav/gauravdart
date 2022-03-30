import 'package:cli/exceptions/exceptions.dart';

class ValidateUtil {
  static void validateName(String? itemName) {
    if (itemName == null) {
      throw ItemNullException();
    }
    if (itemName.length < 2) {
      throw ItemNameException();
    }
  }

  static void validateType(String? itemType) {
    if (itemType == null) {
      throw ItemNullException();
    }
    bool isValid = (itemType == 'raw') ||
        (itemType == 'manufactured') ||
        (itemType == 'imported');
    if (!isValid) throw ItemTypeException();
  }

  static void validateQuantity(int itemValue) {
    if (itemValue <= 0) {
      throw ItemValueException();
    }
  }

  static void validatePrice(double itemValue) {
    if (itemValue <= 0) {
      throw ItemValueException();
    }
  }
}
