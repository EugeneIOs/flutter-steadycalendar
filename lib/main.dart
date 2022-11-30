import 'package:flutter/material.dart';
import 'package:steadycalendar/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await load(fileName: '.env');
  runApp(const App());
}
