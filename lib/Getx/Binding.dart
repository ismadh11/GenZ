import 'package:get/get.dart';

import '../Loginuser.dart';
import '../view_model/Home_view_model.dart';
import 'AuthviewModel.dart';
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Authviewmodel>(() => Authviewmodel());
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
    Get.put(CreateUser());
  }
}
