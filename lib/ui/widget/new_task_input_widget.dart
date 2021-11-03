import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor_reso_coder_i_try/provider/home_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/data/moor_database.dart';

class NewTaskInput extends StatefulWidget {
  const NewTaskInput({
    Key? key,
  }) : super(key: key);

  @override
  _NewTaskInputState createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {
  DateTime? newTaskDate;
  Tag? selectedTag;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Task Name'),
              onSubmitted: (inputName) {
                final task = TasksCompanion(
                  name: Value(inputName),
                  dueDate: Value(newTaskDate),
                  tagId: Value(selectedTag?.id),
                );
                log('inputName: $inputName');
                log('newTaskDate: $newTaskDate');
                log('selectedTag?.name: ${selectedTag?.name}');
                context.read(homeScreenProvider.notifier).insertTask(task);
                resetValuesAfterSubmit();
              },
            ),
          ),
          Consumer(
            builder: (context, watch, child) {
              final state = watch(homeScreenProvider);
              log('_buildTagSelector tags: ${state.tagList}');

              DropdownMenuItem<Tag> dropdownFromTag(Tag tag) {
                return DropdownMenuItem(
                  value: tag,
                  child: Row(
                    children: <Widget>[
                      Text(tag.name),
                      SizedBox(width: 5),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(tag.color ?? 0xFF000040),
                        ),
                      ),
                    ],
                  ),
                );
              }

              final dropdownMenuItems =
                  state.tagList.map((tag) => dropdownFromTag(tag)).toList()
                    // Add a "no tag" item as the first element of the list
                    ..insert(
                      0,
                      DropdownMenuItem(
                        value: null,
                        child: Text('No Tag'),
                      ),
                    );

              return Expanded(
                child: DropdownButton<Tag>(
                  onChanged: (Tag? tag) {
                    setState(() {
                      selectedTag = tag;
                    });
                  },
                  isExpanded: true,
                  value: selectedTag,
                  items: dropdownMenuItems,
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              newTaskDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2010),
                lastDate: DateTime(2022),
              );
            },
          ),
        ],
      ),
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      newTaskDate = null;
      selectedTag = null;
      controller.clear();
    });
  }
}
