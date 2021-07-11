//import 'package:flutter/animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import '../variables.dart';
class LogIn extends StatefulWidget {
  const LogIn({key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
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
                   SizedBox( height: 50,),
                    Container(
                      width: MediaQuery.of(context).size.width/1.7,
                      child: TextField (
                        style: myStyle(18, Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          hintText: "abc@gmail.com",
                          prefixIcon: Icon(Icons.email),
                          hintStyle: myStyle(20, Colors.blueGrey, FontWeight.w700),
                        ),


                      )
                    ),
                    SizedBox(height: 20),
                    Container(
                        width: MediaQuery.of(context).size.width/1.7,
                        child: TextField (
                          style: myStyle(18, Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          controller : passwordcontroller,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            hintStyle: myStyle(20, Colors.blueGrey, FontWeight.w700),
                          ),


                        )
                    ),
                    SizedBox(
                      height: 36,),
                    InkWell(
                      onTap: (){
                        try {
                          int count = 0;
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: emailcontroller.text,
                              password: passwordcontroller.text);
                          Navigator.popUntil(context, (route) {
                            return count++ == 2;
                          }
                          );
                        }
                        catch(e){
                          print(e);
                          var snackbar = SnackBar(content: Text(e.toString(),style: myStyle(20),));
                          Scaffold.of(context).showSnackBar(snackbar);
                        }

                      },
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
                              "SIGN IN",
                              style: myStyle(25, Colors.white),
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
