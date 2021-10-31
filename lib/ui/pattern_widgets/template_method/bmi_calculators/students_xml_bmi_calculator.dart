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