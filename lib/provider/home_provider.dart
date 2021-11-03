import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor_reso_coder_i_try/data/moor_database.dart';
import 'package:moor_reso_coder_i_try/provider/home_state.dart';
import 'package:moor_reso_coder_i_try/repository/home_repository.dart';

class HomeScreenNotifier extends StateNotifier<HomeSacreenState> {
  late HomeScreenRepository _repository;
  late StreamSubscription tasksStreamSubsription;
  late StreamSubscription tagsStreamSubsription;
  HomeScreenNotifier(
    this._repository,
  ) : super(const HomeSacreenState()) {
    tasksStreamSubsription = _repository.watchAllTasks().listen((taskList) {
      state = state.copyWith(taskList: taskList);
    });
    tagsStreamSubsription = _repository.watchTags().listen((tagList) {
      state = state.copyWith(tagList: tagList);
    });
  }

  @override
  void dispose() {
    tasksStreamSubsription.cancel();
    tagsStreamSubsription.cancel();
    super.dispose();
  }

  Future insertTask(Insertable<Task> task) {
    log('insertTask $task');
    return _repository.insertTask(task);
  }

  Future updateTask(Insertable<Task> task) {
    log('updateTask $task');
    return _repository.updateTask(task);
  }

  Future deleteTask(Insertable<Task> task) {
    log('deleteTask $task');
    return _repository.deleteTask(task);
  }

  Future insertTag(Insertable<Tag> tag) {
    log('insertTag $tag');
    return _repository.insertTag(tag);
  }
}

final homeScreenProvider =
    StateNotifierProvider.autoDispose<HomeScreenNotifier, HomeSacreenState>(
        (ref) {
  final repository = ref.watch(homeScreenRepositoryProvider);
  return HomeScreenNotifier(repository);
});
