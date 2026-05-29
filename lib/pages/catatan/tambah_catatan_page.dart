import 'package:flutter/material.dart';

class TambahCatatanPage extends StatefulWidget {
  const TambahCatatanPage({super.key});

  @override
  State<TambahCatatanPage> createState() => _TambahCatatanPageState();
}

class _TambahCatatanPageState extends State<TambahCatatanPage> {

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
          "Tambah Catatan",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // TANGGAL & WAKTU
            Row(
              children: [

                Expanded(
                  child: buildTextField(
                    "Tanggal",
                    "21 Mei 2026",
                    Icons.calendar_today,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: buildTextField(
                    "Waktu",
                    "07:00",
                    Icons.access_time,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // AKTIVITAS
            const Text(
              "Aktivitas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(

                  value: selectedAktivitas,

                  isExpanded: true,

                  items: aktivitasList.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedAktivitas = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // CATATAN
            buildInputTitle("Catatan"),

            buildInputField(
              hint: "Urea 50 kg/ha",
            ),

            const SizedBox(height: 20),

            // LOKASI
            buildInputTitle("Lokasi"),

            buildInputField(
              hint: "Sawah Blok B",
            ),

            const SizedBox(height: 20),

            // DETAIL CATATAN
            buildInputTitle("Detail Catatan"),

            Container(
              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),

              child: const TextField(
                maxLines: 5,

                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:
                  "Pemupukkan menggunakan urea 50 kg/ha. dilakukan pagi hari saat cuaca cerah.",
                ),
              ),
            ),

            const SizedBox(height: 20),

            // FOTO
            buildInputTitle("Foto"),

            Row(
              children: [

                // TAMBAH FOTO
                Expanded(
                  child: Container(
                    height: 90,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [

                        Icon(
                          Icons.camera_alt,
                          size: 34,
                          color: Colors.green,
                        ),

                        SizedBox(height: 8),

                        Text(
                          "Tambah Foto",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // PREVIEW FOTO
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),

                    child: Image.asset(
                      "assets/images/sawah.jpg",
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // BUTTON SIMPAN
            SizedBox(
              width: double.infinity,
              height: 58,

              child: ElevatedButton(
                onPressed: () {

                  // SIMPAN CATATAN
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                child: const Text(
                  "Simpan Catatan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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

  // ==========================
  // WIDGET TEXTFIELD
  // ==========================

  Widget buildInputField({
    required String hint,
  }) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,

        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  // ==========================
  // JUDUL INPUT
  // ==========================

  Widget buildInputTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ==========================
  // FIELD TANGGAL & WAKTU
  // ==========================

  Widget buildTextField(
      String title,
      String value,
      IconData icon,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          decoration: InputDecoration(

            hintText: value,

            prefixIcon: Icon(
              icon,
              color: Colors.grey,
              size: 20,
            ),

            filled: true,
            fillColor: Colors.white,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
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
