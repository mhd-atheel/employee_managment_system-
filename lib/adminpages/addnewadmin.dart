

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddNewAdmin extends StatefulWidget {
  const AddNewAdmin({Key? key}) : super(key: key);

  @override
  _AddNewAdminState createState() => _AddNewAdminState();
}

class _AddNewAdminState extends State<AddNewAdmin> {
  XFile? image;
  String dropdownvalue = 'Male';
  var items = [
    'Male',
    'Female',
    'Other',
  ];

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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
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
                    Text("Mobile Number:-"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
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
                          //onChanged: (val) => print(val),
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

                    onValuePicked: (Country country) {
                      print("${country.name} ,(${country.isoCode})");
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
                        child: Center(child: Text("Sign Up")))),
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
