import 'package:employee_managment_system/adminpages/homepage.dart';
import 'package:employee_managment_system/employeepages/employee_home.dart';
import 'package:employee_managment_system/main_navigation_pages/deparmentpage.dart';
import 'package:employee_managment_system/selectingrole.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/logo.png',
                height: 231,
                width: 231,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 border: Border.all(),
                 borderRadius: BorderRadius.circular(10)
               ),
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: (){
                           setState(() {
                             Functions.index = 0;
                             print("Admin Tab Button" "Index: "+ Functions.index.toString());

                           });
                            },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),

                                  color: Functions.index == 0?  Colors.black : Colors.transparent,
                                ),
                              child: Center(child: Text("Admin",style:TextStyle(
                                color :Functions.index == 0?  Colors.white : Colors.black,
                              ))),
                        ),
                          ),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                          onTap: (){
                           setState(() {
                             Functions.index = 1;
                             print("Employee Tab Button " "Index: "+ Functions.index.toString());
                           });
                            },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),

                                  color: Functions.index == 1?  Colors.black : Colors.transparent,
                                ),
                              child: Center(child: Text("Employee",style:TextStyle(
                               color :Functions.index == 1?  Colors.white : Colors.black,
                              ))),

                        ),
                          ),
                      ),
                    )


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20),
              child: TextFormField(

                onChanged: (val){
                  email = val;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                   hintText:'Email'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20),
              child: TextFormField(

                onChanged: (val){
                  password = val;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                   hintText:'Password'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if(Functions.index == 0){
                      FirebaseAuth login = FirebaseAuth.instance;
                      login.createUserWithEmailAndPassword(email: email, password: password);
                    await  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    }else{
                      await  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EmployeeHome()),
                      );
                    }

                    FirebaseAuth login = FirebaseAuth.instance;
                    login.createUserWithEmailAndPassword(email: email, password: password);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Container(
                      color: Colors.black,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: Text("Login")))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You are new /Admin/HR/Boss"),
                TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SelectRole()),
                  );
                }, child: Text("SignUp"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
