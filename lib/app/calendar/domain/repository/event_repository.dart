import 'package:mbankapp/app/calendar/domain/entities/event.dart';

// ignore: one_member_abstracts
abstract class EventRepository {
  Future<List<Event>> fetchEvents({
    required DateTime startDate,
    DateTime? endDate,
  });
}
