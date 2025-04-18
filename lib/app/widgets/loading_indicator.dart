import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double screenHeight;

  const LoadingIndicator({required this.screenHeight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.white),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Loading Weather Data...',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
