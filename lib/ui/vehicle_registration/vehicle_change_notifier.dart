import 'package:flutter/cupertino.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:octalogic_test/data/network/dto/booking_date_dto.dart';
import 'package:octalogic_test/data/network/dto/vehicle_detail_dto.dart';
import 'package:octalogic_test/data/network/dto/vehicle_type_dto.dart';
import 'package:octalogic_test/repository/vehicle/vehicle_repository.dart';
import 'package:octalogic_test/repository/vehicle/vehicle_repository_impl.dart';

import '../../data/db/table/booking_database.dart';

class VehicleChangeNotifier extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isdetailsLoading = false;

  bool get isdetailsLoading => _isdetailsLoading;

  bool _isbookingLoading = false;

  bool get isbookingLoading => _isbookingLoading;

  String? _failure;

  String? get failure => _failure;

  String? _detailfailure;

  String? get detailfailure => _detailfailure;

  String? _bookingfailure;

  String? get bookingfailure => _bookingfailure;

  List<VehicleData> _list = [];

  List<VehicleData> get list => _list;

  List<Booking> _bookinglist = [];

  List<Booking> get bookinglist => _bookinglist;

  Details? vehicleDetails;

  List<int> _wheelList = [];

  List<int> get wheelList => _wheelList;

  List<Vehicle> _vehicleTypeList = [];

  List<Vehicle> get vehicleTypeList => _vehicleTypeList;

  bool _isSubmitting = false;

  bool get isSubmitting => _isSubmitting;

  bool _isSubmitted = false;

  bool get isSubmitted => _isSubmitted;

  VehicleRepository _repository = VehicleRepositoryImpl();

  String? firstNameError;
  String? lastNameError;
  String? wheelError;
  String? vehicleTypeError;
  String? dateError;
  String? errorMessage;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  int? selectedWheelOption;

  Vehicle? selectedVehicle;

  DateRange? selectedDateRange;

  List<DateTime> _disabledDates = [];

  List<DateTime> get disabledDates =>
      _disabledDates; // Getter for the disabled dates

  bool _isDatabaseLoading = false;

  bool get isDatabaseLoading => _isLoading;

  String? _databaseError;

  String? get error => _databaseError;

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

  VehicleChangeNotifier() {
    _repository.watch().listen((event) {
      event.forEach((element) {
        debugPrint("DATABASE:${element.toString()}");
      });
    });
  }

  Future<BookingTableData?> fetchDatabaseData() async {
    return await _repository.getBookingById(1);
  }

  void onWheelSelected(int value) {
    selectedWheelOption = value;
    wheelError = null;

    notifyListeners();
  }

  void saveSelectedDate(DateRange saved) {
    selectedDateRange = saved;

    notifyListeners();
  }

  void addVehicleTypeList() {
    _vehicleTypeList.clear();
    _vehicleTypeList = _list
        .where((vehicle) => vehicle.wheels == selectedWheelOption)
        .map((vehicle) => vehicle.vehicles!)
        .expand((element) => element)
        .toList();

    notifyListeners();
  }

  bool onNextWheelPage() {
    if (selectedWheelOption == null) {
      wheelError = "Please Select One of the Options";
      notifyListeners();
      return false;
    }
    addVehicleTypeList();
    _repository.saveWheel(selectedWheelOption!);
    return true;
  }

  bool onSubmitClick() {
    if (selectedDateRange == null) {
      dateError = "Please Select Dates";
      notifyListeners();
      return false;
    }

    dateError = null;
    notifyListeners();

    _repository.saveDateRange(selectedDateRange!);
    submitVehicleDetails();

    _isSubmitted = true;
    notifyListeners();
    return true;
  }

  void resetSubmissionStatus() {
    _isSubmitted = false;
    selectedVehicle = null;
    selectedDateRange = null;
    selectedWheelOption = null;
    firstNameController.clear();
    lastNameController.clear();
    _repository.clearDatabase();
    notifyListeners();
  }

  bool onNextVehicleTypePage() {
    if (selectedVehicle == null) {
      vehicleTypeError = "Please Select One of the Options";
      notifyListeners();
      return false;
    }
    _repository.saveVehicleType(selectedVehicle!.vehicleTypeId);
    return true;
  }

  void saveSelectedVehicleType(Vehicle selectedVehicleValue) {
    try {
      selectedVehicle = selectedVehicleValue;

      vehicleTypeError = null;
      notifyListeners();
    } catch (e) {
      vehicleTypeError = "No vehicle found for the selected type";
      selectedVehicle = null;
      print(e);
      notifyListeners();
    }
  }

  void saveSelectedDateRange() {}

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
        _list.clear();
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

  void fetchVehicleSpecificModel() async {
    String? vehicleId = selectedVehicle?.id;

    if (vehicleId == null) {
      return;
    }

    try {
      if (_isdetailsLoading) {
        return;
      }

      _failure = null;
      _isdetailsLoading = true;
      notifyListeners();

      final result = await _repository.fetchVehicleDetails(vehicleId);

      vehicleDetails = result;
    } catch (e, stack) {
      _failure = "Some Error Occurred";
      debugPrintStack(stackTrace: stack);
    } finally {
      _isdetailsLoading = false;
      notifyListeners();
    }
  }

  void fetchBookingDates() async {
    String? vehicleId = selectedVehicle?.id;

    if (vehicleId == null) {
      return;
    }

    if (_isbookingLoading) {
      return;
    }
    _bookingfailure = null;
    _isbookingLoading = true;
    notifyListeners();
    try {
      final result = await _repository.fetchVehicleBooking(vehicleId);

      if (result.isEmpty) {
        _bookingfailure = "Some Error Occurred";
      } else {
        _bookinglist.clear();
        _bookinglist.addAll(result);
        debugPrint("BookingList:${_bookinglist[0]}");

        _disabledDates.clear();
        for (var booking in _bookinglist) {
          for (var date = booking.startDate;
              date.isBefore(booking.endDate) ||
                  date.isAtSameMomentAs(booking.endDate);
              date = date.add(Duration(days: 1))) {
            _disabledDates.add(date);
          }
        }

        debugPrint("Disabled Dates: $_disabledDates");
      }
    } catch (e, stack) {
      _bookingfailure = "Some Error Occurred";
      _bookinglist.clear();
    } finally {
      _isbookingLoading = false;
      notifyListeners();
    }
  }

  void resetErrors() {
    errorMessage = null;
    notifyListeners();
  }

  Future<bool> submitVehicleDetails() async {
    resetErrors();

    _isSubmitting = true;
    _isSubmitted = false;
    notifyListeners();

    try {
      final data = {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "wheel": selectedWheelOption,
        "vehicleType": selectedVehicle?.vehicleTypeId,
        "startDate": selectedDateRange?.start,
        "endDate": selectedDateRange?.end,
      };

      await Future.delayed(Duration(seconds: 1));

      _isSubmitting = false;
      _isSubmitted = true;
      errorMessage = null;
      notifyListeners();
      return true;
    } catch (e) {
      _isSubmitting = false;
      _isSubmitted = false;
      errorMessage = "Submission failed. Please try again.";
      notifyListeners();

      return false;
    }
  }
}
