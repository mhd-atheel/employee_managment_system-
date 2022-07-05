import 'package:employee_managment_system/main_navigation_pages/leave%20page.dart';
import 'package:employee_managment_system/adminpages/resource.dart';
import 'package:flutter/material.dart';

import '../functions.dart';

class LeaveRequest extends StatefulWidget {
  const LeaveRequest({Key? key}) : super(key: key);

  @override
  _LeaveRequestState createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("LEAVE REQUESTS"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          actions: [
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LeavePage()),
              );
            }, child:Container(
               height:40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Leaves",
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
            for(int i=0;i<Resource.LeaveRequestInfo.length;i++)
              Functions.LeaveRequestContainer(context,Resource.LeaveRequestInfo[i][0],Resource.LeaveRequestInfo[i][1],Resource.LeaveRequestInfo[i][2],Resource.LeaveRequestInfo[i][3],Resource.LeaveRequestInfo[i][4],Resource.LeaveRequestInfo[i][5],Resource.LeaveRequestInfo[i][6],)
          ],
        ),
      ),
    );
  }
}
