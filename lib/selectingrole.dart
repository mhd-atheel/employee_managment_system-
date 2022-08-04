import 'package:employee_managment_system/adminpages/addnewadmin.dart';
import 'package:employee_managment_system/adminpages/loginpage.dart';
import 'package:employee_managment_system/main_navigation_pages/addnewstaff.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'functions.dart';
import 'main_navigation_pages/leave page.dart';

class SelectRole extends StatefulWidget {
  const SelectRole({Key? key}) : super(key: key);

  @override
  _SelectRoleState createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/logo.png',
                height: 200,
                width: 200,
              ),
            ),
            Functions.SelectedRoleContainer("I am a New Business man / Admin / HR / Boss", AddNewAdmin(),context,0),
            Functions.SelectedRoleContainer("Sign in as Admin", LoginPage(),context,0),
            Functions.SelectedRoleContainer("Sign in as Emaployee", LoginPage(),context,1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("If you have an account"),
               TextButton(onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => const LoginPage()),
                 );
               }, child: Text("Login"))
              ],
            )
          ],
        ),


      ),
    );
  }
}
