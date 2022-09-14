import 'package:get/get.dart';
import 'package:hakathon_elancer/database/controllers/courses_db_controller.dart';
import 'package:hakathon_elancer/models/course.dart';
import 'package:hakathon_elancer/models/process_response.dart';

class CoursesGetxController extends GetxController {
  List<Course> courses = <Course>[];
  final CoursesDbController _dbController = CoursesDbController();

  static CoursesGetxController get to => Get.find<CoursesGetxController>();

  @override
  void onInit() {
    read();
    super.onInit();
  }

  Future<ProcessResponse> create(Course course) async {
    int newRowId = await _dbController.create(course);
    if (newRowId != 0) {
      course.id = newRowId;
      courses.add(course);
      update();
    }
    return getResponse(newRowId != 0);
  }

  void read() async {
    courses = await _dbController.read();
    update();
  }

  Future<Course?> show(int id) async {
    await _dbController.show(id);
    update();
  }

  Future<ProcessResponse> updateCourse(Course course) async {
    bool updated = await _dbController.update(course);
    if (updated) {
      int index = courses.indexWhere((element) => element.id == course.id);
      if (index != -1) {
        courses[index] = course;
        update();
      }
    }
    return getResponse(updated);
  }

  Future<ProcessResponse> delete(int index) async {
    bool deleted = await _dbController.delete(courses[index].id);
    if (deleted) {
      courses.removeAt(index);
      update();
    }
    return getResponse(deleted);
  }

  ProcessResponse getResponse(bool success) {
    return ProcessResponse(
      message:
          success ? 'Operation completed successfully' : 'Operation failed!',
      success: success,
    );
  }
}
