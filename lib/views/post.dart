import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/controllers/post_controller.dart';
import 'package:instagram/services/database.dart';

class AddPost extends StatelessWidget {
  final TextEditingController _capoController = TextEditingController();
  final PostController controller = PostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => controller.selectImage(ImageSource.gallery),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Obx(
                    () => controller.selectedImage.value == ''
                        ? Text('Select Image')
                        : Image.file(
                            File(controller.selectedImage.value),
                          ),
                  ),
                ),
              ),
              TextFormField(
                decoration: new InputDecoration(hintText: "Enter Caption"),
                controller: _capoController,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_capoController.text != "") {
                      Database().addPost(
                        
                        caption: _capoController.text,
                        // createdAt: DateTime.now(),
                        likes: 0,
                        mediaUrl: controller.selectedImage.value,
                      );
                      Get.snackbar('SUCCES', 'Task Added',
                          backgroundColor: Colors.blue,
                          icon: Icon(Icons.check),
                          duration: (Duration(seconds: 2)));
                      _capoController.clear();
                    } else {
                      Get.snackbar('ALERT !', 'Enter Your task',
                          barBlur: 20,
                          icon: Icon(Icons.add_alert),
                          backgroundColor: Colors.red,
                          duration: (Duration(seconds: 2)));
                    }
                  },
                  child: Text("Post"))
            ],
          ),
        ),
      ),
    );
  }
}
