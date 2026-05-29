```dart
import 'package:flutter/material.dart';

class EmptyCatatanPage extends StatelessWidget {
  const EmptyCatatanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      // APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Tambah Catatan Harian",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),

      // BODY
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // GAMBAR
              Image.asset(
                "assets/images/empty_catatan.png",
                height: 220,
              ),

              const SizedBox(height: 30),

              // JUDUL
              const Text(
                "Belum ada catatan",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              // DESKRIPSI
              const Text(
                "Mulai catat setiap aktivitas\npertanianmu untuk hasil panen\nyang lebih optimal",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // BUTTON
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton.icon(
                  onPressed: () {

                    // PINDAH KE HALAMAN TAMBAH CATATAN
                    Navigator.pushNamed(
                      context,
                      '/tambah-catatan',
                    );
                  },

                  icon: const Icon(
                    Icons.add,
                    size: 28,
                    color: Colors.white,
                  ),

                  label: const Text(
                    "Tambah Catatan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // BOTTOM NAVIGATION
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
}
```
