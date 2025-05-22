import 'package:mbankapp/app/calendar/data/datasource/api_datasource.dart';
import 'package:mbankapp/app/calendar/data/repository/event_repository_impl.dart';
import 'package:mbankapp/app/calendar/domain/repository/event_repository.dart';
import 'package:mbankapp/app/calendar/domain/usecases/fetch_events.dart';
import 'package:mbankapp/core/consts/url.dart';

EventRepository kEventRepo = EventRepositoryImpl(
  ApiDatasource(baseUrl: Url.baseUrl),
);

FetchEventsUseCase kFetchUseCase = FetchEventsUseCase(
  kEventRepo,
);
