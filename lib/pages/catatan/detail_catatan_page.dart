import 'package:flutter/material.dart';

class DetailCatatanPage extends StatelessWidget {
  const DetailCatatanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFF5F5F5),

      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),

        centerTitle: true,

        title: const Text(
          "Detail Catatan",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(
            onPressed: () {

              // EDIT CATATAN
            },

            icon: const Icon(
              Icons.edit,
              color: Colors.orange,
            ),
          ),

          IconButton(
            onPressed: () {

              // HAPUS CATATAN
            },

            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),

      // =========================
      // BODY
      // =========================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            // =========================
            // HEADER CARD
            // =========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),

              child: Column(
                children: [

                  // ICON
                  Container(
                    padding: const EdgeInsets.all(18),

                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.energy_savings_leaf,
                      color: Colors.white,
                      size: 38,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // AKTIVITAS
                  const Text(
                    "Pemupukan",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // CATATAN
                  const Text(
                    "Urea 50 kg/ha",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // INFORMASI
            // =========================
            buildInfoCard(
              icon: Icons.calendar_today,
              title: "Tanggal",
              value: "21 Mei 2026",
            ),

            const SizedBox(height: 14),

            buildInfoCard(
              icon: Icons.access_time,
              title: "Waktu",
              value: "07:00 WIB",
            ),

            const SizedBox(height: 14),

            buildInfoCard(
              icon: Icons.location_on,
              title: "Lokasi",
              value: "Sawah Blok B",
            ),

            const SizedBox(height: 20),

            // =========================
            // DETAIL CATATAN
            // =========================
            const Text(
              "Detail Catatan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(18),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                  ),
                ],
              ),

              child: const Text(
                "Pemupukan dilakukan menggunakan pupuk urea "
                    "sebanyak 50 kg/ha pada pagi hari saat cuaca "
                    "cerah. Kondisi tanah cukup lembab dan "
                    "tanaman terlihat sehat.",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // FOTO
            // =========================
            const Text(
              "Foto Aktivitas",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius:
              BorderRadius.circular(20),

              child: Image.asset(
                "assets/images/sawah.jpg",
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 30),

            // =========================
            // BUTTON
            // =========================
            Row(
              children: [

                // EDIT BUTTON
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {

                      // EDIT PAGE
                    },

                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),

                    label: const Text(
                      "Edit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,

                      foregroundColor: Colors.white,

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 16,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                // DELETE BUTTON
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {

                      // DELETE
                    },

                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),

                    label: const Text(
                      "Hapus",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,

                      foregroundColor: Colors.white,

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 16,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // =========================
  // INFO CARD
  // =========================
  Widget buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius:
              BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              color: Colors.green,
            ),
          ),

          const SizedBox(width: 14),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                title,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
