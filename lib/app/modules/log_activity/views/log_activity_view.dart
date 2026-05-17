import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/log_activity_controller.dart';

class LogActivityView extends GetView<LogActivityController> {
  const LogActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FF),

      body: SafeArea(
        child: Padding(
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
                      onPressed: () {
                        Get.offAllNamed(Routes.DASHBOARD_PEMILIK);
                      },

                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),

                  const SizedBox(width: 16),

                  const Expanded(
                    child: Text(
                      'Log Aktivitas\nKeamanan',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// SEARCH
              Container(
                height: 58,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.05),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: TextField(
                  controller: controller.searchController,
                  onChanged: controller.searchActivity,

                  decoration: InputDecoration(
                    border: InputBorder.none,

                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFF2563EB),
                    ),

                    hintText: 'Cari aktivitas penghuni...',

                    hintStyle: TextStyle(color: Colors.grey.shade500),

                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// INFO CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF3B82F6)],
                  ),

                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.18),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    Container(
                      width: 65,
                      height: 65,

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: const Icon(
                        Icons.security_rounded,
                        color: Colors.white,
                        size: 34,
                      ),
                    ),

                    const SizedBox(width: 18),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: const [
                          Text(
                            "Monitoring Aktivitas",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 6),

                          Text(
                            "Pantau aktivitas keamanan dan riwayat penghuni secara realtime.",
                            style: TextStyle(
                              color: Colors.white70,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              /// TITLE
              const Text(
                "Riwayat Aktivitas",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 18),

              /// LIST
              Expanded(
                child: Obx(() {
                  if (controller.filteredList.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Container(
                            width: 90,
                            height: 90,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),

                            child: const Icon(
                              Icons.search_off_rounded,
                              size: 45,
                              color: Color(0xFF2563EB),
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "Aktivitas tidak ditemukan",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.filteredList.length,

                    itemBuilder: (context, index) {
                      final data = controller.filteredList[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 18),

                        child: ActivityCard(
                          title: data.nama,
                          subtitle: data.status,
                          time: data.waktu,
                          image: data.gambar,
                          kamar: data.kamar,
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String image;
  final String kamar;

  const ActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.image,
    required this.kamar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),

        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// FOTO PROFILE
          Container(
            width: 65,
            height: 65,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),

              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 16),

          /// INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: subtitle.toLowerCase().contains("stranger")
                            ? Colors.red.withOpacity(0.12)
                            : Colors.green.withOpacity(0.12),

                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Text(
                        subtitle,

                        style: TextStyle(
                          color: subtitle.toLowerCase().contains("stranger")
                              ? Colors.red
                              : Colors.green,

                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(
                      Icons.meeting_room_outlined,
                      size: 18,
                      color: Color(0xFF2563EB),
                    ),

                    const SizedBox(width: 6),

                    Text(
                      kamar,

                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),

                      decoration: BoxDecoration(
                        color: const Color(0xFFE0ECFF),
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: const Icon(
                        Icons.access_time_rounded,
                        color: Color(0xFF2563EB),
                        size: 18,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// FOTO CCTV
                Container(
                  width: double.infinity,
                  height: 160,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),

                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
