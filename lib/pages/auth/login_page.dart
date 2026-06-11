import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../database/db_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Alat untuk menangkap teks ketikan user
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi saat tombol masuk ditekan
  void prosesLogin() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan Password tidak boleh kosong!')),
      );
      return;
    }

    // Tanya ke database, apakah akunnya ada?
    bool isBerhasil = await DatabaseHelper().cekLogin(email, password);

    if (isBerhasil) {
      // Kalau berhasil, pindah ke halaman Dashboard/Home
      // Catatan: Pastikan '/home' ini sesuai dengan nama rute dashboard-mu di main.dart
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home'); 
    } else {
      // Kalau gagal, munculkan peringatan
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email atau Password salah!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppConstants.background),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          /// Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.92),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        AppConstants.logo,
                        height: 120,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Selamat Datang Petaniku",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 30),
                      
                      // Tambahkan controller di sini
                      CustomTextField(
                        controller: emailController,
                        hint: "Email",
                        icon: Icons.email_outlined,
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Tambahkan controller di sini
                      CustomTextField(
                        controller: passwordController,
                        hint: "Password",
                        icon: Icons.lock_outline,
                        obscure: true,
                      ),
                      
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: "Masuk",
                          color: AppColors.primary,
                          textColor: Colors.white,
                          onPressed: prosesLogin, // Panggil fungsi prosesLogin
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Lupa Password?",
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}