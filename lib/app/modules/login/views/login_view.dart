import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FF),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),

            child: Column(
              children: [
                const SizedBox(height: 20),

                /// LOGO
                Container(
                  width: 120,
                  height: 120,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.15),
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

                const SizedBox(height: 30),

                /// TITLE
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Safe",
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      TextSpan(
                        text: "Kos",
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2F8FCE),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Masuk untuk mengakses\nsistem keamanan kos pintar",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 35),

                /// CARD LOGIN
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
                      const Text(
                        "Login Account",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Silahkan login untuk melanjutkan",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),

                      const SizedBox(height: 28),

                      /// EMAIL
                      TextField(
                        controller: controller.emailController,

                        decoration: InputDecoration(
                          hintText: "Email",

                          prefixIcon: const Icon(Icons.email_outlined),

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

                      const SizedBox(height: 18),

                      /// PASSWORD
                      TextField(
                        controller: controller.passwordController,
                        obscureText: true,

                        decoration: InputDecoration(
                          hintText: "Password",

                          prefixIcon: const Icon(Icons.lock_outline),

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

                      const SizedBox(height: 14),

                      /// FORGOT PASSWORD
                      Align(
                        alignment: Alignment.centerRight,

                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/forgot-password');
                          },

                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xFF2F8FCE),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// TOGGLE ROLE
                      Obx(() {
                        return Container(
                          padding: const EdgeInsets.all(6),

                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F7FB),
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: controller.selectOwner,

                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),

                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),

                                    decoration: BoxDecoration(
                                      color: controller.isOwnerSelected.value
                                          ? const Color(0xFF2F8FCE)
                                          : Colors.transparent,

                                      borderRadius: BorderRadius.circular(16),
                                    ),

                                    child: Text(
                                      "PEMILIK",

                                      textAlign: TextAlign.center,

                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: controller.isOwnerSelected.value
                                            ? Colors.white
                                            : Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: GestureDetector(
                                  onTap: controller.selectPenghuni,

                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),

                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),

                                    decoration: BoxDecoration(
                                      color: !controller.isOwnerSelected.value
                                          ? const Color(0xFF2F8FCE)
                                          : Colors.transparent,

                                      borderRadius: BorderRadius.circular(16),
                                    ),

                                    child: Text(
                                      "PENGHUNI",

                                      textAlign: TextAlign.center,

                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: !controller.isOwnerSelected.value
                                            ? Colors.white
                                            : Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),

                      const SizedBox(height: 30),

                      /// BUTTON LOGIN
                      SizedBox(
                        width: double.infinity,
                        height: 58,

                        child: ElevatedButton(
                          onPressed: controller.login,

                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2F8FCE),

                            elevation: 0,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          child: const Text(
                            "Masuk",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// REGISTER
                      Obx(() {
                        bool isOwner = controller.isOwnerSelected.value;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Text(
                              "Belum punya akun? ",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),

                            GestureDetector(
                              onTap: isOwner
                                  ? () {
                                      Get.toNamed('/register');
                                    }
                                  : null,

                              child: Text(
                                "Daftar Sekarang",

                                style: TextStyle(
                                  fontWeight: FontWeight.bold,

                                  color: isOwner
                                      ? const Color(0xFF2F8FCE)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
