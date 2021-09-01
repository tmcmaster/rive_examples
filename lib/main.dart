import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:rive_examples/shared_style.dart';
import 'package:rive_examples/teddy/main.dart';

final c = Container();

void main() => FlutterWorkbench.runAppWidgetTester(
      title: 'Responsive Card',
      styles: SharedStyle.themes,
      options: WidgetTesterOptions(
        aspectRatio: 1,
        columns: kIsWeb ? 2 : 1,
      ),
      children: [
        TeddyDemo(),
      ],
    );
