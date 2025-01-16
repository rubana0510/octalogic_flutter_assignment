import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octalogic_test/route/route_generator.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle/initial_screen.dart';
import 'package:octalogic_test/values/colors.dart';
import 'package:provider/provider.dart';

import 'app_model.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) {
        final textTheme = GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
         // navigatorKey: navigatorKey,
         onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
         initialRoute: InitialScreen.routeName,
          // theme: ThemeData(
          //   primarySwatch: AppColor.PRIMARY_SWATCH,
          //   hintColor: AppColor.TEXT_HINT_COLOR,
          //   splashColor: AppColor.SPLASH_RIPPLE_COLOR.withOpacity(0.2),
          //   highlightColor: AppColor.SPLASH_RIPPLE_COLOR.withOpacity(0.2),
          //   brightness: Brightness.light,
          //   iconTheme: IconThemeData(color: AppColor.ICON),
          //   textTheme: textTheme,
          // ),
        );
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.inactive) {
    } else if (state == AppLifecycleState.paused) {}
  }
}
