class CatatanModel {
  final String id;
  final String tanggal; // Format: 21 Mei 2025
  final String waktu;   // Format: 07:00
  final String judul;   // Pemupukan, Penyiraman, dll
  final String deskripsi;
  final String tipe;    // Untuk menentukan icon/warna
  final String lokasi;

  CatatanModel({
    required this.id,
    required this.tanggal,
    required this.waktu,
    required this.judul,
    required this.deskripsi,
    required this.tipe,
    required this.lokasi,
  });
}