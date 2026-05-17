import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/dashboard_pemilik_controller.dart';

class DashboardPemilikView extends GetView<DashboardPemilikController> {
  const DashboardPemilikView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FF),

      bottomNavigationBar: Obx(
        () => Container(
          margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          height: 78,

          decoration: BoxDecoration(
            color: const Color(0xFF2563EB),
            borderRadius: BorderRadius.circular(24),

            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2563EB).withOpacity(0.25),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              navItem(
                icon: Icons.home_rounded,
                active: controller.selectedIndex.value == 0,
                onTap: () {
                  controller.changeBottomNav(0);
                  Get.offAllNamed(Routes.DASHBOARD_PEMILIK);
                },
              ),

              navItem(
                icon: Icons.groups_rounded,
                active: controller.selectedIndex.value == 1,
                onTap: () {
                  controller.changeBottomNav(1);
                  Get.toNamed(Routes.DATA_PENGHUNI);
                },
              ),

              navItem(
                icon: Icons.insights_rounded,
                active: controller.selectedIndex.value == 2,
                onTap: () {
                  controller.changeBottomNav(2);
                  Get.toNamed(Routes.INSIGHT_KEAMANAN);
                },
              ),

              navItem(
                icon: Icons.person_rounded,
                active: controller.selectedIndex.value == 3,
                onTap: () {
                  controller.changeBottomNav(3);
                  Get.toNamed(Routes.PROFILE);
                },
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text(
                          'SAFEKOS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3B82F6),
                            letterSpacing: 1.5,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Obx(
                          () => Text(
                            '${controller.namaKos.value}\nPusat Kendali',

                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.NOTIFICATION);
                      },

                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                            ),
                          ],
                        ),

                        child: const Icon(
                          Icons.notifications_none,
                          size: 28,
                          color: Color(0xFF2563EB),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// STATUS CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                    ),

                    borderRadius: BorderRadius.circular(28),

                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3B82F6).withOpacity(0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.verified_user,
                          color: Colors.white,
                          size: 55,
                        ),
                      ),

                      const SizedBox(width: 18),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: const [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,

                              child: Text(
                                'KONDISI: AMAN',
                                maxLines: 1,

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Update Terakhir: 17.00',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                /// QUICK ACTION
                const Text(
                  'Quick Action',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.REGIS_PENGHUNI);
                      },

                      child: quickButton(
                        icon: Icons.edit_outlined,
                        title: 'Registrasi',
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.LOG_ACTIVITY);
                      },

                      child: quickButton(
                        icon: Icons.history,
                        title: 'Log Aktif',
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Routes.SETTING_KAMERA,
                          arguments: "dashboard",
                        );
                      },

                      child: quickButton(
                        icon: Icons.camera_alt_outlined,
                        title: 'Kamera',
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.SETTING);
                      },

                      child: quickButton(
                        icon: Icons.settings_outlined,
                        title: 'Setelan',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 45),

                /// GRAFIK
                const Text(
                  'Aktivitas Harian',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                      ),
                    ],
                  ),

                  child: SizedBox(
                    height: 250,

                    child: Obx(
                      () => LineChart(
                        LineChartData(
                          gridData: FlGridData(show: true),

                          borderData: FlBorderData(show: false),

                          titlesData: FlTitlesData(show: false),

                          lineBarsData: [
                            LineChartBarData(
                              spots: List.generate(
                                controller.spots.length,

                                (index) => FlSpot(
                                  index.toDouble(),
                                  controller.spots[index],
                                ),
                              ),

                              isCurved: true,
                              color: const Color(0xFF2563EB),
                              barWidth: 4,

                              dotData: FlDotData(show: true),

                              belowBarData: BarAreaData(
                                show: true,

                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF3B82F6).withOpacity(0.4),

                                    const Color(0xFF3B82F6).withOpacity(0.0),
                                  ],

                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                /// AKTIVITAS
                const Text(
                  'Aktivitas Terbaru',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      activityTile(title: 'Penghuni Terdeteksi', time: '16.40'),

                      const SizedBox(height: 16),

                      activityTile(title: 'Orang Tidak Dikenal', time: '15.12'),
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

  Widget quickButton({required IconData icon, required String title}) {
    return Column(
      children: [
        Container(
          width: 78,
          height: 78,

          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
            ),

            borderRadius: BorderRadius.circular(24),

            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3B82F6).withOpacity(0.25),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: Icon(icon, size: 36, color: Colors.white),
        ),

        const SizedBox(height: 12),

        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget activityTile({required String title, required String time}) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,

            decoration: BoxDecoration(
              color: const Color(0xFFDBEAFE),
              borderRadius: BorderRadius.circular(18),
            ),

            child: const Icon(Icons.person, color: Color(0xFF2563EB), size: 32),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  "Deteksi aktivitas terbaru",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF2563EB),
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem({
    required IconData icon,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: active ? Colors.white.withOpacity(0.18) : Colors.transparent,

          borderRadius: BorderRadius.circular(18),
        ),

        child: Icon(icon, color: Colors.white, size: active ? 32 : 28),
      ),
    );
  }
}
