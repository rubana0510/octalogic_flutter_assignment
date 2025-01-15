import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:provider/provider.dart';

import '../../widget/button_widget.dart';
import '../vehicle_change_notifier.dart';

class VehicleBookingScreen extends StatefulWidget {
  static const String routeName = 'vehicle-booking';

  const VehicleBookingScreen({super.key});

  @override
  State<VehicleBookingScreen> createState() => _VehicleBookingScreenState();
}

class _VehicleBookingScreenState extends State<VehicleBookingScreen> {
  @override
  void initState() {
    super.initState();
    final model = Provider.of<VehicleChangeNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model.fetchBookingDates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicle Details"),
        centerTitle: true,
      ),
      body: Consumer<VehicleChangeNotifier>(builder: (context, model, child) {
        if (model.isLoading || model.bookinglist == null)
          return const Center(child: CircularProgressIndicator());
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 300,
            child: DateRangePickerWidget(
              theme: const CalendarTheme(
                selectedColor: Colors.blue,
                dayNameTextStyle: TextStyle(color: Colors.black45, fontSize: 10),
                inRangeColor: Color(0xFFD9EDFA),
                inRangeTextStyle: TextStyle(color: Colors.blue),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                defaultTextStyle: TextStyle(color: Colors.black, fontSize: 12),
                radius: 10,
                tileSize: 40,
                disabledTextStyle: TextStyle(color: Colors.grey),
              ),
              doubleMonth: false,
              height: 400,

              maximumDateRangeLength: 10,
              minimumDateRangeLength: 3,
              initialDateRange: null,
              disabledDates: model.disabledDates,
              onDateRangeChanged: (newDateRange) {
                model.saveSelectedDate(newDateRange!);
                print("New date range selected: $newDateRange");
              },
            ),
          ),
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GradientElevatedButton(
          text: "Submit",
          onPressed: () {
            final model = context.read<VehicleChangeNotifier>();
            model.onSubmitClick();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
