import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_notifikasi_controller.dart';

class DetailNotifikasiView extends GetView<DetailNotifikasiController> {
  const DetailNotifikasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "Notifikasi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: controller.markAllRead,
                    child: const Text(
                      "Mark all as read",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // SNAPSHOT IMAGE
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    const Center(
                      child: Text(
                        "Snapshot CCTV",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    // badge merah
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "TERDETEKSI",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),

                    // kotak merah wajah
                    Positioned(
                      right: 20,
                      top: 55,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 3),
                        ),
                      ),
                    ),

                    // text bawah snapshot
                    Positioned(
                      left: 12,
                      bottom: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Snapshot ID: #SC-9821",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "02 May 2026 - 02:14:45 WIB",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // INFO BOXES
              Row(
                children: [
                  Expanded(child: infoBox(Icons.videocam, "Kamera", "Gerbang\nDepan")),
                  const SizedBox(width: 10),
                  Expanded(child: infoBox(Icons.map, "Zona", "Merah", redText: true)),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(child: infoBox(Icons.timer, "Durasi", "32 detik")),
                  const SizedBox(width: 10),
                  Expanded(child: infoBox(Icons.analytics, "Confidence\nScore", "98 %")),
                ],
              ),

              const SizedBox(height: 14),

              // DETAIL KEJADIAN
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.info_outline, size: 18),
                        SizedBox(width: 6),
                        Text(
                          "Detail Kejadian",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Seseorang tidak dikenal terdeteksi di area terbatas tanpa otorisasi. "
                      "Sistem mendeteksi adanya aktivitas mencurigakan di area gerbang utama selama lebih dari 30 detik",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // BUTTON LIHAT KAMERA
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: controller.lihatKamera,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1C78B8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  label: const Text(
                    "Lihat Kamera",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // BUTTON HUBUNGI PENGHUNI
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: controller.hubungiPenghuni,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A5C88),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.call, color: Colors.white),
                  label: const Text(
                    "Hubungi Penghuni",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // MENU BAWAH
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.verified_user),
                      title: const Text(
                        "Tandai aman",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                      onTap: controller.tandaiAman,
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.visibility_off),
                      title: const Text(
                        "Abaikan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                      onTap: controller.abaikan,
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

  Widget infoBox(IconData icon, String title, String value,
      {bool redText = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: redText ? Colors.red : Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}