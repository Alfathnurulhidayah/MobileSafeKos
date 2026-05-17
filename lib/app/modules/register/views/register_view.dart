import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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

                const SizedBox(height: 28),

                /// TITLE
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Safe",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      TextSpan(
                        text: "Kos",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2F8FCE),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Buat akun baru untuk mulai\nmengelola keamanan kos",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 35),

                /// CARD REGISTER
                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),

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
                        "Create Account",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Silahkan isi data dibawah ini",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),

                      const SizedBox(height: 28),

                      buildField(
                        "Nama Lengkap",
                        controller.namaController,
                        Icons.person_outline,
                      ),

                      const SizedBox(height: 18),

                      buildField(
                        "Email",
                        controller.emailController,
                        Icons.email_outlined,
                      ),

                      const SizedBox(height: 18),

                      buildField(
                        "Password",
                        controller.passwordController,
                        Icons.lock_outline,
                        isPassword: true,
                      ),

                      const SizedBox(height: 18),

                      buildField(
                        "Nama Kos",
                        controller.namaKosController,
                        Icons.home_work_outlined,
                      ),

                      const SizedBox(height: 18),

                      buildField(
                        "Lokasi Kos",
                        controller.lokasiKosController,
                        Icons.location_on_outlined,
                      ),
                      const SizedBox(height: 18),

                      buildField(
                        "Nomor HP",
                        controller.hpController,
                        Icons.phone_outlined,
                      ),

                      const SizedBox(height: 35),

                      /// BUTTON REGISTER
                      SizedBox(
                        width: double.infinity,
                        height: 58,

                        child: ElevatedButton(
                          onPressed: controller.register,

                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2F8FCE),

                            elevation: 0,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// LOGIN TEXT
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text(
                            "Sudah punya akun? ",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),

                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed('/login');
                            },

                            child: const Text(
                              "Login",

                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2F8FCE),
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
      ),
    );
  }

  Widget buildField(
    String hint,
    TextEditingController controller,
    IconData icon, {
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,

      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: Icon(icon),

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
    );
  }
}
