import 'package:flutter/cupertino.dart';
import 'package:flutter_date_range_picker/src/models.dart';
import 'package:octalogic_test/data/db/table/booking_database.dart';
import 'package:octalogic_test/data/network/dto/booking_date_dto.dart';
import 'package:octalogic_test/data/network/dto/vehicle_detail_dto.dart';
import 'package:octalogic_test/data/network/dto/vehicle_type_dto.dart';
import 'package:octalogic_test/repository/vehicle/vehicle_repository.dart';

import '../../data/network/endpoints.dart';
import '../../data/network/util/base_response.dart';

class VehicleRepositoryImpl extends VehicleRepository {
  VehicleRepositoryImpl() {
    dbClient.bookingDao.initRow();
  }

  @override
  Future<List<VehicleData>> fetchVehicleType() async {
    final response = await apiClient.getVehicleTypes();

    final vehicleType = VehicleType.fromJson(response.data).data;

    return vehicleType;
  }

  @override
  void saveUserDetails(String firstName, String lastName) {
    dbClient.bookingDao.insertName(1, firstName, lastName);
    debugPrint("Saving First Name:-$firstName ,Last Name:-$lastName");
  }

  @override
  Future<Details> fetchVehicleDetails(String id) async {
    final response = await apiClient.getVehicleDetails(id);
    final vehicleDetails = Details.fromJson(response.data);
    return vehicleDetails;
  }

  @override
  Future<List<Booking>> fetchVehicleBooking(String id) async {
    final response = await apiClient.getBookingDates(id);

    final List<Booking> vehicleBookings = (response.data['data'] as List)
        .map((data) => Booking.fromJson(data))
        .toList();

    return vehicleBookings;
  }

  @override
  void saveWheel(int selectedWheelOption) {
    dbClient.bookingDao.insertWheelNo(1, selectedWheelOption);
  }

  @override
  void saveVehicleType(String selectedVehicle) {
    dbClient.bookingDao.insertVehicleType(1, selectedVehicle);
  }

  @override
  void saveDateRange(DateRange selectedDateRange) {
    dbClient.bookingDao
        .insertBookingDates(1, selectedDateRange.start, selectedDateRange.end);
  }

  @override
  Stream<List<BookingTableData>> watch() {
    return dbClient.bookingDao.watch();
  }

  @override
  Future<bool> submitVehicleDetails(Map<String, Object?> data) async {
    return true;
  }



  @override
  void clearDatabase() {
    dbClient.bookingDao.clearData(1);
  }

  @override
  Future<BookingTableData?> getBookingById(int id) {
    return dbClient.bookingDao.getRow(id);
  }
}
