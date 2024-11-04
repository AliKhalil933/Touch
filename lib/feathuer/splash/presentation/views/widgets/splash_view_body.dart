import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/services/Shared_preferances_singleton.dart';
import 'package:flutter_project/feathuer/auth/presentation/views/login_View.dart';
import 'package:flutter_project/feathuer/onBording/presentation/views/onbording.dart';
import 'package:video_player/video_player.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('lib/assets/images/splash.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    excuteNavication();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 221, 221, 220),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          _controller.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }

  void excuteNavication() {
    bool isonBoardingViewSeen = Prefs.getbool(KIsOnBordingViewSeen);
    Future.delayed(const Duration(seconds: 8), () {
      if (isonBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBordingView.routeName);
      }
    });
  }
}
