import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/users/presentation/view/users_screen/users_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Users App',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const UsersScreen(),
      ),
    );
  }
}
