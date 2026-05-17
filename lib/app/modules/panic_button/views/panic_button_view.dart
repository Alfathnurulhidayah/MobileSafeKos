import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/panic_button_controller.dart';

class PanicButtonView extends GetView<PanicButtonController> {
  const PanicButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerMove: (event) {
          // SWIPE KE ATAS
          if (event.delta.dy < -18) {
            Get.offAllNamed(Routes.DASHBOARD_PENGHUNI);
          }
        },

        child: Container(
          width: double.infinity,
          height: double.infinity,

          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

              colors: [Color(0xFFD90429), Color(0xFFFF2D55)],
            ),
          ),

          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  // ================= BADGE =================
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(40),

                      border: Border.all(color: Colors.white.withOpacity(0.25)),
                    ),

                    child: const Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Icon(Icons.emergency, color: Colors.white, size: 20),

                        SizedBox(width: 10),

                        Text(
                          "EMERGENCY ACTIVE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ================= TITLE =================
                  const Text(
                    "PANIC BUTTON",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "Sinyal darurat telah dikirim\nke pemilik kos",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ================= SWIPE =================
                  AnimatedBuilder(
                    animation: controller.animation,

                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, -controller.animation.value),
                        child: child,
                      );
                    },

                    child: Column(
                      children: const [
                        Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: Colors.white,
                          size: 80,
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Geser ke atas untuk mematikan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 55),

                  // ================= BUTTON =================
                  Stack(
                    alignment: Alignment.center,

                    children: [
                      // OUTER
                      Container(
                        width: 260,
                        height: 260,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.08),
                        ),
                      ),

                      // MIDDLE
                      Container(
                        width: 220,
                        height: 220,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.08),
                        ),
                      ),

                      // MAIN BUTTON
                      Container(
                        width: 180,
                        height: 180,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF4D4F), Color(0xFFB8001F)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),

                          border: Border.all(color: Colors.white24, width: 4),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 25,
                              offset: Offset(0, 10),
                            ),

                            BoxShadow(
                              color: Colors.redAccent,
                              blurRadius: 30,
                              spreadRadius: 6,
                            ),
                          ],
                        ),

                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.white,
                              size: 72,
                            ),

                            SizedBox(height: 8),

                            Text(
                              "SOS",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // ================= FOOTER =================
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: const Text(
                      "SafeKos Emergency System",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
