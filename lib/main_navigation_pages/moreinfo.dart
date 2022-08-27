import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import '../functions.dart';
import '../adminpages/resource.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({Key? key}) : super(key: key);

  @override
  _MoreInfoState createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
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
                for (int i = 0; i < keys.length; i++)
                // for(int i=0;i<Resource.StaffInfo.length;i++)
                  Functions.StaffContainer(
                    context,
                    staffs[keys[i]]['image'],
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
    );
  }
}
