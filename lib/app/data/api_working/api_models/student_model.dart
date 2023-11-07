class StudentModel {
  String? message;
  List<StudentsList>? students;
  bool? status;

  StudentModel({this.message, this.students, this.status});

  StudentModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    if (json['students'] != null) {
      students = <StudentsList>[];
      json['students'].forEach((v) {
        students!.add(StudentsList.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class StudentsList {
  int? studentId;
  String? studentName;

  StudentsList({this.studentId, this.studentName});

  StudentsList.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    studentName = json['studentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentId'] = studentId;
    data['studentName'] = studentName;
    return data;
  }
}
