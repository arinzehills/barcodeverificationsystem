import 'dart:convert';

import 'package:barcode_app/api/pdf_api.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'admin_page.dart';
import 'api/pdf_invoice.dart';
import 'constants.dart';
// import 'package:pdf/pdf.dart';
import 'dart:io';

import 'database/student_api_database.dart';
import 'models/student.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;




class MyBarcode extends StatefulWidget {
  const MyBarcode({ Key? key }) : super(key: key);

  @override
  _MyBarcodeState createState() => _MyBarcodeState();
}

class _MyBarcodeState extends State<MyBarcode> {
 
  int background=int.parse("0xff061041");
  int mycolor=int.parse("0xff15fef7");
  final controller=TextEditingController;
  String matNumber='';
  final _formKey = GlobalKey<FormState>();
  bool showBarcode=false;
  String error='';


Future<Uint8List> _readImageData(String name) async {
    final data= await rootBundle.load('assets/$name');
    return data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
                actions: [
                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: RaisedButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    onPressed: (){
                                      Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=>AdminPage())
                                      );
                                    },
                                    color: const Color(0xff061041),
                                    child: Text(
                                      'Admin',
                                        style:TextStyle(
                                          color:Colors.white,
                                        ),

                                    ),
                                  ),
                 ),
                ],
            ),
            backgroundColor: Color(background),
            body:  Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    
                      mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                    Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      color: Colors.white,
                      child: showBarcode? BarcodeWidget(
                                  barcode: Barcode.code128(),
                                  data:matNumber,
                                  width: 250,
                                  height: 250,
                                ): Text(
                      'Enter Mat no to check code and get student print out',
                      style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                                      ),
                           textAlign:  TextAlign.center,
                          ),
                    ),
                  ),
                   TextFormField(
                             validator: (val)=> val!.isEmpty ? 'Please Enter a Matric No'
                                                                 : null,
                           
                              decoration: textFieldDecoration.copyWith(
                                prefixIcon: Icon(
                                Icons.person,
                                color: Colors.grey,
                                ),
                               
                                ),
                                cursorColor: Colors.red,
                                 onChanged: (val){
                                              setState(() =>matNumber =val);
                                          },
                  ),
                  Text(
                      error,
                      style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                                      ),
                           textAlign:  TextAlign.center,
                          ),
                    Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: RaisedButton(
                    onPressed: () async { 
                      
                      if(_formKey.currentState!.validate()){
                      
                               try {
                            Student student=await StudentDatabase.studentInstance.readStudent(matNumber);
                            //  print(student.paid);
                            //  Map<dynamic, dynamic> json=jsonDecode(response.body);
                            //  List<dynamic>? getJson = json["success"]; // if request is succesful it gets the value
                            //  print(getJson!.map((value) =>print(value['id']) ));
                            //  Student student=getJson.map((value) {
                            //    studentName: value['studentName'];
                            //    level: value['level'];
                            //    matNumber: value['matNumber'];
                            //    department: value['department'];
                            //   } ) as Student;
                              final studentReceipt= Student(
                                    studentName: student.studentName,
                                    level: student.level,
                                    matNumber:student.matNumber,
                                    paid:true,
                                    department:student.department,
                                    createdTime: DateTime.now(),
                            );
                      // return _creatPdf();
                    PdfInvoiceApi.generate(studentReceipt);
                              print(student);
                               setState(() {
                                error='';
                                print(error);
                              });
                            } catch (e) {
                              setState(() {
                                error=e.toString();
                                print(error);
                              });
                              print(e);
                            }
                      
                      // PdfApi.openFile(pdf);
                            setState(() {
                              showBarcode=true;
                            });
                      }
                     
                        
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                    decoration: const BoxDecoration(
                    gradient:LinearGradient(
                     colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF15fef7 ),
                                Color(0xFF42A5F5),
                            ],
                           ),
                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                        ),
                          child: Container(
                          constraints: const BoxConstraints(minWidth: 58.0, minHeight: 46.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: const Text(
                    'Get print out with code',
                    style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                                    ),
                         textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                          )
                      ]
                  ),
                ),
              )
            )
            );
  }

}