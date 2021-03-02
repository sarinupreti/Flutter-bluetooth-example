import 'package:bots_demo/globals/validators/field_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Empty Email Test', () {
    var result = FieldValidators.validateEmail('');
    expect(result, 'Enter valid Email');
  });

  test('Invalid Email Test', () {
    var result = FieldValidators.validateEmail('');
    expect(result, 'Enter valid Email');
  });

  test('Valid Email Test', () {
    var result = FieldValidators.validateEmail('sarin@gmail.com');
    expect(result, null);
  });

  test('Empty Password Test', () {
    var result = FieldValidators.validatePassword('');
    expect(result, "Enter valid Password");
  });

  test('Valid Password Test', () {
    var result = FieldValidators.validatePassword('ajay12345');
    expect(result, null);
  });
}
