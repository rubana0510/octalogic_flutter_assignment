import 'package:flutter/material.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle/select_wheel_screen.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle_change_notifier.dart';

import '../ui/vehicle_registration/vehicle/initial_screen.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case InitialScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => InitialScreen(),
        );
      case SelectWheelScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SelectWheelScreen(),
        );
      default:
        return buildErrorRoute();
    }
  }

  static Route<dynamic> buildErrorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Arggg!'),
          ),
          body: Center(
            child: Text('Oh No! You should not be here! '),
          ),
        );
      },
    );
  }
}
