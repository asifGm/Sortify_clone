import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:try_spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:try_spotify_clone/core/assets/app_images.dart';
import 'package:try_spotify_clone/core/assets/app_vectors.dart';
import 'package:try_spotify_clone/presentation/auth/pages/signup_or_signin.dart';
import 'package:try_spotify_clone/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModeBackGround),
              ),
            ),
          ),
          Container(
            color: Colors.black.withValues(alpha: 0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                SvgPicture.asset(AppVectors.logo),
                const Spacer(),
                Column(
                  children: [
                    const Text(
                      'Choose Mode',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print(context);
                                context
                                    .read<ThemeCubit>()
                                    .updateTheme(ThemeMode.dark);
                              },
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(100, 55, 46, 46),
                                        shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                      AppVectors.darkMode,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Text(
                              'Dark Mode',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ThemeCubit>()
                                    .updateTheme(ThemeMode.light);
                              },
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(100, 55, 46, 46),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppVectors.lightMode,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Text('Light Mode',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600))
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BasicAppButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SignUpOrSignIn()));
                  },
                  title: 'Continue',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
