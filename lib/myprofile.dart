import 'package:badges/badges.dart';
import 'package:employee_managment_system/adminpages/loginpage.dart';
import 'package:employee_managment_system/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'data.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
   DatabaseReference database = FirebaseDatabase.instance.ref();
   Data.newadminuuid = auth.currentUser!.uid;
   database.child('admin').child(Data.newadminuuid).child('personalDetails').once().then((value) {
     Map myData = value.snapshot.value as Map;
     print(myData);
     setState(() {
       adminname = myData['adminName'];
       email = myData['email'];
       companyName = myData['companyName'];
       mobileNumber = myData['mobileNumber'];
       address = myData['address'];
       country = myData['country'];
       dob = myData['dob'];
       gender = myData['gender'];
     });
   });
  }
  String companyName = '';
  String adminname = '';
  String email = '';
  String mobileNumber = '';
  String address = '';
  String country = '';
  String dob = '';
  String gender = '';

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Profile"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: (){
                 auth.signOut().then((value) {
                   print("Sign out");
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const LoginPage()),
                   );
                 });
              }, icon: Icon(FontAwesomeIcons.rightFromBracket),color: Colors.red,),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Image.asset('assets/images/profile.png'),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      Text(
                        adminname.toUpperCase(),style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),),
                      Row(
                        children: [
                         CircleAvatar(
                           radius: 8,
                           backgroundColor:Color(0xff68D823),
                         ),
                          SizedBox(width: 5,),
                          Text(
                              "ADMINISTRATOR".toUpperCase(),style: TextStyle(
                            fontSize: 15
                          ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 15),
              Functions.MyProfileContainer(context,"Company Name",companyName),
              Functions.MyProfileContainer(context,"Email",email),
              Functions.MyProfileContainer(context,"Mobile Number",mobileNumber),
              Functions.MyProfileContainer(context,"Address",address),
              Functions.MyProfileContainer(context,"Country",country),
              Functions.MyProfileContainer(context,"Date of Birth",dob),
              Functions.MyProfileContainer(context,"Gender",gender),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 8.0),
                child: ElevatedButton(
                    onPressed: () {
                      print("pressed");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: Container(
                        color: Colors.black,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text("Edit Profile")))),
              ),
              // SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
