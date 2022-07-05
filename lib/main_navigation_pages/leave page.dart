
import 'package:employee_managment_system/adminpages/leaverequest.dart';
import 'package:flutter/material.dart';

import '../functions.dart';
import '../adminpages/resource.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({Key? key}) : super(key: key);

  @override
  _LeavePageState createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
           title: Text("LEAVE"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          actions: [
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LeaveRequest()),
              );
            }, child:Container(
              height:40,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Leave Request",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),),
              ),
            ))
          ],
        ),
        body: Column(
          children: [
            for(int i=0;i<Resource.LeaveInfo.length;i++)
              Functions.LeaveContainer(context,Resource.LeaveInfo[i][0],Resource.LeaveInfo[i][1],Resource.LeaveInfo[i][2],Resource.LeaveInfo[i][3],Resource.LeaveInfo[i][4],Resource.LeaveInfo[i][5],Resource.LeaveInfo[i][6],Resource.LeaveInfo[i][7],Resource.LeaveInfo[i][8],Resource.LeaveInfo[i][9],)
          ],
        ),
      ),
    );
  }
}
