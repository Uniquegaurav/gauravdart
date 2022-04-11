import 'package:cli/exceptions/exceptions.dart';
import 'package:test/test.dart';
import 'package:cli/models/course.dart';

void main() {
  void getAge(int userAge) {
    if (userAge < 0 || userAge > 120) throw AgeException();
  }

  void getName(String? name) {
    if (name == null) throw NullException();
    if (name.split(' ').length < 2) throw NameException();
  }

  void getEnrolledCourses(var data) {
    var userCourses = <Courses>[];
    for (var asciiCourse in data.codeUnits) {
      if (asciiCourse == 44) continue;
      if (asciiCourse < 65 || asciiCourse > 70) throw CourseException();
      int idx = asciiCourse - 'A'.codeUnitAt(0);
      userCourses.add(Courses.values[idx]);
    }
    if (userCourses.length < 4) throw CourseException();
  }

  test('Validating age 1', () {
    expect(() => getAge(130), throwsA(isA<AgeException>()));
  });
  test('Validating age 2', () {
    expect(() => getAge(45), returnsNormally);
  });
  test('Validating name 1', () {
    expect(() => getName("Gaurav"), throwsA(isA<NameException>()));
  });
  test('Validating name 2', () {
    expect(() => getName(null), throwsA(isA<NullException>()));
  });
  test('Validating name 3', () {
    expect(() => getName("Kumar Gaurav"), returnsNormally);
  });
  test('Validating course 1', () {
    expect(
        () => getEnrolledCourses("A,C,V,P"), throwsA(isA<CourseException>()));
  });
  test('Validating course 2', () {
    expect(
        () => getEnrolledCourses("A C V<X"), throwsA(isA<CourseException>()));
  });
  test('Validating course 3', () {
    expect(() => getEnrolledCourses("A,B,C"), throwsA(isA<CourseException>()));
  });
  test('Validating course 4', () {
    expect(() => getEnrolledCourses("A,D,B,C"), returnsNormally);
  });
}
