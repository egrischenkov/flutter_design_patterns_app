import 'dart:math';

import 'package:faker/faker.dart';
import 'package_size.dart';

class OrderItem {
  late String title;
  late double price;
  late PackageSize packageSize;

  OrderItem.random() {
    final packageSizeList = PackageSize.values;

    title = faker.lorem.word();
    price = 5.0 + Random().nextInt(95).toDouble() - 0.01;
    packageSize = packageSizeList[Random().nextInt(packageSizeList.length)];
  }
}