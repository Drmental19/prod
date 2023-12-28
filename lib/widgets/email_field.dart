import 'package:flutter/material.dart';
import 'package:lastfirebase/src/pallete.dart';

class EmailField extends StatefulWidget {
  final String hintText;
  const EmailField({
    Key? key,
    required this.hintText,
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
