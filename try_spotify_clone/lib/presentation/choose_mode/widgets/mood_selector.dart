import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:try_spotify_clone/presentation/choose_mode/bloc/animation/button_rotation_state.dart';

class MoodSelector<T extends HydratedCubit<ButtonRotationState>>
    extends StatelessWidget {
  final AnimationController controller;
late  Animation<double> animation;
  late double currentAngle;
  final String svgAssetPath;

  MoodSelector(
      {super.key,
      required this.controller,
      required this.animation,
      required this.currentAngle,
      required this.svgAssetPath});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
              color: Color.fromARGB(100, 55, 46, 46), shape: BoxShape.circle),
          child: BlocListener<T, ButtonRotationState>(
            listener: (context, state) {
              if (controller.isAnimating || controller.value < 1.0) {
                animation =
                    Tween<double>(begin: currentAngle, end: state.rotate)
                        .animate(CurvedAnimation(
                            parent: controller, curve: Curves.easeInOut));
                currentAngle = state.rotate;
                controller.forward(from: 0);
              } else {
                controller.reset();
                controller.forward(from: 0);
              }
            },
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                double progress = animation.value / 360;
                double auraOpacity = (progress * 2).clamp(0.0, 1.0);
                double auraRadius = progress * 1.2;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: animation.value * 3.1415 / 180,
                      child: ShaderMask(
                        blendMode: BlendMode.srcOver,
                        shaderCallback: (rect) {
                          return RadialGradient(
                            colors: [
                              Colors.transparent,
                              Colors.red.withValues(alpha: auraOpacity),
                              Colors.orange.withValues(alpha: auraOpacity),
                              Colors.yellow.withValues(alpha: auraOpacity)
                            ],
                            stops: const [0.4, 0.6, 0.8, 1.0],
                            center: Alignment.center,
                            radius: auraRadius,
                          ).createShader(rect);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(100, 55, 46, 46),
                          ),
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: animation.value * 3.1415 / 180,
                      child: SvgPicture.asset(
                        svgAssetPath,
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
