class StudentModel {
  int? status;
  String? message;
  List<StudentData>? studentData;

  StudentModel({this.status, this.message, this.studentData});

  StudentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['studentData'] != null) {
      studentData = <StudentData>[];
      json['studentData'].forEach((v) {
        studentData!.add(StudentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (studentData != null) {
      data['studentData'] = studentData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentData {
  String? studentId;
  String? classId;
  String? teacherId;
  String? studentName;
  String? createdAt;
  String? updatedAt;
  int? iV;

  StudentData(
      {this.studentId,
        this.classId,
        this.teacherId,
        this.studentName,
        this.createdAt,
        this.updatedAt,
        this.iV});

  StudentData.fromJson(Map<String, dynamic> json) {
    studentId = json['_id'];
    classId = json['classId'];
    teacherId = json['teacherId'];
    studentName = json['studentName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = studentId;
    data['classId'] = classId;
    data['teacherId'] = teacherId;
    data['studentName'] = studentName;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
