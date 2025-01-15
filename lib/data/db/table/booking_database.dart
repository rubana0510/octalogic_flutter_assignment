
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/foundation.dart' as foundation;

import '../../daos/booking_dao.dart';
import 'booking.dart';
part 'booking_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [BookingTable], daos: [BookingDao])
class DbClient extends _$DbClient {
  DbClient() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) {
      return m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      foundation.debugPrint('MigrationStrategy: onUpgrade: from: $from: to: $to');

      if (from <= 1) {
        // await m.addColumn(userEntity, userEntity.fieldName);
      }
    },
  );
}