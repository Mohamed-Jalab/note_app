import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxLines = 1,
    this.labelText,
    this.hintText,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.textInputAction,
  });
  final int maxLines;
  final String? labelText;
  final String? hintText;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$labelText is required';
        }
        return null;
      },
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFF62FCD7)),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(const Color(0xFF62FCD7)),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
