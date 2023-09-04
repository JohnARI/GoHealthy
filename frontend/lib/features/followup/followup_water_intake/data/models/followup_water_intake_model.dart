// This file contains the model for the followup water intake
import 'dart:convert';

class WaterIntakeModel {
  WaterIntakeModel({
    required this.waterIntake,
    required this.waterIntakeGoal,
    double? step,
  }) : step = step ?? .25;

  final List<double> waterIntake;
  late double waterIntakeGoal = 0;
  late double step = 0;

  factory WaterIntakeModel.fromString(String jsonString) =>
      WaterIntakeModel.fromJson(jsonDecode(jsonString));

  factory WaterIntakeModel.fromJson(Map<String, dynamic> json) =>
      WaterIntakeModel(
        waterIntake:
            List<double>.from(json['waterIntake'].map((dynamic x) => x)),
        waterIntakeGoal: json['waterIntakeGoal'],
        step: json['step'],
      );

  @override
  String toString() {
    return '{"waterIntake": ${waterIntake.toString()}, "waterIntakeGoal": ${waterIntakeGoal.toString()}, "step": ${step.toString()}}';
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'waterIntake': waterIntake,
        'waterIntakeGoal': waterIntakeGoal,
        'step': step,
      };
}
