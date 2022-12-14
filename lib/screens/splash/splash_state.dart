import 'package:flutter/material.dart';
import '/screens/splash/splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gotrue/gotrue.dart' as gotrue;
import 'package:provider/provider.dart' as provider;
import '/providers/session_provider.dart';
import '/screens/cal_pager/cal_pager.dart';
import '/screens/intro/intro.dart';

class SplashState extends SupabaseAuthState<Splash> {
  SplashState();

  @override
  void initState() {
    super.initState();
    recoverSupabaseSession();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  login() async {
    provider.Provider.of<SessionProvider>(context, listen: false)
        .refreshCalendars();

    Navigator.of(context).pushNamedAndRemoveUntil(
        CalPager.routeName, ModalRoute.withName(Splash.routeName));
  }

  logout(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Intro.routeName, ModalRoute.withName(Splash.routeName));
  }

  @override
  void onUnauthenticated() {
    logout(context);
  }

  @override
  void onAuthenticated(gotrue.Session session) async {
    login();
  }

  @override
  void onPasswordRecovery(gotrue.Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    print('error authenticating: ' + message);
  }

  @override
  void onReceivedAuthDeeplink(Uri uri) {}
}
