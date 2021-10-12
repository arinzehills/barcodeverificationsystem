import 'package:barcode_app/database/student_api_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'models/student.dart';
import 'more_info.dart';

class MyHomePage extends StatefulWidget {
 



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int background=int.parse("0xff061041");
  int mycolor=int.parse("0xff15fef7");
  String? scanResult;
  bool status=false;

Future _isVerified(bool status, maticNo, Student student){
    
    return showDialog(
      context: context,
      builder:(context)=>AlertDialog(
        title:Center(child: Text('Status')),
        content: Container(
          height: 160,
          child: Center(
            child: Column(
              children: [
                     Icon(
                             status==true ? Icons.done_all_rounded : Icons.dangerous  ,
                            color: status==true ? Colors.green : Colors.red,
                            size: 93,
                          ),
                Text(
                  status==true ? 'Paid' : 'No Such Student',
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ignore: deprecated_member_use
          
           status==true ?  Row(
             children: [
               RaisedButton(
                child: Text('Back'),
                color: Colors.red,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                onPressed:()=> Navigator.pop(context,true),
          ),
          Spacer(),
           RaisedButton(
            child: Text('See Info'),
            color: Colors.green,
            onPressed:(){
                            Navigator.pop(context,true);
                                  showDialog(context: context,
                                builder: (BuildContext context){
                                  
                                    return MoreInfo(matricNo:maticNo ,student: student,);
                                  });
                              },
          ),
             ],
           ):
          // ignore: deprecated_member_use
         
          RaisedButton(
            child: Text('Back'),
            color: Colors.red,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed:()=> Navigator.pop(context,true),
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future scanBarcode() async{
    String scanResult;
    try{
      scanResult= await FlutterBarcodeScanner.
                          scanBarcode('red', 'Cancel', true, ScanMode.BARCODE);
                          print('result '+ scanResult);
    } on PlatformException{
      scanResult="failed to get the platform version";
      if(!mounted) return;

      setState(() => this.scanResult=scanResult);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
            backgroundColor: Color(background),
            body: Center(
               
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
             children: <Widget>[
                                                 Text(
                            'School fee verification system' ,  
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),            
                              ),
                                            SizedBox(height:20),
                
               ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              child: Image.asset(
                                "assets/bidalogo2.jpg", 
                                height: 150,
                                )
                                            ),
                                            SizedBox(height:20),
                                      
            Text(
              scanResult==null ? 'Scan student reciept to get a student information!' : '$scanResult',  
              style: TextStyle(
                color: Colors.white,
              ),            
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: RaisedButton(
                  
                  onPressed: () async{ 
                    // scanBarcode();
                    String scanResult;
                      try{
                        scanResult= await FlutterBarcodeScanner.
                                            scanBarcode('red', 'Cancel', true, ScanMode.BARCODE);
                                            print('resrult '+ scanResult);
                                            String matNumber=scanResult;
                                            try {
                                               Student student =await StudentDatabase.studentInstance.readStudent(matNumber);
                                                if(student.studentName!=null){
                                                  
                                                   setState(() {
                                                  status=true;
                                              });
                                              _isVerified(status,matNumber,student);
                                                }
                                            } catch (e) {
                                              setState(() {
                                                  status=false;
                                              });
                                              Student? student=null;
                                              _isVerified(status,matNumber,student!);
                                            }
                      } on PlatformException{
                        scanResult="failed to get the platform version";
                        if(!mounted) return;

                        setState(() => this.scanResult=scanResult);
                      }
                    // _isVerified();
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
                  'Scan a code',
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
          ],
        ),
      ),
       
    );
  }
}
