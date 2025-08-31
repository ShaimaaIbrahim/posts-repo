import 'package:go_router/go_router.dart';

import '../../features/home/views/screens/home_screen.dart';
import '../../features/main/main_screen.dart';
import 'route_names.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: dashBoardRoute,
      builder: (context, state) =>  HomeScreen(),
    ),
    GoRoute(
      path: mainRoute,
      builder: (context, state) => const MainScreen(),
    ),
  ],
  initialLocation: mainRoute,
);