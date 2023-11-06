class ClassModel {
  List<Data>? data;
  String? message;

  ClassModel({this.data, this.message});

  ClassModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Message'] = message;
    return data;
  }
}

class Data {
  int? classId;
  String? className;
  List<Students>? students;
  String? createdDate;
  List<Attandance>? attandance;

  Data(
      {this.classId,
        this.className,
        this.students,
        this.createdDate,
        this.attandance});

  Data.fromJson(Map<String, dynamic> json) {
    classId = json['classId'];
    className = json['className'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(Students.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    if (json['attandance'] != null) {
      attandance = <Attandance>[];
      json['attandance'].forEach((v) {
        attandance!.add(Attandance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['classId'] = classId;
    data['className'] = className;
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = createdDate;
    if (attandance != null) {
      data['attandance'] = attandance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? studentId;
  String? studentName;

  Students({this.studentId, this.studentName});

  Students.fromJson(Map<String, dynamic> json) {
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


class Attandance {
  bool? attandanceStatus;
  int? studentId;

  Attandance({this.studentId, this.attandanceStatus});

  Attandance.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    attandanceStatus = json['attandanceStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentId'] = studentId;
    data['attandanceStatus'] = attandanceStatus;
    return data;
  }

}
