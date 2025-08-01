import 'package:go_router/go_router.dart';
import '../features/home/ui/home.dart';
import '../features/user/ui/create_user.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/user/create',
      builder: (context, state) => const CreateUserScreen(),
    ),
  ],
);
