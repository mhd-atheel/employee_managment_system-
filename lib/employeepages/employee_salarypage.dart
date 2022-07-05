import 'package:flutter/material.dart';

import '../adminpages/resource.dart';
import '../functions.dart';

class EmployeeSalary extends StatefulWidget {
  const EmployeeSalary({Key? key}) : super(key: key);

  @override
  _EmployeeSalaryState createState() => _EmployeeSalaryState();
}

class _EmployeeSalaryState extends State<EmployeeSalary> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SALARY INFO"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            for(int i=0;i<Resource.SalaryInfo.length;i++)
              Functions.SalaryContainer(context,Resource.SalaryInfo[i][0],Resource.SalaryInfo[i][1],Resource.SalaryInfo[i][2],Resource.SalaryInfo[i][3],Resource.SalaryInfo[i][4],Resource.SalaryInfo[i][5],Resource.SalaryInfo[i][6],Resource.SalaryInfo[i][7],Resource.SalaryInfo[i][8])
          ],
        ),
      ),
    );
  }
}
