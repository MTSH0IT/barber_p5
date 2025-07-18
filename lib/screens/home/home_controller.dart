import 'package:halake_barber/model/controller/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  var selectedIndex = 0.obs;
  var pagerController = PageController();

  void onSelectMenu(int index) {
    selectedIndex.value = index;
    pagerController.jumpToPage(index);
  }
}
