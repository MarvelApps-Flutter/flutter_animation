import 'package:flutter/material.dart';
import '../core/models/trip_model.dart';
import '../shared/heart.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class Details extends StatelessWidget {
  final Trip trip;
  Details({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                  child: Hero(
                tag: "location-image-${trip.img}",
                child: Image.asset(
                  'assets/${trip.img}',
                  height: 360,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              )),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 36),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent.withOpacity(0.8)),
                    child: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          ListTile(
              title: Text(trip.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[800])),
              subtitle: Text(
                  '${trip.nights} night stay for only \$${trip.price}',
                  style: const TextStyle(letterSpacing: 1)),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Heart(),
              )),
          Padding(
              padding: const EdgeInsets.all(18),
              child: Text(lorem(paragraphs: 1, words: 50),
                  // lipsum.createText(numParagraphs: 1, numSentences: 3),
                  style: TextStyle(color: Colors.grey[600], height: 1.4))),
        ],
      ),
    );
  }
}
