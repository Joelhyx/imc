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

  Map<String, dynamic> toJson() => {
    'id': id,
    'weightKg': weightKg,
    'heightCm': heightCm,
    'bmiValue': bmiValue,
    'category': category,
    'date': date,
    'advice': advice,
    'healthyWeightRange': healthyWeightRange,
  };
}
