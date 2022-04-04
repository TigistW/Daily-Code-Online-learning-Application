import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/quiz/screens/quiz_add_update.dart';
import 'package:mobile_app/user/register.dart';

void main() {
  test('', () {});

  test('empty email returns error', () {
    var result = FirstnameValidator.validate('');
    expect(result, 'email can not be empty');
  });
  test('non empty email returns null', () {
    var result = FirstnameValidator.validate('firstname');
    expect(result, null);
  });
  test('empty email returns error', () {
    var result = LastnameValidator.validate('');
    expect(result, 'email can not be empty');
  });
  test('non empty email returns null', () {
    var result = LastnameValidator.validate('lastname');
    expect(result, null);
  });
}
