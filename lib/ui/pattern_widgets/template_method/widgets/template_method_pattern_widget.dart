/*
Copyright (c) 2019 Mangirdas Kazlauskas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

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
