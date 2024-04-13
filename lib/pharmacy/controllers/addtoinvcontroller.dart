import 'package:get/get.dart';

class PopUpController extends GetxController {
  var selectednum = 0.obs;
  void inc(selectednum) {
    selectednum++;
  }

  void dec(selectednum) {
    selectednum--;
  }
}
