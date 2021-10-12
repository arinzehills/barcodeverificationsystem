import 'package:barcode_app/database/student_api_database.dart';
import 'package:barcode_app/models/student.dart';
import 'package:flutter/material.dart';


class StudentList extends StatefulWidget {
  const StudentList({ Key? key }) : super(key: key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {

   late List<Student> students;
    bool isLoading = false;
    var instance=StudentDatabase.studentInstance;

@override
  void initState() {
    super.initState();

    refreshStudentList();
  }

  @override
  void dispose() {
    StudentDatabase.studentInstance;

    super.dispose();
  }

  Future refreshStudentList() async {
    setState(() => isLoading = true);

    this.students = await StudentDatabase.studentInstance.readAllNotes();

    setState(() => isLoading = false);
  }

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(

      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: isLoading
              ? Center(child: CircularProgressIndicator())
              :students.isEmpty
                  ? Text(
                      'No Notes',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  : Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(0,1,8,1),
              itemCount: students.length, //documents.length,
              itemBuilder: (BuildContext context, int index) {
                  final student = students[index];
                  print(student.studentName);
              return Card(
                    child:ListTile(
                              title: SizedBox(
                                width: 50,
                                child: Wrap(
                                             children: [
                                              Text( student.studentName ,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                ),
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Column(
                                  children: [
                                    Row(
                                          children: [
                                                    Icon(
                                                           Icons.date_range,
                                                          color: Colors.green,
                                                          size: 13,
                                                        ),
                                                  SizedBox(
                                                    width: 70,
                                                    child: Wrap(
                                                      children: [
                                                        
                                                    Text(
                                                      student.matNumber,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            color: Colors.black, 
                                                            fontSize:10
                                                          ),
                                                    ),
                                                     ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                   SizedBox(
                                                     width: 50,
                                                     child: Wrap(
                                                       children: [
                                                    Text(
                                                    student.level ,
                                                    overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize:10
                                                            ),
                                                    ),
                                                  ],
                                                     ),
                                                   ),
                                                  Icon(
                                                    Icons.lock_clock,
                                                    color: Colors.green,
                                                  ),
                                            ],
                                         ),
                                         Row(
                                          children: [
                                                    
                                                  SizedBox(
                                                    width: 50,
                                                    child: Wrap(
                                                      children: [
                                                        
                                                    // Text(
                                                    //   orderData['pickup location'] ?? '',
                                                    //   maxLines: 1,
                                                    //   overflow: TextOverflow.ellipsis,
                                                    //     style: TextStyle(
                                                    //         color: Colors.black, 
                                                    //         fontSize:10
                                                    //       ),
                                                    // ),
                                                 
                                                     ],
                                                    ),
                                                  ),
                                //                      FlatButton.icon(
                                //       onPressed:() async{
                                //           //  await   StudentDatabase.studentInstance.delete(int.parse(student.id.toString()));
                                      
                                //       },
                                //   icon: Icon(
                                //     Icons.delete,
                                //      color: Colors.red,), 
                                //   label: Text(
                                //     'DELETE',
                                //    maxLines: 1,
                                //     overflow: TextOverflow.ellipsis,
                                //     style: TextStyle(
                                //       color: Colors.red,
                                //       fontSize: 12
                                //     ),
                                //     ),
                                // )
                                              
                                            ],
                                         ),
                                  ],
                                ),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(-7,5,3, 5),
                              leading:  CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              child: Image.asset("assets/bidalogo.jpeg")
                                            ),
                                         ),
                              onTap:() => {
                                // showDialog(context: context,
                                //     builder: (BuildContext context){
                                     
                                   
                                //      }        
                                  // ),
                              }),
                            );
                    },
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 1,),
                ),
                  ),
    );
  }
}