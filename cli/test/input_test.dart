import 'package:cli/exceptions/exceptions.dart';
import 'package:cli/util/validate_input.dart';
import 'package:test/test.dart';

void main() {
  test('Validating name 1', () {
    expect(() => ValidateUtil.validateName(null),
        throwsA(isA<ItemNullException>()));
  });
  test('Validating name 2', () {
    expect(() => ValidateUtil.validateName('d'),
        throwsA(isA<ItemNameException>()));
  });
  test('Validating name 3', () {
    expect(() => ValidateUtil.validateName('drtrt'), returnsNormally);
  });
  test('Validating type 1', () {
    expect(() => ValidateUtil.validateType('material'),
        throwsA(isA<ItemTypeException>()));
  });
  test('Validating type 2', () {
    expect(() => ValidateUtil.validateType('imported'), returnsNormally);
  });
  test('Validating type 3', () {
    expect(() => ValidateUtil.validateType(null),
        throwsA(isA<ItemNullException>()));
  });
  test('Validating quantity 1', () {
    expect(() => ValidateUtil.validateQuantity(-78),
        throwsA(isA<ItemValueException>()));
  });
  test('Validating quantity 2', () {
    expect(() => ValidateUtil.validateQuantity(0),
        throwsA(isA<ItemValueException>()));
  });
  test('Validating quantity 3', () {
    expect(() => ValidateUtil.validateQuantity(5), returnsNormally);
  });
  test('Validating price 1', () {
    expect(() => ValidateUtil.validatePrice(-780.9),
        throwsA(isA<ItemValueException>()));
  });
  test('Validating price 2', () {
    expect(() => ValidateUtil.validatePrice(0),
        throwsA(isA<ItemValueException>()));
  });
  test('Validating price 3', () {
    expect(() => ValidateUtil.validatePrice(230), returnsNormally);
  });
}
