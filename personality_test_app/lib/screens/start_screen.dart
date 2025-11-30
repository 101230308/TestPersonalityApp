import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() startTest;
  const StartScreen(this.startTest, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover Your Personality',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('💖 ', style: TextStyle(fontSize: 45)),
              SizedBox(width: 20),
              Text('🗺️', style: TextStyle(fontSize: 45)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('📅', style: TextStyle(fontSize: 45)),
              SizedBox(width: 20),
              Text('🧠', style: TextStyle(fontSize: 45)),
            ],
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: startTest,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: Text('Start Test', style: TextStyle(color: Colors.blueGrey)),
          ),
        ],
      ),
    );
  }
}
