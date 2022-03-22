class ItemTypeException implements Exception {
  final String message = "Type can only be [raw , manufactured , imported]";
  @override
  String toString() {
    return message;
  }
}

class ItemNameException implements Exception {
  final String message = "Name can't be just one character";
  @override
  String toString() {
    return message;
  }
}

class ItemValueException implements Exception {
  final String message = "Entered value is invalid";
  @override
  String toString() {
    return message;
  }
}

class ItemDataTypeException implements Exception {
  final String message = "Invalid data type for this field";
  @override
  String toString() {
    return message;
  }
}

class ItemNullException implements Exception {
  final String message = "Input can't be a null value";
  @override
  String toString() {
    return message;
  }
}
