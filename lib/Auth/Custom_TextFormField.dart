import 'package:flutter/material.dart';
import 'package:todo_app/mytheme.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.label,
      required this.Icon,
      this.ObscureText = false,
      this.Keyboard = TextInputType.text,
      required this.Controller,
      required this.Validator});

  String label;

  Widget Icon;

  TextInputType Keyboard;

  TextEditingController Controller;

  String? Function(String?)? Validator;

  bool ObscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: Keyboard,
        controller: Controller,
        validator: Validator,
        obscureText: ObscureText,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(width: 3, color: Mytheme.redcolor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(width: 3, color: Mytheme.bluecolor),
          ),
          prefixIcon: Icon,
          label: Text(label),
          labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
