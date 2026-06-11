import 'package:flutter/material.dart';
import '../models/catatan_model.dart';

class ActivityCard extends StatelessWidget {
  final CatatanModel catatan;
  final VoidCallback onTap;

  const ActivityCard({Key? key, required this.catatan, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menentukan icon dan warna berdasarkan tipe
    IconData iconData;
    Color iconBgColor;

    switch (catatan.tipe) {
      case 'Pemupukan':
      case 'Penanaman':
        iconData = Icons.eco;
        iconBgColor = Colors.green;
        break;
      case 'Penyiraman':
        iconData = Icons.water_drop;
        iconBgColor = Colors.blue;
        break;
      case 'Pengendalian Hama':
        iconData = Icons.bug_report;
        iconBgColor = Colors.redAccent;
        break;
      default:
        iconData = Icons.list;
        iconBgColor = Colors.grey;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: iconBgColor,
              child: Icon(iconData, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(catatan.judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(catatan.deskripsi, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  const SizedBox(height: 2),
                  Text(catatan.lokasi, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(catatan.waktu, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                const SizedBox(height: 8),
                Text(catatan.tanggal, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              ],
            )
          ],
        ),
      ),
    );
  }
}