import 'package:employee_managment_system/data.dart';
import 'package:employee_managment_system/main_navigation_pages/addnewstaff.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  Map staffs = {};
  List keys = [];
  load() {
    Data.newadminuuid = FirebaseAuth.instance.currentUser!.uid;
    ref
        .child('admin')
        .child(Data.newadminuuid)
        .child('staffs')
        .once()
        .then((value) {
      setState(() {
        staffs = value.snapshot.value as Map;
        keys = staffs.keys.toList();
      });
      print(keys);
    });
  }

  @override
  void initState() {
    load();
    super.initState();
  }

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              // Functions.StaffContainer(context)
              for (int i = 0; i < keys.length; i++)
                // for(int i=0;i<Resource.StaffInfo.length;i++)
                Functions.StaffContainer(
                    context,
                    staffs[keys[i]]['staffName'].toString(),
                    staffs[keys[i]]['department'].toString(),
                    staffs[keys[i]]['email'].toString(),
                    staffs[keys[i]]['gender'].toString(),
                    staffs[keys[i]]['address'].toString(),
                    staffs[keys[i]]['country'].toString(),
                    staffs[keys[i]]['dob'].toString(),
                    staffs[keys[i]]['mobileNumber'].toString(),
                    staffs[keys[i]]['salary'].toString(),
                    staffs[keys[i]]['type'].toString(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
