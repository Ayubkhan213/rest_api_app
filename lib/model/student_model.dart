class StudentModel {
  String? studentId;
  String studentName;
  String studentAge;
  String studentAddress;
  String studentContect;
  StudentModel(
      {this.studentId,
      required this.studentName,
      required this.studentAge,
      required this.studentAddress,
      required this.studentContect});
  factory StudentModel.fromJson(Map<String, dynamic> parse) {
    return StudentModel(
        studentId: parse['student_id'],
        studentName: parse['student_name'],
        studentAge: parse['student_age'],
        studentAddress: parse['student_address'],
        studentContect: parse['student_contect']);
  }
  Map<String, dynamic> toJson() {
    return {
      'student_name': studentName,
      'student_age': studentAge,
      'student_address': studentAddress,
      'student_contect': studentContect,
    };
  }
}
