import 'package:hakathon_elancer/database/db_operations.dart';
import 'package:hakathon_elancer/models/course.dart';

class CoursesDbController extends DbOperations<Course> {
  @override
  Future<int> create(Course model) async {
    return await database.insert(Course.tableName, model.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeletedRows = await database
        .delete(Course.tableName, where: 'id= ?', whereArgs: [id]);
    return countOfDeletedRows == 1;
  }

  @override
  Future<List<Course>> read() async {
    // int userId = SharedPrefController().getValueFor<int>(PrefKeys.id.name)!;
    List<Map<String, dynamic>> rowsMap = await database.query(Course.tableName
    // ,where: 'user_id = ? AND quantity > ?', whereArgs: [userId, 0]
    );
    return rowsMap.map((rowMap) => Course.fromMap(rowMap)).toList();
  }

  @override
  Future<Course?> show(int id) async {
    List<Map<String, dynamic>> rowsMap = await database
        .query(Course.tableName, where: 'id = ?', whereArgs: [id]);
    return rowsMap.isNotEmpty ? Course.fromMap(rowsMap.first) : null;
  }

  @override
  Future<bool> update(Course model) async {
    int countOfUpdatedRows = await database.update(
      Course.tableName,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
    return countOfUpdatedRows == 1;
  }

  // Future<int> getQuantity(int id) async {
  //   List<Map<String, dynamic>> rowsMap = await database
  //       .query(Course.tableName, where: 'id = ?', whereArgs: [id]);
  //   return Course.fromMap(rowsMap.first).quantity;
  // }
}
