import 'package:flutter/material.dart';
import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:rive_examples/guss/main.dart';
import 'package:rive_examples/shared_style.dart';
import 'package:rive_examples/smilley_switch/settings.dart';
import 'package:rive_examples/teddy/main.dart';

void main() {
  runApp(
    StyledRiverpodApp(
      themes: SharedStyle.themes,
      overrides: [
        WidgetExamplesTesterProviders.exampleBuildersList.overrideWithValue([
          TeddyDemoExamplesBuilder(),
          //GussDemoExamplesBuilder(),
          SmileySwitchDemoExamplesBuilder(),
        ]),
      ],
      child: WidgetExamplesTester(),
    ),
  );
}

class TeddyDemoExamplesBuilder extends ExamplesBuilder {
  TeddyDemoExamplesBuilder() : super(name: 'Teddy Login Screen', build: () => [TeddyDemo()]);
}

class GussDemoExamplesBuilder extends ExamplesBuilder {
  GussDemoExamplesBuilder() : super(name: 'Guss Login Screen', build: () => [GussDemo()]);
}

class SmileySwitchDemoExamplesBuilder extends ExamplesBuilder {
  SmileySwitchDemoExamplesBuilder() : super(name: 'Smiley Switch', build: () => [SmileySwitchDemo()]);
}
