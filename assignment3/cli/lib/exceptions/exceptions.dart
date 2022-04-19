class CyclicDependencyException implements Exception {
  final String message = "Cyclic Exists";
  @override
  String toString() {
    return message;
  }
}

class NoSuchNodeException implements Exception {
  final String message = "No such node exists with this id";
  @override
  String toString() {
    return message;
  }
}

class InvalidNodeIdException implements Exception {
  final String message = "Node id is not a valid id";
  @override
  String toString() {
    return message;
  }
}

class IdAlreadyExistsException implements Exception {
  final String message = "Node with this id already exists";
  @override
  String toString() {
    return message;
  }
}

class InvalidChoiceException implements Exception {
  final String message = "Enter a valid choice";
  @override
  String toString() {
    return message;
  }
}
