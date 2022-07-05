import 'package:flutter/material.dart';

import '../adminpages/resource.dart';
import '../functions.dart';

class EmployeeDeparmentEmployees extends StatefulWidget {
  const EmployeeDeparmentEmployees({Key? key}) : super(key: key);

  @override
  _EmployeeDeparmentEmployeesState createState() => _EmployeeDeparmentEmployeesState();
}

class _EmployeeDeparmentEmployeesState extends State<EmployeeDeparmentEmployees> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("DEPARTMENT EMPLOYEES"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body:Column(
          children: [
            SizedBox(height: 10,),
            // Functions.StaffContainer(context)
            for(int i=0;i<Resource.StaffInfo.length;i++)
              Functions.EmployeeDepartmentContainer(context,Resource.StaffInfo[i][0],Resource.StaffInfo[i][1],Resource.StaffInfo[i][2],Resource.StaffInfo[i][3],Resource.StaffInfo[i][4],Resource.StaffInfo[i][5],Resource.StaffInfo[i][6],Resource.StaffInfo[i][7])
          ],
        ) ,
      ),
    );
  }
}
