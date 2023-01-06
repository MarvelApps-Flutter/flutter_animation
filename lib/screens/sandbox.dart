import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({super.key});

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _margin = 0;
  double _opacity = 1;
  double _width = 200;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: color,
        duration: const Duration(seconds: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _margin = 50;
                });
              },
              child: const Text("Animate Margin"),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  color = Colors.pink;
                });
              },
              child: const Text("Animate Color"),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _width = 250;
                });
              },
              child: const Text("Animate Width"),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _opacity = 0.5;
                });
              },
              child: const Text("Animate Opacity"),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: Text(
                "Hide Me!!!!",
                style: TextStyle(color: Colors.yellowAccent.shade200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
