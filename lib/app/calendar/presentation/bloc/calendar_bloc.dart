import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbankapp/app/calendar/domain/usecases/fetch_events.dart';
import 'package:mbankapp/app/calendar/presentation/bloc/calendar_event.dart';
import 'package:mbankapp/app/calendar/presentation/bloc/calendar_state.dart';
import 'package:mbankapp/core/utils/date_helper.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc(this.fetchEvents) : super(CalendarInitial()) {
    on<SelectStartDate>(_onSelectStartDate);
    on<SelectStartEndDate>(_onSelectStartEndDate);
  }
  final FetchEventsUseCase fetchEvents;

  Future<void> _onSelectStartDate(
    SelectStartDate event,
    Emitter<CalendarState> emit,
  ) async {
    final today = DateTime.now();

    try {
      if (!DateHelper.isValidRange(event.date, today)) {
        emit(CalendarError('Date range must be exactly 7 days'));
        return;
      }

      emit(CalendarLoading());
      final events = await fetchEvents(
        startDate: event.date,
      );

      emit(
        CalendarLoaded(
          events: events,
          startDate: event.date,
        ),
      );
    } catch (e) {
      emit(CalendarError('Failed to update start date: $e'));
    }
  }

  Future<void> _onSelectStartEndDate(
    SelectStartEndDate event,
    Emitter<CalendarState> emit,
  ) async {
    try {
      if (!DateHelper.isValidRange(event.strtDate, event.endDate)) {
        emit(CalendarError('Date range must be exactly 7 days'));
        return;
      }

      emit(CalendarLoading());
      final events = await fetchEvents(
        startDate: event.strtDate,
        endDate: event.endDate,
      );

      emit(
        CalendarLoaded(
          events: events,
          startDate: event.endDate,
          endDate: event.endDate,
        ),
      );
    } catch (e) {
      emit(CalendarError('Failed to update end date: $e'));
    }
  }
}
