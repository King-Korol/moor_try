import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor_reso_coder_i_try/data/moor_database.dart';
import 'package:moor_reso_coder_i_try/models/task_with_tag_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeSacreenState with _$HomeSacreenState {
  const factory HomeSacreenState({
    @Default([]) List<TaskWithTag> taskList,
    @Default([]) List<Tag> tagList,
  }) = _HomeSacreenState;
}
