import 'package:flutter/material.dart';

class AdditionalInformationCard extends StatelessWidget {
  const AdditionalInformationCard({
    super.key,
    required this.icon,
    required this.semanticLabel,
    required this.name,
    required this.value,
  });

  final IconData icon;
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
