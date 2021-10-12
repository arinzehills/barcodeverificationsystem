import 'package:flutter/material.dart';

import 'constants.dart';
import 'models/student.dart';


 class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}

class MoreInfo extends StatefulWidget {
  final String matricNo;
  final Student student;
  const MoreInfo({ Key? key, required this.matricNo, required this.student }) : super(key: key);

  @override
  _MoreInfoState createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
final _formKey = GlobalKey<FormState>();

Future popUp(bool status){
    
    return showDialog(
      context: context,
      builder:(context)=>AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        content: Container(
          height: 170,          
          child: Center(
            child: Column(
              children: [
                     Icon(
                             status==true ? Icons.done_all_rounded : Icons.dangerous  ,
                            color: status==true ? Colors.green : Colors.red,
                            size: 93,
                          ),
                Text(
                  status==true ? 'Email Sent Successfully' : 'Email Sent Failed',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto'
                  ),
                ),
                SizedBox(height: 4),
                RaisedButton(
                                    child: Text(
                                      status==true ? 'Continue' : 'Re-enter email',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto'
                                        ),
                                      ),
                                    color: status==true ?const Color( 0xff2FCA7C) : Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                    onPressed:()=>{
                                     
                                    },
                                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsets.only(top:299.0),
          child: Card(
            color: Colors.transparent,
            child: Container(
                padding: EdgeInsets.only(left:1,top:30, right:1,bottom:20),
                margin: EdgeInsets.only(top:Constants.avatarRadius * 0.1),
                decoration: BoxDecoration(
                  color: Colors.white,
                shape: BoxShape.rectangle,                    
                borderRadius: BorderRadius.circular(Constants.padding),
                boxShadow: [
                    BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                    ),
                    ]
              ),
                              child: SingleChildScrollView(
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left : 14.0),
                                      child: Text(
                                        'Student Information',
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,                                                      
                                              fontFamily: 'Roboto'
                                              ),
                                              
                                              ),
                                    ),
                                      Padding(
                                      padding: const EdgeInsets.only(left : 14.0, top: 12),
                                      child: Text(
                                        'Name: *' + widget.student.studentName,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,

                                                ),
                                              ),
                                        ),
                                    SizedBox(height: 4,),
                                    Padding(
                                      padding: const EdgeInsets.only(left : 14.0, top: 12),
                                      child: Text(
                                        'Level: *' + widget.student.level,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,

                                                ),
                                              ),
                                        ),
                                    SizedBox(height: 4,),
                                    Padding(
                                      padding: const EdgeInsets.only(left : 14.0, top: 12),
                                      child: Text(
                                        'Matric No: *' + widget.matricNo,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,

                                                ),
                                              ),
                                        ),
                                    SizedBox(height: 4,),
                                    Padding(
                                      padding: const EdgeInsets.only(left : 14.0, top: 12),
                                      child: Text(
                                        'Status: *' 'paid',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,

                                                ),
                                              ),
                                        ),
                                    SizedBox(height: 4,),
                                    Padding(
                                      padding: const EdgeInsets.only(left : 14.0, top: 12),
                                      child: Text(
                                        'department: *' + widget.student.department,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,

                                                ),
                                              ),
                                        ),
                                    SizedBox(height: 4,)
                                         
                                ],
                                                                ),
                              ),
                            
                      ),
          ),
        );


  }
}