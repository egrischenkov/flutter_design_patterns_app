import 'dart:math' as math;
import 'package:meta/meta.dart';

import 'student.dart';

abstract class StudentBmiCalculator {
  /// template method
  @nonVirtual
  List<Student> calculateBmiAndReturnStudentList() {
    var studentList = getStudentsData();
    studentList = doStudentsFiltering(studentList);
    _calculateStudentsBmi(studentList);
    return studentList;
  }

  void _calculateStudentsBmi(List<Student> studentList) {
    for (var student in studentList) {
      student.bmi = _calculateBmi(student.height, student.weight);
    }
  }

  double _calculateBmi(double height, int weight) {
    return weight / math.pow(height, 2);
  }

  /// hook method
  @protected
  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList;
  }

  /// abstract method
  @protected
  List<Student> getStudentsData();
}