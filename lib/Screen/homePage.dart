import 'dart:io';

import 'package:core_flutter_exam/global.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Add Student',
          style: TextStyle(color: Colors.white, fontSize: 25, letterSpacing: 1),
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pushNamed('/detail');
            setState(() {
              if(formkey.currentState!.validate())
                {
                  Navigator.of(context).pushNamed('/detail');

                }
            });
          }, child: Text('Save',style: TextStyle(color: Colors.blue,fontSize: 22),))
        ],
      ),
      backgroundColor: Colors.black,
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
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
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add Student',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                ...List.generate(
                  studentList.length,
                  (index) => Container(
                    margin: EdgeInsets.all(10),
                    height: 500,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue, width: 2),
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
                            IconButton(onPressed: () async {
                              XFile? xfile = await picker.pickImage(source: ImageSource.camera);
                              setState(()  {
                                studentList[index].img = File(xfile!.path);
                              });
                            }, icon: Icon(Icons.camera,color: Colors.white,)),
                            IconButton(onPressed: ()  async {
                              XFile? xfile = await picker.pickImage(source: ImageSource.gallery);
                              setState(()  {
                                studentList[index].img = File(xfile!.path);
                              });
                            }, icon: Icon(Icons.photo,color: Colors.white,))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250,
                              child: TextFormField(
                                validator: (value) {
                                  if(value!.isEmpty)
                                    {
                                      return 'Value must berequried';
                                    }
                                },
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
                              width: 250,
                              child: TextFormField(
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return 'Value must berequried';
                                  }
                                },
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
                              width: 250,
                              child: TextFormField(
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return 'Value must berequried';
                                  }
                                },
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
                        SizedBox(height: 10,),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: () {
                              setState(() {
                                studentList.removeAt(index);
                              });
                            }, child: Text('Remove',style: TextStyle(color: Colors.blue,fontSize: 18),))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
