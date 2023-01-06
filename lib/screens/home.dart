import 'package:flutter/material.dart';

import '../shared/screenTitle.dart';
import '../shared/tripList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.indigo, BlendMode.darken),
              image: AssetImage("assets/background_travel2.jpeg"),
              fit: BoxFit.cover,
              alignment: Alignment.topLeft),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 5, right: 5, top: 50, bottom: 50),
          child: Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30),
                ScreenTitle(
                  text: 'Marvel Trips',
                  color: Colors.blueAccent.shade200,
                ),

                const SizedBox(height: 10),

                Flexible(
                  child: TripList(),
                )
                //Sandbox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
