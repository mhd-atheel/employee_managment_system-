import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../adminpages/resource.dart';
import '../functions.dart';

class AddNewStaff extends StatefulWidget {
  const AddNewStaff({Key? key}) : super(key: key);

  @override
  _AddNewStaffState createState() => _AddNewStaffState();
}

class _AddNewStaffState extends State<AddNewStaff> {
  List<DropdownMenuItem<String>>menuItems =[];
  XFile? image;

  @override
  void initState() {
    Resource.DepName.forEach((element) {
      menuItems.add(DropdownMenuItem(
          child: Text(element[0]),
        value: element[0],
      )
      );
    });
    super.initState();
  }
  String selectedValue = Resource.DepName.first[0];
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5)
                  ),

                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                          // underline: DropdownButtonHideUnderline(child: Container()),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                        ),
                        isExpanded: true,
                        value: selectedValue,
                        underline: DropdownButtonHideUnderline(child: Container()),
                      onChanged: (String? val){
                        print(val);
                        setState(() {
                          selectedValue = val!;
                        });
                      },
                      items: menuItems
                        ,

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
                  onChanged: (val){print(val);},
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
