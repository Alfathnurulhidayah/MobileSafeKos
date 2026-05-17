import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PanicButtonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  var isProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    animation = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    animationController.repeat(reverse: true);
  }

  void swipeMatikan() {
    if (isProcessing.value) return;

    isProcessing.value = true;

    Future.delayed(const Duration(milliseconds: 300), () {
      Get.back();
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
