import 'package:flutter/material.dart';

/// ラジオを「ボタン↑・ラベル↓」の縦配置にし、項目は横並び（Wrap）
/// - `items` : 選択肢（任意型）
/// - `itemLabelBuilder` : ラベル表示ウィジェット
class RadioGroupFormField<T> extends FormField<T> {
  RadioGroupFormField({
    super.key,
    required List<T> items,
    required Widget Function(T value) itemLabelBuilder,
    required FormFieldValidator<T> validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    void Function(T?)? onChanged,
    String? label,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.all(8),
    double spacing = 16,       // 項目間の横間隔
    double runSpacing = 12,    // 折り返し行の縦間隔
    EdgeInsets itemPadding = const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    MainAxisAlignment rowAlign = MainAxisAlignment.start,
    bool dense = true,
  }): 
  super(
    validator: validator,
    autovalidateMode: autovalidateMode,
    builder: (state) {
      final value = state.value;

      void select(T v) {
        state.didChange(v);
        onChanged?.call(v);
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          Container(
            padding: contentPadding,
            decoration: BoxDecoration(
              border: Border.all(
                color: state.hasError ? Colors.red : Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: switch (rowAlign) {
                MainAxisAlignment.center => Alignment.center,
                MainAxisAlignment.end => Alignment.centerRight,
                _ => Alignment.centerLeft,
              },
              child: Wrap(
                spacing: spacing,
                runSpacing: runSpacing,
                children: [
                  for (final item in items)
                    _RadioVerticalItem<T>(
                      value: item,
                      groupValue: value,
                      onSelect: select,
                      label: itemLabelBuilder(item),
                      dense: dense,
                      padding: itemPadding,
                    ),
                ],
              ),
            ),
          ),
          if (state.hasError) ...[
            const SizedBox(height: 6),
            Text(state.errorText!, style: const TextStyle(color: Colors.red)),
          ],
        ],
      );
    },
  );
}

class _RadioVerticalItem<T> extends StatelessWidget {
  const _RadioVerticalItem({
    required this.value,
    required this.groupValue,
    required this.onSelect,
    required this.label,
    this.dense = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
  });

  final T value;
  final T? groupValue;
  final void Function(T v) onSelect;
  final Widget label;
  final bool dense;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final selected = value == groupValue;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => onSelect(value),
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<T>(
                value: value,
                groupValue: groupValue,
                onChanged: (_) => onSelect(value),
                materialTapTargetSize:
                    dense ? MaterialTapTargetSize.shrinkWrap : MaterialTapTargetSize.padded,
                visualDensity: dense ? VisualDensity.compact : VisualDensity.standard,
              ),
              const SizedBox(height: 4),
              DefaultTextStyle.merge(
                style: TextStyle(
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
                child: label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}