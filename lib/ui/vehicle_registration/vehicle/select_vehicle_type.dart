import 'package:flutter/material.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle/vehicle_details_screen.dart';
import 'package:provider/provider.dart';

import '../../widget/button_widget.dart';
import '../vehicle_change_notifier.dart';

class SelectVehicleType extends StatefulWidget {
  static const String routeName = 'select-vehicle-type';

  const SelectVehicleType({super.key});

  @override
  State<SelectVehicleType> createState() => _SelectVehicleTypeState();
}

class _SelectVehicleTypeState extends State<SelectVehicleType> {

  @override
  void initState() {
    super.initState();
    final model = Provider.of<VehicleChangeNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model.fetchVehicleType();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("No Of Wheels"),
        centerTitle: true,
      ),
      body: Consumer<VehicleChangeNotifier>(builder: (context, model, child) {
        if (model.isLoading) return const Center(child: CircularProgressIndicator());
        return Column(
          children: [
            ListView.builder(
              itemCount: model.vehicleTypeList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RadioListTile<String>(
                  title: Text(model.vehicleTypeList[index].name),
                  value: model.vehicleTypeList[index].id,
                  groupValue: model.selectedVehicle?.id,
                  onChanged: (value) {
                    model.saveSelectedVehicleType(model.vehicleTypeList[index]);
                  },
                );
              },
            ),
            if (model.vehicleTypeError != null)
              Text(
                model.vehicleTypeError!,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.red),
              )
          ],
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GradientElevatedButton(
          text: "Next",
          onPressed: () {
            final model = context.read<VehicleChangeNotifier>();
            if (model.onNextVehicleTypePage()) {
               Navigator.of(context).pushNamed(VehicleDetailsScreen.routeName);

            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }
}
