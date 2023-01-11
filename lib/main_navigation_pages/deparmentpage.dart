import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_managment_system/data.dart';
import 'package:employee_managment_system/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../adminpages/resource.dart';
import 'moreinfo.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({Key? key}) : super(key: key);

  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  TextEditingController departmentcontroller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  Map departments = {};
  List keys = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          _showDialog(context);
        },
        backgroundColor: Colors.black,
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      appBar: AppBar(
        title: Text('DEPARMENTS'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection('departments').snapshots(),
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
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  data['department'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 48,
                                  child: TextButton(
                                    child: Text('Edit'),
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                                      backgroundColor: Color(0xff519557),
                                      shape: const BeveledRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(3))),
                                    ),
                                    onPressed: () {
                                      print('Pressed');
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 48,
                                  child: TextButton(
                                    child: Text('Delete'),
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Color(0xffF14B4B),
                                      shape: const BeveledRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(0))),
                                    ),
                                    onPressed: () {
                                      // database
                                      //     .child('admin')
                                      //     .child(Data.newadminuuid)
                                      //     .child('departments')
                                      //     .child(keys[i])
                                      //     .set(null)
                                      //     .then((value) {
                                      //   load();
                                      // });

                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 48,
                                  child: TextButton(
                                    child: Center(child: Text('More')),
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Color(0xffFA8C5E),
                                      shape: const BeveledRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(3))),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MoreInfo()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }).toList(),
          );
        },
      ),






    ));
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: new Text("Add Deparment")),
          insetPadding: EdgeInsets.all(20),
          titlePadding: EdgeInsets.only(top: 14.0, bottom: 4),

          //content: new Text("You are awesome!"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                width: 500,
                color: Colors.white,
                child: Column(
                  children: [
                    TextFormField(
                      controller: departmentcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent)),
                        hintText: 'Add Department',
                      ),
                      onChanged: (val) {},
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () async {
                                  Data.newadminuuid = auth.currentUser!.uid;
                                  FirebaseFirestore.instance.collection('departments').add({
                                    'department':departmentcontroller.text
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text("Submit"),
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text("Cancel"),
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
