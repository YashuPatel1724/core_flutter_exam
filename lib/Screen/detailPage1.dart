import 'package:core_flutter_exam/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDetail extends StatefulWidget {
  const SelectDetail({super.key});

  @override
  State<SelectDetail> createState() => _SelectDetailState();
}

class _SelectDetailState extends State<SelectDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,color: Colors.white,)),
        backgroundColor: Colors.black,
        title: Text(
          'Detail Page',
          style: TextStyle(color: Colors.white, fontSize: 25, letterSpacing: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0,top: 15),
        child: Container(
          height: 350,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue,width: 2)
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  maxRadius: 55,
                  backgroundImage: (studentList[seleindex].img!=null) ? FileImage(studentList[seleindex].img!) : null,
                ),
              ),
             SizedBox(height: 30,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text('Student Name : ',style: TextStyle(color: Colors.blue ,fontSize: 25),),
                   SizedBox(width: 30,),
                   Text('${studentList[seleindex].name!.text}',style: TextStyle(color: Colors.white ,fontSize: 25),)
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text('Student Grid : ',style: TextStyle(color: Colors.blue ,fontSize: 25),),
                   SizedBox(width: 50,),
                   Text('${studentList[seleindex].grid!.text}',style: TextStyle(color: Colors.white ,fontSize: 25),)
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text('Student Std : ',style: TextStyle(color: Colors.blue ,fontSize: 25),),
                   SizedBox(width: 60,),
                   Text('${studentList[seleindex].std!.text}',style: TextStyle(color: Colors.white ,fontSize: 25),)
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
