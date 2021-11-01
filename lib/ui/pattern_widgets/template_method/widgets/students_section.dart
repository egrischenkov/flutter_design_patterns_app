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
