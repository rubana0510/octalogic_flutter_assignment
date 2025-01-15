import 'package:flutter/material.dart';
import 'package:octalogic_test/data/network/dto/vehicle_detail_dto.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle/select_vehicle_type.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle/select_wheel_screen.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle/vehicle_booking_screen.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle_change_notifier.dart';

import '../ui/vehicle_registration/vehicle/initial_screen.dart';
import 'package:provider/provider.dart';

import '../ui/vehicle_registration/vehicle/vehicle_details_screen.dart';

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
      case SelectVehicleType.routeName:
        return MaterialPageRoute(
          builder: (_) => SelectVehicleType(),
        );
      case VehicleDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => VehicleDetailsScreen(),
        );
      case VehicleBookingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => VehicleBookingScreen(),
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
