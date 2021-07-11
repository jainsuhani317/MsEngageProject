
import 'package:callit/screens/userprofile.dart';
import 'package:callit/screens/videocallscreen.dart';
import 'package:callit/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePg extends StatefulWidget {
  const HomePg({ key}) : super(key: key);

  @override
  _HomePgState createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
  int p=0;
  List PageOptions = [
    VideoCallScreen(),
    UserProfile(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.white,
        selectedItemColor:Colors.deepPurple,
        selectedLabelStyle: myStyle( 20 , Colors.blue),
        unselectedItemColor: Colors.black26 ,
        unselectedLabelStyle: myStyle(20, Colors.blue),
        currentIndex:  p,
        onTap: (index){
          p = index;
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.video_call, size: 30),
          label: 'Video Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'User Profile',
          )
        ],

      ),
       body: PageOptions[p],
    ) ;





  }
}
