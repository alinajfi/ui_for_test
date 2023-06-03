import 'package:flutter/material.dart';
import 'package:upwork_test/routes/route_names.dart';
import 'package:upwork_test/views/screens/home_screen.dart';
import 'package:upwork_test/views/screens/nearyou_screen.dart';

import '../views/screens/location_screen.dart';
import '../views/screens/schedule_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case RouteNames.scheduleSceen:
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      case RouteNames.locationScreen:
        return MaterialPageRoute(builder: (_) => const LocationScreen());
      case RouteNames.nearyouScreen:
        return MaterialPageRoute(builder: (_) => const NearyouScreen());
      default:
        return null;
    }
  }
}
