import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsightKeamananView extends StatefulWidget {
  const InsightKeamananView({super.key});

  @override
  State<InsightKeamananView> createState() => _InsightKeamananViewState();
}

class _InsightKeamananViewState extends State<InsightKeamananView> {
  bool isMingguan = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFFEFF6FF),
        elevation: 0,

        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),

        title: const Text(
          "Insight Keamanan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // ================= TAB =================
            Container(
              padding: const EdgeInsets.all(6),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),

              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMingguan = true;
                        });
                      },

                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.symmetric(vertical: 14),

                        decoration: BoxDecoration(
                          color: isMingguan
                              ? const Color(0xFF2563EB)
                              : Colors.transparent,

                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: Center(
                          child: Text(
                            "Mingguan",
                            style: TextStyle(
                              color: isMingguan ? Colors.white : Colors.black54,

                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMingguan = false;
                        });
                      },

                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.symmetric(vertical: 14),

                        decoration: BoxDecoration(
                          color: !isMingguan
                              ? const Color(0xFF2563EB)
                              : Colors.transparent,

                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: Center(
                          child: Text(
                            "Bulanan",
                            style: TextStyle(
                              color: !isMingguan
                                  ? Colors.white
                                  : Colors.black54,

                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= AI RECOMMENDATION =================
            buildCard(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    width: 5,
                    height: 90,

                    decoration: BoxDecoration(
                      color: const Color(0xFF2563EB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            Icon(Icons.auto_awesome, color: Color(0xFF2563EB)),

                            SizedBox(width: 8),

                            Text(
                              "AI Recommendation",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 14),

                        Text(
                          "Perketat zona merah pada jam "
                          "22.00 - 03.00 untuk mencegah "
                          "potensi akses tidak sah.",
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= BAR CHART =================
            buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    "Trend Stranger",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    height: 260,

                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,

                        maxY: 20,

                        borderData: FlBorderData(show: false),

                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                        ),

                        titlesData: FlTitlesData(
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),

                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),

                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),

                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,

                              getTitlesWidget: (value, meta) {
                                const style = TextStyle(fontSize: 14);

                                Widget text;

                                switch (value.toInt()) {
                                  case 0:
                                    text = const Text('Sen', style: style);
                                    break;
                                  case 1:
                                    text = const Text('Sel', style: style);
                                    break;
                                  case 2:
                                    text = const Text('Rab', style: style);
                                    break;
                                  case 3:
                                    text = const Text('Kam', style: style);
                                    break;
                                  case 4:
                                    text = const Text('Jum', style: style);
                                    break;
                                  case 5:
                                    text = const Text('Sab', style: style);
                                    break;
                                  case 6:
                                    text = const Text('Min', style: style);
                                    break;

                                  default:
                                    text = const Text('');
                                }

                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),

                                  child: text,
                                );
                              },
                            ),
                          ),
                        ),

                        barGroups: [
                          makeGroupData(0, 10),
                          makeGroupData(1, 14),
                          makeGroupData(2, 7),
                          makeGroupData(3, 16),
                          makeGroupData(4, 10),
                          makeGroupData(5, 18),
                          makeGroupData(6, 14),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= ROW =================
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Expanded(
                  child: buildCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text(
                          "Jam Rawan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 30),

                        rawanItem("22:00", 0.9),
                        const SizedBox(height: 16),

                        rawanItem("01:00", 0.95),
                        const SizedBox(height: 16),

                        rawanItem("04:00", 0.4),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: buildCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text(
                          "Aktivitas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          height: 150,

                          child: PieChart(
                            PieChartData(
                              centerSpaceRadius: 45,

                              sectionsSpace: 3,

                              sections: [
                                PieChartSectionData(
                                  value: 72,
                                  color: const Color(0xFF2563EB),
                                  radius: 18,
                                  title: '72%',
                                  titleStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),

                                PieChartSectionData(
                                  value: 28,
                                  color: Colors.redAccent,
                                  radius: 18,
                                  title: '28%',
                                  titleStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Color(0xFF2563EB),
                            ),

                            SizedBox(width: 8),

                            Text("Residen"),
                          ],
                        ),

                        const SizedBox(height: 10),

                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.redAccent,
                            ),

                            SizedBox(width: 8),

                            Text("Stranger"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ================= HEATMAP =================
            buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: const [
                      Text(
                        "Heatmap Aktivitas",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      Row(
                        children: [
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Color(0xFF2563EB),
                          ),

                          SizedBox(width: 6),

                          Text("Live"),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: 24,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 8,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),

                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: index % 5 == 0
                              ? Colors.redAccent.withOpacity(0.4)
                              : const Color(0xFFDBEAFE),

                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 18),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("Gate Utama"),
                      Text("Area Parkir"),
                      Text("Koridor 1"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= WORD CLOUD =================
            buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    "WordCloud Kriminal",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),

                  const SizedBox(height: 24),

                  Wrap(
                    spacing: 14,
                    runSpacing: 14,

                    children: const [
                      Text(
                        "Curanmor",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),

                      Text("Terdeteksi", style: TextStyle(fontSize: 20)),

                      Text("Aman", style: TextStyle(fontSize: 22)),

                      Text(
                        "Alarm",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text("Mencurigakan", style: TextStyle(fontSize: 18)),

                      Text("Aktivitas Malam", style: TextStyle(fontSize: 20)),

                      Text(
                        "Gate 2",
                        style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFF2563EB),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= SCORE =================
            buildCard(
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,

                    decoration: BoxDecoration(
                      color: const Color(0xFFDBEAFE),
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: const Icon(
                      Icons.shield_outlined,
                      color: Color(0xFF2563EB),
                    ),
                  ),

                  const SizedBox(width: 18),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Skor Keamanan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Optimal • 92/100",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  const Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15),
        ],
      ),

      child: child,
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,

      barRods: [
        BarChartRodData(
          toY: y,
          width: 28,

          borderRadius: BorderRadius.circular(8),

          color: const Color(0xFF2563EB),
        ),
      ],
    );
  }

  Widget rawanItem(String jam, double value) {
    return Row(
      children: [
        SizedBox(
          width: 55,

          child: Text(
            jam,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),

        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: LinearProgressIndicator(
              value: value,
              minHeight: 12,
              backgroundColor: Colors.grey.shade300,

              valueColor: const AlwaysStoppedAnimation(Color(0xFF2563EB)),
            ),
          ),
        ),
      ],
    );
  }
}
