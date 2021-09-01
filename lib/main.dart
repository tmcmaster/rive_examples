import 'package:flutter/material.dart';
import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:rive_examples/shared_style.dart';
import 'package:rive_examples/teddy/main.dart';

void main() {
  runApp(
    StyledRiverpodApp(
      themes: SharedStyle.themes,
      overrides: [
        WidgetExamplesTesterProviders.exampleBuildersList.overrideWithValue([
          TeddyDemoExamplesBuilder(),
        ]),
      ],
      child: WidgetExamplesTester(),
    ),
  );
}

class TeddyDemoExamplesBuilder extends ExamplesBuilder {
  TeddyDemoExamplesBuilder() : super(name: 'Teddy Login Screen', build: () => [TeddyDemo()]);
}
