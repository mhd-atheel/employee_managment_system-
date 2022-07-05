
import 'package:employee_managment_system/main_navigation_pages/addnewstaff.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../functions.dart';
import '../adminpages/resource.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({Key? key}) : super(key: key);

  @override
  _StaffPageState createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddNewStaff()),
            );
          },
          backgroundColor: Colors.black,
          child: const FaIcon(FontAwesomeIcons.plus),
        ),
        appBar: AppBar(
          title: Text("STAFFS"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
       body: Column(
         children: [
           SizedBox(height: 10,),
          // Functions.StaffContainer(context)
           for(int i=0;i<Resource.StaffInfo.length;i++)
             Functions.StaffContainer(context,Resource.StaffInfo[i][0],Resource.StaffInfo[i][1],Resource.StaffInfo[i][2],Resource.StaffInfo[i][3],Resource.StaffInfo[i][4],Resource.StaffInfo[i][5],Resource.StaffInfo[i][6],Resource.StaffInfo[i][7],Resource.StaffInfo[i][8],Resource.StaffInfo[i][9])
         ],
       ),
      ),
    );
  }
}