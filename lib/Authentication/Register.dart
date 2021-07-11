import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import '../variables.dart';

class Register extends StatefulWidget {
  const Register({ key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height / 2,
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
            child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 1.6,
                margin: EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3),

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
                    SizedBox(height: 50,),
                    Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.7,
                        child: TextField(
                          style: myStyle(18, Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            hintText: "abc@gmail.com",
                            prefixIcon: Icon(Icons.email),
                            hintStyle: myStyle(
                                20, Colors.blueGrey, FontWeight.w700),
                          ),


                        )
                    ),
                    SizedBox(height: 20),
                    Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.7,
                        child: TextField(
                          style: myStyle(18, Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            hintStyle: myStyle(
                                20, Colors.blueGrey, FontWeight.w700),
                          ),


                        )
                    ),
                    SizedBox(height: 20),
                    Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.7,
                        child: TextField(
                          style: myStyle(18, Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          controller: usernamecontroller,
                          decoration: InputDecoration(
                            hintText: "username",
                            prefixIcon: Icon(Icons.person),
                            hintStyle: myStyle(
                                20, Colors.blueGrey, FontWeight.w700),
                          ),


                        )
                    ),
                    SizedBox(
                      height: 36,),
                    InkWell(
                      onTap:  () async{

                        try {
                          print(emailcontroller.text);
                          print(passwordcontroller.text);
                          print(usernamecontroller.text);
                          //print(signeduser);
                          UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text );
                          User user = result.user;
                          await FirebaseFirestore.instance.collection('users')
                              .doc(user.uid).set({
                            'username': usernamecontroller.text,
                            'email': emailcontroller.text,
                            'password': passwordcontroller.text,
                            'uid': user.uid}
                          );
                          //Navigator.pop(context);
                        } catch(e){
                          print(e);
                          var snackbar = SnackBar(content: Text(e.toString(),style: myStyle(20),));
                          Scaffold.of(context).showSnackBar(snackbar);

                        }



                      },

                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.5,
                        height: 60,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: GradientColors.teal,),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                            child: Text(
                              "SIGN UP",
                              style: myStyle(25, Colors.white),
                            )
                        ),
                      ),
                    ),


                  ]

                  ,
                )
            ),

          )
        ],

      ),
    );
  }
}