import 'package:employee_managment_system/adminpages/homepage.dart';
import 'package:employee_managment_system/adminpages/leaverequest.dart';
import 'package:employee_managment_system/main_navigation_pages/deparmentpage.dart';
import 'package:employee_managment_system/main_navigation_pages/leave%20page.dart';
import 'package:employee_managment_system/main_navigation_pages/moreinfo.dart';
import 'package:employee_managment_system/main_navigation_pages/staffpage.dart';
import 'package:employee_managment_system/myprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Functions {
  static int index = 0;
  static Dashboard_box(context, bgcolor, name, count) {
    return GestureDetector(
      onTap: () {
        if (name == "Leave Request") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LeaveRequest()),
          );
        } else if (name == "Department") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DepartmentPage()),
          );
        } else if (name == "staffs") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StaffPage()),
          );
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(bgcolor),
                  // 0xffEA40A6
                ),
                height: 120,
                width: MediaQuery.of(context).size.width / 2.2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        count,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  static EmployeeHomebox(context, bgcolor, name, count) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          if (name == "Leave Request") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LeaveRequest()),
            );
          } else if (name == "Department") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DepartmentPage()),
            );
          } else if (name == "staffs") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StaffPage()),
            );
          }
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(bgcolor),
                    // 0xffEA40A6
                  ),
                  height: 120,
                  width: MediaQuery.of(context).size.width/1.05 ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 60),
                        child: Text(
                          count,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  static MainNav(name, icon, nav, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nav),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(),
                color: Colors.white),
            height: 66,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Icon(icon)
                ],
              ),
            ),
          )),
    );
  }
  static DeparmentContainer(context, depName, index,) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    depName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    index.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    child: TextButton(
                      child: Text('Edit'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                        backgroundColor: Color(0xff519557),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(3))),
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    child: TextButton(
                      child: Text('Delete'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xffF14B4B),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                      ),
                      onPressed: () {

                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    child: TextButton(
                      child: Center(child: Text('More')),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xffFA8C5E),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(3))),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MoreInfo()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  static StaffContainer(context,image,staffname, depname, email, gender, address ,country, dob, mobile,salary,type) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                border: const Border(
              bottom: BorderSide(),
            )),
            child: Padding(
            padding: EdgeInsets.fromLTRB(5.0, 0.0,0,0),

            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(image),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    staffname,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    depname,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          width: 80,
                          child: TextButton(
                            child: FaIcon(FontAwesomeIcons.penToSquare),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                              backgroundColor: Color(0xff519557),
                              shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0))),
                            ),
                            onPressed: () {
                              print('Pressed');
                            },
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 80,
                          child: TextButton(
                            child: FaIcon(FontAwesomeIcons.trash),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                              backgroundColor: Color(0xffF14B4B),
                              shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      topRight: Radius.circular(0))),
                            ),
                            onPressed: () {
                              print('Pressed');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ), // row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "EMAIL: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Text(email)
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "GENDER: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text(gender)
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ADDRESS : ",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Expanded(child: Text(address))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "COUNTRY : ",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Expanded(child: Text(country))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "DOB : ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text(dob)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "MOBILE NO : ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text(mobile)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "SALARY :",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text(salary+ " \$")
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "SALARY TYPE: ",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text(type)
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
  static SalaryContainer(context, image, staffname, depname, date, day, time, salary, allowence, total) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                border: const Border(
              bottom: BorderSide(),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.all(0)),
                Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(image),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  staffname,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  depname,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 80,
                        child: TextButton(
                          child: FaIcon(FontAwesomeIcons.fileInvoice),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                            backgroundColor: Color(0xffDB7830),
                            shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0))),
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 80,
                        child: TextButton(
                          child: FaIcon(FontAwesomeIcons.trash),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                            backgroundColor: Color(0xffF14B4B),
                            shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    topRight: Radius.circular(0))),
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Text(
                  day,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Text(
                  time,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Salary",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Allowence",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  salary,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                Text(
                  allowence,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                Text(
                  total,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          // row
        ]),
      ),
    );
  }
  static LeaveContainer(context, image, staffname, depname, AppliedDate, title, reason, fromdate, todate, bgcolors, icon) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                border: const Border(
              bottom: BorderSide(),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.all(0)),
                Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(image),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  staffname,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  depname,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [Text("Applied On"), Text(AppliedDate)],
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        height: 48,
                        width: 80,
                        child: TextButton(
                          child: FaIcon(icon),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                            backgroundColor: bgcolors,
                            shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0))),
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  reason,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(fromdate),
              SizedBox(
                width: 10,
              ),
              Text(todate),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
          // row
        ]),
      ),
    );
  }
  static LeaveRequestContainer(context, image, staffname, depname, title, reason, fromdate, todate,) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                border: const Border(
              bottom: BorderSide(),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.all(0)),
                Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(image),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  staffname,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  depname,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 80,
                        child: TextButton(
                          child: FaIcon(FontAwesomeIcons.circleCheck),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                            backgroundColor: Color(0xff519557),
                            shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0))),
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 80,
                        child: TextButton(
                          child: FaIcon(FontAwesomeIcons.circleXmark),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                            backgroundColor: Color(0xffDB7830),
                            shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0))),
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  reason,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(fromdate),
              SizedBox(
                width: 10,
              ),
              Text(todate),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
          // row
        ]),
      ),
    );
  }
  static ChatContainer(context, image, staffname, lastmessage, notificationcount, navigationroot) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => navigationroot),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(image),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                staffname,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                lastmessage,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 10),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Text(notificationcount.toString()),
                          radius: 16,
                          backgroundColor: Color(0xffF14B4B),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  static ContactsContainer(context, image, staffname, depname, navigationroot, index) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => navigationroot),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(image),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                staffname,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                depname,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 10),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(index.toString()),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  static EmployeeDepartmentContainer(context, image, staffname, depname, email, gender, address, dob, mobile) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(),
                )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.0, 0.0,0,0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(image),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    staffname,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    depname,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 42,
                          width: 140,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextButton(
                              child: Text("Connect",),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                //  padding: EdgeInsets.only(top: 2, bottom: 30, right: 0, left: 0),
                                backgroundColor: Color(0xffDB7830),
                                shape: const BeveledRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(1))),
                              ),
                              onPressed: () {

                              },
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ), // row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "EMAIL: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Text(email)
                      ],
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text(
                      "MOBILE NO : ",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text(mobile)
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
  static SelectedRoleContainer(name,nav, context,index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: GestureDetector(
          onTap: () {
            // if (Functions.index == 0){
            //
            // }
            Functions.index = index;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nav),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(),
                color: Colors.white),
            height: 66,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
          )),
    );
  }
  static MyProfileContainer(context,infoname,infomation){
    return Center(
      child: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none, // This is what you need.
        children:[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0 ,horizontal: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 15),
                    child: Text(
                      infomation.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ), //Container
          Positioned(
            top: 0,
            left: 20,
            child: Container(
              width: 123,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Text(
                    infoname,style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
            ),
          ), //Container
          //Container
        ],
        //<Widget>[]
      ),
    );
  }
}
