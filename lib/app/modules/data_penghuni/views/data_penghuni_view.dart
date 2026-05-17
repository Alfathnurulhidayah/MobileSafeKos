import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data_penghuni_controller.dart';

class DataPenghuniView extends GetView<DataPenghuniController> {
  const DataPenghuniView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: SafeArea(
        child: Column(
          children: [
            /// ================= HEADER =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(22, 16, 22, 24),

              decoration: const BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: IconButton(
                          onPressed: () => Get.back(),

                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                      ),

                      const SizedBox(width: 14),

                      const Expanded(
                        child: Text(
                          "Data Penghuni Kos",

                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// SEARCH
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: TextField(
                      controller: controller.searchController,

                      onChanged: controller.searchPenghuni,

                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Color(0xFF2563EB),
                        ),

                        hintText: "Cari penghuni...",
                        hintStyle: const TextStyle(color: Color(0xFF94A3B8)),

                        filled: true,
                        fillColor: Colors.white,

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),

                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ================= LIST =================
            Expanded(
              child: Obx(() {
                if (controller.filteredList.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Icon(
                          Icons.people_alt_outlined,
                          size: 80,
                          color: Colors.grey.shade400,
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          "Belum ada penghuni",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 22),

                  itemCount: controller.filteredList.length,

                  itemBuilder: (context, index) {
                    final penghuni = controller.filteredList[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),

                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 14,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          /// FOTO
                          Container(
                            width: 68,
                            height: 68,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFEFF6FF),

                              border: Border.all(color: Colors.white, width: 3),

                              image:
                                  penghuni.fotoWajah.isNotEmpty &&
                                      penghuni.fotoWajah.first.isNotEmpty
                                  ? DecorationImage(
                                      image: FileImage(
                                        File(penghuni.fotoWajah.first),
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),

                            child:
                                penghuni.fotoWajah.isEmpty ||
                                    penghuni.fotoWajah.first.isEmpty
                                ? const Icon(
                                    Icons.person,
                                    size: 34,
                                    color: Color(0xFF2563EB),
                                  )
                                : null,
                          ),

                          const SizedBox(width: 16),

                          /// DATA
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  penghuni.nama,

                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),

                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEFF6FF),
                                    borderRadius: BorderRadius.circular(12),
                                  ),

                                  child: Text(
                                    penghuni.kamar,

                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2563EB),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// EDIT BUTTON
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(14),
                            ),

                            child: IconButton(
                              onPressed: () {
                                controller.keEditPenghuni(penghuni);
                              },

                              icon: const Icon(
                                Icons.edit_outlined,
                                color: Color(0xFF2563EB),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
