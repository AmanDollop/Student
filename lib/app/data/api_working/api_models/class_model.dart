class ClassModel {
  int? status;
  String? message;
  List<ClassData>? classData;

  ClassModel({this.status, this.message, this.classData});

  ClassModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['classData'] != null) {
      classData = <ClassData>[];
      json['classData'].forEach((v) {
        classData!.add(ClassData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (classData != null) {
      data['classData'] = classData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClassData {
  String? classId;
  String? teacherId;
  String? className;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ClassData(
      {this.classId,
        this.teacherId,
        this.className,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ClassData.fromJson(Map<String, dynamic> json) {
    classId = json['_id'];
    teacherId = json['teacherId'];
    className = json['className'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = classId;
    data['teacherId'] = teacherId;
    data['className'] = className;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
