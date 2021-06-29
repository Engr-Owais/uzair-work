import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/controllers/AuthControllers.dart';
import 'package:instagram/controllers/UserController.dart';
import 'package:instagram/views/Bottombar.dart';
import 'package:instagram/views/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user != null) {
          return BottomBar();
        } else {
          return Login();
        }
      },
    );
  }
}
