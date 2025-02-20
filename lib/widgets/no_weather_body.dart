import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset("images/wind-day.json"),
            Text(
              'There is no weather 😢 start',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
