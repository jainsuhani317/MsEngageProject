import 'package:callit/Authentication/LogIn.dart';
import 'package:callit/Authentication/Register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import '../variables.dart';

class ToAuthScreen extends StatefulWidget {
  const ToAuthScreen({key}) : super(key: key);

  @override
  _ToAuthScreenState createState() => _ToAuthScreenState();
}

class _ToAuthScreenState extends State<ToAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: GradientColors.blue)

            ),
            child: Center(
              child: Image.asset(
                'image',
                height: 100,

              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.6,
              margin: EdgeInsets.only(left:30, right: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0,3),

                  )

                ],
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                ),


              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn())),

                    child:  Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors:GradientColors.teal,),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text(
                          "Let's SIGN IN",
                          style: myStyle(30, Colors.white),
                        )
                      ),
                    ),
                        ),
                    SizedBox(height: 40,),
                    InkWell(

    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Register())),
                    child:
                    Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors:GradientColors.purplePink,),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                          child: Text(
                            "New here?",
                            style: myStyle(30, Colors.white),
                          )
                      ),
                    ),
                    ),
                  ]

                  ,
              )
            ) ,

          )
        ],

      ),
    );
  }
}

