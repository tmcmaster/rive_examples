import 'package:flutter/material.dart';
import 'package:rive_examples/smilley_switch/smiley_switch.dart';

class SmileySwitchDemo extends StatefulWidget {
  @override
  _SmileySwitchDemoState createState() => _SmileySwitchDemoState();
}

class _SmileySwitchDemoState extends State<SmileySwitchDemo> {
  static final List<bool> options = [false, true, false, true, true];
  bool _snapToEnd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Wrap(
          children: options
              .asMap()
              .map((i, isOn) => MapEntry(
                  i,
                  SmileySwitch(isOn, snapToEnd: _snapToEnd, onToggle: () {
                    setState(() {
                      _snapToEnd = false;
                      options[i] = !isOn;
                    });
                  })))
              .values
              .toList(),
        ),
      ),
    );
  }
}
