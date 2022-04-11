class InvalidChoiceException implements Exception {
  final String message = "Enter a valid choice";
  @override
  String toString() {
    return message;
  }
}

class NullException implements Exception {
  final String message = "Can't be a null value";
  @override
  String toString() {
    return message;
  }
}

class EncodingException implements Exception {
  final String message = "Not a correct format for encoding";
  @override
  String toString() {
    return message;
  }
}

class AgeException implements Exception {
  final String message = "Age should be in between 0 to 120";
  @override
  String toString() {
    return message;
  }
}

class NameException implements Exception {
  final String message = "First Name and Last name required!";
  @override
  String toString() {
    return message;
  }
}

class CourseException implements Exception {
  final String message = "Course should be minimum 4 from set [A,B,C,D,E,F]";
  @override
  String toString() {
    return message;
  }
}

class RollNumberException implements Exception {
  final String message = "Roll Number already exists";
  @override
  String toString() {
    return message;
  }
}
