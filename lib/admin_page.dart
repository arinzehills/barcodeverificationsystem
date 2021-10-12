import 'package:barcode_app/database/student_api_database.dart';
import 'package:barcode_app/student_list.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'models/student.dart';


class AdminPage extends StatefulWidget {
  const AdminPage({ Key? key }) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {


   final _formKey = GlobalKey<FormState>();
   String name='';
   String mat='';
  String error='';
  String level='';
  String department='';
  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
             mainAxisSize: MainAxisSize.min,
                      children:<Widget>[ 
                        
                        Center(
                              child: Text(
                            'Add Student',
                            style: TextStyle(
                                fontSize: 22.0,
                              color: Color(int.parse("0xff061041")),
                               fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                         Container(
                            padding: EdgeInsets.all(20.0),
                           height: 130,
                            child:
                            Image.asset('assets/bidalogo.jpeg')
                           ),
                        
                          SingleChildScrollView(
                               child: Form(
                                autovalidateMode: AutovalidateMode.always,
                                    key: _formKey,
                                          child: Column(
                                   children: <Widget>[
                                     TextFormField(
                                        validator: (val)=> val!.isEmpty ? 'Please Enter a Name' : null,
                                      decoration: textFieldDecoration.copyWith(
                                          prefixIcon: Icon(
                                          Icons.person,
                                          color: iconsColor,
                                          ),
                                          hintText: 'Enter Name',
                                                 ) ,
                                        onChanged: (val){
                                            setState(() => name =val);
                                        },  
                              ),
                                SizedBox(
                                  height:10,
                              ),
                                      TextFormField(
                                        validator: (val)=> val!.isEmpty ? 'Please Enter the department' : null,
                                       
                                      decoration: textFieldDecoration.copyWith(
                                          prefixIcon: Icon(
                                          Icons.person,
                                          color: iconsColor,
                                          ),
                                          hintText: 'Department',
                                                 ) ,
                                        onChanged: (val){
                                            setState(() => department =val);
                                        },  
                              ),
                              SizedBox(
                                  height:10,
                              ),
                              TextFormField(
                                    validator: (val)=> val!.isEmpty ? 'Please Enter a MAT No' : null,

                                      decoration: textFieldDecoration.copyWith(
                                          prefixIcon: Icon(
                                          Icons.call,
                                          color: iconsColor,
                                          ),
                                          hintText: 'Matric number',
                                                 ) ,
                                        onChanged: (val){
                                            setState(() =>mat =val);
                                        },  
                              ),
                              SizedBox(
                                  height:10,
                              ),
                              TextFormField(
                                validator: (val)=> val!.isEmpty ? 'Enter Level' : null,
                                     decoration:textFieldDecoration.copyWith(
                                          prefixIcon: Icon(
                                          Icons.lock,
                                          color: iconsColor,
                                          ),
                                           
                                        suffixIcon: IconButton(
                                              icon: const Icon(Icons.visibility),
                                              color:iconsColor,
                                              onPressed: () {
                                              
                                              },
                                          ),
                                          hintText: 'Enter level',
                                      ) ,
                                        onChanged: (val){
                                            setState(() =>level =val);
                                        },  
                              ),
                             SizedBox(
                                  height:10,
                              ),
                              
                                      Text(
                                        error,
                                        style: TextStyle(color: Colors.red),
                                        ),  
                                   ],
                                 ),
                               )
                        ),
                      
                      RaisedButton(
                            color: Color(int.parse("0xff15fef7")),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          onPressed: () async{
                                         
                                         if(_formKey.currentState!.validate()){

                                            final student= Student(
                                              studentName: name,
                                              level: level,
                                              matNumber: mat,
                                              paid:true,
                                              department:department,
                                              createdTime: DateTime.now(),
                                            );
                                         var response= await   StudentDatabase.studentInstance.create(student);
                                        // print(student.studentName);
                                        // print(student.department);
                                        // print(response);
                                        // print(student.matNumber);
                                        // print(student.level);
                                          ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                                  SnackBar(
                                                    backgroundColor: const Color(0xff061041),
                                                    content: Text('Added Successfully, Login')
                                                      )
                                                );
                                            
                                         }
                                            },
                                             child: Text(
                                      'Add',
                                        style:TextStyle(
                                          color:Colors.blue,
                                        ),

                                    ),
                      ),
                            

                            RaisedButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    onPressed: (){
                                      Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=>StudentList())
                                      );
                                          StudentDatabase.studentInstance.readAllNotes();

                                    },
                                    color: const Color(0xff061041),
                                    child: Text(
                                      'List of Student',
                                        style:TextStyle(
                                          color:Colors.white,
                                        ),

                                    ),
                                  ),
                      ]

          ),
        )
      ),
      
    );
  }
}