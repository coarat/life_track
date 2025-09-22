import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_track/providers/app_providers.dart';
import 'package:life_track/features/log/domain/entities/food_log.dart';
import 'package:go_router/go_router.dart';

class CreateFoodLogScreen extends ConsumerStatefulWidget {
  const CreateFoodLogScreen({super.key});

  @override
  ConsumerState<CreateFoodLogScreen> createState() => _CreateFoodScreenState();
}

class _CreateFoodScreenState extends ConsumerState<CreateFoodLogScreen> {
  final _foodController = <TextEditingController>[];
  final _imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addField(); // 初期入力欄を1つ用意
  }

  void _addField() {
    final c = TextEditingController();
    setState(() {
      _foodController.add(c);
    });
  }

  void _removeField(int index) {
    setState(() {
      _foodController[index].dispose();
      _foodController.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (final c in _foodController) {
      c.dispose();
    }
    _imageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final foods = _foodController.map((c) => c.text).toList();
    final image = _imageController.text.trim();

    if (foods.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('1つ以上入力してください')),
      );
      return;
    }

    final entity = FoodLogEntity(foods: foods, imagePath: image);

    final foodLogR = ref.read(foodLogRepositoryProvider);
    await foodLogR.insert(entity);

    if (mounted) {
      context.go('/');
    }
  }

  static const _hPad = EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('食事記録追加')),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: _hPad,
                child: const TextField(
                  decoration: InputDecoration(labelText: '検索ワード'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _foodController.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: ValueKey(_foodController[index]), // 安全に削除できるようキーを付与
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) => _removeField(index),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: _hPad,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: ListTile(
                        title: TextField(
                          controller: _foodController[index],
                          decoration: InputDecoration(
                            labelText: '食事 No.${index + 1}',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () => _foodController[index].clear(),
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => _removeField(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: _addField,
                        icon: const Icon(Icons.add),
                        label: const Text('追加'),
                      ),
                      const SizedBox(width: 12),
                      FilledButton.icon(
                        onPressed: _submit,
                        icon: const Icon(Icons.send),
                        label: const Text('送信'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
