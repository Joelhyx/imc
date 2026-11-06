import 'package:imc/models/bmi_record.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class BmiSampleData {
  static final List<BmiRecord> sampleHistory = [
    const BmiRecord(
      id: '1',
      weightKg: 68.5,
      heightCm: 172.0,
      bmiValue: 23.1,
      category: 'Peso saludable',
      date: 'Hoy, 09:15',
      advice:
          '¡Excelente! Tu peso se encuentra en un rango óptimo. Mantén tus hábitos activos y una hidratación adecuada.',
      healthyWeightRange: '54.7 kg - 73.6 kg',
    ),
    const BmiRecord(
      id: '2',
      weightKg: 70.0,
      heightCm: 172.0,
      bmiValue: 23.7,
      category: 'Peso saludable',
      date: '10 May, 08:30',
      advice:
          'Estás dentro de los parámetros ideales. Continúa con tu alimentación equilibrada.',
      healthyWeightRange: '54.7 kg - 73.6 kg',
    ),
    const BmiRecord(
      id: '3',
      weightKg: 72.5,
      heightCm: 172.0,
      bmiValue: 24.5,
      category: 'Peso saludable',
      date: '28 Abr, 19:40',
      advice:
          'Tu peso está cerca del límite superior del rango saludable. Buen momento para mantenerte activo.',
      healthyWeightRange: '54.7 kg - 73.6 kg',
    ),
    const BmiRecord(
      id: '4',
      weightKg: 75.0,
      heightCm: 172.0,
      bmiValue: 25.4,
      category: 'Sobrepeso',
      date: '15 Mar, 10:00',
      advice:
          'Ligeramente por encima de tu peso ideal. Caminar 30 minutos al día puede marcar una gran diferencia.',
      healthyWeightRange: '54.7 kg - 73.6 kg',
    ),
  ];

  static BmiRecord get currentResult => sampleHistory.first;

  static BmiRecord calculate({
    required double weightKg,
    required double heightCm,
  }) {
    final double heightM = heightCm / 100.0;
    final double rawBmi = weightKg / (heightM * heightM);
    final double bmiValue = double.parse(rawBmi.toStringAsFixed(1));
    final double minHealthyWeight = 18.5 * heightM * heightM;
    final double maxHealthyWeight = 24.9 * heightM * heightM;
    final String rangeStr =
        '${minHealthyWeight.toStringAsFixed(1)} kg - ${maxHealthyWeight.toStringAsFixed(1)} kg';
    String category;
    String advice;
    if (bmiValue < 18.5) {
      category = 'Bajo peso';
      advice =
          'Te encuentras por debajo del peso recomendado. Te sugerimos consultar a un profesional de la salud.';
    } else if (bmiValue < 25.0) {
      category = 'Peso saludable';
      advice =
          '¡Excelente! Tu peso se encuentra en un rango óptimo. Mantén tus hábitos activos y una hidratación adecuada.';
    } else if (bmiValue < 30.0) {
      category = 'Sobrepeso';
      advice =
          'Estás ligeramente por encima del peso ideal. Pequeños cambios en alimentación y movimiento te ayudarán.';
    } else {
      category = 'Obesidad';
      advice =
          'Tu índice indica obesidad. Es recomendable asesorarte con un médico para diseñar un plan progresivo y seguro.';
    }
    return BmiRecord(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      weightKg: weightKg,
      heightCm: heightCm,
      bmiValue: bmiValue,
      category: category,
      date: 'Hoy, cálculo reciente',
      advice: advice,
      healthyWeightRange: rangeStr,
    );
  }
}
