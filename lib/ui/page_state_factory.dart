import 'package:flutter/material.dart';

class PageStateFactory<T extends State>  extends StatefulWidget {
  final Function concreteState;

  PageStateFactory({required this.concreteState});

  @override
  T createState() => concreteState();
}
