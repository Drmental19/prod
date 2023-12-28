import 'package:flutter/material.dart';
import 'package:lastfirebase/src/pallete.dart';

class EmailField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const EmailField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        controller: widget.controller,
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
        ),
      ),
    );
  }
}
