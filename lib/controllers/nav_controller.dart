import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class NavController extends GetxController {
  var _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;
}
