import 'dart:async';

import 'package:flutter/material.dart';
import 'package:future_jobs/themes.dart';

import 'onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingPage(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4141A4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/logo.png',
                width: 59,
                height: 76,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'FUTUREJOB',
              style: whiteTextColor.copyWith(
                fontSize: 32,
                fontWeight: semiBold
              ),
            )
          ],
        ),
      ),
    );
  }
}