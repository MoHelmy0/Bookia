import 'package:flutter/material.dart';

class loginGA extends StatelessWidget {
  const loginGA ({super.key, required this.imagePath, required this.titel});
  final String imagePath;
  final String titel;


  @override
  Widget build(BuildContext context) {
    return Material(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xFFE0E0E0), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.white,
          minimumSize: Size(double.infinity, 56),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 24,
              height: 24,
            ),
            SizedBox(width: 12),
            Text(
              titel,
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
