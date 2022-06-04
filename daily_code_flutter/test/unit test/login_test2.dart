import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/user/usermodel/user.dart';
import 'package:mobile_app/user/login.dart';

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
}
