import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:future_jobs/pages/signin_page.dart';
import 'package:future_jobs/themes.dart';

import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isEmailValid = true;
  bool isUploaded = false;
  TextEditingController emailController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    Widget showedImage() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                'assets/image_profile.png',
                width: 100,
              )
            ],
          ),
        ),
      );
    }

    Widget uploadedImages() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                'assets/icon_upload.png',
                width: 100,
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: greyTextColor.copyWith(fontSize: 16),
                ),
                Text(
                  'Begin New Journey',
                  style: blackTextStyle.copyWith(
                      fontSize: 24, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 50,
                ),
                isUploaded ? showedImage() : uploadedImages(),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: greyTextColor.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          fillColor: inputFieldColor,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                              borderRadius: BorderRadius.circular(100))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Email Address',
                      style: greyTextColor.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: emailController,
                      onChanged: (value) {
                        print(value);
                        bool isValid = EmailValidator.validate(value);
                        print(isValid);
                        if (isValid) {
                          setState(() {
                            isEmailValid = true;
                          });
                        } else {
                          setState(() {
                            isEmailValid = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: inputFieldColor,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      isEmailValid ? primaryColor : redColor),
                              borderRadius: BorderRadius.circular(100))),
                      style: TextStyle(
                          color: isEmailValid ? primaryColor : redColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Password',
                      style: greyTextColor.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: inputFieldColor,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                              borderRadius: BorderRadius.circular(100))),
                      style: TextStyle(
                          color: isEmailValid ? primaryColor : redColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Goal',
                      style: greyTextColor.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          fillColor: inputFieldColor,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                              borderRadius: BorderRadius.circular(100))),
                      style: TextStyle(
                          color: isEmailValid ? primaryColor : redColor),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        width: 400,
                        height: 50,
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                          },
                          child: Text(
                            'Sign Up',
                            style: whiteTextColor,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(66)
                            )
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInPage(),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Text('Back to Sign In',
                              style: greyTextColor.copyWith(
                                  fontSize: 14, fontWeight: light)),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
