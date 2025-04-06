import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shared/color_manger.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer ?_timer;

  void _onStart(){
    _timer=Timer(const Duration(seconds: 3), _onFinish);
  }
  void _onFinish(){
    Get.offAll(()=>const WelcomeScreen());
  }


  @override
  void initState() {
    super.initState();
    _onStart();
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Center(child: Image.asset('assets/images/new_logo.png',fit: BoxFit.fill,)),
    );
  }
}