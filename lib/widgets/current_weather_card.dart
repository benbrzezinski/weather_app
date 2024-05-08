import 'package:flutter/material.dart';
import 'dart:ui';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Wrap(
                  direction: Axis.vertical,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 15,
                  children: [
                    Text(
                      "20°C",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.cloud,
                      size: 64,
                      semanticLabel: "weather phenomenon",
                    ),
                    Text(
                      "Rain",
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
