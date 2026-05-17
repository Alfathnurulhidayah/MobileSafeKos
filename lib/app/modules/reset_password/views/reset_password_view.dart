import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FF),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// BACK BUTTON
              IconButton(
                onPressed: () => Get.back(),

                icon: const Icon(Icons.arrow_back_ios),
              ),

              const SizedBox(height: 10),

              /// LOGO
              Center(
                child: Container(
                  width: 110,
                  height: 110,

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(28),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.12),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(18),

                    child: Image.asset(
                      'assets/images/logo1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              /// TITLE
              const Center(
                child: Text(
                  "Reset Password",

                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 12),

              /// DESCRIPTION
              const Center(
                child: Text(
                  "Masukkan password baru untuk\nakun SafeKos anda.",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// CARD
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(28),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.08),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// PASSWORD TITLE
                    const Text(
                      "NEW PASSWORD",

                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// PASSWORD FIELD
                    Obx(
                      () => TextField(
                        controller: controller.passwordController,

                        obscureText: controller.isHidden.value,

                        decoration: InputDecoration(
                          hintText: "Masukkan password baru",

                          prefixIcon: const Icon(Icons.lock_outline),

                          suffixIcon: IconButton(
                            onPressed: controller.togglePassword,

                            icon: Icon(
                              controller.isHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),

                          filled: true,
                          fillColor: const Color(0xFFF3F7FB),

                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),

                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// CONFIRM PASSWORD TITLE
                    const Text(
                      "CONFIRM PASSWORD",

                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// CONFIRM PASSWORD FIELD
                    Obx(
                      () => TextField(
                        controller: controller.confirmPasswordController,

                        obscureText: controller.isHiddenConfirm.value,

                        decoration: InputDecoration(
                          hintText: "Konfirmasi password baru",

                          prefixIcon: const Icon(Icons.lock_outline),

                          suffixIcon: IconButton(
                            onPressed: controller.toggleConfirmPassword,

                            icon: Icon(
                              controller.isHiddenConfirm.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),

                          filled: true,
                          fillColor: const Color(0xFFF3F7FB),

                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),

                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    /// BUTTON RESET PASSWORD
                    SizedBox(
                      width: double.infinity,
                      height: 58,

                      child: ElevatedButton.icon(
                        onPressed: controller.resetPassword,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F8FCE),

                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),

                        icon: const Icon(
                          Icons.lock_reset_rounded,
                          color: Colors.white,
                        ),

                        label: const Text(
                          "Reset Password",

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              /// FOOTER
              const Center(
                child: Text(
                  "SAFEKOS SECURITY SYSTEM",

                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                    letterSpacing: 1.2,
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
}
