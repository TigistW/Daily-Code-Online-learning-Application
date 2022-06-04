import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/user/usermodel/user.dart';
import 'package:mobile_app/user/register.dart';

void main() {
  test('', () {});

  test('empty email returns error', () {
    var result = EmailValidator.validate('');
    expect(result, 'email can not be empty');
  });
  test('non empty email returns null', () {
    var result = EmailValidator.validate('email');
    expect(result, null);
  });

  test('empty password returns error', () {
    var result = PasswordValidator.validate('');
    expect(result, 'password can not be empty');
  });
  test('non empty password returns null', () {
    var result = PasswordValidator.validate('password');
    expect(result, null);
  });

  test('empty firstname returns error', () {
    var result = FirstnameValidator.validate('');
    expect(result, 'firstname can not be empty');
  });
  test('non empty firstname returns null', () {
    var result = FirstnameValidator.validate('password');
    expect(result, null);
  });

  test('empty lastname should return error', () {
    var result = LastnameValidator.validate('');
    expect(result, 'lastname can not be empty');
  });

   test('non empty lastname should null', () {
    var result = LastnameValidator.validate('lastname');
    expect(result, null);
  });
}
