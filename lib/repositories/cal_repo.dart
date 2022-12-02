import 'package:steadycalendar/models/calendar.dart';
import 'package:steadycalendar/repositories/cal_repo_interface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CalendarRepository implements CalRepoInterface {
  @override
  Future<List<Calendar>> refreshCalendars() async {
    Supabase.instance.client
        .from('calendars')
        .select('idm name, color, background_slug, calendar_dates (date)');
  }
}
