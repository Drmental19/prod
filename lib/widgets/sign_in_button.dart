import 'package:flutter/material.dart';
import 'package:lastfirebase/pages/home_page.dart';
import 'package:lastfirebase/src/pallete.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../function/sign_in/sign_in.dart';
import '../pages/login_screen.dart';

class SigninButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SigninButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  _SigninButtonState createState() => _SigninButtonState();
}

class _SigninButtonState extends State<SigninButton> {


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 150, maxHeight: 45),
      child: ElevatedButton(
        onPressed: () async {
          String email = widget.emailController.text;
          String password = widget.passwordController.text;
          // Now you can use email and password in your sign-in logic
          if (await check_sign_in(email, password)) {
            print('Successfull');
            SharedPreferences preferences = await SharedPreferences.getInstance();
            preferences.setString('email', email);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Pallete.hexocyan),
          elevation: MaterialStateProperty.all<double>(0),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: const BorderSide(color: Colors.transparent),
            ),
          ),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 150, maxHeight: 45),
          alignment: Alignment.center,
          child: const Text(
            'Sign in',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
