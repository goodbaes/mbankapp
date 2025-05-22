import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbankapp/app/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:mbankapp/app/calendar/presentation/bloc/calendar_state.dart';
import 'package:mbankapp/app/calendar/presentation/widgets/calendar/calendar.dart';
import 'package:mbankapp/app/calendar/presentation/widgets/events/event_item.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar Events'),
      ),
      body: Column(
        children: [
          const CalendarEventWidget(),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<CalendarBloc, CalendarState>(
              builder: (context, state) {
                if (state is CalendarInitial) {
                  return const Center(
                    child: Text(
                      'Select a 7-day date range or more, to see events.',
                    ),
                  );
                } else if (state is CalendarLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CalendarLoaded) {
                  if (state.events.isEmpty) {
                    return const Center(
                      child: Text('No events found for this period.'),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.events.length,
                    itemBuilder: (context, index) {
                      final event = state.events[index];
                      return EventListItem(event: event);
                    },
                  );
                } else if (state is CalendarError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Error: ${state.message}',
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
