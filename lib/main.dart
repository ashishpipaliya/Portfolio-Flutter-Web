import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}
