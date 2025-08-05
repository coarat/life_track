import 'package:go_router/go_router.dart';
import 'package:life_track/features/home/ui/home.dart';
import 'package:life_track/features/user/ui/create_user.dart';

final appRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/user/create',
    builder: (context, state) => const CreateUserScreen(),
  ),
];
