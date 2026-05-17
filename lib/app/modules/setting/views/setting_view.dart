import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/camera_data.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),

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
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Text(
                    "Pengaturan Sistem",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// NOTIFIKASI
              Row(
                children: const [
                  Icon(
                    Icons.notifications_active_outlined,
                    color: Color(0xFF2563EB),
                  ),

                  SizedBox(width: 8),

                  Text(
                    "Notifikasi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              /// CARD NOTIF
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    /// ALERT STRANGER
                    Obx(() {
                      return settingSwitchTile(
                        title: "Alert Stranger",
                        subtitle: "Deteksi wajah tidak dikenal",
                        value: controller.alertStranger.value,
                        onChanged: (val) {
                          controller.alertStranger.value = val;
                        },
                      );
                    }),

                    const SizedBox(height: 16),

                    Divider(color: Colors.grey.shade200),

                    const SizedBox(height: 16),

                    /// ALERT UNVERIFIED
                    Obx(() {
                      return settingSwitchTile(
                        title: "Alert Unverified",
                        subtitle: "Deteksi aktivitas mencurigakan",
                        value: controller.alertUnverified.value,
                        onChanged: (val) {
                          controller.alertUnverified.value = val;
                        },
                      );
                    }),

                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(
                          child: buildDropdown(
                            title: "Durasi Trigger",
                            value: controller.durasiTrigger,
                            items: const ["10s", "30s", "60s"],
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: buildDropdown(
                            title: "Sensitivitas",
                            value: controller.sensitivitas,
                            items: const ["Rendah", "Sedang", "Tinggi"],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// ZONA
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  const Text(
                    "Zona Keamanan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  TextButton.icon(
                    onPressed: controller.toggleZona,

                    icon: const Icon(Icons.edit_outlined),

                    label: Text(
                      controller.isEditZona.value ? "Simpan Zona" : "Edit Zona",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// CCTV
              Obx(
                () => Container(
                  width: double.infinity,
                  height: 240,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),

                    border: Border.all(color: Colors.white, width: 2),

                    image: const DecorationImage(
                      image: AssetImage("assets/images/cctv_dummy.jpg"),
                      fit: BoxFit.cover,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),

                  child: Stack(
                    children: [
                      /// LIVE
                      Positioned(
                        top: 14,
                        left: 14,

                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: const Text(
                            "LIVE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      /// POLYGON
                      CustomPaint(
                        size: const Size(double.infinity, 240),
                        painter: ZonaPainter(controller.points),
                      ),

                      /// POINT
                      ...List.generate(controller.points.length, (index) {
                        return Positioned(
                          left: controller.points[index].dx - 10,
                          top: controller.points[index].dy - 10,

                          child: GestureDetector(
                            onPanUpdate: controller.isEditZona.value
                                ? (details) {
                                    controller.points[index] = Offset(
                                      controller.points[index].dx +
                                          details.delta.dx,
                                      controller.points[index].dy +
                                          details.delta.dy,
                                    );

                                    controller.points.refresh();
                                  }
                                : null,

                            child: Container(
                              width: 22,
                              height: 22,

                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,

                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),

                      /// STATUS
                      if (controller.isEditZona.value)
                        Positioned(
                          bottom: 14,
                          right: 14,

                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(14),
                            ),

                            child: const Text(
                              "MODE EDIT",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// KAMERA
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  const Text(
                    "Konfigurasi Kamera",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  ElevatedButton.icon(
                    onPressed: controller.tambahKamera,

                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF2563EB),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    icon: const Icon(Icons.add, color: Colors.white),

                    label: const Text(
                      "Tambah",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Obx(
                () => Column(
                  children: controller.kameraList.map((kamera) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),

                      child: kameraCard(kamera),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
            ),
          ],
        ),

        Switch(
          value: value,
          activeColor: const Color(0xFF2563EB),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget buildDropdown({
    required String title,
    required RxString value,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),

            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(14),
            ),

            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value.value,
                isExpanded: true,

                items: items.map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),

                onChanged: (val) {
                  value.value = val!;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget kameraCard(CameraModel kamera) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(14),
                ),

                child: const Icon(
                  Icons.videocam_outlined,
                  color: Color(0xFF2563EB),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      kamera.nama,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Obx(
                      () => Text(
                        kamera.isOnline.value ? "ONLINE" : "OFFLINE",

                        style: TextStyle(
                          color: kamera.isOnline.value
                              ? Colors.green
                              : Colors.red,

                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    controller.toggleCamera(kamera);
                  },

                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFFEFF6FF),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: const Text(
                    "ON/OFF",
                    style: TextStyle(
                      color: Color(0xFF2563EB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    controller.testKamera(kamera.nama);
                  },

                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFF2563EB),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: const Text(
                    "Test",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ZonaPainter extends CustomPainter {
  final List<Offset> points;

  ZonaPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..color = Colors.red.withOpacity(0.25)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();

    if (points.isNotEmpty) {
      path.moveTo(points[0].dx, points[0].dy);

      for (int i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }

      path.close();

      canvas.drawPath(path, fillPaint);
      canvas.drawPath(path, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
