import 'dart:convert';

import 'package:meta/meta.dart';

import '../apis/json_students_api.dart';
import '../student.dart';
import '../student_bmi_calculator.dart';

class TeenageStudentsJsonBmiCalculator extends StudentBmiCalculator {
  final JsonStudentsApi _api = JsonStudentsApi();

  @protected
  @override
  List<Student> getStudentsData() {
    var studentsJson = _api.getStudentsJson();
    var studentsMap = json.decode(studentsJson) as Map<String, dynamic>;
    var studentsJsonList = studentsMap['students'] as List;
    var studentsList = studentsJsonList.map((json) {
      return Student(
        fullName: json['fullName'],
        age: json['age'],
        height: json['height'],
        weight: json['weight'],
      );
    }).toList();

    return studentsList;
  }

  @override
  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList.where((student) {
      return student.age > 12 && student.age < 20;
    }).toList();
  }
}