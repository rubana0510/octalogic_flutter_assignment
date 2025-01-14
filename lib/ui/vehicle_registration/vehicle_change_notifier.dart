import 'package:flutter/cupertino.dart';
import 'package:octalogic_test/data/network/dto/vehicle_type_dto.dart';
import 'package:octalogic_test/repository/vehicle/vehicle_repository.dart';
import 'package:octalogic_test/repository/vehicle/vehicle_repository_impl.dart';

class VehicleChangeNotifier extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _failure;

  String? get failure => _failure;

  List<VehicleData> _list = [];

  List<VehicleData> get list => _list;

  List<int> _wheelList = [];

  List<int> get wheelList => _wheelList;

  VehicleRepository _repository = VehicleRepositoryImpl();

  String? firstNameError;
  String? lastNameError;
  String? wheelError;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  int? selectedWheelOption;

  bool validateFirstLastName() {
    firstNameError = null;
    lastNameError = null;
    if (firstNameController.text.isEmpty) {
      firstNameError = "Please Enter Your First Name";
      notifyListeners();
    } else if (lastNameController.text.isEmpty) {
      lastNameError = "Please Enter Your Last Name";
      notifyListeners();
    } else {
      _repository.saveUserDetails(
          firstNameController.text, lastNameController.text);
      firstNameError = null;
      lastNameError = null;

      return true;
    }
    return false;
  }

  void onWheelSelected(int value) {
    selectedWheelOption = value;
    wheelError=null;
    notifyListeners();
  }

  bool onNextWheelPage() {
    if (selectedWheelOption == null) {
      wheelError = "Please Select One of the Options";
      notifyListeners();
      return false;
    }
    return true;
  }

  void fetchVehicleType() async {
    if (_isLoading) {
      return;
    }

    _failure = null;
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _repository.fetchVehicleType();

      if (result.isEmpty) {
        _failure = "Some Error Occurred";
      } else {
        _list.addAll(result);
        _wheelList = result.map((e) => e.wheels!).toList();
      }
    } catch (e, stack) {
      _failure = "Some Error Occurred";
      _list.clear();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
