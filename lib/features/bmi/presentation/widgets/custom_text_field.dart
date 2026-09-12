import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.validator,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          maxLength: 50,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hint,
            counterText: "",
            fillColor: const Color(0x26B3B2EA),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
