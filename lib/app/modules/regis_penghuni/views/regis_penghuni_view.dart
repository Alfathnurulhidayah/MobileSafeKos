import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/regis_penghuni_controller.dart';

class RegisPenghuniView extends GetView<RegisPenghuniController> {
  const RegisPenghuniView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FF),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),

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
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Text(
                      "Daftarkan\nPenghuni Baru",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// LOGO + TITLE
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 95,
                      height: 95,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.12),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Image.asset(
                          'assets/images/logo1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "Registrasi Wajah Penghuni",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Tambahkan data penghuni dan\nfoto wajah untuk sistem keamanan.",
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// CARD FORM
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    buildField(
                      "Nama Lengkap",
                      controller.namaController,
                      Icons.person_outline_rounded,
                    ),

                    const SizedBox(height: 16),

                    buildField(
                      "Email",
                      controller.emailController,
                      Icons.email_outlined,
                    ),

                    const SizedBox(height: 16),

                    buildField(
                      "Password",
                      controller.passwordController,
                      Icons.lock_outline,
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

                    const SizedBox(height: 24),

                    /// FOTO WAJAH
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(22),

                        border: Border.all(
                          color: const Color(0xFFBFDBFE),
                          width: 1.5,
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.face_retouching_natural_rounded,
                                color: Color(0xFF2563EB),
                              ),

                              SizedBox(width: 10),

                              Text(
                                "Data Wajah Penghuni",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 18),

                          Obx(() {
                            return controller.images.isEmpty
                                ? Container(
                                    height: 220,
                                    width: double.infinity,

                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18),

                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),

                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      children: [
                                        Container(
                                          width: 75,
                                          height: 75,

                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE0ECFF),
                                            borderRadius: BorderRadius.circular(
                                              22,
                                            ),
                                          ),

                                          child: const Icon(
                                            Icons.camera_alt_rounded,
                                            size: 38,
                                            color: Color(0xFF2563EB),
                                          ),
                                        ),

                                        const SizedBox(height: 18),

                                        const Text(
                                          "Belum Ada Foto",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        Text(
                                          "Tambahkan minimal 3 foto wajah\nuntuk meningkatkan akurasi sistem.",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            height: 1.5,
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
                                                borderRadius:
                                                    BorderRadius.circular(18),

                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.08),
                                                    blurRadius: 10,
                                                    offset: const Offset(0, 4),
                                                  ),
                                                ],
                                              ),

                                              child: kIsWeb
                                                  ? Image.network(
                                                      controller
                                                          .images[index]
                                                          .path,
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

                                                  decoration:
                                                      const BoxDecoration(
                                                        color: Colors.red,
                                                        shape: BoxShape.circle,
                                                      ),

                                                  child: const Icon(
                                                    Icons.close_rounded,
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
                                  );
                          }),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// BUTTON FOTO
                    SizedBox(
                      width: double.infinity,
                      height: 55,

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
                                    leading: const Icon(
                                      Icons.camera_alt_rounded,
                                    ),

                                    title: const Text('Ambil Foto Kamera'),

                                    onTap: () {
                                      controller.bukaKamera();
                                      Get.back();
                                    },
                                  ),

                                  ListTile(
                                    leading: const Icon(Icons.image_rounded),

                                    title: const Text('Upload dari Gallery'),

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
                          backgroundColor: Colors.white,
                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),

                            side: const BorderSide(color: Color(0xFF2563EB)),
                          ),
                        ),

                        icon: const Icon(
                          Icons.camera_alt_rounded,
                          color: Color(0xFF2563EB),
                        ),

                        label: const Text(
                          "Tambah Foto Wajah",
                          style: TextStyle(
                            color: Color(0xFF2563EB),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    /// BUTTON SIMPAN
                    SizedBox(
                      width: double.infinity,
                      height: 58,

                      child: ElevatedButton(
                        onPressed: controller.simpanPenghuni,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),

                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),

                        child: const Text(
                          "Simpan & Daftarkan",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
          horizontal: 16,
          vertical: 18,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),

          borderSide: BorderSide(color: Colors.grey.shade200),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),

          borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
        ),
      ),
    );
  }
}
