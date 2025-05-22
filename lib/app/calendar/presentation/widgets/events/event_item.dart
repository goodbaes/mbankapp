import 'package:flutter/material.dart';
import 'package:mbankapp/app/calendar/domain/entities/event.dart';

class EventListItem extends StatelessWidget {
  const EventListItem({required this.event, super.key});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(event.eventName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.description),
            const SizedBox(height: 4),
            Text(
              'Date: ${event.date}',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
