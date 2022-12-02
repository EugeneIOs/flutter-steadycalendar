import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:matcher/matcher.dart';
import 'package:provider/provider.dart';
import 'package:steadycalendar/providers/session_provider.dart';
import 'package:steadycalendar/repositories/cal_repo.dart';
import 'package:steadycalendar/repositories/cal_repo_interface.dart';
import 'package:steadycalendar/screens/cal_pager/cal_pager.dart';
import 'package:steadycalendar/screens/intro/intro.dart';
import 'package:steadycalendar/screens/login_options/login_options.dart';
import 'package:steadycalendar/screens/splash/splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class App extends StatelessWidget {
  const App(this.splashState, {Key? key}) : super(key: key);

  final State<Splash> splashState;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steady Calendar',
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: ((context) => Splash(splashState)),
        CalPager.routeName: ((context) => const CalPager()),
        LoginOptions.routeName: ((context) => const LoginOptions()),
        Intro.routeName: ((context) => const Intro()),
      },
    );
  }
}

/// Performs initialization steps and then runs our app.
Future<void> runAppWithOptions(
    {String envFileName = '.env',
    CalRepoInterface calendarRepository = const CalendarRepository(),
    required State<Splash> splashState}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await load(fileName: envFileName);

  await Supabase.initialize(
      url: 'https://${env['SUPABASE_PROJECT_ID']!}.supabase.co',
      anonKey: env['SUPABASE_ANON_KEY']!,
      debug: false);

  runApp(ChangeNotifierProvider(
      create: (context) => SessionProvider(calendarRepository),
      child: App(splashState)));
}
