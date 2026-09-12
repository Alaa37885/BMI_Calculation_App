import 'package:flutter/material.dart';

class MetricInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const MetricInputField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
  });

  void _increment() {
    int x = int.tryParse(controller.text) ?? 0;
    x++;
    controller.text = x.toString();
  }

  void _decrement() {
    int x = int.tryParse(controller.text) ?? 0;
    if (x > 0) {
      x--;
    }
    controller.text = x.toString();
  }

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
          textAlign: TextAlign.center,
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: _increment,
              child: const Icon(Icons.add, size: 26, color: Colors.black),
            ),
            prefixIcon: GestureDetector(
              onTap: _decrement,
              child: const Icon(Icons.remove, size: 26, color: Colors.black),
            ),
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
          maxLength: 50,
          validator: validator,
        ),
      ],
    );
  }
}
