import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle/vehicle_booking_screen.dart';
import 'package:provider/provider.dart';

import '../../widget/button_widget.dart';
import '../vehicle_change_notifier.dart';

class VehicleDetailsScreen extends StatefulWidget {
  static const String routeName = 'vehicle-detail';

  const VehicleDetailsScreen({super.key});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final model = Provider.of<VehicleChangeNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model.fetchVehicleSpecificModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicle Details"),
        centerTitle: true,
      ),
      body:
      Consumer<VehicleChangeNotifier>(builder: (context, model, child) {
        if (model.isLoading||model.vehicleDetails==null)
          return const Center(child: CircularProgressIndicator());
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: model.vehicleDetails!.image.publicUrl),
            Text(model.vehicleDetails!.name)
          ],
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GradientElevatedButton(
          text: "Submit",
          onPressed: () {
             Navigator.of(context).pushNamed(VehicleBookingScreen.routeName);

          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
