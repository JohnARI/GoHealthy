import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/app.dart';

Future<void> main() async {
  // Initialize the dotenv library
  await dotenv.load();
  runApp(const MainApp());
}
