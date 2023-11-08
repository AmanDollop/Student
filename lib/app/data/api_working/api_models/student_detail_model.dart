class StudentDetailModel {
  int? status;
  String? message;
  List<AttendanceData>? attendanceData;

  StudentDetailModel({this.status, this.message, this.attendanceData});

  StudentDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['attendanceData'] != null) {
      attendanceData = <AttendanceData>[];
      json['attendanceData'].forEach((v) {
        attendanceData!.add(AttendanceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (attendanceData != null) {
      data['attendanceData'] =
          attendanceData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttendanceData {
  String? sId;
  String? teacherId;
  String? classId;
  String? studentId;
  String? attandanceDate;
  bool? status;
  int? iV;

  AttendanceData(
      {this.sId,
        this.teacherId,
        this.classId,
        this.studentId,
        this.attandanceDate,
        this.status,
        this.iV});

  AttendanceData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    teacherId = json['teacherId'];
    classId = json['classId'];
    studentId = json['studentId'];
    attandanceDate = json['attandanceDate'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['teacherId'] = teacherId;
    data['classId'] = classId;
    data['studentId'] = studentId;
    data['attandanceDate'] = attandanceDate;
    data['status'] = status;
    data['__v'] = iV;
    return data;
  }
}
