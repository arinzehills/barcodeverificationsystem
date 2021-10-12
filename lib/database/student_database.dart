import 'package:sqflite/sqflite.dart';
import 'package:barcode_app/models/student.dart';
import 'package:path/path.dart';

class StudentDatabase{
  static final StudentDatabase studentInstance= StudentDatabase._init();
  StudentDatabase._init();
  

  static Database? _database;
  Future<Database> get database async{
    if(_database !=null) return _database!;

    _database= await _initDB('students.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath=await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1,onCreate: _createDB);

      }

      Future _createDB(Database db, int version) async{
         final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT';
    final boolType = 'BOOLEAN';
    final integerType = 'INTEGER';

            // await db.execute('''
            //     CREATE TABLE $tableStudent ( 
            //       ${StudentColumns.id} $idType, 
            //     ${StudentColumns.studentName} $textType,
            //     ${StudentColumns.level} $integerType,
            //     ${StudentColumns.paid} $textType,
            //     ${StudentColumns.department} $textType,
            //       )
            //     ''');
          await db.execute('''
          CREATE TABLE $tableStudent(
                ${StudentColumns.id} $idType, 
                ${StudentColumns.studentName} $textType,
                ${StudentColumns.level} $integerType,
                ${StudentColumns.matNumber} $textType,
                ${StudentColumns.paid} $boolType,
                ${StudentColumns.department} $textType,
                ${StudentColumns.time} $textType
                )
          ''');
      }
      Future<Student> create(Student student) async {
    final db = await studentInstance.database;

    // final json = Student.toJson();
    // final columns =
    //     '${StudentFields.title}, ${StudentFields.description}, ${StudentFields.time}';
    // final values =
    //     '${json[StudentFields.title]}, ${json[StudentFields.description]}, ${json[StudentFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableStudent, student.toJson());
    return student.copy(id: id);
  }
  Future<Student> readStudent(String matNumber) async {
    final db = await studentInstance.database;

    final maps = await db.query(
      tableStudent,
      columns: StudentColumns.values,
      where: '${StudentColumns.matNumber} = ?',
      whereArgs: [matNumber],
    );

    if (maps.isNotEmpty) {
      return Student.fromJson(maps.first);
    } else {
      throw Exception('Student with Matric Number: $matNumber not found');
    }
  }
  Future<List<Student>> readAllNotes() async {
    final db = await studentInstance.database;

    final orderBy = '${StudentColumns.time} ASC';
    final result =
        await db.rawQuery('SELECT * FROM $tableStudent ORDER BY $orderBy');

    // final result = await db.query(tableStudent, orderBy: orderBy);

    return result.map((json) => Student.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await studentInstance.database;

    return await db.delete(
      tableStudent,
      where: '${StudentColumns.id} = ?',
      whereArgs: [id],
    );
  }

    Future close() async{
       final db=await studentInstance.database;
          _database = null;
       db.close();
    }
}