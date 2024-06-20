
import 'dart:io';

import 'package:core_flutter_exam/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(
        backgroundColor: Colors.black,
        title: Text('Home Page',style: TextStyle(
          color: Colors.white,fontSize: 25,letterSpacing: 1
        ),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.back,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(studentList.length, (index) => ListTile(
              leading: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushNamed('/select');
                    seleindex = index;
                  });
                },
                child: CircleAvatar(
                  backgroundImage: (studentList[index].img!=null)? FileImage(studentList[index].img!) : null,
                ),
              ),
              title: Text('${studentList[index].name!.text}',style: TextStyle(color: Colors.white,fontSize: 25),
              ),
              subtitle: Row(
                children: [
                  Text('Grid : ${studentList[index].grid!.text}',style: TextStyle(color: Colors.white),),
                  SizedBox(width: 10,),
                  Text('Std : ${studentList[index].std!.text}',style: TextStyle(color: Colors.white),),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                 IconButton(onPressed: () {
                   setState(() {
                     showDialog(context: context, builder: (context) => SingleChildScrollView(
                       child: AlertDialog(
                         backgroundColor: Colors.black,
                         content : Container(
                           margin: EdgeInsets.all(10),
                           height: 360,
                           width: 200,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                           ),
                           child: Column(
                             children: [
                               SizedBox(height: 10,),
                               CircleAvatar(
                                 maxRadius: 50,
                                 backgroundImage: (studentList[index].img!=null)? FileImage(studentList[index].img!) : null,
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   IconButton(onPressed: () {
                                     setState(() async {
                                       XFile? xfile = await picker.pickImage(source: ImageSource.camera);
                                       studentList[index].img = File(xfile!.path);
                                     });
                                   }, icon: Icon(Icons.camera,color: Colors.white,)),
                                   IconButton(onPressed: () async {
                                     XFile? xfile = await picker.pickImage(source: ImageSource.gallery);
                                     studentList[index].img = File(xfile!.path);
                                   }, icon: Icon(Icons.photo,color: Colors.white,))
                                 ],
                               ),
                               SizedBox(height: 10,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   SizedBox(
                                     width: 190,
                                     child: TextFormField(
                                       controller: studentList[index].name,
                                       style: TextStyle(color: Colors.white),
                                       decoration: InputDecoration(
                                           label: Text(
                                             'Student Name',
                                             style: TextStyle(color: Colors.white),
                                           )),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   SizedBox(
                                     width: 190,
                                     child: TextFormField(
                                       controller: studentList[index].grid,
                                       style: TextStyle(color: Colors.white),
                                       decoration: InputDecoration(
                                         label: Text(
                                           'Student Grid',
                                           style: TextStyle(color: Colors.white),
                                         ),
                                       ),
                                       keyboardType: TextInputType.number,
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   SizedBox(
                                     width: 190,
                                     child: TextFormField(
                                       controller: studentList[index].std,
                                       style: TextStyle(color: Colors.white),
                                       decoration: InputDecoration(
                                         label: Text(
                                           'Student Standard',
                                           style: TextStyle(color: Colors.white),
                                         ),
                                       ),
                                       keyboardType: TextInputType.number,
                                     ),
                                   ),
                                 ],
                               ),
                       
                             ],
                           ),
                         ),
                         actions: [
                           TextButton(onPressed: () {
                             setState(() {
                               Navigator.pop(context);
                             });
                           }, child: Text('Save',style: TextStyle(color: Colors.blue,fontSize: 18),))
                         ],
                       ),
                     ),
                     );
                   });
                 }, icon: Icon(Icons.edit,color: Colors.white,)),
                  IconButton(onPressed: () {
                    setState(() {
                      studentList.removeAt(index);
                    });
                  }, icon: Icon(Icons.delete,color: Colors.white,))
                ],
              ),
            ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {
          Navigator.of(context).pop();
          TextEditingController txtname = TextEditingController();
          TextEditingController txtgrid = TextEditingController();
          TextEditingController txtstd = TextEditingController();
          File? txtimg;
          setState(() {
            studentList.add(StudentModel(
              name: txtname,
              grid: txtgrid,
              std: txtstd,
              img: txtimg,
            ));
          });
      },child: Icon(Icons.add,color: Colors.white,),),
    );
  }
}
