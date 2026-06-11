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
            color: Colors.black.withOpacity(0.2),
          ),

          /// Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(height: 60),

                  // Circular logo with text overlay
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Circular background image
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: AppColors.primary,
                              width: 6,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipOval(
                              child: Image.asset(
                                AppConstants.logo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // Text overlay at bottom
                        Positioned(
                          bottom: 25,
                          child: Column(
                            children: [
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  /// Buttons
                  Center(
                    child: SizedBox(
                      width:300,
                      child: Row(
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
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}