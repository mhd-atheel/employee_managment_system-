import 'package:flutter/material.dart';

import '../functions.dart';
import '../adminpages/resource.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({Key? key}) : super(key: key);

  @override
  _MoreInfoState createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Front-End Development"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
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
