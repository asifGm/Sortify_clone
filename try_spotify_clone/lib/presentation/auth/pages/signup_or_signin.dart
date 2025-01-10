import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:try_spotify_clone/core/assets/app_vectors.dart';

class SignUpOrSignIn extends StatelessWidget {
  const SignUpOrSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          )
        ],
      ),
    );
  }
}
