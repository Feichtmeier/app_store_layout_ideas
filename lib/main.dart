import 'package:app_store_layout_ideas/app.dart';
import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

Future<void> main() async {
  await YaruWindowTitleBar.ensureInitialized();
  runApp(const App());
}
