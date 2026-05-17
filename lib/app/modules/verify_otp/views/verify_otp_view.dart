import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();

    final email = Get.arguments ?? "";

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
                  "Verify OTP",

                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 12),

              /// DESCRIPTION
              Center(
                child: Text(
                  "Masukkan kode OTP yang telah\ndikirim ke email anda.\n\n$email",

                  textAlign: TextAlign.center,

                  style: const TextStyle(
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
                    /// OTP TITLE
                    const Text(
                      "OTP CODE",

                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// OTP FIELD
                    TextField(
                      controller: otpController,

                      keyboardType: TextInputType.number,

                      textAlign: TextAlign.center,

                      maxLength: 6,

                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 8,
                      ),

                      decoration: InputDecoration(
                        hintText: "------",

                        counterText: "",

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

                    const SizedBox(height: 28),

                    /// VERIFY BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 58,

                      child: ElevatedButton.icon(
                        onPressed: () {
                          /// NANTI CONNECT API VERIFY OTP

                          Get.snackbar(
                            "Success",
                            "OTP Verified",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          Get.toNamed(Routes.RESET_PASSWORD, arguments: email);
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F8FCE),

                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),

                        icon: const Icon(
                          Icons.verified_user_rounded,
                          color: Colors.white,
                        ),

                        label: const Text(
                          "Verifikasi OTP",

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    /// RESEND OTP
                    Center(
                      child: TextButton(
                        onPressed: () {
                          /// NANTI CONNECT RESEND OTP

                          Get.snackbar(
                            "Info",
                            "Kode OTP dikirim ulang",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },

                        child: const Text(
                          "Kirim ulang kode OTP",

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F8FCE),
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
