import 'package:callit/videocall/create.dart';
import 'package:callit/videocall/join.dart';
import 'package:flutter/material.dart';

import '../variables.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({ key}) : super(key: key);

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> with SingleTickerProviderStateMixin {
  TabController tabController;

  buildTab(String s){
    return Container(
      width: 150,
      height: 50,
      child: Card(
        child: Center(
          child: Text(s, style: myStyle(15, Colors.black)),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: Text("CallIt", style: myStyle(20, Colors.orange, FontWeight.bold),),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            buildTab("Join with Code"),
            buildTab("Create Meeting")
          ],
        ),
      ),

      body: TabBarView(
        controller: tabController,
        children: [
          JoinMeeting(),
        CreateMeeting(),


        ],
      ),
    );
  }
}
