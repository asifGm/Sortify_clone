import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:try_spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:try_spotify_clone/core/assets/app_images.dart';
import 'package:try_spotify_clone/core/assets/app_vectors.dart';
import 'package:try_spotify_clone/presentation/auth/pages/signup_or_signin.dart';
import 'package:try_spotify_clone/presentation/choose_mode/bloc/animation/Button_rotaion_sun_cuibit.dart';
import 'package:try_spotify_clone/presentation/choose_mode/bloc/animation/button_rotation_moon_cuibit.dart';

import 'package:try_spotify_clone/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:try_spotify_clone/presentation/choose_mode/widgets/mood_selector.dart';

class ChooseMode extends StatefulWidget {
  const ChooseMode({super.key});

  @override
  State<ChooseMode> createState() => _ChooseModeState();
}

class _ChooseModeState extends State<ChooseMode> with TickerProviderStateMixin {
  late AnimationController _controllerMoon;
  late Animation<double> _animationMoon;
  final double _currentAngleMoon = 0;
  late AnimationController _controllerSun;
  late Animation<double> _animationSun;
  final double __currentAngleSun = 0;

  @override
  void initState() {
    super.initState();
    _controllerMoon = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    _animationMoon = Tween<double>(begin: 0, end: 0).animate(_controllerMoon);

    _controllerSun = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _animationSun = Tween<double>(begin: 0, end: 0).animate(_controllerSun);
  }

  @override
  void dispose() {
    _controllerMoon.dispose();
    _controllerSun.dispose();
    super.dispose();
  }

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
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                                colors: [Colors.red, Colors.blue],
                                begin: Alignment.centerLeft,
                                end: Alignment.bottomRight)
                            .createShader(bounds);
                      },
                      blendMode: BlendMode.srcIn,
                      child: const Text(
                        'Choose Mode',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
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
                                context
                                    .read<ButtonRotationMoonCuibit>()
                                    .rotation();
                                context
                                    .read<ThemeCubit>()
                                    .updateTheme(ThemeMode.dark);
                              },
                              child: MoodSelector<ButtonRotationMoonCuibit>(
                                controller: _controllerMoon,
                                animation: _animationMoon,
                                currentAngle: _currentAngleMoon,
                                svgAssetPath: AppVectors.darkMode,
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
                                    .read<ButtonRotaionSunCuibit>()
                                    .rotation();
                                context
                                    .read<ThemeCubit>()
                                    .updateTheme(ThemeMode.light);
                              },
                              child: MoodSelector<ButtonRotaionSunCuibit>(
                                controller: _controllerSun,
                                animation: _animationSun,
                                currentAngle: __currentAngleSun,
                                svgAssetPath: AppVectors.lightMode,
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
