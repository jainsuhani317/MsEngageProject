import 'dart:io';
import 'package:callit/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({ key}) : super(key: key);

  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController roomcontroller = TextEditingController();
  bool isVideoMuted = true;
  bool isAudioMuted = true;

  joinmeeting() async{
    try{
      Map<FeatureFlagEnum,bool> feautueflags ={
        FeatureFlagEnum.WELCOME_PAGE_ENABLED : false
      };
      if(Platform.isAndroid){
        feautueflags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      }
      else if(Platform.isIOS){
        feautueflags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    var options = JitsiMeetingOptions()
      ..room = roomcontroller.text
      ..userDisplayName = namecontroller.text == "" ? "Anonymous" : namecontroller.text
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted;
      //..featureFlag.addPeopleEnabled;
   // featureflags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;  //does not work well for android


      await JitsiMeet.joinMeeting(options) as FeatureFlag;
    }
    catch(e){
  print("Error : $e");
    }


  }


  //String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 17

        ),
        child:
          SingleChildScrollView(
            child:
              Column(
                children: [
                  SizedBox(height: 25,),
                  Text("Enter Code", style: myStyle(20)),
                  SizedBox(height: 20,),
                  TextField(
                    controller: roomcontroller,
                    //appContext:null,
                    //length: 5,
                    //autoDisposeControllers: false,
                    //animationType: AnimationType.fade,
                    //pinTheme: PinTheme(shape: PinCodeFieldShape.underline),
                    //animationDuration: Duration(milliseconds: 250),
                    onChanged: (val){},
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: namecontroller,
                    style: myStyle(20),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name (optional)",
                      labelStyle: myStyle(15)
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CheckboxListTile(
                    value: isVideoMuted,
                      onChanged: (value){
                      setState(() {
                        isVideoMuted = value;
                      });
                      },
                      title: Text('Video Muted'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CheckboxListTile(
                    value: isAudioMuted,
                    onChanged: (value){
                      setState(() {
                        isAudioMuted = value;
                      });
                    },
                    title: Text('Audio Muted'),
                  ),
                  Text("You can change this settings in the meeting", style: myStyle(15),
                  textAlign: TextAlign.justify,
                  ),
                  Divider(
                    height: 45,
                    thickness: 2.1,
                  ),
                  InkWell(
                    onTap: ()=> joinmeeting(),
                    child:Container(
                      width: MediaQuery.of(context).size.width/1.8,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: GradientColors.facebookMessenger)
                      ),
                      child: Center(
                        child: Text("Join", style: myStyle(20, Colors.white)),
                      ),
                    ) ,
                  )
                ],
              )
          )
      ),
    );
  }
}
