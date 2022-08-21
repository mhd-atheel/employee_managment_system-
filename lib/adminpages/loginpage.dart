import 'package:employee_managment_system/adminpages/homepage.dart';
import 'package:employee_managment_system/employeepages/employee_home.dart';
import 'package:employee_managment_system/selectingrole.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data.dart';
import '../functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  FirebaseAuth auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 231,
                  width: 231,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Functions.index = 0;
                              print("Admin Tab Button" "Index: " +
                                  Functions.index.toString());
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Functions.index == 0
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                              child: Center(
                                  child: Text("Admin",
                                      style: TextStyle(
                                        color: Functions.index == 0
                                            ? Colors.white
                                            : Colors.black,
                                      ))),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Functions.index = 1;
                              print("Employee Tab Button " "Index: " +
                                  Functions.index.toString());
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Functions.index == 1
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                              child: Center(
                                  child: Text("Employee",
                                      style: TextStyle(
                                        color: Functions.index == 1
                                            ? Colors.white
                                            : Colors.black,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: TextFormField(
                  controller: emailController,
                  validator: validateEmail,
                  onChanged: (val) {
                    email = val;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Email'),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: TextFormField(
                  validator: validatePassword,
                  controller: passwordController,
                  onChanged: (val) {
                    password = val;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Password'),
                ),
              ),
              Center(
                child: Text(errorMessage),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        try {
                          if(Functions.index == 0){
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          ).then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                            print("Login SuccessFully");
                          });}
                          else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EmployeeHome()),
                            );
                          }
                          errorMessage = '';
                        } on FirebaseAuthException catch (error) {
                          errorMessage = error.message!;
                        }
                        setState(() {});
                      }

                    },

                    // onPressed: () async {
                    //
                    //   if(Functions.index == 0){
                    //     FirebaseAuth login = FirebaseAuth.instance;
                    //   await  login.createUserWithEmailAndPassword(email: email, password: password);
                    //     Data.uuid = FirebaseAuth.instance.currentUser!.uid;
                    //     ref.child("users").child(Data.uuid).set({
                    //       'email':email,
                    //       'password':password,
                    //
                    //     });
                    //   await  Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => const HomePage()),
                    //     );
                    //   }else{
                    //     await  Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => const EmployeeHome()),
                    //     );
                    //   }
                    //
                    //   FirebaseAuth login = FirebaseAuth.instance;
                    //   login.createUserWithEmailAndPassword(email: email, password: password);
                    // },
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
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectRole()),
                        );
                      },
                      child: Text("SignUp"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty)
    return 'E-mail address is required.';
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';
  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty)
    return 'Password is required.';
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword))
    return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';
  return null;
}
