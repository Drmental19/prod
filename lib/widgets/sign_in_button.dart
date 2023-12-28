import 'package:flutter/material.dart';
import 'package:lastfirebase/pages/home_page.dart';
import 'package:lastfirebase/src/pallete.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 150, maxHeight: 45),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Pallete.hexocyan),
          elevation: MaterialStateProperty.all<double>(
              0), // Loại bỏ độ nâng của button
          overlayColor: MaterialStateProperty.all<Color>(
              Colors.transparent), // Loại bỏ màu sáng khi nhấn
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
