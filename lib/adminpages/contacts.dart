import 'package:employee_managment_system/adminpages/resource.dart';
import 'package:flutter/material.dart';

import '../functions.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CONTACTS"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (val){print(val);},
                decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(25))
                    )
                ),
              ),
            ),
            for(int i=0;i<Resource.ContactsInfo.length;i++)
              Functions.ContactsContainer(context,Resource.ContactsInfo[i][0],Resource.ContactsInfo[i][1],Resource.ContactsInfo[i][2],Resource.ContactsInfo[i][3],i+1)
          ],
        ),
      ),
    );
  }
}
