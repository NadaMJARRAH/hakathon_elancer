import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  DbController._();

  late Database _database;
  static DbController? _instance;

  factory DbController() {
    return _instance ??= DbController._();
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database database) {},
      onCreate: (Database database, int version) async {
        await database.execute('CREATE TABLE users ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'email TEXT NOT NULL,'
            'password TEXT NOT NULL,'
            'mobile INTEGER NOT NULL,'
            'gender TEXT NOT NULL,'
            'image TEXT NOT NULL'
            ')');

        await database.execute('CREATE TABLE freelancers ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'image TEXT NOT NULL,'
            'email TEXT NOT NULL,'
            'password TEXT NOT NULL,'
            'mobile INTEGER NOT NULL,'
            'gender TEXT NOT NULL,'
            'experince TEXT NOT NULL,'
            'skill_id INTEGER NOT NULL,'
            'FOREIGN KEY (skill_id) references skills(id)'
            ')');

        await database.execute('CREATE TABLE admin ('
            'email TEXT NOT NULL,'
            'password TEXT NOT NULL'
            ')');

        await database.execute('CREATE TABLE courses ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'course_name TEXT NOT NULL,'
            'houre_num INTEGER NOT NULL,'
            'teacher_name TEXT NOT NULL,'
            'info TEXT NOT NULL,'
            'image TEXT NOT NULL,'
            'path TEXT NOT NULL'
            ')');

        await database.execute('CREATE TABLE blogs ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'info TEXT NOT NULL,'
            'image TEXT NOT NULL'
            ')');

        await database.execute('CREATE TABLE ads ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'date TEXT NOT NULL,'
            'start_houre TEXT NOT NULL,'
            'duration TEXT NOT NULL,'
            'info TEXT NOT NULL,'
            'address TEXT NOT NULL,'
            'company TEXT NOT NULL,'
            'image TEXT NOT NULL,'
            'path TEXT NOT NULL'
            ')');

        await database.execute('CREATE TABLE profile ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'whatsapp TEXT,'
            'facebook TEXT,'
            'linkedin TEXT,'
            'twitter TEXT,'
            'upwork TEXT,'
            'mostaql TEXT,'
            'kamsat TEXT,'
            'freelance TEXT,'
            'name TEXT NOT NULL,'
            'info TEXT NOT NULL,'
            'image TEXT NOT NULL,'
            'path TEXT NOT NULL,'
            'freelancer_id INTEGER,'
            'FOREIGN KEY (freelancer_id) references freelancers(id)'
            ')');

        await database.execute('CREATE TABLE skills ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'title TEXT NOT NULL'
            ')');
      },
      onUpgrade: (Database database, int oldVersion, int newVersion) {},
      onDowngrade: (Database database, int oldVersion, int newVersion) {},
    );
  }
}
