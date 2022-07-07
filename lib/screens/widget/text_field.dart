import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final String hText;
  final bool obsText;
  final TextEditingController controller;

  myTextField({
    required this.hText,
    required bool this.obsText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsText,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
          hintText: hText,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          )),
    );
    ;
  }
}
