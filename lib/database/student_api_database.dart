import 'dart:convert';

import 'package:barcode_app/models/student.dart';
import 'package:http/http.dart' as http;

class StudentDatabase{
static final StudentDatabase studentInstance= StudentDatabase._init();
StudentDatabase._init();

Future<http.Response?> create(Student student) async {

      try {
        var response = await http.post(
         Uri.parse(
      "${Env.URL_PREFIX}/create_student.php"),
      body: {
        "studentName": student.studentName,
        "level": student.level,
        "matNumber": student.matNumber,
        "paid": student.paid.toString(),
        "department": student.department,
      },
    );
 
    print(response);
    return response;

      } catch (e) {
        print(e);
      }
      
    // final json = Student.toJson();
    // final columns =
    //     '${StudentFields.title}, ${StudentFields.description}, ${StudentFields.time}';
    // final values =
    //     '${json[StudentFields.title]}, ${json[StudentFields.description]}, ${json[StudentFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

  }

  Future<Student> readStudent(String matNumber) async {
     try {
        var response = await http.post(
         Uri.parse(
      "https://barcodeapi.000webhostapp.com/read_student.php"),
      body: {
        "matNumber": matNumber,
      },
    );
    // print(response);
    print(jsonDecode(response.body)[0]);
    var arrayResponse=jsonDecode(response.body)[0];
   
    return Student.fromJson(jsonDecode(response.body)[0]);

      } catch (e) {
        print(e.toString());
        throw Exception('Student with Matric Number: $matNumber not found');
        
      }
  
    
  }
  Future<List<Student>> readAllNotes() async {
     
        var result = await http.post(
         Uri.parse(
      "https://barcodeapi.000webhostapp.com/student_list.php"),
     
    );
       

    // final result = await db.query(tableStudent, orderBy: orderBy);
    
    // return result.map((json) => Student.fromJson(json)).toList();
    Map<dynamic, dynamic> json=jsonDecode(result.body);
      List<dynamic>? getJson = json["success"];
      print(getJson!.map((json) => Student.fromJson(json)).toList()); // if request is succesful it gets the value
    return getJson.map((json) => Student.fromJson(json)).toList();

  }
}

class Env {
  static String URL_PREFIX = "https://barcodeapi.000webhostapp.com/";
  // http://192.168.43.162/barcode_api

}