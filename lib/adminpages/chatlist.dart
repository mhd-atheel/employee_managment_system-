  import 'dart:io';

import 'package:employee_managment_system/adminpages/contacts.dart';
import 'package:employee_managment_system/adminpages/resource.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../functions.dart';

class ChatList extends StatefulWidget {
    const ChatList({Key? key}) : super(key: key);

    @override
    _ChatListState createState() => _ChatListState();
  }

  class _ChatListState extends State<ChatList> {
    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Contacts()),
                );
              },
              backgroundColor: Colors.black,
              child: const FaIcon(FontAwesomeIcons.user),
            ),
          appBar: AppBar(
            title: Text("CHATS"),
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Image.network('https://www.pngplay.com/wp-content/uploads/12/User-Avatar-Profile-Clip-Art-Transparent-PNG.png'),
                onPressed: () {},
              ),
            ],
          ),
          body: Column(
            children: [
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
              //context,image,staffname,depname,notificationcount
              for(int i=0;i<Resource.ChatInfo.length;i++)
                Functions.ChatContainer(context,Resource.ChatInfo[i][0],Resource.ChatInfo[i][1],Resource.ChatInfo[i][2],Resource.ChatInfo[i][3],Resource.ChatInfo[i][4])
            ],
          )
        ),
      );
    }
  }
