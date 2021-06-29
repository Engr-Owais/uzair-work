import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/Widgets/card.dart';
import 'package:instagram/controllers/home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GetX<HomeController>(
          init: Get.put<HomeController>(HomeController()),
          builder: (HomeController postController) {
            // ignore: unnecessary_null_comparison
            if (postController.posts.length != null && postController.posts != null) {
              return Expanded(
                child: ListView.builder(
                  itemCount: postController.posts.length,
                  itemBuilder: (_, index) {
                    return PostCard(
                      todo: postController.posts[index],
                    );
                  },
                ),
              );
            } else {
              return Center(child: Text("No Posts" , style: TextStyle(color: Colors.black),));
            }
          },
        ),
      ),
    );
  }
}
