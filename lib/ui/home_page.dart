import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:moor_reso_coder_i_try/models/task_with_tag_model.dart';
import 'package:moor_reso_coder_i_try/provider/home_provider.dart';

import '/data/moor_database.dart';
import 'widget/new_tag_input_widget.dart';
import 'widget/new_task_input_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tasks'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildTaskList(context)),
            NewTaskInput(),
            NewTagInput(),
          ],
        ));
  }

  _buildTaskList(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(homeScreenProvider);
        return ListView.builder(
          itemCount: state.taskList.length,
          itemBuilder: (_, index) {
            log('_buildTaskList task::: ${state.taskList[index].task}');
            log('_buildTaskList tag: ${state.tagList}');
            return _buildListItem(context, state.taskList[index]);
          },
        );
      },
    );
  }

  Widget _buildListItem(BuildContext context, TaskWithTag taskWithTag) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => context
              .read(homeScreenProvider.notifier)
              .deleteTask(taskWithTag.task),
        )
      ],
      child: CheckboxListTile(
        title: Text(taskWithTag.task.name),
        subtitle: Text(taskWithTag.task.dueDate?.toString() ?? 'No date'),
        secondary: _buildTag(taskWithTag.tag),
        value: taskWithTag.task.completed,
        onChanged: (newValue) {
          context
              .read(homeScreenProvider.notifier)
              .updateTask(taskWithTag.task.copyWith(completed: newValue));
        },
      ),
    );
  }

  Column _buildTag(Tag? tag) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tag != null) ...[
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(tag.color ?? 0xFF000040),
            ),
          ),
          Text(
            tag.name,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ],
    );
  }
}
