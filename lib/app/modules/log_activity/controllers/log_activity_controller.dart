import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/activity_data.dart';
import '../../../models/activity_model.dart';

class LogActivityController extends GetxController {
  final searchController = TextEditingController();

  var filteredList = <ActivityModel>[].obs;

  @override
  void onInit() {
    filteredList.value = ActivityData.activityList;

    super.onInit();
  }

  void searchActivity(String query) {
    if (query.isEmpty) {
      filteredList.value = ActivityData.activityList;
    } else {
      filteredList.value = ActivityData.activityList
          .where(
            (activity) =>
                activity.nama.toLowerCase().contains(query.toLowerCase()) ||
                activity.status.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
  }

  @override
  void onClose() {
    searchController.dispose();

    super.onClose();
  }
}
