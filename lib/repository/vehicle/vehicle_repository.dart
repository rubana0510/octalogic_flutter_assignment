
import 'package:flutter_date_range_picker/src/models.dart';
import 'package:octalogic_test/data/network/dto/booking_date_dto.dart';
import 'package:octalogic_test/data/network/dto/vehicle_detail_dto.dart';
import 'package:octalogic_test/data/network/dto/vehicle_type_dto.dart';

import '../../data/db/table/booking_database.dart';
import '../base_repository.dart';

abstract class VehicleRepository extends BaseRepository {

  Future<List<VehicleData>> fetchVehicleType();

  Future<Details> fetchVehicleDetails(String id);

  Future<List<Booking>> fetchVehicleBooking(String id);

  void saveUserDetails(String firstName, String lastName);

  void saveWheel(int selectedWheelOption) ;

  void saveVehicleType(String selectedVehicle);

  void saveDateRange(DateRange selectedDateRange);

  Stream<List<BookingTableData>> watch();

}
