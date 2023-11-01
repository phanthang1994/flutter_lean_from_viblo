
import 'package:go_router/go_router.dart';
import 'package:untitled2/toto_riverpod/config/routes/routes_location.dart';
import 'package:untitled2/toto_riverpod/config/routes/routes_provider.dart';

import '../../../riverpodd/office_rrousselGit/todo_gpt.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: CreateTaskScreen.builder,
  ),
];
