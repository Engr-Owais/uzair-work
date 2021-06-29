
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:instagram/controllers/nav_controller.dart';
import 'package:instagram/views/Home.dart';
import 'package:instagram/views/post.dart';

class BottomBar extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  final List<Widget> bodyContent = [
    Home(),
    Text("Contacts"),
    AddPost(),
    Text("Messages"),
    Text("Info"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FaIcon(
            FontAwesomeIcons.instagram,
            color: Colors.black,
            size: 40,
          ),
        ),
        title: Text(
          "Instagram",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 3.0,
      ),
      body: Obx(
        () => Center(
          child: bodyContent.elementAt(navController.selectedIndex),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: "Contacts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Post",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Info",
            ),
          ],
          currentIndex: navController.selectedIndex,
          onTap: (index) => navController.selectedIndex = index,
        ),
      ),
    );
  }
}
