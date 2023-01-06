import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Animation? colorAnimation;
  Animation? heartSizeAnimation;
  Animation<double>? _curveAnimation;

  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // refering this as the current widget
      duration: const Duration(milliseconds: 500),
    );

    _animationController.addListener(() {});

    _animationController.addStatusListener((status) {
      if (_animationController.isCompleted) {
        setState(() {
          isFavorited = true;
        });
      } else {
        setState(() {
          isFavorited = false;
        });
      }
    });

    _curveAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);

    colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_curveAnimation!);

    heartSizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 30, end: 60), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 60, end: 30), weight: 50)
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: colorAnimation!.value,
            size: heartSizeAnimation!.value,
          ),
          onPressed: () {
            if (isFavorited == false) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
          },
        );
      },
    );
  }
}
