import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),

            child: Column(
              children: [
                const SizedBox(height: 30),

                // LOGO TEXT
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Safe',
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF111827),
                          letterSpacing: -1,
                        ),
                      ),

                      TextSpan(
                        text: 'Kos',
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF2F8FCE),
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // SUBTITLE
                const Text(
                  "Smart Security Boarding System",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 50),

                // LOGO IMAGE
                Container(
                  width: 260,
                  height: 260,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    gradient: const LinearGradient(
                      colors: [Color(0xFFB9E3FF), Color(0xFFEAF6FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2F8FCE).withOpacity(0.18),
                        blurRadius: 35,
                        spreadRadius: 8,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Center(
                    child: Image.asset(
                      'assets/images/logo1.png',
                      width: 180,
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 55),

                // TITLE
                const Text(
                  'Keamanan Kos Modern\nDalam Genggaman',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                    color: Color(0xFF111827),
                  ),
                ),

                const SizedBox(height: 20),

                // DESCRIPTION
                const Text(
                  'Pantau CCTV, kontrol akses,\ndan aktifkan panic button secara realtime.',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 17,
                    height: 1.6,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 70),

                // BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 68,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F8FCE),

                      elevation: 12,

                      shadowColor: const Color(0xFF2F8FCE).withOpacity(0.35),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),

                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },

                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          'Mulai Sekarang',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(width: 10),

                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
