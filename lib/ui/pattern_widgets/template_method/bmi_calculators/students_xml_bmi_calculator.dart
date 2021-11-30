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

import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

import '../apis/xml_students_api.dart';
import '../student.dart';
import '../student_bmi_calculator.dart';

class StudentsXmlBmiCalculator extends StudentBmiCalculator {
  final XmlStudentsApi _api = XmlStudentsApi();

  @protected
  @override
  List<Student> getStudentsData() {
    var studentsXml = _api.getStudentsXml();
    var xmlDocument = XmlDocument.parse(studentsXml);
    var studentsList = <Student>[];

    for (var xmlElement in xmlDocument.findAllElements('student')) {
      var fullName = xmlElement.findElements('fullname').single.text;
      var age = int.parse(xmlElement.findElements('age').single.text);
      var height = double.parse(xmlElement.findElements('height').single.text);
      var weight = int.parse(xmlElement.findElements('weight').single.text);

      studentsList.add(Student(
        fullName: fullName,
        age: age,
        height: height,
        weight: weight,
      ));
    }

    return studentsList;
  }
}