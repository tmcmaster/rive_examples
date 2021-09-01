import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SmileySwitch extends StatelessWidget {
  final bool isOn;
  final VoidCallback onToggle;
  final bool snapToEnd;

  SmileySwitch(
    this.isOn, {
    required this.snapToEnd,
    required this.onToggle,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onToggle,
        child: Container(
            width: 180,
            height: 180,
            child: FlareActor('assets/rive/smiley_switch.flr', snapToEnd: snapToEnd, animation: isOn ? "On" : 'Off')));
  }
}
