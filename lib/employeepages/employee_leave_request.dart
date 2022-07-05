import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmployeeLeaveRequest extends StatefulWidget {
  const EmployeeLeaveRequest({Key? key}) : super(key: key);

  @override
  _EmployeeLeaveRequestState createState() => _EmployeeLeaveRequestState();
}

class _EmployeeLeaveRequestState extends State<EmployeeLeaveRequest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("LEAVE REQUEST"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Reason:-"),
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
                  Text("Description:-"),
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("From:-"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(7.0,0,0,0),
                      child: Row(
                        children: [
                          Text("To:-"),
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

                ],
              ),
            ),
            SizedBox(height: 10,),
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

          ],
        ),
      ),
    );
  }
}
