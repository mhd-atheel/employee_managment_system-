import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../data.dart';
import '../functions.dart';
import 'package:intl/intl.dart';

class AddNewStaff extends StatefulWidget {
  const AddNewStaff({Key? key}) : super(key: key);

  @override
  _AddNewStaffState createState() => _AddNewStaffState();
}

class _AddNewStaffState extends State<AddNewStaff> {

  XFile? image;
  TextEditingController staffNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String country = "Sri Lanka";
  String gender = "Male";
  String dob = "";
  String department = '';
  String type = "Per day";
  Map departments = {} ;
  List keys = [];
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadURL;
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  FirebaseAuth auth = FirebaseAuth.instance;
   String dropdownvalue = 'Male';
    String depValue='';
  var items = [
    'Male',
    'Female',
    'Other',
  ];
  Future ImagePickerMethod() async{
    final pick =await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(pick != null){
        _image = File(pick.path);
      }
      else{
        showSnackBars("No File Selected", Duration(milliseconds: 400));
      }
    });
  }
  Future uploadImage() async {
    final  posttime = DateTime.now().millisecondsSinceEpoch.toString();
   // Data.newadminuuid = FirebaseAuth.instance.currentUser!.uid;
    Reference ref = FirebaseStorage.instance.ref().child(Data.newadminuuid).child(posttime);
    await ref.putFile(_image!);
    downloadURL = await ref.getDownloadURL();
    DatabaseReference database = FirebaseDatabase.instance.ref();
    database.child('admin').child(Data.newadminuuid).child('staffprofileimage').set({
      'downloadurl': downloadURL
    });
    print(downloadURL);
  }


  showSnackBars(String SnackText,Duration d){
    final snackBar = SnackBar(content: Text(SnackText),duration: d,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ADD NEW STAFF"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  TextButton(
                    onPressed: () async {
                     ImagePickerMethod();
                      },
                    child: _image == null?CircleAvatar(
                      radius: 40,
                      child: FaIcon(FontAwesomeIcons.userPlus),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ):CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: Image.file(_image!),
                        )
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text("Add Staff Profile")
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text("Staff Name:-"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (val){print(val);},
                  cursorColor: Colors.black,
                  controller: staffNameController,
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
                    Text("Department:-"),
                  ],
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('departments').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 60,
                      width:MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(5),),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          hint: Text('Select Department',style: TextStyle(color: Colors.black),),
                          dropdownColor: Colors.white,
                          underline: DropdownButtonHideUnderline(child: Container()),
                          value: 'frontend',
                          iconDisabledColor: Colors.transparent,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          items: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                            return DropdownMenuItem(
                              value: data['department'],
                              child: Text(data['department']),
                            );
                          }).toList(),
                          onChanged: (Object? Value) {
                            setState(() {
                              depValue = Value!.toString();
                              // gender = Value;
                              print(Value);
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text("Email:-"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (val){print(val);},
                  controller: emailController,
                  keyboardType:TextInputType.emailAddress,
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
                    Text("Password:-"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (val){print(val);},
                  controller: passwordController,
                  keyboardType:TextInputType.emailAddress,
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
                    Text("Mobile No:-"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (val){print(val);},
                  keyboardType: TextInputType.phone,
                  controller: mobileController,
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
                      onChanged: (val){
                        dob = val;
                      },
                      validator: (val) {
                        print(val);
                        return null;
                      },
                     onSaved: (val) => print(val),
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
                          isExpanded: true,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),

                            );
                          }).toList(),
                          onChanged: (String? Value) {
                            setState(() {
                              dropdownvalue = Value!;
                              gender = Value;
                              print(Value);
                            });
                          },
                        ),
                      ),
                    ),
              ],
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
                          Text("Salary:-"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(7.0,0,0,0),
                        child: Row(
                          children: [
                            Text("Type:-"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10),
                        child: TextFormField(
                          controller: salaryController,
                          keyboardType: TextInputType.number,
                           decoration: InputDecoration(
                               focusedBorder: InputBorder. none,
                               enabledBorder: InputBorder. none,
                             hintText: '\$0.00',
                             border: OutlineInputBorder()
                           ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  Functions.index = 0;
                                  print("Per Day Tab Button" "Index: "+ Functions.index.toString());

                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),

                                    color: Functions.index == 0?  Colors.black : Colors.transparent,
                                  ),
                                  child: Center(child: Text("Per Day",style:TextStyle(
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
                                  print("Per Month Tab Button " "Index: "+ Functions.index.toString());
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),

                                    color: Functions.index == 1?  Colors.black : Colors.transparent,
                                  ),
                                  child: Center(child: Text("Per Month",style:TextStyle(
                                    color :Functions.index == 1?  Colors.white : Colors.black,
                                  ))),

                                ),
                              ),
                            ),
                          )


                        ],
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
                      country=Country.name;
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text("Address :-"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  maxLines: 4,
                  onChanged: (val){print(val);},
                  controller: addressController,
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
                padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 8.0),
                child: ElevatedButton(
                    onPressed: () async{

                      Data.newadminuuid = FirebaseAuth.instance.currentUser!.uid;
                      final  posttime = DateTime.now().millisecondsSinceEpoch.toString();
                      Reference database = FirebaseStorage.instance.ref().child(Data.newadminuuid).child('staffProfile').child(posttime);
                      await database.putFile(_image!);
                      downloadURL = await database.getDownloadURL();
                     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
                         FirebaseFirestore.instance.collection('staffData').add({
                         'staffName':staffNameController.text,
                         'email':emailController.text,
                         'mobileNumber':mobileController.text,
                         'address':addressController.text,
                         'department':depValue,
                         'dob':dob,
                         'gender':gender,
                         'salary':salaryController.text,
                         'country':country,
                         'type': Functions.index == 0 ?type = "Per day":type="Per Month",
                         'image': downloadURL,
                         'password': passwordController.text,
                         'userType': 'user',
                       }).then((value){
                         print('added');
                       });
                     });

                      },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: Container(
                      color: Colors.black,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                        child: Center(child: Text("Submit")))),
              ),
              SizedBox(height: 10,)

            ],
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
