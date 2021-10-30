import 'dart:math';

import 'package:faker/faker.dart';

class FakeApi {
  Future<List<String>> getNames() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        if (Random().nextBool()) {
          return _getRandomNames();
        }

        throw Exception('Unexpected error');
      }
    );
  }

  List<String> _getRandomNames() {
    if (Random().nextBool()) {
      return [];
    }

    return [
      faker.person.name(),
      faker.person.name(),
      faker.person.name(),
    ];
  }
}