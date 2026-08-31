import 'package:flowee_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FloweeApp());
}

class FloweeApp extends StatelessWidget {
  const FloweeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flower app",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: Placeholder(),
    );
  }
}