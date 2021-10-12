import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PdfApi {
  static Future<File> saveDocument({
                required String name,
                required Document pdf,
              }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }
   static Future<File> saveAndlaunchFile(List<int> bytes, String filename) async{
    final directory = await getExternalStorageDirectory();
    // /Get directory path
    final path = directory!.path;
    //Create an empty file to write PDF data
    File file = File('$path/$filename');

    //Write PDF data
await file.writeAsBytes(bytes, flush: true);

//Open the PDF document in mobile
OpenFile.open('$path/$filename');
return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }

 
}