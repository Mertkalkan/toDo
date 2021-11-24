import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/components/task_item.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return SafeArea(
          child: SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                   Center(
                    child: Text(
                      'Yoro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: 'Game Of Squids',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: tasks.length > 0
                        ? Text(
                            'New tasks',
                            style: TextStyle(
                              color: Colors.amber.shade700,
                              fontSize: 13,
                              fontFamily: 'NotoSans',
                            ),
                          )
                        : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  tasks.length > 0
                      ? ListView.builder(
                          //scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            //print(index);
                            return TaskItem(
                              tasks: tasks[index],
                            );
                          },
                          itemCount: tasks.length)
                      : Container(
                          child: Center(
                              child: Image.asset(
                          'images/task.png',
                          height: 350,
                          width: 350,
                        ))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
