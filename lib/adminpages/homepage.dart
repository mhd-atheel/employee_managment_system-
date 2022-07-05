import 'dart:io';

import 'package:badges/badges.dart';
import 'package:employee_managment_system/adminpages/chatlist.dart';
import 'package:employee_managment_system/functions.dart';
import 'package:employee_managment_system/main_navigation_pages/leave%20page.dart';
import 'package:employee_managment_system/main_navigation_pages/salary%20page.dart';
import 'package:employee_managment_system/main_navigation_pages/staffpage.dart';
import 'package:employee_managment_system/myprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main_navigation_pages/deparmentpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('EMPLOYEE',style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              icon:const FaIcon(FontAwesomeIcons.bell),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.network('https://www.pngplay.com/wp-content/uploads/12/User-Avatar-Profile-Clip-Art-Transparent-PNG.png'),
              onPressed:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyProfile()),
                );
              },
            ),
          ],
        ),
        floatingActionButton: Badge(
          badgeContent: const Text("3",style: TextStyle(color: Colors.white),),
          badgeColor: const Color(0xffF14B4B),
          position: BadgePosition.topEnd(top: -4, end: -2),
          toAnimate: false,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatList()),
              );
            },
            backgroundColor: Colors.black,
            child: const FaIcon(FontAwesomeIcons.message)
          ),
        ),
        
        
        
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal:10),
                child: Row(
                  children:const  [
                    Text("DASHBOARD")
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Functions.Dashboard_box(context,0xff3F9CBA,"Department","07"),
                  const SizedBox(width: 10,),
                  Functions.Dashboard_box(context,0xffEA40A6,"Staffs","10")
                ],
              ),
              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Functions.Dashboard_box(context,0xffF14B4B,"Leave Request","03"),
                  const SizedBox(width: 10,),
                  Functions.Dashboard_box(context,0xff519557,"Total Month Salary","\$1.5K"),

                ],
              ),
              const SizedBox(height: 0,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal:10),
                child: Row(
                  children: const [
                    Text("MAIN NAVIGATION")
                  ],
                ),
              ),
               Functions.MainNav("Departments", FontAwesomeIcons.circleArrowRight,const DepartmentPage(),context),
               Functions.MainNav("Staffs", FontAwesomeIcons.circleArrowRight, const StaffPage(),context),
               Functions.MainNav("Salary", FontAwesomeIcons.circleArrowRight,const SalaryPage(),context),
               Functions.MainNav("Leave", FontAwesomeIcons.circleArrowRight,const LeavePage(),context),

            ],
          ),
        ),
      ),
    );
  }
}
