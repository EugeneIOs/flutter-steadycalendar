// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:steadycalendar/config/constants.dart';

import 'package:steadycalendar/models/calendar_color.dart';
import 'package:steadycalendar/models/calendar_date.dart';
import 'package:steadycalendar/models/calendar_dates_converter.dart';
import 'package:steadycalendar/models/date_time_converter.dart';

part 'calendar.g.dart';

@JsonSerializable()
@CalendarDatesConverter()
@DateTimeConverter()
class Calendar {
  @JsonKey(
    includeIfNull: false,
  )
  int? id;

  @JsonKey(
    name: 'user_id',
  )
  String? userID;

  String name;

  @JsonKey(
    name: 'color',
    required: true,
  )
  String colorHex;

  @JsonKey(
    name: 'background_slug',
    required: true,
  )
  String backgroundSlug;

  @JsonKey(
    name: 'calendar_dates',
    required: false,
    includeIfNull: true,
  )
  CalendarDates? dates;

  CalendarColor get color => colors.firstWhere((e) => colorHex == e.hex);

  Calendar({
    this.id,
    this.userID,
    required this.name,
    required this.colorHex,
    required this.backgroundSlug,
  });

  factory Calendar.blank() {
    return Calendar(
        name: 'Untitled',
        colorHex: colors.first.hex,
        backgroundSlug: 'darts@3x.png');
  }

  factory Calendar.fromJson(Map<String, dynamic> json) =>
      _$CalendarFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarToJson(this);
}
