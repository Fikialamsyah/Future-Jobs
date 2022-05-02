import 'package:flutter/material.dart';
import 'package:future_jobs/pages/signin_page.dart';
import 'package:future_jobs/pages/signup_page.dart';
import 'package:future_jobs/themes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/onboarding.png'
                  )
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Build Your Next\nFuture Career Like\na Master',
                    style: whiteTextColor.copyWith(
                      fontSize: 32
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '18.000 Jobs available',
                    style: whiteTextColor.copyWith(
                      fontSize: 14,
                      fontWeight: light
                    ),
                  ),
                  Center(
                    child: Column(
                      children :[
                        Padding(
                          padding: const EdgeInsets.only(top: 350),
                          child: Container(
                            width: 200,
                            height: 50,
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                              },
                              child: Text(
                                'Get Started',
                                style: purpleTextStyle.copyWith(
                                  fontWeight: medium
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: whiteColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                )
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 200,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                            },
                            child: Text(
                              'Sign In',
                              style: whiteTextColor,
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: whiteColor
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                              )
                            ),
                          ),
                        )
                      ]
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}