import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'chats.dart';

class Resource {
  static List DepName=[
    ["Back-End Department"],
    ["Design"],
    ["Front-End Department"],
    ["Quality Assurance"],
    ["Marketing"],
    ["Finance"],
    ["Business Analazise"]
  ];
  // context,image,staffname,depname,email,gender,address,dob,mobile
   static List StaffInfo=[
        ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','front-end department','aathilmazz1234@gmail.com','Male','No 24/15 A ist cross street thillayadi puttalam','2001/04/29','0750755684','\$100','Per Day'],
        ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','front-end department','aathilmazz1234@gmail.com','Male','No 24/15 A ist cross street thillayadi puttalam','2001/04/29','0750755684','\$100','Per Day'],
   ];

   // context,image,staffname,depname,AppliedDate,title,reason,fromdate,todate
   static List LeaveInfo =[
        ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Arham','Design','2022/5/12','sick','today iam not well becource i have sick','2022/5/12','2022/5/13',Color(0xffDB7830),FontAwesomeIcons.circleXmark],
        ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','Design','2022/5/12','Quarantine','i need to quarantine myself for few weeks as i got some symptoms of covid 19','2022/5/12','2022/5/13',Color(0xff519557),FontAwesomeIcons.circleCheck]
   ];
  static List LeaveRequestInfo =[
    ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Arham','Design','sick','today iam not well becource i have sick','2022/5/12','2022/5/13'],
    ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','Design','Quarantine','i need to quarantine myself for few weeks as i got some symptoms of covid 19','2022/5/12','2022/5/13']
  ];

  //context,image,staffname,depname,date,day,time,salary,allowence,total
  static List SalaryInfo = [
    ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','front-end department','2022/05/24','Friday','10.00 AM','\$950','\$250','\$1200'],

  ];

  static List ChatInfo = [
       ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','which folder work with today',"3",Chats()],
       ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','which folder work with today',"2",Chats()],
       ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','which folder work with today',"1",Chats()],
       ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','which folder work with today',"4",Chats()],
  ];
  static List ContactsInfo = [
    ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','Front-End Department',"3",],
    ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','Front-End Department',"2",],
    ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','Front-End Department',"1",],
    ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS785biEGWYfQ3kCbvts_QRuNPn7IJpvovN4A&usqp=CAU','Mohamed Atheel','Front-End Department',"4",],
  ];
}