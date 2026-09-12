import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  final int selectedGender;
  final Function(int) onGenderSelected;

  const GenderSelection({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "select gender",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _GenderCard(
              index: 0,
              imagePath: "assets/images/Group.png",
              isSelected: selectedGender == 0,
              onTap: () => onGenderSelected(0),
            ),
            const SizedBox(width: 40),
            _GenderCard(
              index: 1,
              imagePath: "assets/images/female.png",
              isSelected: selectedGender == 1,
              onTap: () => onGenderSelected(1),
            ),
          ],
        ),
      ],
    );
  }
}

class _GenderCard extends StatelessWidget {
  final int index;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderCard({
    required this.index,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0x26B3B2EA),
          border: isSelected
              ? Border.all(width: 1, color: const Color(0xE501502E))
              : null,
        ),
        child: Image.asset(imagePath),
      ),
    );
  }
}
