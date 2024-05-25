import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ymca_all_in_one/pdf.dart';

class Papers extends StatefulWidget {
  final dynamic course;
  final dynamic subject;
  const Papers({super.key, required this.course, required this.subject});

  @override
  State<Papers> createState() => _PapersState();
}

class _PapersState extends State<Papers> {

  var pathToPdf = "";

  List<String> papers = ["2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"];

  Future<void> getPathToAudio() async {
    try {
      // Get the external storage directory for your app's files
      Directory? externalDir = await getExternalStorageDirectory();
      if (externalDir != null) {
        pathToPdf = '${externalDir.path}/Download/temp.pdf';
      } else {
        // Handle the case where external storage is not available
        if(mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('External storage not available')));
      }
    } catch (e) {
      // Handle any errors
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error : $e')));
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.subject, textAlign: TextAlign.center,)),
        automaticallyImplyLeading: false,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: papers.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index){
                    return Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(width: 2, color: Colors.blue)

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.subject+' '+papers[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),textAlign: TextAlign.center,),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Pdf()));
                                    }, child: const Icon(Icons.remove_red_eye,size: 30,)
                                ),
                                OutlinedButton(
                                    onPressed: () async {
                                      await FlutterDownloader.enqueue(
                                        url: 'https://firebasestorage.googleapis.com/v0/b/ymca-all-in-one.appspot.com/o/5.%20Process%20Synchronisation.pdf?alt=media&token=26758293-930a-4193-adaf-1d39e312c3db',
                                        headers: {}, // optional: header send with url (auth token etc)
                                        savedDir: pathToPdf,
                                        showNotification: true, // show download progress in status bar (for Android)
                                        openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                                      );
                                    }, child: const Icon(Icons.download,size: 30,)
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
              }),
            )
          ],
        ),
      )
    );
  }
}
