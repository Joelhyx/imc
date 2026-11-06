import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:imc/pages/history_screen.dart';
import 'package:imc/data/bmi_sample_data.dart';
import 'package:imc/pages/result_screen.dart';
import 'package:imc/globals/app_state.dart';
import 'package:imc/components/value_adjustment_card.dart';

@NowaGenerated()
class HomePage extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

@NowaGenerated()
class _HomePageState extends State<HomePage> {
  int _age = 26;

  // CAMBIO: estado del género elegido. true = masculino, false = femenino.
  bool _isMale = true;

  double _weightKg = 68.0;

  double _heightCm = 172.0;

  double get _currentBmi {
    final double heightM = _heightCm / 100.0;
    if (heightM <= 0) return 0;
    return _weightKg / (heightM * heightM);
  }

  String get _currentCategory {
    final bmi = _currentBmi;
    if (bmi < 18.5) return 'Bajo peso';
    if (bmi < 25.0) return 'Peso saludable';
    if (bmi < 30.0) return 'Sobrepeso';
    return 'Obesidad';
  }

  Color _getCategoryColor(ColorScheme colorScheme) {
    final bmi = _currentBmi;
    if (bmi < 18.5) return colorScheme.tertiary;
    if (bmi < 25.0) return colorScheme.secondary;
    if (bmi < 30.0) return const Color(0xFFEAB308);
    return const Color(0xFFEF4444);
  }

  void _calculateAndNavigate() {
    final record = BmiSampleData.calculate(
      weightKg: _weightKg,
      heightCm: _heightCm,
      // CAMBIO: ahora también se envían el género y la edad, porque
      // calculate() los necesita para estimar la grasa corporal.
      isMale: _isMale,
      age: _age,
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen(record: record)),
    );
  }

  // CAMBIO: método nuevo que dibuja UN botón de género.
  // Si está seleccionado se ve relleno (ElevatedButton); si no, solo con
  // borde (OutlinedButton). Los dos usan los estilos definidos en themes.dart,
  // así que respetan el tema claro y el oscuro.
  // Devuelve un Expanded para que los dos botones se repartan el ancho.
  Widget _genderButton({
    required String label,
    required IconData icon,
    required bool selected,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: selected
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(label),
            )
          : OutlinedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(label),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final categoryColor = _getCategoryColor(colorScheme);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        actions: [
          IconButton(
            tooltip: 'Cambiar tema',
            icon: Icon(
              AppState.of(context).isDarkMode
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
            onPressed: () {
              AppState.of(context, listen: false).toggleTheme();
            },
          ),
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
              // CAMBIO: fila NUEVA con los dos botones de género, colocada
              // arriba del todo (antes del título). Al pulsar uno, setState
              // cambia _isMale y se redibuja para marcar el seleccionado.
              Row(
                spacing: 12,
                children: [
                  _genderButton(
                    label: 'Masculino',
                    icon: Icons.male_rounded,
                    selected: _isMale,
                    onPressed: () {
                      setState(() {
                        _isMale = true;
                      });
                    },
                  ),
                  _genderButton(
                    label: 'Femenino',
                    icon: Icons.female_rounded,
                    selected: !_isMale,
                    onPressed: () {
                      setState(() {
                        _isMale = false;
                      });
                    },
                  ),
                ],
              ),
              Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tu bienestar en cifras',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    'Ajusta tu peso, estatura y edad para conocer tu Índice de Masa Corporal al instante.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              ValueAdjustmentCard(
                title: 'Peso actual',
                valueText: _weightKg.toStringAsFixed(1),
                unitText: 'kg',
                icon: Icons.monitor_weight_outlined,
                sliderValue: _weightKg,
                min: 30.0,
                max: 180.0,
                onMinus: () {
                  setState(() {
                    if (_weightKg > 30.5) {
                      _weightKg = (_weightKg - 0.5);
                    }
                  });
                },
                onPlus: () {
                  setState(() {
                    if (_weightKg < 179.5) {
                      _weightKg = (_weightKg + 0.5);
                    }
                  });
                },
                onChanged: (val) {
                  setState(() {
                    _weightKg = double.parse(val.toStringAsFixed(1));
                  });
                },
              ),
              ValueAdjustmentCard(
                title: 'Estatura',
                valueText: _heightCm.toInt().toString(),
                unitText: 'cm',
                icon: Icons.height_rounded,
                sliderValue: _heightCm,
                min: 100.0,
                max: 220.0,
                onMinus: () {
                  setState(() {
                    if (_heightCm > 100) {
                      _heightCm -= 1;
                    }
                  });
                },
                onPlus: () {
                  setState(() {
                    if (_heightCm < 220) {
                      _heightCm += 1;
                    }
                  });
                },
                onChanged: (val) {
                  setState(() {
                    _heightCm = val.roundToDouble();
                  });
                },
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
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
                            child: Icon(
                              Icons.cake_outlined,
                              color: colorScheme.primary,
                              size: 20,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Edad',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                '${_age} años',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          IconButton.filledTonal(
                            onPressed: () {
                              setState(() {
                                if (_age > 10) _age -= 1;
                              });
                            },
                            icon: const Icon(Icons.remove, size: 18),
                            style: IconButton.styleFrom(
                              backgroundColor: colorScheme.surfaceContainerLow,
                              foregroundColor: colorScheme.onSurface,
                              minimumSize: const Size(36, 36),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          Text(
                            '${_age}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                          IconButton.filledTonal(
                            onPressed: () {
                              setState(() {
                                if (_age < 110) _age += 1;
                              });
                            },
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
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: categoryColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Estimación rápida',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          'IMC: ${_currentBmi.toStringAsFixed(1)}',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: categoryColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: categoryColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        _currentCategory,
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: categoryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: _calculateAndNavigate,
                icon: const Icon(Icons.calculate_rounded),
                label: const Text('Calcular IMC'),
              ),
              OutlinedButton.icon(
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
            ],
          ),
        ),
      ),
    );
  }
}
