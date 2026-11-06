import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class BmiRecord {
  const BmiRecord({
    required this.id,
    required this.weightKg,
    required this.heightCm,
    required this.bmiValue,
    required this.category,
    required this.date,
    required this.advice,
    required this.healthyWeightRange,
    // CAMBIO: campo NUEVO y OPCIONAL (sin "required"). Guarda el % de grasa
    // corporal estimado, que depende del género. Es opcional para no tener
    // que tocar los registros de ejemplo del historial, que no lo tienen.
    this.bodyFatPercent,
  });

  factory BmiRecord.fromJson(Map<String, dynamic> json) {
    return BmiRecord(
      id: json['id'] as String,
      weightKg: (json['weightKg'] as num).toDouble(),
      heightCm: (json['heightCm'] as num).toDouble(),
      bmiValue: (json['bmiValue'] as num).toDouble(),
      category: json['category'] as String,
      date: json['date'] as String,
      advice: json['advice'] as String,
      healthyWeightRange: json['healthyWeightRange'] as String,
      // CAMBIO: "as num?" admite que la clave no exista o sea null
      // (registros antiguos sin grasa corporal).
      bodyFatPercent: (json['bodyFatPercent'] as num?)?.toDouble(),
    );
  }

  final String id;

  final double weightKg;

  final double heightCm;

  final double bmiValue;

  final String category;

  final String date;

  final String advice;

  final String healthyWeightRange;

  // CAMBIO: porcentaje de grasa corporal estimado. Es "double?" (anulable):
  // vale null cuando el registro no lo calculó.
  final double? bodyFatPercent;

  Map<String, dynamic> toJson() => {
    'id': id,
    'weightKg': weightKg,
    'heightCm': heightCm,
    'bmiValue': bmiValue,
    'category': category,
    'date': date,
    'advice': advice,
    'healthyWeightRange': healthyWeightRange,
    // CAMBIO: se guarda también la grasa corporal (puede ser null).
    'bodyFatPercent': bodyFatPercent,
  };
}
