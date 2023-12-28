import 'package:flutter/material.dart';
import 'package:lastfirebase/src/pallete.dart';

class PasswordField extends StatefulWidget {
  final String hintText;
  final bool hiddenText;
  final TextEditingController controller;

  const PasswordField({
    Key? key,
    required this.hintText,
    required this.hiddenText,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        controller: widget.controller, // Accessing controller from the widget
        obscureText: _obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.noColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.hexocyan,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Pallete.borderColor,
          hintText: widget.hintText,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
