import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ymca_all_in_one/CourseList.dart';
import 'package:ymca_all_in_one/Favourite.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {

  final List<String> content = [
    "College notes",
    "College projects",
    "Previous year papers",
    "Placements material",
    "Ncert books",
    "Ncert Solutions",
    "Ncert exempler",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Free study material",
              textAlign: TextAlign.center,
            ),
            // const Spacer(),
            CupertinoButton(
                child: const Icon(Icons.favorite, color: Colors.white,),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Favourite()));
                })
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
                child: const Text("Free study material for Ymca students",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),)),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Expanded(
              child: ListView.builder(itemCount: content.length,itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CourseList(content: content[index],)));
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
                                  content[index],
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
