import 'package:mbankapp/app/app.dart';
import 'package:mbankapp/app/home/presentation/home_screen.dart';
import 'package:mbankapp/bootstrap.dart';

void main() {
  bootstrap(
    () => const App(
      home: HomeScreen(),
    ),
  );
}
