import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor_reso_coder_i_try/dao/tag_dao.dart';
import 'package:moor_reso_coder_i_try/dao/task_dao.dart';
import 'package:moor_reso_coder_i_try/models/tags_model.dart';
import 'package:moor_reso_coder_i_try/models/tasks_model.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [Tasks, Tags], daos: [TaskDao, TagDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration => MigrationStrategy(
  // onUpgrade: (migrator, from, to) async {
  //   if (from == 1) {
  //     await migrator.addColumn(tasks, tasks.tagName);
  //     await migrator.createTable(tags);
  //   }
  // },
  // beforeOpen: (db, details) async {
  //   await db.customStatement('PRAGMA foreign_keys = ON');
  // },
  // );
}

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});
