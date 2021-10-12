class Student{


  final int? id;
   final String  studentName;
  final String level;
  final String matNumber;
  final bool paid;
  final String department;
  final DateTime createdTime;

  const Student({
    this.id,
    required this.studentName,
    required this.level,
    required this.matNumber,
    required this.paid,
    required this.department,
    required this.createdTime,
  });

  Student copy({
    int? id,
    String? studentName,
  String? level,
  String? matNumber,
   bool? paid,
   String? department,
   DateTime? createdTime,
  }) => Student(
    id: id ?? this.id,
    studentName: studentName ?? this.studentName,
    level: level ?? this.level,
    matNumber: matNumber ?? this.matNumber,
    paid: paid ?? this.paid,
    department: department ?? this.department,
    createdTime: createdTime ?? this.createdTime,
  );

  static Student fromJson(Map<String, Object?> json) => Student(
        id: json[StudentColumns.id] as int?,
        paid: json[StudentColumns.paid] == 1,
        studentName: json[StudentColumns.studentName] as String,
        matNumber: json[StudentColumns.matNumber] as String,
        level: json[StudentColumns.level] as String,
        department: json[StudentColumns.department] as String,
        createdTime: DateTime.parse(json[StudentColumns.time] as String),
      );

  Map<String, Object?> toJson()=>{
    StudentColumns.id: id,
    StudentColumns.studentName: studentName,
    StudentColumns.level:level,
    StudentColumns.matNumber:matNumber,
    StudentColumns.paid:paid,
    StudentColumns.department:department,
    StudentColumns.time:createdTime.toIso8601String(),
  };
  
}

final String tableStudent='students';

class StudentColumns{
  static final List<String> values =[
    //add all the fields
    id, studentName,level,matNumber,paid, department,time
  ];

  static final String id='_id';
  static final String  studentName='studentName';
  static final String level='level';
  static final String matNumber='matNumber';
  static final String paid='paid';
  static final String department='department';
   static final String time = 'time';
}
