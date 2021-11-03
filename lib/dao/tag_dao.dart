import 'dart:developer';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor_reso_coder_i_try/data/moor_database.dart';
import 'package:moor_reso_coder_i_try/models/tags_model.dart';

part 'tag_dao.g.dart';

@UseDao(tables: [Tags])
class TagDao extends DatabaseAccessor<AppDatabase> with _$TagDaoMixin {
  final AppDatabase db;

  TagDao(this.db) : super(db);

  Stream<List<Tag>> watchTags() {
    log('TagDao watchTags');
    return select(tags).watch();
  }

  Future insertTag(Insertable<Tag> tag) {
    log('TagDao insertTag $tag');
    return into(tags).insert(tag);
  }
}
