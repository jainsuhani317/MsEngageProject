import 'package:callit/Authentication/ToAuthScreen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../variables.dart';

class EnterScreen extends StatefulWidget {
  const EnterScreen({key}) : super(key: key);

  @override
  _EnterScreenState createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  @override
  Widget build(BuildContext context) {
    //SizedBox( height: 40,);
    return IntroductionScreen(

        pages: [

          PageViewModel(
            title: "Welcome",
            body: "Welcome to CallIt, the best video conferencing app",
              image: Center(
              child: Image(image: AssetImage('Images/welcomeimage.jpg'))//Image.asset('Images/welcomeimage.jpg', height: 175),
              ),
            decoration: PageDecoration(
              bodyTextStyle: myStyle(20, Colors.lightBlue),
              titleTextStyle: myStyle(20, Colors.blueAccent)
            )

    ),
          PageViewModel(
              title: "Privacy",
              body: "Your Security is Important",
              image: Center(
                child: Image.asset('Images/keylock.jpg', height: 175),
              ),
              decoration: PageDecoration(
                  bodyTextStyle: myStyle(20, Colors.lightBlue),
                  titleTextStyle: myStyle(20, Colors.blueAccent)
              )

          ),
          PageViewModel(
              title: "Let's Get Started",
              body: "Instant Video Conferencing App",
              image: Center(
                child: Image.asset('Images/yay.png', height: 160),
              ),
              decoration: PageDecoration(
                  bodyTextStyle: myStyle(20, Colors.lightBlue),
                  titleTextStyle: myStyle(20, Colors.blueAccent)
              )

          ),

        ],
            onDone:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ToAuthScreen()));
    },
    onSkip: (){},
    showSkipButton: true,
    skip: const Icon(Icons.skip_next, size: 45),
    next: const Icon(Icons.arrow_forward_ios),
    done: Text("Done", style: myStyle(20, Colors.black))
        );
  }
}
