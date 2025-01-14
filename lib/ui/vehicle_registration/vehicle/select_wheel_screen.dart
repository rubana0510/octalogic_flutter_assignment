import 'package:flutter/material.dart';
import 'package:octalogic_test/ui/vehicle_registration/vehicle_change_notifier.dart';
import 'package:provider/provider.dart';

import '../../widget/button_widget.dart';

class SelectWheelScreen extends StatefulWidget {
  static const String routeName = 'select-wheel';

  const SelectWheelScreen({super.key});

  @override
  State<SelectWheelScreen> createState() => _SelectWheelScreenState();
}

class _SelectWheelScreenState extends State<SelectWheelScreen> {
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
              itemCount: model.wheelList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RadioListTile<int>(
                  title: Text("${model.wheelList[index]} wheeler"),
                  value: model.wheelList[index],
                  groupValue: model.selectedWheelOption,
                  onChanged: (value) {
                    model.onWheelSelected(value!);
                  },
                );
              },
            ),
            if (model.wheelError != null)
              Text(
                model.wheelError!,
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
            if (!model.onNextWheelPage()) {}
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
