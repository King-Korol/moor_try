import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor_reso_coder_i_try/dao/tag_dao.dart';
import 'package:moor_reso_coder_i_try/dao/task_dao.dart';
import 'package:moor_reso_coder_i_try/data/moor_database.dart';
import 'package:moor_reso_coder_i_try/models/task_with_tag_model.dart';

class HomeScreenRepository {
  late TaskDao taskDao;
  late TagDao tagDao;

  HomeScreenRepository({
    required this.taskDao,
    required this.tagDao,
  });

  Stream<List<TaskWithTag>> watchAllTasks() {
    return taskDao.watchAllTasks();
  }

  Future insertTask(Insertable<Task> task) {
    return taskDao.insertTask(task);
  }

  Future updateTask(Insertable<Task> task) {
    return taskDao.updateTask(task);
  }

  Future deleteTask(Insertable<Task> task) {
    return taskDao.deleteTask(task);
  }

  Stream<List<Tag>> watchTags() {
    return tagDao.watchTags();
  }

  Future insertTag(Insertable<Tag> tag) {
    return tagDao.insertTag(tag);
  }
}

final homeScreenRepositoryProvider = Provider(
  (ref) => HomeScreenRepository(
    taskDao: ref.watch(databaseProvider).taskDao,
    tagDao: ref.watch(databaseProvider).tagDao,
  ),
);
