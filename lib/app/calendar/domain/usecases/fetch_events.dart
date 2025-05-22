import 'package:mbankapp/app/calendar/domain/entities/event.dart';
import 'package:mbankapp/app/calendar/domain/repository/event_repository.dart';

class FetchEventsUseCase {
  FetchEventsUseCase(this.repository);
  final EventRepository repository;

  Future<List<Event>> call({required DateTime startDate, DateTime? endDate}) {
    return repository.fetchEvents(startDate: startDate, endDate: endDate);
  }
}
