
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../functions.dart';
import '../adminpages/resource.dart';

class SalaryPage extends StatefulWidget {
  const SalaryPage({Key? key}) : super(key: key);

  @override
  _SalaryPageState createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!

          },
          backgroundColor: Colors.black,
          child: const FaIcon(FontAwesomeIcons.plus),
        ),
        appBar: AppBar(
          title: Text("Salary Details"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for(int i=0;i<Resource.SalaryInfo.length;i++)
              Functions.SalaryContainer(context,Resource.SalaryInfo[i][0],Resource.SalaryInfo[i][1],Resource.SalaryInfo[i][2],Resource.SalaryInfo[i][3],Resource.SalaryInfo[i][4],Resource.SalaryInfo[i][5],Resource.SalaryInfo[i][6],Resource.SalaryInfo[i][7],Resource.SalaryInfo[i][8])
          ],
        ),

      ),
    );
  }
}
