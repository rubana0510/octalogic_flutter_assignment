
import 'package:octalogic_test/data/network/dto/vehicle_type_dto.dart';

import '../base_repository.dart';

abstract class VehicleRepository extends BaseRepository {

  Future<List<VehicleData>> fetchVehicleType();

  void saveUserDetails(String firstName, String lastName);

}
