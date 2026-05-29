import 'package:flutter/material.dart';

class CatatanPage extends StatelessWidget {
  const CatatanPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> catatanList = [

      {
        "tanggal": "21 Mei 2026",
        "waktu": "07:00",
        "aktivitas": "Pemupukan",
        "catatan": "Urea 50 kg/ha",
        "lokasi": "Sawah Blok B",
        "icon": Icons.energy_savings_leaf,
        "color": Colors.green,
      },

      {
        "tanggal": "20 Mei 2026",
        "waktu": "06:30",
        "aktivitas": "Penyiraman",
        "catatan": "Sawah Blok B",
        "lokasi": "Pagi Hari",
        "icon": Icons.water_drop,
        "color": Colors.blue,
      },

      {
        "tanggal": "19 Mei 2026",
        "waktu": "16:00",
        "aktivitas": "Pengendalian Hama",
        "catatan": "Penyemprotan Pestisida",
        "lokasi": "Seluruh Area",
        "icon": Icons.bug_report,
        "color": Colors.redAccent,
      },

      {
        "tanggal": "18 Mei 2026",
        "waktu": "06:30",
        "aktivitas": "Penanaman",
        "catatan": "Bibit Padi Varietas Hibrida",
        "lokasi": "Luas 2 Ha",
        "icon": Icons.spa,
        "color": Colors.green,
      },
    ];

    return Scaffold(

      backgroundColor: const Color(0xFFF5F5F5),

      // APPBAR
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,

        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),

        centerTitle: true,

        title: const Text(
          "Catatan Harian",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // BODY
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // SEARCH & FILTER
            Row(
              children: [

                // SEARCH
                Expanded(
                  child: Container(
                    height: 50,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Cari Aktivitas",

                        prefixIcon: Icon(Icons.search),

                        border: InputBorder.none,

                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // FILTER BUTTON
                Container(
                  height: 50,
                  width: 50,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // DROPDOWN FILTER
            Row(
              children: [

                Expanded(
                  child: buildDropdown(
                    "Semua Aktivitas",
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: buildDropdown(
                    "Mei 2026",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // INSIGHT CARD
            Container(
              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(16),
              ),

              child: Row(
                children: [

                  Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: const Icon(
                      Icons.menu_book,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: const [

                        Text(
                          "Ringkasan Bulan Ini",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "4 Aktivitas tercatat",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.eco,
                    color: Colors.green,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // LIST CATATAN
            Expanded(
              child: ListView.builder(

                itemCount: catatanList.length,

                itemBuilder: (context, index) {

                  final item = catatanList[index];

                  return Container(

                    margin: const EdgeInsets.only(bottom: 14),

                    padding: const EdgeInsets.all(14),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        // TANGGAL & WAKTU
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                          children: [

                            Text(
                              item["tanggal"],
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            Text(
                              item["waktu"],
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // ISI CARD
                        Row(
                          children: [

                            // ICON
                            Container(
                              padding: const EdgeInsets.all(14),

                              decoration: BoxDecoration(
                                color: item["color"],
                                shape: BoxShape.circle,
                              ),

                              child: Icon(
                                item["icon"],
                                color: Colors.white,
                                size: 28,
                              ),
                            ),

                            const SizedBox(width: 14),

                            // TEXT
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    item["aktivitas"],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    item["catatan"],
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),

                                  const SizedBox(height: 2),

                                  Text(
                                    item["lokasi"],
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // FLOATING BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,

        onPressed: () {

          // PINDAH KE TAMBAH CATATAN
        },

        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),

      // BOTTOM NAVBAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,

        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Dashboard",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Catatan",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Jadwal",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: "Tips",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }

  // ==========================
  // DROPDOWN STYLE
  // ==========================

  Widget buildDropdown(String text) {

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

        children: [

          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),

          const Icon(
            Icons.keyboard_arrow_down,
          ),
        ],
      ),
    );
  }
}
