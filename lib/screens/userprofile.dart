import 'package:callit/variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String username= '';
  bool isdatapresent = false;
  @override
  void initState(){
    super.initState();
    //getuserdata();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[250],
      body: isdatapresent == false ? Center(
        child: CircularProgressIndicator(),
      ):
      Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2.7,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: GradientColors.beautifulGreen)
              ),
            )

          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width/1.8 -85,
              top: MediaQuery.of(context).size.height/3,

            ),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://www.searchpng.com/2019/02/11/deafult-profile-icon-transparent-png-free-download/'
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                ),
                Text(
                  "Username",
                  style: myStyle(40, Colors.black),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 35,
                  decoration: BoxDecoration(
                    gradient: LinearGradient( colors: GradientColors.cherry)
                  ),
                  child: Center(
                    child: Text("Edit", style: myStyle(20, Colors.white) ),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
