
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/controllers/AuthControllers.dart';
import 'package:instagram/views/sigun.dart';

class Login extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Container(
          //       height: 250,
          //       width: 250,
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
                    
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 30),
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Password",
                          icon: Icon(
                            Icons.security,
                            color: Colors.black,
                          ),
                          helperText: 'Please Enter Atleast 6 Characters'),
                      controller: passwordController,
                      obscureText: true,
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      child: Text("Log In"),
                      onPressed: () {
                        controller.login(
                            emailController.text, passwordController.text);
                      },
                    ),
                    ElevatedButton(
                      child: Text("Sign Up"),
                      onPressed: () {
                        Get.off(SignUp());
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}