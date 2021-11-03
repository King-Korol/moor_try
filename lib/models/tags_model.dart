import 'package:moor_flutter/moor_flutter.dart';

class Tags extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 10)();
  IntColumn get color => integer().nullable()();
}
