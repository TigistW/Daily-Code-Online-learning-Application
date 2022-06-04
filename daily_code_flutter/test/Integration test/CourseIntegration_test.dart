// import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:mobile_app/Course/Screen/course_add.dart';
import 'package:test/test.dart';
// import 'package:mobile_app/user/register.dart' as app;

void main() {
  // enableFlutterDriverExtension();
  // app.Register();
  group('online course', () {
    final firstname = find.byValueKey('firstname');
    // final firstnames = find.byKey(const ValueKey('firstname'));
    final lastname = find.byValueKey('lastname');
    final email = find.byValueKey('email');
    final password = find.byValueKey('password');
    final elevatedButton = find.byValueKey('elevatedButton');

    final courseTitle = find.byValueKey('courseTitle');
    final courseDescription = find.byValueKey('courseDescription');
    final courseCode = find.byValueKey('courseCode');
    final loginButton = find.byValueKey('loginButton');
    final addCourse = find.byValueKey('addButton');

    FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    Future<bool> isPresent(SerializableFinder byValueKey,
        {Duration timeout = const Duration(seconds: 1)}) async {
      try {
        await driver!.waitFor(byValueKey, timeout: timeout);
        return true;
      } catch (exception) {
        return false;
      }
    }

    test('create account', () async {
      await driver!.tap(firstname);
      await driver!.enterText("feven");
      await driver!.tap(lastname);
      await driver!.enterText("tigist");

      await driver!.tap(email);
      await driver!.enterText("tg@gmail.com");

      await driver!.tap(password);
      await driver!.enterText("123456");

      await driver!.tap(elevatedButton);
      await driver!.waitFor(find.text("save"));
    });
    test('login', () async {
      await driver!.tap(email);
      await driver!.enterText("tg@gmail.com");

      await driver!.tap(password);
      await driver!.enterText("123456");

      await driver!.tap(loginButton);
      await driver!.waitFor(find.text("login"));
    });
    test('add Course', () async {
      await driver!.tap(courseTitle);
      await driver!.enterText("AMP");

      await driver!.tap(courseDescription);
      await driver!.enterText("Advanced Mobile Programming");

      await driver!.tap(courseCode);
      await driver!.enterText("1203");

      await driver!.tap(addCourse);

      await driver!.waitFor(find.text("course adding"),
          timeout: const Duration(seconds: 3));
    });
  });
}
