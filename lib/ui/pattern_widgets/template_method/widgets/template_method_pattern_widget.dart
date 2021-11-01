import 'package:flutter/material.dart';

import '../../../widgets/vertical_space.dart';
import '../bmi_calculators/students_json_bmi_calculator.dart';
import '../bmi_calculators/students_xml_bmi_calculator.dart';
import '../bmi_calculators/teenage_students_json_bmi_calculator.dart';
import 'students_section.dart';

class TemplateMethodPatternWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StudentsSection(
            bmiCalculator: StudentsXmlBmiCalculator(),
            headerText: 'Students from XML data source:',
          ),
          VerticalSpace(16),
          StudentsSection(
            bmiCalculator: StudentsJsonBmiCalculator(),
            headerText: 'Students from JSON data source:',
          ),
          VerticalSpace(16),
          StudentsSection(
            bmiCalculator: TeenageStudentsJsonBmiCalculator(),
            headerText: 'Students from JSON data source (teenagers only):',
          ),
        ],
      ),
    );
  }
}
