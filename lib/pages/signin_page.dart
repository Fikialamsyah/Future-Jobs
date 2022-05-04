import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:future_jobs/pages/signup_page.dart';
import 'package:future_jobs/themes.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';
import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  bool isEmailValid = true;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: redColor,
      ));
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
                  style: greyTextStyle.copyWith(
                    fontSize: 16
                  ),
                ),
                Text(
                  'Build Your Career',
                  style: blackTextStyle.copyWith(
                    fontSize: 20, 
                    fontWeight: bold
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image.asset(
                    'assets/image_sign_in.png',
                    width: 261,
                    height: 240,
                  ),
                ),
                const SizedBox(
                  height: 49,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(
                      'Email Address',
                      style: greyTextStyle.copyWith(fontSize: 16),
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
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: passwordController,
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
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        width: 400,
                        height: 50,
                        child: isLoading ? const Center(child: CircularProgressIndicator()): TextButton(
                          onPressed: () async {
                            if(emailController.text.isEmpty || passwordController.text.isEmpty){
                              showError('email dan password tidak boleh kosong');
                            } else {
                               setState(() {
                                isLoading = true;
                              });

                              UserModel? user = await authProvider.login(
                                  emailController.text,
                                  passwordController.text,);

                              setState(() {
                                isLoading = false;
                              });


                              if (user == null) {
                                showError('email atau password salah');
                              } else {
                                userProvider.user = user;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ));
                              }
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: whiteTextStyle,
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
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Text(
                            'Create New Account',
                            style: greyTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: light
                            ),
                          ),
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