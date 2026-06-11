import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final Future<void> _initFuture;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _isInitialized = true;
      _initFuture = _precacheImages();
    }
  }

  Future<void> _precacheImages() async {
    await Future.wait([
      precacheImage(const AssetImage("assets/images/bg_sawah.jpg"), context),
      precacheImage(const AssetImage("assets/images/logo.png"), context),
      precacheImage(const AssetImage("assets/images/profile.png"), context),
      precacheImage(const AssetImage("assets/images/weather_bg.jpg"), context),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F0),
      body: FutureBuilder<void>(
        future: _initFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }

          return SafeArea(
            child: Stack(
              children: [
                // BACKGROUND
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg_sawah.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // CONTENT
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // =========================
                        // HEADER
                        // =========================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/logo.png",
                                  width: 60,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Petani\nPintar",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: const AssetImage(
                                "assets/images/profile.png",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Selamat pagi, Pak Trio!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Yuk, tingkatkan hasil panen kamu",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // =========================
                        // WEATHER CARD
                        // =========================
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/weather_bg.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Cuaca Hari Ini",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "27 C",
                                        style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Hari ini cerah,\n"
                                        "waktu siram ideal",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.wb_cloudy,
                                    size: 90,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  weatherItem(
                                    Icons.water_drop,
                                    "Kelembapan",
                                    "70%",
                                  ),
                                  weatherItem(
                                    Icons.air,
                                    "Angin",
                                    "12 km/jam",
                                  ),
                                  weatherItem(
                                    Icons.cloud,
                                    "Hujan",
                                    "10%",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // =========================
                        // AKTIVITAS TERAKHIR
                        // =========================
                        sectionCard(
                          title: "Aktivitas Terakhir",
                          children: [
                            activityItem(
                              Colors.green,
                              Icons.eco,
                              "Pemupukan",
                              "Urea 50 kg/ha",
                              "11 Mei 2025",
                            ),
                            activityItem(
                              Colors.blue,
                              Icons.water_drop,
                              "Penyiraman",
                              "Sawah Blok B",
                              "12 Mei 2025",
                            ),
                            activityItem(
                              Colors.redAccent,
                              Icons.bug_report,
                              "Pengendalian Hama",
                              "Penyemprotan Pestisida",
                              "7 Mei 2025",
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // =========================
                        // JADWAL
                        // =========================
                        sectionCard(
                          title: "Jadwal & Notifikasi",
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Colors.green.shade100,
                                  child: const Icon(
                                    Icons.calendar_month,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pemupukan lanjutan",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "NPK 26-16-16\n"
                                        "16 Mei 2025",
                                      ),
                                    ],
                                  ),
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  backgroundColor: Colors.green,
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 90),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      // =========================
      // BOTTOM NAVIGATION
      // =========================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
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
            icon: Icon(Icons.lightbulb),
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

  // ==========================================
  // WEATHER ITEM
  // ==========================================
  Widget weatherItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Column(
      children: [

        Icon(
          icon,
          color: Colors.white,
        ),

        const SizedBox(height: 5),

        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),

        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ==========================================
  // SECTION CARD
  // ==========================================
  Widget sectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),

      child: Column(
        children: [

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                "Lihat Semua",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          ...children,
        ],
      ),
    );
  }

  // ==========================================
  // ACTIVITY ITEM
  // ==========================================
  Widget activityItem(
    Color color,
    IconData icon,
    String title,
    String subtitle,
    String date,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Row(
        children: [

          CircleAvatar(
            backgroundColor: color,

            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(subtitle),

                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 5,
            ),

            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius:
                  BorderRadius.circular(20),
            ),

            child: const Text(
              "Selesai",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
