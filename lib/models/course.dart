class Course {
  late int id;
  late String name;
  late int houreNum;
  late String teacherName;
  late String info;
  late String path;
  late String image;

  static const String tableName = 'courses';

  Course();

  ///Read row data from database table
  Course.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    name = rowMap['course_name'];
    houreNum = rowMap['houre_num'];
    teacherName = rowMap['teacher_name'];
    info = rowMap['info'];
    image = rowMap['image'];
    path = rowMap['path'];
  }

  ///Prepare map to be saved in database
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['course_name'] = name;
    map['houre_num'] = houreNum;
    map['teacher_name'] = teacherName;
    map['image'] = image;
    map['info'] = info;
    map['path'] = path;

    return map;
  }
}
