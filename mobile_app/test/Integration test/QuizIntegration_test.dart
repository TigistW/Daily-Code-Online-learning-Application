import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

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
    final loginButton = find.byValueKey('loginButton');

    final quizName = find.byValueKey('quizName');
    final quizDescription = find.byValueKey('quizDescription');

    final addQuiz = find.byValueKey('addQuiz');
    final deleteQuiz = find.byValueKey('addQuiz');
    final updateQuiz = find.byValueKey('updateQuiz');

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
      await driver!.enterText("mekdi");
      await driver!.tap(lastname);
      await driver!.enterText("kebede");

      await driver!.tap(email);
      await driver!.enterText("mekdi@gmail.com");

      await driver!.tap(password);
      await driver!.enterText("123456");

      await driver!.tap(elevatedButton);
      await driver!.waitFor(find.text("save"));
    });
    test('login', () async {
      await driver!.tap(email);
      await driver!.enterText("mekdi@gmail.com");

      await driver!.tap(password);
      await driver!.enterText("123456");

      await driver!.tap(loginButton);
      await driver!.waitFor(find.text("login"));
    });
    test('add Quiz', () async {
      await driver!.tap(quizName);
      await driver!.enterText("what is .......");

      await driver!.tap(quizDescription);
      await driver!.enterText("the answer is .......");

      await driver!.tap(addQuiz);
      await driver!.tap(updateQuiz);
      await driver!.waitFor(find.text("quiz adding"),
          timeout: const Duration(seconds: 3));
    });

    test('delete Quiz', () async {
      await driver!.tap(deleteQuiz);
    });

    test('Update Quiz', () async {
      await driver!.tap(quizName);
      await driver!.enterText("what is .......");

      await driver!.tap(quizDescription);
      await driver!.enterText("the answer is .......");

      await driver!.tap(updateQuiz);

      await driver!.waitFor(find.text("quiz updating"),
          timeout: const Duration(seconds: 3));
    });
  });
}
