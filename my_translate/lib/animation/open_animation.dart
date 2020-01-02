import 'package:flutter/material.dart';
import '../pages/index_page.dart';

class OpenAnimation extends StatefulWidget 
{
  _OpenAnimation createState() => _OpenAnimation();
}

class _OpenAnimation extends State<OpenAnimation> with SingleTickerProviderStateMixin
{
  AnimationController _controller;
  Animation _animation;

  @override
  void initState()
  {
    super.initState();
    _controller = AnimationController
    (
      duration: Duration
      (
        seconds: 3,
      ),
      vsync: this,
    );
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);
    _animation.addStatusListener((status)
    {
      if(status == AnimationStatus.completed)
      {
        Navigator.of(context).pushAndRemoveUntil
        (
          MaterialPageRoute(builder: (context) => IndexPage()), 
          (route) => route == null
        );
      }
    });

    _controller.forward();
  }


  @override
  Widget build(BuildContext context) 
  {
    return FadeTransition
    (
         opacity: _animation,
         child: Image.asset
         (
           'images/start.png',
           fit: BoxFit.cover,
          ),
    );

  }
}