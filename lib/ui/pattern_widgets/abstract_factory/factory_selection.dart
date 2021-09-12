import 'package:flutter/material.dart';
import 'i_platform_widgets_factory.dart';

class FactorySelection extends StatelessWidget {
  final List<IPlatformWidgetsFactory> factoryList;
  final selectedIndex;
  final ValueSetter<int?> onChanged;

  FactorySelection({
    required this.factoryList,
    required this.selectedIndex,
    required this.onChanged,
});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: factoryList.length,
        itemBuilder: (context, index) {
          return RadioListTile(
            title: Text(factoryList[index].getTitle()),
            value: index,
            groupValue: selectedIndex,
            selected: index == selectedIndex,
            onChanged: (_) => onChanged(index),
          );

        });
  }
}
