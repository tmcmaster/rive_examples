import 'package:flutter/material.dart';
import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:rive_examples/favorite_icon/buttons_row.dart';
import 'package:rive_examples/flutter_guy/main.dart';
import 'package:rive_examples/guss/main.dart';
import 'package:rive_examples/penguiln_dance/main.dart';
import 'package:rive_examples/resizing_house/page.dart';
import 'package:rive_examples/shared_style.dart';
import 'package:rive_examples/smilley_switch/settings.dart';
import 'package:rive_examples/teddy/main.dart';

void main() {
  runApp(
    StyledRiverpodApp(
      themes: SharedStyle.themes,
      overrides: [
        WidgetExamplesTesterProviders.exampleBuildersList.overrideWithValue(
          [
            TeddyDemoExamplesBuilder(),
            //GussDemoExamplesBuilder(),
            SmileySwitchDemoExamplesBuilder(),
            PenguinDanceDemoExamplesBuilder(),
            FavouriteIconDemoExamplesBuilder(),
            ResizingHouseDemoExamplesBuilder(),
            FlutterGuyDemoExamplesBuilder(),
          ],
        ),
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

class PenguinDanceDemoExamplesBuilder extends ExamplesBuilder {
  PenguinDanceDemoExamplesBuilder() : super(name: 'Penguin Dance', build: () => [PenguinDanceDemo()]);
}

class FavouriteIconDemoExamplesBuilder extends ExamplesBuilder {
  FavouriteIconDemoExamplesBuilder() : super(name: 'Favourite Icon', build: () => [FavouriteIconDemo()]);
}

class ResizingHouseDemoExamplesBuilder extends ExamplesBuilder {
  ResizingHouseDemoExamplesBuilder() : super(name: 'Resizing House', build: () => [ResizingHouseDemo()]);
}

class FlutterGuyDemoExamplesBuilder extends ExamplesBuilder {
  FlutterGuyDemoExamplesBuilder() : super(name: 'Flutter Guy', build: () => [FlutterGuyDemo()]);
}
