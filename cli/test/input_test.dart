import 'package:cli/util/validate_input.dart';
import 'package:test/test.dart';

void main() {
  test('Validating name 1', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validateName('b');
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, "Name can't be just one character");
  });
  test('Validating name 2', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validateName('gaer');
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, 'NO EXCEPTION');
  });
  test('Validating name 3', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validateName('56ag had');
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, 'NO EXCEPTION');
  });
  test('Validating type 1', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validateType('raw');
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, 'NO EXCEPTION');
  });
  test('Validating type 2', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validateType('lasjd');
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, "Type can only be [raw , manufactured , imported]");
  });
  test('Validating type 3', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validateType('material');
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, "Type can only be [raw , manufactured , imported]");
  });
  test('Validating quantity 1', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validateQuantity(0);
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, "Entered value is invalid");
  });
  test('Validating quantity 2', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validateQuantity(-345);
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, "Entered value is invalid");
  });
  test('Validating quantity 3', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validateQuantity(23);
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, 'NO EXCEPTION');
  });
  test('Validating price 1', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validatePrice(-56.9);
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, "Entered value is invalid");
  });
  test('Validating price 2', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validatePrice(23);
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, 'NO EXCEPTION');
  });
  test('Validating price 3', () {
    String exceptionMsg = 'NO EXCEPTION';
    try {
      ValidateUtil.validatePrice(456.8);
    } catch (e) {
      exceptionMsg = e.toString();
    }
    expect(exceptionMsg, 'NO EXCEPTION');
  });
}
