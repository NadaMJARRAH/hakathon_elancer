
// import 'package:hakathon_elancer/database/db_controller.dart';
// import 'package:hakathon_elancer/models/process_response.dart';
// import 'package:hakathon_elancer/models/user.dart';
// import 'package:hakathon_elancer/prefs/shared_pref_controller.dart';
// import 'package:sqflite/sqlite_api.dart';

// class UserDbController {
//   //Login, Register

//   final Database _database = DbController().database;

//   Future<ProcessResponse> login({required String email, required String password}) async {
//     //SELECT * FROM users WHERE email = email AND password = password;
//     List<Map<String, dynamic>> rowsMap = await _database.query(
//       User.tableName,
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );

//     if(rowsMap.isNotEmpty) {
//       User user = User.fromMap(rowsMap.first);
//       SharedPrefController().save(user: user);
//       return ProcessResponse(message: 'Logged in successfully',success: true);
//     }
//     return ProcessResponse(message: 'Credentials error, check and try again!');
//   }

//   Future<ProcessResponse>   register({required User user}) async {
//     // FIRST: RAW INSERT (SQL)
//     // int newRowId = await _database.rawInsert(
//     //     'INSERT INTO users (name, email, password) VALUES (?, ?, ?)',
//     //     [user.name, user.email, user.password]);
//     // SECOND: INSERT
//     if (await _isEmailExist(email: user.email)) {
//       int newRowId = await _database.insert(User.tableName, user.toMap());
//       return ProcessResponse(
//         message: newRowId != 0 ? 'Registered successfully' : 'Register failed!',
//         success: newRowId != 0,
//       );
//     } else {
//       return ProcessResponse(
//         message: 'Email exist, use another',
//         success: false,
//       );
//     }
//   }

//   Future<bool> _isEmailExist({required String email}) async {
//     List<Map<String, dynamic>> rowsMap = await _database
//         .rawQuery('SELECT * FROM users WHERE email = ?', [email]);
//     return rowsMap.isEmpty;
//   }
// }

// /**
//  * SQL:
//  *  1) Create => INSERT SQL
//  *      => INSERT INTO tableName (c1, c2, c3) VALUES (v1, v2, v3);
//  *
//  *  2) READ => SELECT SQL
//  *      => SELECT * FROM tableName
//  *      => SELECT * FROM tableName WHERE c1 = value
//  *      => SELECT * FROM tableName WHERE c1 = value AND c2 = value
//  *      => SELECT * FROM tableName WHERE c1 = value OR c2 = value
//  *
//  *  3) UPDATE => UPDATE SQL
//  *      => UPDATE tableName SET c1 = v1
//  *      => UPDATE tableName SET c1 = v1 WHERE c2 = v2
//  *      => UPDATE tableName SET c1 = v1, c2 = v2, c3 = v3 WHERE c4 = v4
//  *
//  *  4) DELETE => DELETE SQL
//  *      => DELETE from tableName
//  *      => DELETE from tableName WHERE c1 = v1
//  *  ----------
//  *  *) DROP => DROP TABLE tableName
//  *  *) ALTER
//  *      1) ADD COLUMN: ALTER TABLE tableName ADD columnName VARCHAR(45) NOT NULL AFTER id;
//  *
//  *  -------
//  *  ADD FOREIGN KEY (user_id) reference users(id) - on Delete cascade null restrict
//  */
