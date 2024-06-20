import 'package:core_flutter_exam/Screen/detailPage.dart';
import 'package:core_flutter_exam/Screen/homePage.dart';
import 'package:flutter/material.dart';

import 'Screen/detailPage1.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/detail' : (context) => DetailPage(),
        '/select' : (context) => SelectDetail(),
      },
    );
  }
}
