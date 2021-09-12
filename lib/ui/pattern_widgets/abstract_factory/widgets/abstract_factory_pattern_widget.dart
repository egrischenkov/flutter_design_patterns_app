import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../../../widgets/vertical_space.dart';
import '../factories/cupertino_widgets_factory.dart';
import '../factories/material_widgets_factory.dart';
import '../factory_selection.dart';
import '../i_indicator.dart';
import '../i_platform_widgets_factory.dart';
import '../i_slider.dart';
import '../i_switch.dart';

class AbstractFactoryPatternWidget extends StatefulWidget {
  @override
  _AbstractFactoryPatternWidgetState createState() => _AbstractFactoryPatternWidgetState();
}

class _AbstractFactoryPatternWidgetState extends State<AbstractFactoryPatternWidget> {
  final List<IPlatformWidgetsFactory> _factoryList = [
    MaterialWidgetsFactory(),
    CupertinoWidgetsFactory(),
  ];

  int selectedFactoryIndex = isAndroid() ? 0 : 1;

  late IIndicator _indicator;

  late ISlider _slider;
  double sliderValue = 50.0;
  String get _sliderValueString => sliderValue.toStringAsFixed(0);


  late ISwitch _switch;
  bool switchValue = false;
  String get _switchValueString => switchValue ? "ON" : "OFF";


  void _createWidgets() {
    _indicator = _factoryList[selectedFactoryIndex].createIndicator();
    _slider = _factoryList[selectedFactoryIndex].createSlider();
    _switch = _factoryList[selectedFactoryIndex].createSwitch();
  }

  @override
  void initState() {
    super.initState();
    _createWidgets();
  }

  void _setSelectedFactoryIndex(int? index) {
    setState(() {
      selectedFactoryIndex = index!;
      _createWidgets();
    });
  }

  void _setSliderValue(double value) {
    setState(() {
      sliderValue = value;
    });
  }

  void _setSwitchValue(bool value) {
    setState(() {
      switchValue = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          FactorySelection(
            factoryList: _factoryList,
            selectedIndex: selectedFactoryIndex,
            onChanged: _setSelectedFactoryIndex,
          ),
          Text("Widgets showcase", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          VerticalSpace(32),
          Text("Process indicator"),
          VerticalSpace(16),
          _indicator.render(),
          VerticalSpace(32),
          Text("Slider ($_sliderValueString)"),
          VerticalSpace(16),
          _slider.render(sliderValue, _setSliderValue),
          VerticalSpace(32),
          Text("Switch ($_switchValueString)"),
          VerticalSpace(16),
          _switch.render(switchValue, _setSwitchValue)
        ],
      ),
    );
  }
}
