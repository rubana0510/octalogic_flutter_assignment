import 'package:flutter/material.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle/select_wheel_screen.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle_change_notifier.dart';
import 'package:octalogic_test/values/colors.dart';
import 'package:provider/provider.dart';

import '../../widget/button_widget.dart';

class InitialScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Vehicle Registration'),
        ),
      ),
      body: Consumer<VehicleChangeNotifier>(builder: (context, model, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First TextField with custom border color
              TextField(
                controller: model.firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: const OutlineInputBorder(),
                  errorText: model.firstNameError,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.PURPLE, width: 1.5),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Second TextField with custom border color
              TextField(
                controller: model.lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  errorText: model.lastNameError,
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.PURPLE, width: 1.5),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GradientElevatedButton(
                text: "Next",
                onPressed: () {
                  final result = model.validateFirstLastName();
                  if (result) {
                    Navigator.of(context)
                        .pushNamed(SelectWheelScreen.routeName);
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
