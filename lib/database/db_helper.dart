import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await () async {
      String path = join(await getDatabasesPath(), 'petani_pintar.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
        onConfigure: _onConfigure,
      );
    }();
    return _database!;
  }

  // Mengaktifkan fitur Foreign Key di SQLite
  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database db, int version) async {
    // Tabel 3.1 User
    await db.execute('''
      CREATE TABLE user(
        id_user INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        email TEXT,
        password TEXT,
        no_hp TEXT,
        created_at DATETIME
      )
    ''');

    // Tabel 3.2 Catatan
    await db.execute('''
      CREATE TABLE catatan(
        id_catatan INTEGER PRIMARY KEY AUTOINCREMENT,
        id_user INTEGER,
        jenis_aktivitas TEXT,
        catatan TEXT,
        detail_catatan TEXT,
        lokasi TEXT,
        foto TEXT,
        tanggal DATE,
        waktu TIME,
        created_at DATETIME,
        FOREIGN KEY (id_user) REFERENCES user (id_user) ON DELETE CASCADE
      )
    ''');

    // Tabel 3.3 Jadwal
    await db.execute('''
      CREATE TABLE jadwal(
        id_jadwal INTEGER PRIMARY KEY AUTOINCREMENT,
        id_user INTEGER,
        jenis_aktivitas TEXT,
        catatan TEXT,
        detail_catatan TEXT,
        lokasi TEXT,
        tanggal DATE,
        waktu TIME,
        status TEXT,
        created_at DATETIME,
        FOREIGN KEY (id_user) REFERENCES user (id_user) ON DELETE CASCADE
      )
    ''');

    // Tabel 3.4 Cuaca
    await db.execute('''
      CREATE TABLE cuaca(
        id_cuaca INTEGER PRIMARY KEY AUTOINCREMENT,
        kota TEXT,
        suhu REAL,
        kelembapan INTEGER,
        kondisi TEXT,
        kecepatan_angin REAL,
        tanggal_update DATETIME
      )
    ''');

    // Tabel 3.5 Tips
    await db.execute('''
      CREATE TABLE tips(
        id_tips INTEGER PRIMARY KEY AUTOINCREMENT,
        judul TEXT,
        isi_tips TEXT,
        kategori TEXT,
        created_at DATETIME
      )
    ''');

    // Tabel 3.6 Notifikasi
    await db.execute('''
      CREATE TABLE notifikasi(
        id_notifikasi INTEGER PRIMARY KEY AUTOINCREMENT,
        id_jadwal INTEGER,
        judul TEXT,
        pesan TEXT,
        status_baca INTEGER,
        created_at DATETIME,
        FOREIGN KEY (id_jadwal) REFERENCES jadwal (id_jadwal) ON DELETE CASCADE
      )
    ''');

    // ---> PENAMBAHAN DATA ADMIN DI SINI <---
    // Menyuntikkan akun admin dengan email dan password barumu
    await db.execute('''
      INSERT INTO user (nama, email, password, no_hp, created_at)
      VALUES ('Admin Petani', 'admin@gmail.com', 'admin123', '08000000000', datetime('now'))
    ''');
  }

  Future<bool> cekLogin(String email, String password) async {
    final db = await database;
    var result = await db.query(
      'user',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    
    // Jika result tidak kosong, berarti email dan password cocok
    return result.isNotEmpty;
  }
}