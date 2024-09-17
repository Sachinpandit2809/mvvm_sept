class StudentModel {
  List<Students>? students;

  StudentModel({this.students});

  StudentModel.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  String? id;
  String? name;
  String? enrollment;
  String? course;
  String? intermediate;

  Students(
      {this.id, this.name, this.enrollment, this.course, this.intermediate});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enrollment = json['enrollment'];
    course = json['course'];
    intermediate = json['intermediate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enrollment'] = this.enrollment;
    data['course'] = this.course;
    data['intermediate'] = this.intermediate;
    return data;
  }
}
