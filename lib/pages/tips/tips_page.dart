import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.green.shade50,

      appBar: AppBar(
        title: const Text(
          "Tips Pertanian",
        ),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // HEADER
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius:
                    BorderRadius.circular(25),
              ),

              child: const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    "Tips Hari Ini 🌱",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Rekomendasi otomatis berdasarkan kondisi cuaca dan aktivitas pertanian.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // TIPS 1
            tipsCard(
              icon: Icons.cloud,
              warna: Colors.blue,
              judul: "Prediksi Hujan",
              isi:
                  "Hari ini diprediksi hujan. "
                  "Disarankan menunda penyiraman tanaman.",
            ),

            const SizedBox(height: 15),

            // TIPS 2
            tipsCard(
              icon: Icons.wb_sunny,
              warna: Colors.orange,
              judul: "Cuaca Panas",
              isi:
                  "Suhu mencapai 32°C. "
                  "Lakukan penyiraman tambahan pada sore hari.",
            ),

            const SizedBox(height: 15),

            // TIPS 3
            tipsCard(
              icon: Icons.grass,
              warna: Colors.green,
              judul: "Waktu Pemupukan",
              isi:
                  "Waktu ideal pemupukan "
                  "adalah pagi atau sore hari "
                  "agar penyerapan lebih optimal.",
            ),

            const SizedBox(height: 15),

            // TIPS 4
            tipsCard(
              icon: Icons.water_drop,
              warna: Colors.lightBlue,
              judul: "Kondisi Tanah",
              isi:
                  "Tanah masih cukup lembab. "
                  "Kurangi intensitas penyiraman hari ini.",
            ),
          ],
        ),
      ),
    );
  }

  // WIDGET CARD TIPS
  Widget tipsCard({
    required IconData icon,
    required Color warna,
    required String judul,
    required String isi,
  }) {

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 5,
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          // ICON
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: warna.withOpacity(0.15),
              borderRadius:
                  BorderRadius.circular(15),
            ),

            child: Icon(
              icon,
              color: warna,
              size: 28,
            ),
          ),

          const SizedBox(width: 15),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  judul,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  isi,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.5,
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
