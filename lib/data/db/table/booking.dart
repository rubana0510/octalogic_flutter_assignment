import 'package:drift/drift.dart';


class BookingTable extends Table {
  IntColumn get id => integer()();

  TextColumn get firstname => text().nullable()();

  TextColumn get lastName => text().nullable()();

  IntColumn get wheels => integer().nullable()();

  TextColumn get vehicleType => text().nullable()();

  DateTimeColumn get startDate => dateTime().nullable()();

  DateTimeColumn get endDate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}