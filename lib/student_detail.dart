import 'package:barcode_app/models/student.dart';
import 'package:flutter/material.dart';

import 'database/student_database.dart';


class StudentDetail extends StatefulWidget {

  final String id;

  StudentDetail({required this.id});


  @override
  _StudentDetailState createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  @override
  Widget build(BuildContext context) {

    // Student student =await StudentDatabase.studentInstance.readStudent(this.id);
    
    return Scaffold(
           appBar: AppBar(
             title: Text(' Profile'),
                  ),
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Wrap(
                          children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/avatar.png'),
                        radius: 40.0,
                      ),
                    ),
                    Divider(
                      height: 20.0,
                    ),
                    //for user name
                    Row(
                      children: [
                       SizedBox(
                          width: 240,
                          child: Wrap(
                            children: [
                              Text(
                                ' userData.name',
                                maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                style:TextStyle(
                                  color:Colors.blue,
                                  fontSize: 25.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Spacer(),
                         Icon(
                          Icons.account_circle,
                          color: Colors.red,
                        )
                      ],
                    ),
                    
                    SizedBox(height: 2,),
                    Text(
                      'user name',
                      style:TextStyle(
                        color:Colors.red,
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:10),
                    //for Phone Number
                     SizedBox(height:10),
                    Row(
                     children: [
                       SizedBox(
                          width: 240,
                                  child: Wrap(
                                    children: [
                              Text(
                               ' userData.phone',
                                  maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                style:TextStyle(
                                  color:Colors.red,
                                  fontSize: 25.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                         ),
                       ),
                        //for Phone
                 
                        Spacer(),
                         Icon(
                          Icons.phone,
                          color: Colors.red,
                        )
                     ],
                   ),
                    SizedBox(height: 5,),
                    Text(
                      'Phone Number',
                      style:TextStyle(
                        color:Colors.red,
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //for email
                   Row(
                     children: [
                      SizedBox(
                          width: 240,
                          child: Wrap(
                            children: [
                              Text(
                                'userData.email',
                                  maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                style:TextStyle(
                                  color:Colors.blue,
                                  fontSize: 25.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                         ),
                       ),
                        Spacer(),
                       
                        Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        
                     ],
                   ),
                    SizedBox(height: 5,),
                    Text(
                      'email address',
                      style:TextStyle(
                        color:Colors.red,
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:10),
                    //for Address
                    Row(
                     children: [
                       SizedBox(
                          width: 240,
                                  child: Wrap(
                                    children: [
                              Text(
                                'userData.address',  maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                style:TextStyle(
                                  color:Colors.red,
                                  fontSize: 25.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                         ),
                       ),
                        //for editing address
                          
                        Spacer(),
                         Icon(
                          Icons.location_city,
                          color: Colors.red,
                        )
                     ],
                   ),
                    SizedBox(height: 5,),
                    Text(
                      'Home Address',
                      style:TextStyle(
                        color:Colors.blue,
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          )
        );
  }
}