import 'package:flutter/material.dart';

class Bowling extends StatefulWidget {
  const Bowling({super.key});

  @override
  State<Bowling> createState() => _BowlingState();
}

class _BowlingState extends State<Bowling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
