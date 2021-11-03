// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeSacreenStateTearOff {
  const _$HomeSacreenStateTearOff();

  _HomeSacreenState call(
      {List<TaskWithTag> taskList = const [], List<Tag> tagList = const []}) {
    return _HomeSacreenState(
      taskList: taskList,
      tagList: tagList,
    );
  }
}

/// @nodoc
const $HomeSacreenState = _$HomeSacreenStateTearOff();

/// @nodoc
mixin _$HomeSacreenState {
  List<TaskWithTag> get taskList => throw _privateConstructorUsedError;
  List<Tag> get tagList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeSacreenStateCopyWith<HomeSacreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSacreenStateCopyWith<$Res> {
  factory $HomeSacreenStateCopyWith(
          HomeSacreenState value, $Res Function(HomeSacreenState) then) =
      _$HomeSacreenStateCopyWithImpl<$Res>;
  $Res call({List<TaskWithTag> taskList, List<Tag> tagList});
}

/// @nodoc
class _$HomeSacreenStateCopyWithImpl<$Res>
    implements $HomeSacreenStateCopyWith<$Res> {
  _$HomeSacreenStateCopyWithImpl(this._value, this._then);

  final HomeSacreenState _value;
  // ignore: unused_field
  final $Res Function(HomeSacreenState) _then;

  @override
  $Res call({
    Object? taskList = freezed,
    Object? tagList = freezed,
  }) {
    return _then(_value.copyWith(
      taskList: taskList == freezed
          ? _value.taskList
          : taskList // ignore: cast_nullable_to_non_nullable
              as List<TaskWithTag>,
      tagList: tagList == freezed
          ? _value.tagList
          : tagList // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
abstract class _$HomeSacreenStateCopyWith<$Res>
    implements $HomeSacreenStateCopyWith<$Res> {
  factory _$HomeSacreenStateCopyWith(
          _HomeSacreenState value, $Res Function(_HomeSacreenState) then) =
      __$HomeSacreenStateCopyWithImpl<$Res>;
  @override
  $Res call({List<TaskWithTag> taskList, List<Tag> tagList});
}

/// @nodoc
class __$HomeSacreenStateCopyWithImpl<$Res>
    extends _$HomeSacreenStateCopyWithImpl<$Res>
    implements _$HomeSacreenStateCopyWith<$Res> {
  __$HomeSacreenStateCopyWithImpl(
      _HomeSacreenState _value, $Res Function(_HomeSacreenState) _then)
      : super(_value, (v) => _then(v as _HomeSacreenState));

  @override
  _HomeSacreenState get _value => super._value as _HomeSacreenState;

  @override
  $Res call({
    Object? taskList = freezed,
    Object? tagList = freezed,
  }) {
    return _then(_HomeSacreenState(
      taskList: taskList == freezed
          ? _value.taskList
          : taskList // ignore: cast_nullable_to_non_nullable
              as List<TaskWithTag>,
      tagList: tagList == freezed
          ? _value.tagList
          : tagList // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc

class _$_HomeSacreenState implements _HomeSacreenState {
  const _$_HomeSacreenState(
      {this.taskList = const [], this.tagList = const []});

  @JsonKey(defaultValue: const [])
  @override
  final List<TaskWithTag> taskList;
  @JsonKey(defaultValue: const [])
  @override
  final List<Tag> tagList;

  @override
  String toString() {
    return 'HomeSacreenState(taskList: $taskList, tagList: $tagList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeSacreenState &&
            (identical(other.taskList, taskList) ||
                const DeepCollectionEquality()
                    .equals(other.taskList, taskList)) &&
            (identical(other.tagList, tagList) ||
                const DeepCollectionEquality().equals(other.tagList, tagList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(taskList) ^
      const DeepCollectionEquality().hash(tagList);

  @JsonKey(ignore: true)
  @override
  _$HomeSacreenStateCopyWith<_HomeSacreenState> get copyWith =>
      __$HomeSacreenStateCopyWithImpl<_HomeSacreenState>(this, _$identity);
}

abstract class _HomeSacreenState implements HomeSacreenState {
  const factory _HomeSacreenState(
      {List<TaskWithTag> taskList, List<Tag> tagList}) = _$_HomeSacreenState;

  @override
  List<TaskWithTag> get taskList => throw _privateConstructorUsedError;
  @override
  List<Tag> get tagList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeSacreenStateCopyWith<_HomeSacreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
