import 'package:callit/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:uuid/uuid.dart';

class CreateMeeting extends StatefulWidget {
  const CreateMeeting({key}) : super(key: key);

  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  String mcode = "";
  generatecode(){
    setState(() {
      mcode = Uuid().v1().substring(0, 5);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text("Create a code and share it with friends",
              style:  myStyle(20),
            textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Code:",
                style: myStyle( 25),
              ),
              Text(
                mcode,
                style: myStyle(20, Colors.black),
              )

            ],
          ),
          SizedBox(height: 30,),
          InkWell(
            onTap: ()=> generatecode(),
            child:Container(
              width: MediaQuery.of(context).size.width/1.8,
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: GradientColors.facebookMessenger)
              ),
              child: Center(
                child: Text("Generate Code", style: myStyle(20, Colors.white)),
              ),
            ) ,
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: ()=> FirebaseAuth.instance.signOut(),
            child:Container(
              width: MediaQuery.of(context).size.width/1.8,
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: GradientColors.facebookMessenger)
              ),
              child: Center(
                child: Text("Signout", style: myStyle(20, Colors.white)),
              ),
            ) ,
          )

        ],
      ),
    );
  }
}
