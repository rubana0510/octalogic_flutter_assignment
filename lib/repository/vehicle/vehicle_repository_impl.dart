import 'package:flutter/cupertino.dart';
import 'package:octalogic_test/data/network/dto/vehicle_type_dto.dart';
import 'package:octalogic_test/repository/vehicle/vehicle_repository.dart';

class VehicleRepositoryImpl extends VehicleRepository {
  @override
  Future<List<VehicleData>> fetchVehicleType() async {
    final response = await apiClient.getVehicleTypes();

    final vehicleType = VehicleType.fromJson(response.data).data;

    return vehicleType;
  }

  @override
  void saveUserDetails(String firstName, String lastName) {
    debugPrint("Saving First Name:-$firstName ,Last Name:-$lastName");
  }
}
