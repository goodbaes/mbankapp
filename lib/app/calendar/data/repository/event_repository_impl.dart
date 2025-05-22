import 'package:mbankapp/app/calendar/data/datasource/api_datasource.dart';
import 'package:mbankapp/app/calendar/data/models/event_model.dart';
import 'package:mbankapp/app/calendar/domain/entities/event.dart';
import 'package:mbankapp/app/calendar/domain/repository/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  EventRepositoryImpl(this.apiService);
  final ApiDatasource apiService;

  @override
  Future<List<Event>> fetchEvents({
    required DateTime startDate,
    DateTime? endDate,
  }) async {
    final response = await apiService.fetchEvents(startDate, endDate: endDate);
    return response.map(EventModel.fromJson).toList();
  }
}
