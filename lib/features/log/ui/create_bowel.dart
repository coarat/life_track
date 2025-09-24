import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_track/providers/app_providers.dart';
import 'package:life_track/features/log/domain/entities/bowel_log.dart';
import 'package:go_router/go_router.dart';
import 'package:life_track/features/log/ui/utils/radio_form.dart';

class CreateBowelLogScreen extends ConsumerStatefulWidget {
  const CreateBowelLogScreen({super.key});

  @override
  ConsumerState<CreateBowelLogScreen> createState() => _CreateBowelScreenState();
}

class _CreateBowelScreenState extends ConsumerState<CreateBowelLogScreen> {
  AmountEnum? _amountSelected;
  ColorEnum? _colorSelected;
  ShapeEnum? _shapeSelected;
  ThicknessEnum? _ticknessSelected;
  SmellEnum? _smellSelected;
  final _memoController = TextEditingController();

  @override
  void dispose() {
    _memoController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final amount = _amountSelected;
    final color = _colorSelected;
    final shape = _shapeSelected;
    final tickness = _ticknessSelected;
    final smell = _smellSelected;
    final memo = _memoController.text.trim();

    if (amount == null || color == null || shape == null || tickness == null || smell == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('選択していない項目があります')),
      );
      return;
    }

    final entity = BowelLogEntity(amount: amount, color: color, shape: shape, thickness: tickness, smell: smell, memo: memo);

    final bowelLogR = ref.read(bowelLogRepositoryProvider);
    await bowelLogR.insert(entity);

    if (mounted) {
      context.go('/');
    }
  }

  void _onSelected(Object? value) {
    setState(() {
      if (value == null) return;

      if (value is AmountEnum) {_amountSelected = value;}
      else if (value is ColorEnum) {_colorSelected = value;}
      else if (value is ShapeEnum) {
        _shapeSelected = value;
        if (_shapeSelected == ShapeEnum.grain || _shapeSelected == ShapeEnum.liquid) {
          _ticknessSelected = ThicknessEnum.noTickness;
        }
      }
      else if (value is ThicknessEnum) {_ticknessSelected = value;}
      else if (value is SmellEnum) {_smellSelected = value;}
      else {return;}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('排便記録追加'),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RadioGroupFormField<AmountEnum>(
                label: '量',
                items: AmountEnum.values,
                itemLabelBuilder: (p) => Text(p.label),
                validator: (v) => v == null ? 'いずれかを選択してください' : null,
                onChanged: (v) => _onSelected(v),
              ),
              RadioGroupFormField<ColorEnum>(
                label: '色',
                items: ColorEnum.values,
                itemLabelBuilder: (p) => Text(p.label),
                validator: (v) => v == null ? 'いずれかを選択してください' : null,
                onChanged: (v) => _onSelected(v),
              ),
              RadioGroupFormField<ShapeEnum>(
                label: '形',
                items: ShapeEnum.values,
                itemLabelBuilder: (p) => Text(p.label),
                validator: (v) => v == null ? 'いずれかを選択してください' : null,
                onChanged: (v) => _onSelected(v),
              ),
              RadioGroupFormField<ThicknessEnum>(
                label: '太さ',
                items: ThicknessEnum.values,
                itemLabelBuilder: (p) => Text(p.label),
                validator: (v) => v == null ? 'いずれかを選択してください' : null,
                onChanged: (v) => _onSelected(v),
              ),
              RadioGroupFormField<SmellEnum>(
                label: '匂い',
                items: SmellEnum.values,
                itemLabelBuilder: (p) => Text(p.label),
                validator: (v) => v == null ? 'いずれかを選択してください' : null,
                onChanged: (v) => _onSelected(v),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: TextField(
                  controller: _memoController,
                  decoration: InputDecoration(labelText: 'メモ'),
                ),
              ),   
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      FilledButton.icon(
                        onPressed: _submit,
                        icon: const Icon(Icons.send),
                        label: const Text('登録'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}