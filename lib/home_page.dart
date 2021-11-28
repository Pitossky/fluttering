import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/call_screen.dart';
import 'package:whatsapp_clone/screens/camera_screen.dart';
import 'package:whatsapp_clone/screens/chat_screen.dart';
import 'package:whatsapp_clone/screens/status_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp Clone"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CALLS",
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            )
          ],
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: TabBarView(
        children: [
          CameraScreen(),
          CallScreen(),
          ChatScreen(),
          StatusScreen(),
        ],
        controller: _tabController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Print Something"),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.message),
      ),
    );
  }
}
