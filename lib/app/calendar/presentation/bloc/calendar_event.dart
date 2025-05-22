abstract class CalendarEvent {}

class SelectStartDate extends CalendarEvent {
  SelectStartDate({required this.date});
  final DateTime date;
}

class SelectStartEndDate extends CalendarEvent {
  SelectStartEndDate({required this.strtDate, required this.endDate});
  final DateTime strtDate;
  final DateTime endDate;
}
