import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:try_spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:try_spotify_clone/core/assets/app_images.dart';
import 'package:try_spotify_clone/core/assets/app_vectors.dart';
import 'package:try_spotify_clone/core/configs/theme/app_colors.dart';
import 'package:try_spotify_clone/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.intoBackground),
                  fit: BoxFit.fill),
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
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  '          Lorem ipsum dolor sit amet\n,consectetur adipiscing elit,Sagittis enim\n    purus sed phasellus, Cursur ornare id\n                 scelerisque aliquam. ',
                  style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                      fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const ChooseMode(),
                        ),
                      );
                    },
                    title: 'Get Started'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
