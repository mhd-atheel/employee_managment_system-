import 'package:employee_managment_system/adminpages/homepage.dart';
import 'package:employee_managment_system/adminpages/leaverequest.dart';
import 'package:employee_managment_system/employeepages/employee_home.dart';
import 'package:employee_managment_system/selectingrole.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SelectRole(),
    );
  }
}

