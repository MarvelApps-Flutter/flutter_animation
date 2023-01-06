import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../core/constants/trips_data.dart';
import '../core/models/trip_model.dart';
import '../screens/details.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Widget> _tripTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _addTrips();
    });
  }

  void _addTrips() {
    Future future = Future(() {});
    trips.forEach((Trip trip) {
      future = future.then((value) {
        return Future.delayed(const Duration(milliseconds: 500), () {
          _tripTiles.add(_buildTile(trip));
          // await Future.delayed(Duration(milliseconds: 800));
          _listKey.currentState!.insertItem(_tripTiles.length - 1);
        });
      });
    });
  }

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Details(trip: trip)));
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${trip.nights} Nights',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[300])),
          Text(trip.title,
              style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: "location-image-${trip.img}",
          child: Image.asset(
            'assets/${trip.img}',
            height: 100.0,
          ),
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }

  final Tween<Offset> _offset =
      Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _tripTiles.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(_offset),
            child: _tripTiles[index],
          );
        });
  }
}
