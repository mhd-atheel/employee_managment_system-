import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_managment_system/data.dart';
import 'package:employee_managment_system/main_navigation_pages/addnewstaff.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../functions.dart';
import '../adminpages/resource.dart';
import 'moreinfo.dart';

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
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('staffData').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(), borderRadius: BorderRadius.circular(5)),
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            border: const Border(
                              bottom: BorderSide(),
                            )),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 0.0,0,0),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(data['image']),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                data['staffName'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                data['department'] ,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 80,
                                      child: TextButton(
                                        child: FaIcon(FontAwesomeIcons.penToSquare),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                                          backgroundColor: Color(0xff519557),
                                          shape: const BeveledRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(0))),
                                        ),
                                        onPressed: () {
                                          print('Pressed');
                                        },
                                      ),
                                    ),
                                    Container(
                                      height: 48,
                                      width: 80,
                                      child: TextButton(
                                        child: FaIcon(FontAwesomeIcons.trash),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                                          backgroundColor: Color(0xffF14B4B),
                                          shape: const BeveledRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0))),
                                        ),
                                        onPressed: () {
                                          print('Pressed');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), // row
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "EMAIL: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 13),
                                    ),
                                    Text(data['email'])
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "GENDER: ",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                                Text(data['gender'])
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ADDRESS : ",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                                Expanded(child: Text(data['address']))
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "COUNTRY : ",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                                Expanded(child: Text(data['country']))
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "DOB : ",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                                Text(data['dob'])
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "MOBILE NO : ",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                                Text(data['mobileNumber'])
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "SALARY :",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                                Text(data['salary']+ " \$")
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "SALARY TYPE: ",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                                Text(data['type'])
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
