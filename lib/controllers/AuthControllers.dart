import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:instagram/model/usermodel.dart';
import 'package:instagram/services/database.dart';

import 'UserController.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: non_constant_identifier_names
  Rxn<User> _User = Rxn<User>();

  User? get user => _User.value;

  @override
  // ignore: must_call_super
  onInit() {
    _User.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: name,
        email: _authResult.user!.email,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
      }
      Get.snackbar('Yeah! User Created Successfully', 'Go To Login',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user!.uid);
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
