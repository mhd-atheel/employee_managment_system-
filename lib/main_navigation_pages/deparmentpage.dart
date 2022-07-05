import 'package:employee_managment_system/functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../adminpages/resource.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({Key? key}) : super(key: key);

  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {

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
          body: SingleChildScrollView(
            child: Column(
              children: [
                for(int i=0;i<Resource.DepName.length;i++)
                  Functions.DeparmentContainer(context,Resource.DepName[i][0],i+1)
              ],
            ),
          ),
        )
    );
  }
  void _showDialog(BuildContext context) {
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
                child:Column(
                  children: [
                    TextFormField(

                      decoration: InputDecoration(

                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurpleAccent)),
                        hintText: 'Add Department',
                      ),
                      onChanged: (val) {

                      },
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(child: ElevatedButton(
                            onPressed: (){},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("Submit"),
                            ))),
                      ],
                    ),
                    SizedBox(height:10 ,),
                    Row(
                      children: [
                        Expanded(child: ElevatedButton(
                            onPressed: (){},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("Cancel"),
                            ))),
                      ],
                    ),

                  ],
                ) ,
              ),
            )
          ],
        );
      },
    );
  }
}
