import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム画面'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () => context.push('/food-log/create'),
            child: const Text('食事記録追加'),
          ),
          ElevatedButton(
            onPressed: () => context.push('/bowel-log/create'),
            child: const Text('排便記録追加'),
          ),
          const SizedBox(height: 8),
        ],
      )),
    );
  }
}
