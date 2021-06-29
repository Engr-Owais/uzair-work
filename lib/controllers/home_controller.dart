import 'package:get/state_manager.dart';
import 'package:instagram/model/post.dart';
import 'package:instagram/services/database.dart';

class HomeController extends GetxController {
  RxList<Post> postList = RxList<Post>();

  // ignore: invalid_use_of_protected_member
  List<Post> get posts => postList.value;

  @override
  // ignore: must_call_super
  void onInit() {
    postList.bindStream(Database().postStream());
  }
}
