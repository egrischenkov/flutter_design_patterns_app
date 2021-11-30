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
import '../../../widgets/common_elevated_button.dart';

import '../../../widgets/vertical_space.dart';
import '../student.dart';
import '../student_bmi_calculator.dart';
import 'students_datatable.dart';

class StudentsSection extends StatefulWidget {
  final StudentBmiCalculator bmiCalculator;
  final String headerText;

  const StudentsSection({
    required this.bmiCalculator,
    required this.headerText,
  });

  @override
  _StudentsSectionState createState() => _StudentsSectionState();
}

class _StudentsSectionState extends State<StudentsSection> {
  final List<Student> students = [];

  void _calculateBmiAndGetStudentsData() {
    setState(() {
      students.addAll(widget.bmiCalculator.calculateBmiAndReturnStudentList());
    });
  }

  void _clear() {
    setState(students.clear);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.headerText),
        VerticalSpace(16),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _StudentsSectionContent(
            students: students,
            onPressed: _calculateBmiAndGetStudentsData,
            clear: _clear,
          ),
        ),
      ],
    );
  }
}

class _StudentsSectionContent extends StatelessWidget {
  final List<Student> students;
  final VoidCallback onPressed;
  final VoidCallback clear;

  const _StudentsSectionContent({
    required this.students,
    required this.onPressed,
    required this.clear,
  });

  @override
  Widget build(BuildContext context) {
    return students.isEmpty
        ? CommonElevatedButton(
            onTap: onPressed,
            title: "Calculate BMI and get students' data",
          )
        : Column(
            children: [
              StudentsDataTable(
                students: students,
              ),
              Center(
                child: CommonElevatedButton(title: 'Clear', onTap: clear),
              ),
            ],
          );
  }
}
