import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/decisions_service.dart';
import 'screens/home_screen.dart';

void main() => runApp(const TiebreakerApp());

class TiebreakerApp extends StatelessWidget {
  const TiebreakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DecisionsService()),
          ],
        child: MaterialApp(
        title: 'The TieBreaker',
        theme: ThemeData(colorSchemeSeed: Colors.deepPurple),
        home: const HomeScreen(),
      ),
    );
  }
}