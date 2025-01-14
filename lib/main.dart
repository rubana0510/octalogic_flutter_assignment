import 'package:flutter/material.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle_change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'app.dart';
import 'app_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>.value(
      value: AppModel(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: ChangeNotifierProvider<VehicleChangeNotifier>.value(
          value: VehicleChangeNotifier(),
          child: App(),
        ),
      ),
    );
  }
}
