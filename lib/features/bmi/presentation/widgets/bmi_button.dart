import 'package:flutter/material.dart';

class BmiButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const BmiButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          backgroundColor: const Color(0xff484783),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
