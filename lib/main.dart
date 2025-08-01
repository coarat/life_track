import 'package:flutter/material.dart';
import './routes/app_router.dart';

void main() => startApp();

Future<void> startApp() async {
  runApp(
    MaterialApp.router(
      routerConfig: router,
      title: 'Life Track',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
    ),
  );
}
