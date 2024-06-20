import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

List<StudentModel> studentList = [];
class StudentModel
{
  TextEditingController? name;
  TextEditingController? grid;
  TextEditingController? std;
  File? img;

  StudentModel({this.name,this.grid,this.std,this.img});
}

ImagePicker picker = ImagePicker();
GlobalKey<FormState> formkey =  GlobalKey();
int seleindex = 0;