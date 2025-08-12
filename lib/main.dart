import 'package:flutter/material.dart';
import 'package:life_track/routes/app_router.dart';
import 'package:life_track/providers/app_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:life_track/firebase_options.dart';
import 'package:go_router/go_router.dart';

void main() => startApp();

Future<void> startApp() async {
  // Flutterのバインディングを初期化（必須）
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kDebugMode) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9000);
  }
  runApp(
    const ProviderScope(
      child: AppInitializer(),
    ),
  );
}

class AppInitializer extends ConsumerWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialRoute = ref.watch(initialRouteProvider);

    return initialRoute.when(
      data: (route) {
        final router = GoRouter(
          initialLocation: route,
          routes: appRoutes,
        );

        return MaterialApp.router(
          routerConfig: router,
          title: 'Life Track',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
        );
      },
      loading: () => const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (err, stack) => MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Error: $err')),
        ),
      ),
    );
  }
}
