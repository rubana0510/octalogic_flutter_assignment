import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle/vehicle_booking_screen.dart';
import 'package:provider/provider.dart';

import '../../widget/button_widget.dart';
import '../../widget/error_container.dart';
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
      body: Consumer<VehicleChangeNotifier>(builder: (context, model, child) {
        if (model.isdetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (model.failure != null) {
          return Center(
            child: ErrorContainer(
                text: model.failure!, onPressed: model.fetchVehicleSpecificModel),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: model.vehicleDetails!.image.publicUrl),
            const SizedBox(
              height: 10,
            ),
            Text(
              model.vehicleDetails!.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GradientElevatedButton(
          text: "Next",
          onPressed: () {
            Navigator.of(context).pushNamed(VehicleBookingScreen.routeName);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
