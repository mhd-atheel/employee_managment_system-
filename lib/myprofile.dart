import 'package:badges/badges.dart';
import 'package:employee_managment_system/functions.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Profile"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
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
                        "Mohamed Atheel".toUpperCase(),style: TextStyle(
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
              Functions.MyProfileContainer(context,"Company Name","atheel's (Pvt) limited"),
              Functions.MyProfileContainer(context,"Email","aathilmazz1234@gmail.com"),
              Functions.MyProfileContainer(context,"Mobile Number","+94 750755684"),
              Functions.MyProfileContainer(context,"Address","24/15 A 1ST CROSS STREET,THILLAYA,Puttalam"),
              Functions.MyProfileContainer(context,"Country","Sri Lanka"),
              Functions.MyProfileContainer(context,"Date of Birth","2001/04/29"),
              Functions.MyProfileContainer(context,"Gender","Male"),
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
