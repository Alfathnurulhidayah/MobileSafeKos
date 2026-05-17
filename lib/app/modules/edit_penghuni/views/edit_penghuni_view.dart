import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

import '../controllers/edit_penghuni_controller.dart';

class EditPenghuniView extends GetView<EditPenghuniController> {
  const EditPenghuniView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FF),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// HEADER
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: IconButton(
                      onPressed: () => Get.back(),

                      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Edit Penghuni",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A3D62),
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Kelola data penghuni kos",
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// MAIN CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// TITLE
                    const Text(
                      "Informasi Penghuni",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A3D62),
                      ),
                    ),

                    const SizedBox(height: 22),

                    buildField(
                      "Nama Lengkap",
                      controller.namaController,
                      Icons.person_outline,
                    ),

                    const SizedBox(height: 16),

                    buildField(
                      "Nomor Kamar",
                      controller.kamarController,
                      Icons.meeting_room_outlined,
                    ),

                    const SizedBox(height: 16),

                    buildField(
                      "Nomor HP",
                      controller.hpController,
                      Icons.phone_outlined,
                    ),

                    const SizedBox(height: 26),

                    /// FOTO TITLE
                    Row(
                      children: const [
                        Icon(
                          Icons.face_retouching_natural,
                          color: Color(0xFF2563EB),
                        ),

                        SizedBox(width: 8),

                        Text(
                          "Data Wajah Penghuni",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF0A3D62),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// BOX FOTO
                    Obx(() {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(20),

                          border: Border.all(
                            color: const Color(0xFFDBEAFE),
                            width: 1.5,
                          ),
                        ),

                        child: controller.images.isEmpty
                            ? SizedBox(
                                height: 190,

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: const [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      size: 60,
                                      color: Color(0xFF2563EB),
                                    ),

                                    SizedBox(height: 12),

                                    Text(
                                      "Belum ada foto wajah",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 6),

                                    Text(
                                      "Ambil minimal 3 foto wajah penghuni",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Wrap(
                                spacing: 14,
                                runSpacing: 14,

                                children: List.generate(
                                  controller.images.length,
                                  (index) {
                                    return Stack(
                                      clipBehavior: Clip.none,

                                      children: [
                                        Container(
                                          width: 115,
                                          height: 115,
                                          clipBehavior: Clip.hardEdge,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              18,
                                            ),

                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.08,
                                                ),
                                                blurRadius: 10,
                                                offset: const Offset(0, 5),
                                              ),
                                            ],
                                          ),

                                          child: kIsWeb
                                              ? Image.network(
                                                  controller.images[index].path,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  File(
                                                    controller
                                                        .images[index]
                                                        .path,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                        ),

                                        /// DELETE BUTTON
                                        Positioned(
                                          top: -8,
                                          right: -8,

                                          child: GestureDetector(
                                            onTap: () {
                                              controller.hapusFoto(index);
                                            },

                                            child: Container(
                                              width: 30,
                                              height: 30,

                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle,

                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.red
                                                        .withOpacity(0.35),
                                                    blurRadius: 8,
                                                  ),
                                                ],
                                              ),

                                              child: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                      );
                    }),

                    const SizedBox(height: 22),

                    /// BUTTON FOTO
                    SizedBox(
                      width: double.infinity,
                      height: 52,

                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.bottomSheet(
                            Container(
                              padding: const EdgeInsets.all(20),

                              decoration: const BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24),
                                ),
                              ),

                              child: Wrap(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      padding: const EdgeInsets.all(10),

                                      decoration: BoxDecoration(
                                        color: const Color(0xFFDBEAFE),

                                        borderRadius: BorderRadius.circular(12),
                                      ),

                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Color(0xFF2563EB),
                                      ),
                                    ),

                                    title: const Text(
                                      'Buka Kamera',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    onTap: () {
                                      controller.bukaKamera();
                                      Get.back();
                                    },
                                  ),

                                  ListTile(
                                    leading: Container(
                                      padding: const EdgeInsets.all(10),

                                      decoration: BoxDecoration(
                                        color: const Color(0xFFDBEAFE),

                                        borderRadius: BorderRadius.circular(12),
                                      ),

                                      child: const Icon(
                                        Icons.image,
                                        color: Color(0xFF2563EB),
                                      ),
                                    ),

                                    title: const Text(
                                      'Upload Gambar',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    onTap: () {
                                      controller.bukaGallery();
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),
                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),

                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        ),

                        label: const Text(
                          "Tambah Foto Wajah",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    /// BUTTON ACTION
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 54,

                            child: ElevatedButton(
                              onPressed: controller.simpan,

                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2563EB),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),

                              child: const Text(
                                "Simpan",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: SizedBox(
                            height: 54,

                            child: ElevatedButton(
                              onPressed: controller.hapus,

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),

                              child: const Text(
                                "Hapus",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(
    String hint,
    TextEditingController controller,
    IconData icon,
  ) {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: Icon(icon, color: const Color(0xFF2563EB)),

        filled: true,
        fillColor: const Color(0xFFF8FAFC),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: const BorderSide(color: Color(0xFFDBEAFE)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
        ),
      ),
    );
  }
}
