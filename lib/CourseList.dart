import 'package:flutter/material.dart';
import 'package:ymca_all_in_one/semester.dart';

class CourseList extends StatefulWidget {

  final dynamic content;
  const CourseList({super.key, required this.content});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {

  final List<String> course = [
    "MCA",
    "BCA",
    "Btech cs",
    "Btech electronics",
    "Btech mechanical",
    "Btech it",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.content, textAlign: TextAlign.center,)),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("Select Your Course from the list",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Expanded(
              child: ListView.builder(itemCount: course.length,itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Semester(course: course[index], sem: 6,)));
                  },
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.5)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Center(
                                child: Text(
                                  course[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.width * 0.06,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
