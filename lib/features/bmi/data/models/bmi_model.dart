class BmiResponse {
  final String? status;
  final dynamic error;
  final BmiData? data;
  final String? birthDate;
  final String? name;
  final String? gender;

  BmiResponse({
    this.status,
    this.error,
    this.data,
    this.birthDate,
    this.name,
    this.gender,
  });

  factory BmiResponse.fromJson(Map<String, dynamic> json) {
    return BmiResponse(
      status: json['status'],
      error: json['error'],
      data: json['data'] != null ? BmiData.fromJson(json['data']) : null,

      birthDate: json['birthDate'],
      name: json['name'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'error': error,
      'data': data?.toJson(),
      'birthDate': birthDate,
      'name': name,
      'gender': gender,
    };
  }
}

class BmiData {
  final String? height;
  final String? weight;
  final double? bmi;
  final double? bmiPrime;
  final String? category;
  final String? risk;
  final String? summary;
  final IdealWeightRange? idealWeightRange;
  final double? weightToChange;

  BmiData({
    this.height,
    this.weight,
    this.bmi,
    this.bmiPrime,
    this.category,
    this.risk,
    this.summary,
    this.idealWeightRange,
    this.weightToChange,
  });

  factory BmiData.fromJson(Map<String, dynamic> json) {
    return BmiData(
      height: json['height'],
      weight: json['weight'],
      bmi: (json['bmi'] as num?)?.toDouble(),
      bmiPrime: (json['bmiPrime'] as num?)?.toDouble(),
      category: json['category'],
      risk: json['risk'],
      summary: json['summary'],
      idealWeightRange: json['idealWeightRange'] != null
          ? IdealWeightRange.fromJson(json['idealWeightRange'])
          : null,
      weightToChange: (json['weightToChange'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'weight': weight,
      'bmi': bmi,
      'bmiPrime': bmiPrime,
      'category': category,
      'risk': risk,
      'summary': summary,
      'idealWeightRange': idealWeightRange?.toJson(),
      'weightToChange': weightToChange,
    };
  }
}

class IdealWeightRange {
  final double? min;
  final double? max;
  final String? unit;

  IdealWeightRange({this.min, this.max, this.unit});

  factory IdealWeightRange.fromJson(Map<String, dynamic> json) {
    return IdealWeightRange(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'min': min, 'max': max, 'unit': unit};
  }
}
