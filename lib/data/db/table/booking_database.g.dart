// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_database.dart';

// ignore_for_file: type=lint
class $BookingTableTable extends BookingTable
    with TableInfo<$BookingTableTable, BookingTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _firstnameMeta =
      const VerificationMeta('firstname');
  @override
  late final GeneratedColumn<String> firstname = GeneratedColumn<String>(
      'firstname', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _wheelsMeta = const VerificationMeta('wheels');
  @override
  late final GeneratedColumn<int> wheels = GeneratedColumn<int>(
      'wheels', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _vehicleTypeMeta =
      const VerificationMeta('vehicleType');
  @override
  late final GeneratedColumn<String> vehicleType = GeneratedColumn<String>(
      'vehicle_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, firstname, lastName, wheels, vehicleType, startDate, endDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'booking_table';
  @override
  VerificationContext validateIntegrity(Insertable<BookingTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('firstname')) {
      context.handle(_firstnameMeta,
          firstname.isAcceptableOrUnknown(data['firstname']!, _firstnameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('wheels')) {
      context.handle(_wheelsMeta,
          wheels.isAcceptableOrUnknown(data['wheels']!, _wheelsMeta));
    }
    if (data.containsKey('vehicle_type')) {
      context.handle(
          _vehicleTypeMeta,
          vehicleType.isAcceptableOrUnknown(
              data['vehicle_type']!, _vehicleTypeMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookingTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookingTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}firstname']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      wheels: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wheels']),
      vehicleType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vehicle_type']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
    );
  }

  @override
  $BookingTableTable createAlias(String alias) {
    return $BookingTableTable(attachedDatabase, alias);
  }
}

class BookingTableData extends DataClass
    implements Insertable<BookingTableData> {
  final int id;
  final String? firstname;
  final String? lastName;
  final int? wheels;
  final String? vehicleType;
  final DateTime? startDate;
  final DateTime? endDate;
  const BookingTableData(
      {required this.id,
      this.firstname,
      this.lastName,
      this.wheels,
      this.vehicleType,
      this.startDate,
      this.endDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || firstname != null) {
      map['firstname'] = Variable<String>(firstname);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || wheels != null) {
      map['wheels'] = Variable<int>(wheels);
    }
    if (!nullToAbsent || vehicleType != null) {
      map['vehicle_type'] = Variable<String>(vehicleType);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    return map;
  }

  BookingTableCompanion toCompanion(bool nullToAbsent) {
    return BookingTableCompanion(
      id: Value(id),
      firstname: firstname == null && nullToAbsent
          ? const Value.absent()
          : Value(firstname),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      wheels:
          wheels == null && nullToAbsent ? const Value.absent() : Value(wheels),
      vehicleType: vehicleType == null && nullToAbsent
          ? const Value.absent()
          : Value(vehicleType),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
    );
  }

  factory BookingTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookingTableData(
      id: serializer.fromJson<int>(json['id']),
      firstname: serializer.fromJson<String?>(json['firstname']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      wheels: serializer.fromJson<int?>(json['wheels']),
      vehicleType: serializer.fromJson<String?>(json['vehicleType']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstname': serializer.toJson<String?>(firstname),
      'lastName': serializer.toJson<String?>(lastName),
      'wheels': serializer.toJson<int?>(wheels),
      'vehicleType': serializer.toJson<String?>(vehicleType),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
    };
  }

  BookingTableData copyWith(
          {int? id,
          Value<String?> firstname = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<int?> wheels = const Value.absent(),
          Value<String?> vehicleType = const Value.absent(),
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent()}) =>
      BookingTableData(
        id: id ?? this.id,
        firstname: firstname.present ? firstname.value : this.firstname,
        lastName: lastName.present ? lastName.value : this.lastName,
        wheels: wheels.present ? wheels.value : this.wheels,
        vehicleType: vehicleType.present ? vehicleType.value : this.vehicleType,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
      );
  BookingTableData copyWithCompanion(BookingTableCompanion data) {
    return BookingTableData(
      id: data.id.present ? data.id.value : this.id,
      firstname: data.firstname.present ? data.firstname.value : this.firstname,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      wheels: data.wheels.present ? data.wheels.value : this.wheels,
      vehicleType:
          data.vehicleType.present ? data.vehicleType.value : this.vehicleType,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookingTableData(')
          ..write('id: $id, ')
          ..write('firstname: $firstname, ')
          ..write('lastName: $lastName, ')
          ..write('wheels: $wheels, ')
          ..write('vehicleType: $vehicleType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, firstname, lastName, wheels, vehicleType, startDate, endDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookingTableData &&
          other.id == this.id &&
          other.firstname == this.firstname &&
          other.lastName == this.lastName &&
          other.wheels == this.wheels &&
          other.vehicleType == this.vehicleType &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class BookingTableCompanion extends UpdateCompanion<BookingTableData> {
  final Value<int> id;
  final Value<String?> firstname;
  final Value<String?> lastName;
  final Value<int?> wheels;
  final Value<String?> vehicleType;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  const BookingTableCompanion({
    this.id = const Value.absent(),
    this.firstname = const Value.absent(),
    this.lastName = const Value.absent(),
    this.wheels = const Value.absent(),
    this.vehicleType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  BookingTableCompanion.insert({
    this.id = const Value.absent(),
    this.firstname = const Value.absent(),
    this.lastName = const Value.absent(),
    this.wheels = const Value.absent(),
    this.vehicleType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  static Insertable<BookingTableData> custom({
    Expression<int>? id,
    Expression<String>? firstname,
    Expression<String>? lastName,
    Expression<int>? wheels,
    Expression<String>? vehicleType,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstname != null) 'firstname': firstname,
      if (lastName != null) 'last_name': lastName,
      if (wheels != null) 'wheels': wheels,
      if (vehicleType != null) 'vehicle_type': vehicleType,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  BookingTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? firstname,
      Value<String?>? lastName,
      Value<int?>? wheels,
      Value<String?>? vehicleType,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate}) {
    return BookingTableCompanion(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastName: lastName ?? this.lastName,
      wheels: wheels ?? this.wheels,
      vehicleType: vehicleType ?? this.vehicleType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstname.present) {
      map['firstname'] = Variable<String>(firstname.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (wheels.present) {
      map['wheels'] = Variable<int>(wheels.value);
    }
    if (vehicleType.present) {
      map['vehicle_type'] = Variable<String>(vehicleType.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookingTableCompanion(')
          ..write('id: $id, ')
          ..write('firstname: $firstname, ')
          ..write('lastName: $lastName, ')
          ..write('wheels: $wheels, ')
          ..write('vehicleType: $vehicleType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$DbClient extends GeneratedDatabase {
  _$DbClient(QueryExecutor e) : super(e);
  $DbClientManager get managers => $DbClientManager(this);
  late final $BookingTableTable bookingTable = $BookingTableTable(this);
  late final BookingDao bookingDao = BookingDao(this as DbClient);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bookingTable];
}

typedef $$BookingTableTableCreateCompanionBuilder = BookingTableCompanion
    Function({
  Value<int> id,
  Value<String?> firstname,
  Value<String?> lastName,
  Value<int?> wheels,
  Value<String?> vehicleType,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
});
typedef $$BookingTableTableUpdateCompanionBuilder = BookingTableCompanion
    Function({
  Value<int> id,
  Value<String?> firstname,
  Value<String?> lastName,
  Value<int?> wheels,
  Value<String?> vehicleType,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
});

class $$BookingTableTableTableManager extends RootTableManager<
    _$DbClient,
    $BookingTableTable,
    BookingTableData,
    $$BookingTableTableFilterComposer,
    $$BookingTableTableOrderingComposer,
    $$BookingTableTableCreateCompanionBuilder,
    $$BookingTableTableUpdateCompanionBuilder> {
  $$BookingTableTableTableManager(_$DbClient db, $BookingTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BookingTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BookingTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> firstname = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<int?> wheels = const Value.absent(),
            Value<String?> vehicleType = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
          }) =>
              BookingTableCompanion(
            id: id,
            firstname: firstname,
            lastName: lastName,
            wheels: wheels,
            vehicleType: vehicleType,
            startDate: startDate,
            endDate: endDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> firstname = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<int?> wheels = const Value.absent(),
            Value<String?> vehicleType = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
          }) =>
              BookingTableCompanion.insert(
            id: id,
            firstname: firstname,
            lastName: lastName,
            wheels: wheels,
            vehicleType: vehicleType,
            startDate: startDate,
            endDate: endDate,
          ),
        ));
}

class $$BookingTableTableFilterComposer
    extends FilterComposer<_$DbClient, $BookingTableTable> {
  $$BookingTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get firstname => $state.composableBuilder(
      column: $state.table.firstname,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get wheels => $state.composableBuilder(
      column: $state.table.wheels,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get vehicleType => $state.composableBuilder(
      column: $state.table.vehicleType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BookingTableTableOrderingComposer
    extends OrderingComposer<_$DbClient, $BookingTableTable> {
  $$BookingTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get firstname => $state.composableBuilder(
      column: $state.table.firstname,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get wheels => $state.composableBuilder(
      column: $state.table.wheels,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get vehicleType => $state.composableBuilder(
      column: $state.table.vehicleType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $DbClientManager {
  final _$DbClient _db;
  $DbClientManager(this._db);
  $$BookingTableTableTableManager get bookingTable =>
      $$BookingTableTableTableManager(_db, _db.bookingTable);
}
