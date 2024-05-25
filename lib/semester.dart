import 'package:flutter/material.dart';

import 'Subjects.dart';

class Semester extends StatelessWidget {

  dynamic course, sem;
  Semester({super.key, required this.course, required this.sem});

  // List<String> sem = ["Semester 1", "Semester 2", "Semester 3", "Semester 4", "Semester 5", "Semester 6"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Choose your semester",textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),)),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: sem,
                itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Subjects(course: course, sem: "Semester ${index+1}",)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.12,
                    child: Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(width: 2, color: Colors.blue)
                      ),
                      shadowColor: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Semester ${index+1}", textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          )

        ],
      ),
    );
  }
}
