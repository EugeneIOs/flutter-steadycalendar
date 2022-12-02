import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:steadycalendar/providers/session_provider.dart';
import 'package:steadycalendar/screens/cal_pager/cal_view/cal_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '/config/constants.dart';

class CalPager extends StatelessWidget {
  static const String routeName = '/cal_pager';

  const CalPager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(builder: (context, session, _) {
      return Scaffold(
          body: Stack(
        children: [
          PageView(children: session.cals.map((cal) => CalView(cal)).toList()),
          (Supabase.instance.client.auth.currentUser != null
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Text(Supabase.instance.client.auth.currentUser!.id),
                      TextButton(
                          onPressed: _logOut, child: const Text("Log Out"))
                    ]))
              : Container())
        ],
      ));
    });
  }

  _logOut() async {
    await Supabase.instance.client.auth.signOut();
    // NOTE splash.dart will handle navigation when it handles auth updates
  }
}
