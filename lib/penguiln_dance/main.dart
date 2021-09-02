import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';

class PenguinDanceDemo extends StatefulWidget {
  PenguinDanceDemo({Key? key}) : super(key: key);

  @override
  _PenguinDanceDemoState createState() => _PenguinDanceDemoState();
}

class _PenguinDanceDemoState extends State<PenguinDanceDemo> with FlareController {
  double _rockAmount = 0.5;
  double _speed = 1.0;
  double _rockTime = 0.0;
  bool _isPaused = false;

  ActorAnimation? _rock;

  @override
  void initialize(FlutterActorArtboard artboard) {
    _rock = artboard.getAnimation("music_walk");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _rockTime += elapsed * _speed;
    _rock!.apply(_rockTime % _rock!.duration, artboard, _rockAmount);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Rockin\' Penguin')),
      body: Stack(
        children: [
          Positioned.fill(
              child: FlareActor('assets/rive/Penguin.flr',
                  alignment: Alignment.center,
                  isPaused: _isPaused,
                  fit: BoxFit.cover,
                  animation: 'walk',
                  controller: this)),
          Positioned.fill(
              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Container(
                height: 200,
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Mix Amount", style: TextStyle(color: Colors.white)),
                    Slider(
                      value: _rockAmount,
                      min: 0.0,
                      max: 1.0,
                      divisions: null,
                      onChanged: (double value) {
                        setState(() {
                          _rockAmount = value;
                        });
                      },
                    ),
                    Text('Speed', style: TextStyle(color: Colors.white)),
                    Slider(
                      value: _speed,
                      min: 0.2,
                      max: 3.0,
                      divisions: null,
                      onChanged: (double value) {
                        setState(() {
                          _speed = value;
                        });
                      },
                    ),
                    Text('Paused', style: TextStyle(color: Colors.white)),
                    Checkbox(
                      value: _isPaused,
                      onChanged: (bool? value) {
                        setState(() {
                          _isPaused = value ?? false;
                        });
                      },
                    )
                  ],
                )),
          ]))
        ],
      ),
    );
  }
}
