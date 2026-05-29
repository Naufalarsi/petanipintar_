import 'package:flutter/material.dart';

class EditCatatanPage extends StatefulWidget {
  const EditCatatanPage({super.key});

  @override
  State<EditCatatanPage> createState() =>
      _EditCatatanPageState();
}

class _EditCatatanPageState
    extends State<EditCatatanPage> {

  // =====================================
  // CONTROLLER
  // =====================================

  final TextEditingController tanggalController =
  TextEditingController(
    text: "21 Mei 2026",
  );

  final TextEditingController waktuController =
  TextEditingController(
    text: "07:00",
  );

  final TextEditingController catatanController =
  TextEditingController(
    text: "Urea 50 kg/ha",
  );

  final TextEditingController lokasiController =
  TextEditingController(
    text: "Sawah Blok B",
  );

  final TextEditingController detailController =
  TextEditingController(
    text:
    "Pemupukan dilakukan menggunakan pupuk urea sebanyak 50 kg/ha pada pagi hari.",
  );

  String selectedAktivitas = "Pemupukan";

  final List<String> aktivitasList = [
    "Pemupukan",
    "Penyiraman",
    "Penanaman",
    "Panen",
    "Pengendalian Hama",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F5F5),

      // =====================================
      // APP BAR
      // =====================================
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
          "Edit Catatan",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // =====================================
      // BODY
      // =====================================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            // =====================================
            // TANGGAL & WAKTU
            // =====================================
            Row(
              children: [

                Expanded(
                  child: buildField(
                    controller: tanggalController,
                    label: "Tanggal",
                    icon: Icons.calendar_today,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: buildField(
                    controller: waktuController,
                    label: "Waktu",
                    icon: Icons.access_time,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // =====================================
            // AKTIVITAS
            // =====================================
            const Text(
              "Aktivitas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(16),

                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(

                  value: selectedAktivitas,

                  isExpanded: true,

                  items:
                  aktivitasList.map((item) {

                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );

                  }).toList(),

                  onChanged: (value) {

                    setState(() {
                      selectedAktivitas =
                      value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // =====================================
            // CATATAN
            // =====================================
            buildInputTitle("Catatan"),

            buildInput(
              controller: catatanController,
              hint: "Masukkan Catatan",
            ),

            const SizedBox(height: 20),

            // =====================================
            // LOKASI
            // =====================================
            buildInputTitle("Lokasi"),

            buildInput(
              controller: lokasiController,
              hint: "Masukkan Lokasi",
            ),

            const SizedBox(height: 20),

            // =====================================
            // DETAIL CATATAN
            // =====================================
            buildInputTitle("Detail Catatan"),

            Container(
              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(16),

                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),

              child: TextField(
                controller: detailController,
                maxLines: 5,

                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // =====================================
            // FOTO
            // =====================================
            buildInputTitle("Foto Aktivitas"),

            ClipRRect(
              borderRadius:
              BorderRadius.circular(16),

              child: Image.asset(
                "assets/images/sawah.jpg",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              height: 52,

              child: OutlinedButton.icon(
                onPressed: () {

                  // GANTI FOTO
                },

                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.green,
                ),

                label: const Text(
                  "Ganti Foto",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.green,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // =====================================
            // BUTTON UPDATE
            // =====================================
            SizedBox(
              width: double.infinity,
              height: 58,

              child: ElevatedButton(
                onPressed: () {

                  // UPDATE DATABASE
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(18),
                  ),
                ),

                child: const Text(
                  "Simpan Perubahan",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // =====================================
  // INPUT TITLE
  // =====================================

  Widget buildInputTitle(String title) {

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),

      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // =====================================
  // INPUT FIELD
  // =====================================

  Widget buildInput({
    required TextEditingController controller,
    required String hint,
  }) {

    return TextField(
      controller: controller,

      decoration: InputDecoration(
        hintText: hint,

        filled: true,
        fillColor: Colors.white,

        contentPadding:
        const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),

          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),

          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  // =====================================
  // FIELD WITH ICON
  // =====================================

  Widget buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          controller: controller,

          decoration: InputDecoration(

            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),

            filled: true,
            fillColor: Colors.white,

            contentPadding:
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),

            border: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(16),

              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(16),

              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
