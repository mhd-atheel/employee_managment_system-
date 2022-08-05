import 'package:badges/badges.dart';
import 'package:employee_managment_system/employeepages/employee_leave_request.dart';
import 'package:employee_managment_system/employeepages/employee_salarypage.dart';
import 'package:employee_managment_system/employeepages/empolyee_department_employees.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:employee_managment_system/functions.dart';
import '../adminpages/chatlist.dart';
import '../adminpages/leaverequest.dart';
import '../functions.dart';
import '../main_navigation_pages/deparmentpage.dart';
import '../main_navigation_pages/staffpage.dart';
import '../myprofile.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({Key? key}) : super(key: key);

  @override
  _EmployeeHomeState createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {


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
        body: Column(
          children: [
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal:10),
              child: Row(
                children: const [
                  Text("DASHBOARD")
                ],
              ),
            ),

            Functions.EmployeeHomebox(context, 0xffF14B4B, 'Leaves', 20.toString()),
            Functions.EmployeeHomebox(context, 0xff519557, 'Salary of Month', "\$ " +6500.toString()),
            const SizedBox(height: 0,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal:10),
              child: Row(
                children: const [
                  Text("MAIN NAVIGATION")
                ],
              ),
            ),
            Functions.MainNav("Leave Request", FontAwesomeIcons.circleArrowRight,const EmployeeLeaveRequest(),context),
            Functions.MainNav("Your Department Employees", FontAwesomeIcons.circleArrowRight, const EmployeeDeparmentEmployees(),context),
            Functions.MainNav("Salary Info", FontAwesomeIcons.circleArrowRight, const EmployeeSalary(),context),
          ],
        ),
      ),
    );
  }
}
