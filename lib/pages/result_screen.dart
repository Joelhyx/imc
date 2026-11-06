import 'package:flutter/material.dart';
import 'package:imc/models/bmi_record.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:imc/data/bmi_sample_data.dart';
import 'package:imc/pages/history_screen.dart';

@NowaGenerated()
class ResultScreen extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ResultScreen({super.key, this.record});

  final BmiRecord? record;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final data = record ?? BmiSampleData.currentResult;
    final isNormal = data.category == 'Peso saludable';
    final isUnderweight = data.category == 'Bajo peso';
    final isOverweight = data.category == 'Sobrepeso';
    final Color statusColor = isNormal
        ? colorScheme.secondary
        : (isUnderweight
              ? colorScheme.tertiary
              : (isOverweight
                    ? const Color(0xFFEAB308)
                    : const Color(0xFFEF4444)));
    final Color statusBg = statusColor.withValues(alpha: 0.12);
    final double clampedBmi = data.bmiValue.clamp(15.0, 35.0);
    final double gaugeFraction = (clampedBmi - 15.0) / (35.0 - 15.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu Resultado'),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => Navigator.maybePop(context),
              )
            : null,
        actions: [
          IconButton(
            tooltip: 'Historial',
            icon: const Icon(Icons.history_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 28,
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      Text(
                        'ÍNDICE DE MASA CORPORAL',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        data.bmiValue.toStringAsFixed(1),
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontSize: 64,
                          fontWeight: FontWeight.w800,
                          color: statusColor,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: statusBg,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: statusColor.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: statusColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              data.category,
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: statusColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        spacing: 6,
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final availableWidth = constraints.maxWidth;
                              final indicatorPosition =
                                  (gaugeFraction * availableWidth).clamp(
                                    12.0,
                                    availableWidth - 12.0,
                                  );
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: (indicatorPosition - 12).clamp(
                                        0.0,
                                        availableWidth - 24.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.arrow_drop_down_rounded,
                                        color: statusColor,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 35,
                                          child: Container(
                                            height: 10,
                                            color: colorScheme.tertiary,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 64,
                                          child: Container(
                                            height: 10,
                                            color: colorScheme.secondary,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 50,
                                          child: Container(
                                            height: 10,
                                            color: const Color(0xFFEAB308),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 51,
                                          child: Container(
                                            height: 10,
                                            color: const Color(0xFFEF4444),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 35,
                                child: Text(
                                  '< 18.5',
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 64,
                                child: Text(
                                  '18.5 - 24.9',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 50,
                                child: Text(
                                  '25.0 - 29.9',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 51,
                                child: Text(
                                  '≥ 30.0',
                                  textAlign: TextAlign.right,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              spacing: 4,
                              children: [
                                Text(
                                  'Peso',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                Text(
                                  '${data.weightKg.toStringAsFixed(1)} kg',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 1,
                              height: 32,
                              color: colorScheme.outlineVariant,
                            ),
                            Column(
                              spacing: 4,
                              children: [
                                Text(
                                  'Altura',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                Text(
                                  '${data.heightCm.toInt()} cm',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(
                            Icons.health_and_safety_outlined,
                            color: colorScheme.primary,
                            size: 22,
                          ),
                          Text(
                            'Rango saludable ideal',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        data.healthyWeightRange,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Corresponde a un IMC de 18.5 a 24.9 para tu estatura actual.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // CAMBIO: tarjeta NUEVA con el consejo según el rango de IMC.
              // data.advice ya lo generaba BmiSampleData.calculate() según el
              // rango (bajo peso, saludable, sobrepeso u obesidad), pero no se
              // mostraba en ninguna pantalla. El icono usa statusColor, así que
              // el color también cambia con el rango.
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(
                            Icons.lightbulb_outline_rounded,
                            color: statusColor,
                            size: 22,
                          ),
                          Text(
                            'Consejo para ti',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        data.advice,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // CAMBIO: tarjeta NUEVA con la grasa corporal estimada. El "if"
              // dentro de la lista hace que SOLO aparezca si el registro la
              // tiene: los del historial de ejemplo no, y no se muestra nada.
              // El "!" es seguro porque el if ya comprobó que no es null.
              if (data.bodyFatPercent != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            Icon(
                              Icons.percent_rounded,
                              color: colorScheme.primary,
                              size: 22,
                            ),
                            Text(
                              'Grasa corporal estimada',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${data.bodyFatPercent!.toStringAsFixed(1)} %',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Estimación orientativa según tu IMC, edad y género.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.history_rounded),
                label: const Text('Ver historial de mediciones'),
              ),
              OutlinedButton.icon(
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Calcular de nuevo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
