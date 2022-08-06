


import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../data.dart';

class AddNewAdmin extends StatefulWidget {
  const AddNewAdmin({Key? key}) : super(key: key);

  @override
  _AddNewAdminState createState() => _AddNewAdminState();
}

class _AddNewAdminState extends State<AddNewAdmin> {
  XFile? image;
  String dropdownvalue = 'Male';
   String dob = '';
  String country = 'Sri lanka' ;
  late String gender ;
  var items = [
    'Male',
    'Female',
    'Other',
  ];
  DatabaseReference ref  = FirebaseDatabase.instance.ref();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final companyNameController = TextEditingController();
  final adminNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final countryController = TextEditingController();
  final addressController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
   showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.amberAccent,

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(height:10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    TextButton(
                      onPressed: () async {
                        ImagePicker _picker = ImagePicker();
                        image = await _picker.pickImage(source: ImageSource.gallery);
                      },
                      child: CircleAvatar(
                        radius: 40,
                        child: FaIcon(FontAwesomeIcons.userPlus),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text("Add Admin Profile")
                  ],
                ),              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Company Name:-"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: validateCompanyName,
                    controller: companyNameController,
                    onChanged: (val){print(val);},
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,

                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Admin Name:-"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (val){print(val);},
                    cursorColor: Colors.black,
                    validator: validateAdminName,
                    controller: adminNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,

                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Email:-"),
                      Text(errorMessage)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val){print(val);},
                    cursorColor: Colors.black,
                    controller: emailController,
                    validator: validateEmail,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,

                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Password:-"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                  //  keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onChanged: (val){print(val);},
                    controller: passwordController,
                    validator: validatePassword,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,

                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Mobile Number:-"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (val){print(val);},
                    validator: validateMobileNumber,
                    controller: mobileNumberController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,

                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Date of Birth:-"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(7.0,0,0,0),
                          child: Row(
                            children: [
                              Text("Gender:-"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width/2.2,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DateTimePicker(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: FaIcon(FontAwesomeIcons.calendar),
                            ),
                            initialValue: '',

                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            dateMask: 'd MMM, yyyy',
                            dateHintText: "DD,MM,YYYY",
                            timeFieldWidth: 20,
                            //dateLabelText: 'YYYY',
                            onChanged: (val) {
                              dob = val;
                            },
                            validator: validateDob,
                          //  controller: dobController,
                            onSaved: (val) {
                              print(val);
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 50,
                        width:MediaQuery.of(context).size.width/2.2,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            dropdownColor: Colors.white,
                            underline: DropdownButtonHideUnderline(child: Container()),
                            value: dropdownvalue,
                            iconDisabledColor: Colors.transparent,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            //  isExpanded: true,
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,

                                child: Text(items),


                              );
                            }).toList(),
                            onChanged: (String? Value) {
                              setState(() {
                                dropdownvalue = Value!;
                                print(Value);
                                gender=Value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),),
                    child: CountryPickerDropdown(

                      isExpanded: true,
                      initialValue: 'LK',
                      itemBuilder: _buildDropdownItem,
            //   itemFilter:  ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),
                      priorityList:[
                        CountryPickerUtils.getCountryByIsoCode('GB'),
                        CountryPickerUtils.getCountryByIsoCode('CN'),

                      ],
                      sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),

                      onValuePicked: (Country ) {
                        // print("${country.name} ,(${country.isoCode})");
                        country=Country.name;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Address:-"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    maxLines: 4,
                    onChanged: (val){print(val);},
                    cursorColor: Colors.black,
                    validator: validateAddress,
                    controller: addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,

                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 8.0),
                  child: ElevatedButton(
                      onPressed: ()async {

                        try  {
                          if(_key.currentState!.validate()){
                            FirebaseAuth auth = FirebaseAuth.instance;
                            auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
                              print("Success");
                            });
                           Data.newadminuuid = FirebaseAuth.instance.currentUser!.uid;
                            ref.child('admin').child(Data.newadminuuid).set({
                              'companyName':companyNameController.text,
                              'adminName':adminNameController.text,
                              'email':emailController.text,
                              'password':passwordController.text,
                              'mobileNumber':mobileNumberController.text,
                              'dob':dob,
                              'gender':gender,
                              'country':country,
                              'address':addressController.text,

                            });

                          }

                     //     errorMessage = '';

                        } on FirebaseAuthException catch (error) {
                         errorMessage=error.message!;
                        }
                        setState(() {});
                        // if(_key.currentState!.validate()){
                        //   FirebaseAuth auth = FirebaseAuth.instance;
                        //   auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
                        //     print("Success");
                        //   });
                        //   Data.newadminuuid = FirebaseAuth.instance.currentUser!.uid;
                        //   ref.child('admin').child(Data.newadminuuid).set({
                        //     'companyName':companyNameController.text,
                        //     'adminName':adminNameController.text,
                        //     'email':emailController.text,
                        //     'password':passwordController.text,
                        //     'mobileNumber':mobileNumberController.text,
                        //     'dob':dob,
                        //     'gender':gender,
                        //     'country':country,
                        //     'address':addressController.text,
                        //
                        //   });
                        //
                        // }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      child: Container(
                          color: Colors.black,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Center(child: Text("Sign Up")))),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildDropdownItem(Country country) => Container(

  child: Row(
    children: <Widget>[
      SizedBox(width: 5,),
     CountryPickerUtils.getDefaultFlagImage(country),
      SizedBox(width: 5,),
      Text("(${country.name})",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,),
    ],
  ),
);

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
String? validateCompanyName(String? formCompanyName) {
  if (formCompanyName == null || formCompanyName.isEmpty)
    return 'Company name is required.';
  // String pattern =
  //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp exp = new RegExp("^[a-z][a-z0-9_]*\$");
  // RegExp regex = RegExp(pattern);

  if (exp.allMatches(formCompanyName).isEmpty) {
    return '''
      Company name must be at lowercase letter
      Should not use any uppercase letter, number and symbol.
      ''';
    // print(exp.hasMatch(formCompanyName));
  }
  else {return null;}

}
String? validateAdminName(String? formAdminName) {
  if (formAdminName == null || formAdminName.isEmpty)
    return 'Admin name is Requird';
  // String pattern =
  //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp exp = new RegExp("^[a-z][a-z0-9_]*\$");
  // RegExp regex = RegExp(pattern);

  if (exp.allMatches(formAdminName).isEmpty) {
    return '''
      Company name must be at lowercase letter
      Should not use any uppercase letter, number and symbol.
      ''';
    // print(exp.hasMatch(formCompanyName));
  }
  else {return null;}
}
String? validateDob(String? formDob) {
  if (formDob == null || formDob.isEmpty)
    return 'Date of birth is required.';
  return null;
}
String? validateMobileNumber(String? formMobileNumber) {
  if (formMobileNumber == null || formMobileNumber.isEmpty)
    return 'Mobile Number is Requird';
  // String pattern =
  //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp exp = new RegExp("[0-9]");
  // RegExp regex = RegExp(pattern);

  if (exp.allMatches(formMobileNumber).isEmpty) {
    return '''
      Company name must be at lowercase letter
      Should not use any uppercase letter, number and symbol.
      ''';
    // print(exp.hasMatch(formCompanyName));
  }
  else {return null;}

}
String? validateAddress(String? formAddress) {
  if (formAddress == null || formAddress.isEmpty)
   return 'Address is requird';

  else {return null;}

}
