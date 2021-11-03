import 'dart:developer';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor_reso_coder_i_try/data/moor_database.dart';
import 'package:moor_reso_coder_i_try/models/task_with_tag_model.dart';
import 'package:moor_reso_coder_i_try/models/tags_model.dart';
import 'package:moor_reso_coder_i_try/models/tasks_model.dart';

part 'task_dao.g.dart';

@UseDao(
  tables: [Tasks, Tags],
)
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  TaskDao(this.db) : super(db);

  Stream<List<TaskWithTag>> watchAllTasks() {
    log('TaskDao watchAllTasks');
    return (select(tasks)
          ..orderBy(
            [
              (t) =>
                  OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
              (t) => OrderingTerm(expression: t.name),
            ],
          ))
        .join(
          [
            leftOuterJoin(
              tags,
              tags.id.equalsExp(tasks.tagId),
            ),
          ],
        )
        .watch()
        .map((rows) => rows.map(
              (row) {
                return TaskWithTag(
                  task: row.readTable(tasks),
                  tag: row.readTableOrNull(tags),
                );
              },
            ).toList());
  }

  Future insertTask(Insertable<Task> task) {
    log('TaskDao insertTask: $task');
    return into(tasks).insert(task);
  }

  Future updateTask(Insertable<Task> task) {
    log('TaskDao updateTask: $task');
    return update(tasks).replace(task);
  }

  Future deleteTask(Insertable<Task> task) {
    log('TaskDao deleteTask: $task');
    return delete(tasks).delete(task);
  }
}
