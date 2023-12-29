import 'package:flutter/material.dart';
import 'package:lastfirebase/pages/home_page.dart';
import 'package:lastfirebase/widgets/email_field.dart';
import 'package:lastfirebase/widgets/password_field.dart';
import 'package:lastfirebase/widgets/sign_in_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background_hexo.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/HexoGrp.png',
                    height: 230,
                    width: 350,
                  ),
                  const Text(
                    '_Login_',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 15),
                  EmailField(
                    hintText: 'Enter your email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  PasswordField(
                    hiddenText: true,
                    hintText: 'Enter your password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 25),
                  SigninButton(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
