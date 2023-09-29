import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/task_data.dart';

// cách 1 dùng provider.of(context) sẽ để vào chỗ cần lấy
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String ? newTaskTitle;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle!);
                Navigator.pop(context);
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// cách 2 dùng consumer thì cho tất vào trong consumer

// class AddTaskScreen extends StatelessWidget {
//   const AddTaskScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     String? newTaskTitle;
//
//     return Container(
//       color: const Color(0xff757575),
//       child: Container(
//         padding: const EdgeInsets.all(20.0),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0),
//             topRight: Radius.circular(20.0),
//           ),
//         ),
//         child: Consumer<TaskData>(
//           builder: (context, taskData, child) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 const Text(
//                   'Add Task',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 30.0,
//                     color: Colors.lightBlueAccent,
//                   ),
//                 ),
//                 TextField(
//                   autofocus: true,
//                   textAlign: TextAlign.center,
//                   onChanged: (newText) {
//                     newTaskTitle = newText;
//                   },
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     taskData.addTask(newTaskTitle!);
//                     Navigator.pop(context);
//                   },
//                   child: const Text(
//                     'Add',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


// cách 3 nguyên lý như cách 1

// class AddTaskScreen extends StatelessWidget {
//   const AddTaskScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     String? newTaskTitle;
//
//     return Container(
//       color: const Color(0xff757575),
//       child: Container(
//         padding: const EdgeInsets.all(20.0),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0),
//             topRight: Radius.circular(20.0),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             const Text(
//               'Add Task',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 30.0,
//                 color: Colors.black,
//               ),
//             ),
//             TextField(
//               autofocus: true,
//               textAlign: TextAlign.center,
//               onChanged: (newText) {
//                 newTaskTitle = newText;
//               },
//             ),
//             TextButton(
//               onPressed: () {
//                 context.read<TaskData>().addTask(newTaskTitle!);
//                 Navigator.pop(context);
//               },
//               child: const Text(
//                 'Add',
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
