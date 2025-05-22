import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbankapp/app/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:mbankapp/app/calendar/presentation/screens/calendar_screen.dart';
import 'package:mbankapp/di/di.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc(
        kFetchUseCase,
      ),
      child: const CalendarScreen(),
    );
  }
}
