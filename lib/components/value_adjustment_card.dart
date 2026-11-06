import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class ValueAdjustmentCard extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ValueAdjustmentCard({
    super.key,
    required this.title,
    required this.valueText,
    required this.unitText,
    required this.icon,
    required this.sliderValue,
    required this.min,
    required this.max,
    required this.onMinus,
    required this.onPlus,
    required this.onChanged,
  });

  final String title;

  final String valueText;

  final String unitText;

  final IconData icon;

  final double sliderValue;

  final double min;

  final double max;

  final void Function() onMinus;

  final void Function() onPlus;

  final void Function(double value) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 12,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: colorScheme.primary, size: 20),
                    ),
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    IconButton.filledTonal(
                      onPressed: onMinus,
                      icon: const Icon(Icons.remove, size: 18),
                      style: IconButton.styleFrom(
                        backgroundColor: colorScheme.surfaceContainerLow,
                        foregroundColor: colorScheme.onSurface,
                        minimumSize: const Size(36, 36),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    IconButton.filledTonal(
                      onPressed: onPlus,
                      icon: const Icon(Icons.add, size: 18),
                      style: IconButton.styleFrom(
                        backgroundColor: colorScheme.surfaceContainerLow,
                        foregroundColor: colorScheme.onSurface,
                        minimumSize: const Size(36, 36),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              spacing: 6,
              children: [
                Text(
                  valueText,
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                Text(
                  unitText,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: colorScheme.primary,
                inactiveTrackColor: colorScheme.primaryContainer,
                thumbColor: colorScheme.primary,
                overlayColor: colorScheme.primary.withValues(alpha: 0.15),
                trackHeight: 6,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              ),
              child: Slider(
                value: sliderValue.clamp(min, max),
                min: min,
                max: max,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
