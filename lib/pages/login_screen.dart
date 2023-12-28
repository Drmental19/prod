import 'package:flutter/material.dart';
import 'package:lastfirebase/widgets/email_field.dart';
import 'package:lastfirebase/widgets/password_field.dart';

import 'package:lastfirebase/widgets/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background_hexo.jpg', // Đường dẫn đến ảnh nền của bạn
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black
                .withOpacity(0.3), // Điều chỉnh độ mờ ở đây (giữa 0 và 1)
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
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
                  const EmailField(
                    hintText: 'Enter your email',
                  ),
                  const SizedBox(height: 15),
                  const PasswordField(
                    hiddenText: true,
                    hintText: 'Enter your password',
                  ),
                  const SizedBox(height: 25),
                  const SigninButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
