import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../widget/button_widget.dart';
import '../../widget/error_container.dart';
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
    final model = Provider.of<VehicleChangeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicle Booking"),
        centerTitle: true,
      ),
      body: Consumer<VehicleChangeNotifier>(builder: (context, model, child) {
        if (model.isbookingLoading ) {
          return const Center(child: CircularProgressIndicator());
        }
        if (model.bookingfailure != null) {
          return Center(
            child: ErrorContainer(
                text: model.bookingfailure!, onPressed: model.fetchBookingDates),
          );
        }
        return Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                width: 300,
                child: DateRangePickerWidget(
                  theme: const CalendarTheme(
                    selectedColor: Colors.blue,
                    dayNameTextStyle:
                        TextStyle(color: Colors.black45, fontSize: 10),
                    inRangeColor: Color(0xFFD9EDFA),
                    inRangeTextStyle: TextStyle(color: Colors.blue),
                    selectedTextStyle: TextStyle(color: Colors.white),
                    todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                    defaultTextStyle:
                        TextStyle(color: Colors.black, fontSize: 12),
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
              if (model.dateError != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    model.dateError!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
            ],
          ),
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GradientElevatedButton(
          text: "Submit",
          isSubmitting: model.isSubmitting,
          onPressed: () async {
            final model = context.read<VehicleChangeNotifier>();

            bool isSuccess =  model.onSubmitClick();
            if (isSuccess) {
              final data = await model.fetchDatabaseData();

              if (data == null) {
                return;
              }
              if (!mounted) {
                return;
              }
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Center(child: Text('Details Submitted')),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("First Name: ${data.firstname}"),
                        Text("Last Name: ${data.lastName}"),
                        Text("Wheels: ${data.wheels} Wheeler"),
                        Text(
                          "Start Date: ${data.startDate != null ? DateFormat('yyyy-MM-dd').format(data.startDate!) : 'N/A'}\n"
                          "End Date: ${data.endDate != null ? DateFormat('yyyy-MM-dd').format(data.endDate!) : 'N/A'}",
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);

                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/',
                            (route) => false,
                          );
                          model.resetSubmissionStatus();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(model.errorMessage ?? "Submission failed.")),
              );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
