import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({Key? key}) : super(key: key);

  @override
  _AnimatedCrossFadeWidgetState createState() => _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool crossFadeStateShowFirst = true;

  void _crossFade() {
    setState(() {
      crossFadeStateShowFirst = crossFadeStateShowFirst ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row (
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedCrossFade (
              duration: Duration(milliseconds: 500),
              sizeCurve: Curves.bounceOut,
              crossFadeState: crossFadeStateShowFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Container (
                color: Colors.amber,
                height: 100.0,
                width: 100.0,
              ),
              secondChild: Container (
                color: Colors.lime,
                height: 200.0,
                width: 200.0,
              ),
            ),
            Positioned.fill(
              child: TextButton (
                child: Text ('Tap to\nFade Color & Size'),
                onPressed: () {
                  _crossFade();
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}