import 'package:flutter/material.dart';
import 'package:steadycalendar/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:steadycalendar/providers/session_provider.dart';
import 'package:steadycalendar/repositories/cal_repo.dart';
import 'package:steadycalendar/repositories/cal_repo_interface.dart';
import 'package:steadycalendar/screens/splash/splash_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  runAppWithOptions(envFileName: '.env', splashState: SplashState());
}
