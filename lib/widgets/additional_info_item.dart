import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  const AdditionalInfoItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.semanticLabel,
    required this.name,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String semanticLabel;
  final String name;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      children: [
        Icon(
          icon,
          size: 32,
          color: iconColor,
          semanticLabel: semanticLabel,
        ),
        Text(
          name,
        ),
        Text(
          "$value",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
