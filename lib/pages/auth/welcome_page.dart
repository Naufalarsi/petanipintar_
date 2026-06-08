import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/routes.dart';
import '../../widgets/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
            color: Colors.black.withOpacity(0.35),
          ),

          /// Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// Logo
                  Image.asset(
                    AppConstants.logo,
                    height: 180,
                  ),

                  const SizedBox(height: 20),

                  /// Title
                  const Text(
                    "Aplikasi Untuk\nSahabat Bertani",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  /// Buttons
                  Row(
                    children: [

                      Expanded(
                        child: CustomButton(
                          text: "Register",
                          color: Colors.white,
                          textColor: AppColors.primary,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.register,
                            );
                          },
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: CustomButton(
                          text: "Login",
                          color: AppColors.primary,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.login,
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}