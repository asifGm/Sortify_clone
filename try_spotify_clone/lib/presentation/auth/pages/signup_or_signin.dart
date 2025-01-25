import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:try_spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:try_spotify_clone/common/widgets/appBar/basic_app_bar.dart';
import 'package:try_spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:try_spotify_clone/core/assets/app_images.dart';
import 'package:try_spotify_clone/core/assets/app_vectors.dart';
import 'package:try_spotify_clone/core/configs/theme/app_colors.dart';
import 'package:try_spotify_clone/presentation/auth/pages/sign_up.dart';

class SignUpOrSignIn extends StatelessWidget {
  const SignUpOrSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authInitialPageBackGround),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(AppVectors.logo),
                const SizedBox(
                  height: 55,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Enjoy Listening To Music',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
                ),
                const SizedBox(
                  height: 17,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "Spotify is a proprietary Swedish audio\nstreaming and media services provide",
                  style: TextStyle(fontSize: 17, color: AppColors.grey),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: BasicAppButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUp()));
                        },
                        title: "Register",
                        height: 65,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
