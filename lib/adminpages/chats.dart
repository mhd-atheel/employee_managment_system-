import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  String text = "";
  List Chats = [

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mohamed Atheel"),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,



          children: [
            Expanded(
              child: SingleChildScrollView(
              
                child: Column(
                  children: [
                    for(int i =0;i<Chats.length;i++)
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children:[ Container(
                           decoration: BoxDecoration(
                             color: Colors.black,
                             borderRadius: BorderRadius.circular(5)
                           ),
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text(Chats[i],
                                 style: TextStyle(
                                   color: Colors.white
                                 ),
                               ),
                             )
                         ),
                       ]),
                     )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.23,
                    height: 50,
                    child: TextFormField(
                      onChanged: (val){
                        setState(() {
                          text=val;
                        });
                      },
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(child: FaIcon(FontAwesomeIcons.paperclip),onTap: (){print("file");},),
                            SizedBox(width: 10,),
                            GestureDetector(child: Icon(Icons.camera_alt),onTap: (){print("image");},),
                            SizedBox(width: 10,),
                          ],
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      Chats.add(text);
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    child: FaIcon(FontAwesomeIcons.solidPaperPlane,color: Colors.white,),
                  ),
                )
              ],
            ),

            ],
        ),
      ),
    );
  }
}
