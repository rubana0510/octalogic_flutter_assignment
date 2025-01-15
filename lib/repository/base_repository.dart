import 'package:get_it/get_it.dart';

import '../data/db/table/booking_database.dart';
import '../data/network/api_client.dart';

abstract class BaseRepository {
  final ApiClient apiClient = ApiClient();
  final DbClient dbClient = GetIt.I.get<DbClient>();

}

