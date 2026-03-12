import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String hint;
  final Icon? pass;
  final TextInputType keyType;

  const TextForm({
    super.key,
    required this.hint,
    this.pass,
    required this.keyType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: TextFormField(
        keyboardType: keyType,
        decoration: InputDecoration(
          suffixIcon: pass,
          hintText: hint,
          hintStyle: TextStyle(
            color: Color(0xFF9E9E9E),
            fontSize: 15,
          ),
          filled: true,
          fillColor: Color(0xFFF9F9F9),
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFC9A84C), width: 1.5),
          ),
        ),
      ),
    );
  }
}
