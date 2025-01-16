import 'package:drift/drift.dart';
import 'package:octalogic_test/data/db/table/booking.dart';

import '../db/table/booking_database.dart';

part 'booking_dao.g.dart';

@DriftAccessor(tables: [BookingTable])
class BookingDao extends DatabaseAccessor<DbClient> with _$BookingDaoMixin {
  BookingDao(DbClient db) : super(db);

  void initRow() {
    into(bookingTable).insert(const BookingTableCompanion(id: Value(1)),
        mode: InsertMode.insertOrReplace);
  }

  void insertName(int id, String firstName, String lastName) {
    (update(bookingTable)..where((tbl) => tbl.id.equals(id))).write(
        BookingTableCompanion(
            firstname: Value(firstName), lastName: Value(lastName)));
  }

  void insertWheelNo(int id, int wheel) {
    (update(bookingTable)..where((tbl) => tbl.id.equals(id)))
        .write(BookingTableCompanion(wheels: Value(wheel)));
  }

  void insertVehicleType(int id, String vehicleType) {
    (update(bookingTable)..where((tbl) => tbl.id.equals(id)))
        .write(BookingTableCompanion(vehicleType: Value(vehicleType)));
  }

  void insertBookingDates(int id, DateTime startDate, DateTime endDate) {
    (update(bookingTable)..where((tbl) => tbl.id.equals(id))).write(
        BookingTableCompanion(
            startDate: Value(startDate), endDate: Value(endDate)));
  }

  Stream<List<BookingTableData>> watch() {
    return select(bookingTable).watch();
  }

  Future<BookingTableData?> getRow(int id) {
    return (select(bookingTable)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  void clearData(int id) {
    (update(bookingTable)..where((tbl) => tbl.id.equals(id)))
        .write(const BookingTableCompanion(
      vehicleType: Value(null),
      wheels: Value(null),
      firstname: Value(null),
      lastName: Value(null),
      startDate: Value(null),
      endDate: Value(null),
    ));
  }
}
