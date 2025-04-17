import 'package:flutter/material.dart';

class ErrorWidgetSection extends StatelessWidget {
  final double screenHeight;
  final VoidCallback onRetry;

  const ErrorWidgetSection({required this.screenHeight, required this.onRetry, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.white, size: 40),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Failed to load weather data',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: screenHeight * 0.02),
          ElevatedButton(
            onPressed: onRetry,
            child: Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
