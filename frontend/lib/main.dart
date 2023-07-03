import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/app.dart';
import 'utils/shared_preference.dart';

Future<void> main() async {
  // Initialize the dotenv library
  await dotenv.load();
  // Initialize the secure storage
  await SharedPreference.initialize();
  runApp(const MainApp());
}
