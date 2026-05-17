import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/notification_card.dart';
import '../controllers/notification_controller.dart';
import '../../../routes/app_pages.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),

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
                      onPressed: () {
                        Get.offAllNamed(Routes.DASHBOARD_PEMILIK);
                      },

                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Notifikasi",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2563EB),
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Pantau aktivitas keamanan terbaru",
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// SUMMARY CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF3B82F6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.18),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.notifications_active,
                        color: Colors.white,
                        size: 42,
                      ),
                    ),

                    const SizedBox(width: 18),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "3 Notifikasi Baru",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 6),

                          Text(
                            "Sistem mendeteksi aktivitas penting hari ini.",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// FILTER
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  children: [
                    filterButton("Semua", true),

                    const SizedBox(width: 10),

                    filterButton("Zona Merah", false),

                    const SizedBox(width: 10),

                    filterButton("Panic", false),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// TITLE
              const Text(
                "Aktivitas Terbaru",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2563EB),
                ),
              ),

              const SizedBox(height: 18),

              /// LIST
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),

                  children: [
                    modernNotificationCard(
                      child: NotificationCard(
                        title: 'Unknown terdeteksi',
                        subtitle: 'Zona Merah - Gerbang Depan (32 detik)',
                        time: '22:14',
                        titleColor: Colors.red,
                        label: 'Zona Merah',
                        labelColor: Colors.red,
                      ),
                    ),

                    modernNotificationCard(
                      child: NotificationCard(
                        title: 'Unverified activity',
                        subtitle: 'Mask detected - Zona Merah',
                        time: '20:10',
                        titleColor: Colors.black87,
                        label: 'Zona Merah',
                        labelColor: Colors.black87,
                      ),
                    ),

                    modernNotificationCard(
                      child: NotificationCard(
                        title: 'Panik Button ditekan',
                        subtitle: 'Kamar 3 - Penghuni: Siti',
                        time: '19:45',
                        titleColor: Colors.red,
                        label: 'PANIC',
                        labelColor: Colors.red,

                        actionButton: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),

                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),

                          onPressed: () {},

                          child: const Text(
                            'HUBUNGI PETUGAS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget modernNotificationCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(4),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: child,
    );
  }

  Widget filterButton(String text, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

      decoration: BoxDecoration(
        color: active ? const Color(0xFF2563EB) : Colors.white,

        borderRadius: BorderRadius.circular(30),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Text(
        text,

        style: TextStyle(
          color: active ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
