import 'package:mbankapp/app/calendar/domain/entities/event.dart';

abstract class CalendarState {}

class CalendarInitial extends CalendarState {}

class CalendarLoading extends CalendarState {}

class CalendarLoaded extends CalendarState {
  CalendarLoaded({
    required this.events,
    this.startDate,
    this.endDate,
  });
  final List<Event> events;
  final DateTime? startDate;
  final DateTime? endDate;
}

class CalendarError extends CalendarState {
  CalendarError(this.message);
  final String message;
}
