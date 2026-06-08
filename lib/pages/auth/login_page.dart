import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// Background
          Container(
            decoration: BoxDecoration(
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

                      const CustomTextField(
                        hint: "Email",
                        icon: Icons.email_outlined,
                      ),

                      const SizedBox(height: 20),

                      const CustomTextField(
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
                          onPressed: () {},
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