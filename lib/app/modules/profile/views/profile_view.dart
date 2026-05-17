import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),

          child: Column(
            children: [
              /// ================= HEADER =================
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(14),
                          ),

                          child: IconButton(
                            onPressed: () {
                              Get.offAllNamed(Routes.DASHBOARD_PEMILIK);
                            },

                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color(0xFF2563EB),
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Obx(
                      () => ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () {
                                controller.saveProfile();
                              },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),
                          elevation: 0,

                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 12,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        child: controller.isLoading.value
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Simpan',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// ================= PROFILE CARD =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(26),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(30),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Stack(
                      children: [
                        Obx(() {
                          final image = controller.profileImage.value;

                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 5),
                            ),

                            child: CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.white,

                              child: ClipOval(
                                child: image != null
                                    ? kIsWeb
                                          ? Image.network(
                                              image.path,
                                              width: 124,
                                              height: 124,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.file(
                                              image,
                                              width: 124,
                                              height: 124,
                                              fit: BoxFit.cover,
                                            )
                                    : const Icon(
                                        Icons.person,
                                        size: 70,
                                        color: Color(0xFF2563EB),
                                      ),
                              ),
                            ),
                          );
                        }),

                        Positioned(
                          bottom: 0,
                          right: 0,

                          child: GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                Container(
                                  padding: const EdgeInsets.all(20),

                                  decoration: const BoxDecoration(
                                    color: Colors.white,

                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(26),
                                    ),
                                  ),

                                  child: Wrap(
                                    children: [
                                      ListTile(
                                        leading: const Icon(
                                          Icons.camera_alt_rounded,
                                        ),

                                        title: const Text('Buka Kamera'),

                                        onTap: () {
                                          controller.pickImageCamera();

                                          Get.back();
                                        },
                                      ),

                                      ListTile(
                                        leading: const Icon(
                                          Icons.image_rounded,
                                        ),

                                        title: const Text('Pilih dari Gallery'),

                                        onTap: () {
                                          controller.pickImageGallery();

                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },

                            child: Container(
                              padding: const EdgeInsets.all(10),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),

                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Color(0xFF2563EB),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Obx(
                      () => Text(
                        controller.profileName.value,

                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Obx(
                        () => Text(
                          'OWNER • ${controller.namaKos.value.toUpperCase()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// ================= INFORMASI =================
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xFF2563EB),
                        ),

                        SizedBox(width: 8),

                        Text(
                          'Informasi Akun',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    buildTextField('Nama Lengkap', controller.nameController),

                    buildTextField('Email', controller.emailController),

                    buildTextField('No. Hp', controller.phoneController),

                    buildTextField('Alamat Kos', controller.addressController),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              /// ================= LOGOUT =================
              SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade500,
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  onPressed: () {
                    Get.offAllNamed(Routes.LANDING);
                  },

                  icon: const Icon(Icons.logout_rounded, color: Colors.white),

                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,

          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF475569),
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          controller: controller,

          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF8FAFC),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
