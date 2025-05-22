import 'package:mbankapp/app/calendar/domain/entities/event.dart';

class EventModel extends Event {
  EventModel({
    required super.eventName,
    required super.description,
    required super.date,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      eventName: json['event_name'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_name': eventName,
      'description': description,
      'date': date,
    };
  }
}
